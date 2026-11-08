using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.ReportesLocales
{
    public partial class ventas_proveedor : Form
    {
        private const string PlaceholderText = "Filtrar resultados por ID o nombre del proveedor...";
        private DataTable dtReporteProveedor;
        private int idSucursalActual;

        public ventas_proveedor(int idSucursal = 1)
        {
            InitializeComponent();
            this.idSucursalActual = idSucursal;
            ConfigurarFechas();
            ConfigurarPlaceholder();
            ConfigurarTabla();
            InicializarEstructuraTabla();
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

        // Estructura exacta según las 4 columnas de SP_REPORTE_VENTAS_POR_PROVEEDOR
        private void InicializarEstructuraTabla()
        {
            dtReporteProveedor = new DataTable();
            dtReporteProveedor.Columns.Add("ID_PROVEEDOR", typeof(int));
            dtReporteProveedor.Columns.Add("NOMBRE_PROVEEDOR", typeof(string));
            dtReporteProveedor.Columns.Add("CANTIDAD_VENDIDA", typeof(int));
            dtReporteProveedor.Columns.Add("TOTAL_VENTAS_RELACIONADAS", typeof(decimal));

            dgvReporte.DataSource = dtReporteProveedor;

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
            DateTime fechaInicio = dtpFechaInicio.Value.Date;
            DateTime fechaFin = dtpFechaFin.Value.Date;

            // Validación idéntica a SP_REPORTE_VENTAS_POR_PROVEEDOR
            if (fechaInicio > fechaFin)
            {
                MessageBox.Show("Debe indicar un periodo de fechas válido (la fecha inicial no puede ser mayor a la final).",
                                "Periodo Inválido", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                dtpFechaInicio.Focus();
                return;
            }

            // Aquí se llamará a SP_REPORTE_VENTAS_POR_PROVEEDOR(fechaInicio, fechaFin, idSucursalActual)
            ActualizarTotalesResumen();
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
