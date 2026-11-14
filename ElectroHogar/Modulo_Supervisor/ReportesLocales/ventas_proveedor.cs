using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.ReportesLocales
{
    public partial class ventas_proveedor : Form
    {
        private const string PlaceholderText = "Filtrar resultados por ID o nombre del proveedor...";
        private DataTable dtReporteProveedor;
        private int idSucursalActual;

        public ventas_proveedor(int idSucursal = 0)
        {
            InitializeComponent();
            this.idSucursalActual = idSucursal > 0 ? idSucursal : (SesionUsuario.IdSucursal > 0 ? SesionUsuario.IdSucursal : 1);
            ConfigurarFechas();
            ConfigurarPlaceholder();
            ConfigurarTabla();
            GenerarReporteProveedor();
        }

        private void ConfigurarFechas()
        {
            dtpFechaInicio.Format = DateTimePickerFormat.Short;
            dtpFechaFin.Format = DateTimePickerFormat.Short;

            dtpFechaInicio.Value = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
            dtpFechaFin.Value = DateTime.Today;
        }

        private void ConfigurarTabla()
        {
            dgvReporte.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvReporte.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvReporte.MultiSelect = false;
            dgvReporte.ReadOnly = true;
            dgvReporte.AllowUserToAddRows = false;
            dgvReporte.RowHeadersVisible = false;
            dgvReporte.BackgroundColor = Color.White;
            dgvReporte.BorderStyle = BorderStyle.FixedSingle;

            dgvReporte.EnableHeadersVisualStyles = false;
            dgvReporte.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvReporte.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvReporte.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvReporte.ColumnHeadersHeight = 38;

            dgvReporte.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvReporte.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvReporte.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvReporte.RowTemplate.Height = 32;
        }

        // Llama a SP_REPORTE_VENTAS_POR_PROVEEDOR(P_FECHA_INICIO, P_FECHA_FIN, P_ID_SUCURSAL)
        private void GenerarReporteProveedor()
        {
            DateTime fechaInicio = dtpFechaInicio.Value.Date;
            DateTime fechaFin = dtpFechaFin.Value.Date;

            if (fechaInicio > fechaFin)
            {
                MessageBox.Show("Debe indicar un periodo de fechas válido (la fecha inicial no puede ser mayor a la final).",
                                "Periodo Inválido", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                dtpFechaInicio.Focus();
                return;
            }

            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null)
                {
                    MessageBox.Show("No se pudo conectar con la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_REPORTE_VENTAS_POR_PROVEEDOR", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_FECHA_INICIO", fechaInicio);
                        cmd.Parameters.AddWithValue("P_FECHA_FIN", fechaFin);
                        cmd.Parameters.AddWithValue("P_ID_SUCURSAL", this.idSucursalActual);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtReporteProveedor = new DataTable();
                        da.Fill(dtReporteProveedor);

                        dgvReporte.DataSource = dtReporteProveedor;
                        FormatearColumnas();
                        AplicarFiltroLocal();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show(ex.Message, "Aviso de Base de Datos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void FormatearColumnas()
        {
            if (dgvReporte.Columns.Count == 0) return;

            dgvReporte.Columns["ID_PROVEEDOR"].HeaderText = "ID Proveedor";
            dgvReporte.Columns["NOMBRE_PROVEEDOR"].HeaderText = "Nombre del Proveedor";
            dgvReporte.Columns["CANTIDAD_VENDIDA"].HeaderText = "Unidades Vendidas";
            dgvReporte.Columns["TOTAL_VENTAS_RELACIONADAS"].HeaderText = "Total Ventas Relacionadas";

            dgvReporte.Columns["TOTAL_VENTAS_RELACIONADAS"].DefaultCellStyle.Format = "C2";
            dgvReporte.Columns["ID_PROVEEDOR"].FillWeight = 45;
            dgvReporte.Columns["CANTIDAD_VENDIDA"].FillWeight = 65;
        }

        // --- BOTÓN GENERAR REPORTE ---
        private void btnGenerarReporte_Click(object sender, EventArgs e)
        {
            GenerarReporteProveedor();
        }

        private void ActualizarTotalesResumen()
        {
            if (dtReporteProveedor == null) return;

            int sumaUnidades = 0;
            decimal sumaVentas = 0;

            foreach (DataRowView fila in dtReporteProveedor.DefaultView)
            {
                sumaUnidades += Convert.ToInt32(fila["CANTIDAD_VENDIDA"]);
                sumaVentas += Convert.ToDecimal(fila["TOTAL_VENTAS_RELACIONADAS"]);
            }

            lblResumenTotales.Text = $"Total Unidades Vendidas: {sumaUnidades}   |   Monto Total Relacionado: {sumaVentas:C2}";
        }

        // --- FILTRO RÁPIDO EN MEMORIA ---
        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            AplicarFiltroLocal();
        }

        private void AplicarFiltroLocal()
        {
            if (dtReporteProveedor == null) return;

            string filtro = txtBuscar.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {
                dtReporteProveedor.DefaultView.RowFilter = "";
            }
            else
            {
                dtReporteProveedor.DefaultView.RowFilter = string.Format(
                    "CONVERT(ID_PROVEEDOR, 'System.String') LIKE '%{0}%' OR " +
                    "NOMBRE_PROVEEDOR LIKE '%{0}%'",
                    filtro
                );
            }

            ActualizarTotalesResumen();
        }

        private void ConfigurarPlaceholder()
        {
            txtBuscar.Text = PlaceholderText;
            txtBuscar.ForeColor = Color.Gray;

            txtBuscar.Enter += (s, e) =>
            {
                if (txtBuscar.Text == PlaceholderText)
                {
                    txtBuscar.Text = "";
                    txtBuscar.ForeColor = Color.Black;
                }
            };

            txtBuscar.Leave += (s, e) =>
            {
                if (string.IsNullOrWhiteSpace(txtBuscar.Text))
                {
                    txtBuscar.Text = PlaceholderText;
                    txtBuscar.ForeColor = Color.Gray;
                }
            };
        }

        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
