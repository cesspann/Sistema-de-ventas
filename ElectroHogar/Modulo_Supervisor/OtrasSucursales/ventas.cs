using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.OtrasSucursales
{
    public partial class ventas : Form
    {
        private const string PlaceholderText = "Buscar por ID factura, número de factura o cliente...";
        private DataTable dtVentasSucursal;
        private bool cargandoSucursales = false;

        public ventas()
        {
            InitializeComponent();
            ConfigurarPlaceholder();
            ConfigurarTabla();
            CargarSucursales();
        }

        private void ConfigurarTabla()
        {
            dgvVentas.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvVentas.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvVentas.MultiSelect = false;
            dgvVentas.ReadOnly = true;
            dgvVentas.AllowUserToAddRows = false;
            dgvVentas.RowHeadersVisible = false;
            dgvVentas.BackgroundColor = Color.White;
            dgvVentas.BorderStyle = BorderStyle.FixedSingle;

            dgvVentas.EnableHeadersVisualStyles = false;
            dgvVentas.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvVentas.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvVentas.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvVentas.ColumnHeadersHeight = 38;

            dgvVentas.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvVentas.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvVentas.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvVentas.RowTemplate.Height = 32;
        }

        private void CargarSucursales()
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
                    cargandoSucursales = true;
                    string query = "SELECT ID_SUCURSAL, NOMBRE_SUCURSAL FROM SUCURSAL ORDER BY ID_SUCURSAL;";
                    MySqlDataAdapter da = new MySqlDataAdapter(query, conn);
                    DataTable dtSucursales = new DataTable();
                    da.Fill(dtSucursales);

                    cmbSucursal.DisplayMember = "NOMBRE_SUCURSAL";
                    cmbSucursal.ValueMember = "ID_SUCURSAL";
                    cmbSucursal.DataSource = dtSucursales;
                    cargandoSucursales = false;

                    if (cmbSucursal.Items.Count > 0)
                    {
                        CargarVentasPorSucursal(Convert.ToInt32(cmbSucursal.SelectedValue));
                    }
                }
                catch (MySqlException ex)
                {
                    cargandoSucursales = false;
                    MessageBox.Show("Error al cargar sucursales: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void CargarVentasPorSucursal(int idSucursal)
        {
            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null) return;

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_FACTURAS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_SUCURSAL", idSucursal);
                        cmd.Parameters.AddWithValue("P_BUSQUEDA", DBNull.Value);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtVentasSucursal = new DataTable();
                        da.Fill(dtVentasSucursal);

                        dgvVentas.DataSource = dtVentasSucursal;
                        FormatearColumnas();
                        AplicarFiltroLocal();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al consultar ventas de la sucursal: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void FormatearColumnas()
        {
            if (dgvVentas.Columns.Count == 0) return;

            dgvVentas.Columns["ID_FACTURA"].HeaderText = "ID";
            dgvVentas.Columns["NUMERO_FACTURA"].HeaderText = "N° Factura";
            dgvVentas.Columns["NOMBRE_CLIENTE"].HeaderText = "Cliente";
            dgvVentas.Columns["NOMBRE_SUCURSAL"].HeaderText = "Sucursal";
            dgvVentas.Columns["FECHA_HORA"].HeaderText = "Fecha y Hora";
            dgvVentas.Columns["MONTO_TOTAL"].HeaderText = "Monto Total";
            dgvVentas.Columns["METODO_PAGO"].HeaderText = "Método Pago";

            dgvVentas.Columns["FECHA_HORA"].DefaultCellStyle.Format = "dd/MM/yyyy HH:mm";
            dgvVentas.Columns["MONTO_TOTAL"].DefaultCellStyle.Format = "C2";
            dgvVentas.Columns["ID_FACTURA"].FillWeight = 40;
            dgvVentas.Columns["NUMERO_FACTURA"].FillWeight = 75;
        }

        private void cmbSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cargandoSucursales || cmbSucursal.SelectedValue == null) return;

            int idSucursalSeleccionada = Convert.ToInt32(cmbSucursal.SelectedValue);
            CargarVentasPorSucursal(idSucursalSeleccionada);
        }

        private void ActualizarResumenTotales()
        {
            if (dtVentasSucursal == null) return;

            int totalFacturas = dtVentasSucursal.DefaultView.Count;
            decimal sumaMonto = 0;

            foreach (DataRowView fila in dtVentasSucursal.DefaultView)
            {
                sumaMonto += Convert.ToDecimal(fila["MONTO_TOTAL"]);
            }

            lblResumenTotales.Text = $"Facturas Activas: {totalFacturas}   |   Monto Total: {sumaMonto:C2}";
        }

        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            AplicarFiltroLocal();
        }

        private void AplicarFiltroLocal()
        {
            if (dtVentasSucursal == null) return;

            string filtro = txtBuscar.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {
                dtVentasSucursal.DefaultView.RowFilter = "";
            }
            else
            {
                dtVentasSucursal.DefaultView.RowFilter = string.Format(
                    "CONVERT(ID_FACTURA, 'System.String') LIKE '%{0}%' OR " +
                    "NUMERO_FACTURA LIKE '%{0}%' OR " +
                    "NOMBRE_CLIENTE LIKE '%{0}%'",
                    filtro
                );
            }

            ActualizarResumenTotales();
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
