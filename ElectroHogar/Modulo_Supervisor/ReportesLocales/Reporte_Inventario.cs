using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.ReportesLocales
{
    public partial class Reporte_Inventario : Form
    {
        private const string PlaceholderText = "Buscar por ID, producto, categoría o sucursal...";
        private DataTable dtReporteInventario;
        private int idSucursalActual;

        public Reporte_Inventario(int idSucursal = 0)
        {
            InitializeComponent();
            this.idSucursalActual = idSucursal > 0 ? idSucursal : (SesionUsuario.IdSucursal > 0 ? SesionUsuario.IdSucursal : 1);
            ConfigurarPlaceholder();
            ConfigurarComboEstado();
            ConfigurarTabla();
            CargarReporteInventario();
        }

        private void ConfigurarComboEstado()
        {
            cmbEstado.Items.AddRange(new object[] { "Todos", "Activo", "Inactivo" });
            cmbEstado.SelectedIndex = 0;
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

        // Llama a SP_REPORTE_INVENTARIO(P_ID_SUCURSAL)
        private void CargarReporteInventario()
        {
            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null)
                {
                    MessageBox.Show("No se pudo conectar con la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_REPORTE_INVENTARIO", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_SUCURSAL", this.idSucursalActual);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtReporteInventario = new DataTable();
                        da.Fill(dtReporteInventario);

                        dgvReporte.DataSource = dtReporteInventario;
                        FormatearColumnas();
                        AplicarFiltros();
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

            dgvReporte.Columns["ID_PRODUCTO"].HeaderText = "ID Prod.";
            dgvReporte.Columns["NOMBRE_PRODUCTO"].HeaderText = "Producto";
            dgvReporte.Columns["NOMBRE_CATEGORIA"].HeaderText = "Categoría";
            dgvReporte.Columns["ID_SUCURSAL"].HeaderText = "ID Suc.";
            dgvReporte.Columns["NOMBRE_SUCURSAL"].HeaderText = "Sucursal";
            dgvReporte.Columns["STOCK"].HeaderText = "Stock";
            dgvReporte.Columns["PRECIO_VENTA"].HeaderText = "Precio Venta";
            dgvReporte.Columns["VALOR_INVENTARIO"].HeaderText = "Valor Inventario";
            dgvReporte.Columns["ESTADO_PRODUCTO"].HeaderText = "Estado";

            dgvReporte.Columns["PRECIO_VENTA"].DefaultCellStyle.Format = "C2";
            dgvReporte.Columns["VALOR_INVENTARIO"].DefaultCellStyle.Format = "C2";
            dgvReporte.Columns["ID_PRODUCTO"].FillWeight = 45;
            dgvReporte.Columns["ID_SUCURSAL"].FillWeight = 45;
            dgvReporte.Columns["STOCK"].FillWeight = 50;
            dgvReporte.Columns["ESTADO_PRODUCTO"].FillWeight = 60;
        }

        // --- BOTÓN ACTUALIZAR / CONSULTAR REPORTE ---
        private void btnGenerarReporte_Click(object sender, EventArgs e)
        {
            CargarReporteInventario();
        }

        private void ActualizarTotalesResumen()
        {
            if (dtReporteInventario == null) return;

            int totalUnidades = 0;
            decimal valorTotal = 0;

            foreach (DataRowView fila in dtReporteInventario.DefaultView)
            {
                totalUnidades += Convert.ToInt32(fila["STOCK"]);
                valorTotal += Convert.ToDecimal(fila["VALOR_INVENTARIO"]);
            }

            lblResumenTotales.Text = $"Unidades en Stock: {totalUnidades}   |   Valor Total Inventario: {valorTotal:C2}";
        }

        // --- FILTROS RÁPIDOS EN MEMORIA ---
        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            AplicarFiltros();
        }

        private void cmbEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            AplicarFiltros();
        }

        private void AplicarFiltros()
        {
            if (dtReporteInventario == null) return;

            string filtroTexto = txtBuscar.Text.Trim().Replace("'", "''");
            string estadoSeleccionado = cmbEstado.SelectedItem?.ToString() ?? "Todos";
            string condicion = "";

            if (!string.IsNullOrEmpty(filtroTexto) && filtroTexto != PlaceholderText)
            {
                condicion = string.Format(
                    "(CONVERT(ID_PRODUCTO, 'System.String') LIKE '%{0}%' OR " +
                    "NOMBRE_PRODUCTO LIKE '%{0}%' OR " +
                    "NOMBRE_CATEGORIA LIKE '%{0}%' OR " +
                    "NOMBRE_SUCURSAL LIKE '%{0}%')",
                    filtroTexto
                );
            }

            if (estadoSeleccionado != "Todos")
            {
                condicion += (condicion.Length > 0 ? " AND " : "") + $"ESTADO_PRODUCTO = '{estadoSeleccionado}'";
            }

            dtReporteInventario.DefaultView.RowFilter = condicion;
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
