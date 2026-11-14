using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.OtrasSucursales
{
    public partial class productos : Form
    {
        private const string PlaceholderText = "Buscar por ID, categoría, producto, stock, precio, estado o descuento...";
        private DataTable dtProductosSucursal;
        private int idEmpleadoActual;
        private bool cargandoSucursales = false;

        public productos(int idEmpleado = 0)
        {
            InitializeComponent();
            this.idEmpleadoActual = idEmpleado > 0 ? idEmpleado : (SesionUsuario.IdEmpleado > 0 ? SesionUsuario.IdEmpleado : 1);
            ConfigurarPlaceholder();
            ConfigurarTabla();
            CargarSucursales();
        }

        private void ConfigurarTabla()
        {
            dgvProductos.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvProductos.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvProductos.MultiSelect = false;
            dgvProductos.ReadOnly = true;
            dgvProductos.AllowUserToAddRows = false;
            dgvProductos.RowHeadersVisible = false;
            dgvProductos.BackgroundColor = Color.White;
            dgvProductos.BorderStyle = BorderStyle.FixedSingle;

            dgvProductos.EnableHeadersVisualStyles = false;
            dgvProductos.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvProductos.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvProductos.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvProductos.ColumnHeadersHeight = 38;

            dgvProductos.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvProductos.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvProductos.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvProductos.RowTemplate.Height = 32;
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
                        CargarProductosPorSucursal(Convert.ToInt32(cmbSucursal.SelectedValue));
                    }
                }
                catch (MySqlException ex)
                {
                    cargandoSucursales = false;
                    MessageBox.Show("Error al cargar sucursales: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void CargarProductosPorSucursal(int idSucursal)
        {
            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null) return;

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_PRODUCTOS_SUCURSAL", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_EMPLEADO", this.idEmpleadoActual);
                        cmd.Parameters.AddWithValue("P_BUSQUEDA", DBNull.Value);
                        cmd.Parameters.AddWithValue("ID_SUCURSAL", idSucursal);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtProductosSucursal = new DataTable();
                        da.Fill(dtProductosSucursal);

                        dgvProductos.DataSource = dtProductosSucursal;
                        FormatearColumnas();
                        AplicarFiltroLocal();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al consultar productos de la sucursal: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void FormatearColumnas()
        {
            if (dgvProductos.Columns.Count == 0) return;

            dgvProductos.Columns["ID_PRODUCTO"].HeaderText = "ID Prod.";
            dgvProductos.Columns["ID_CATEGORIA"].HeaderText = "ID Cat.";
            dgvProductos.Columns["NOMBRE_CATEGORIA"].HeaderText = "Categoría";
            dgvProductos.Columns["NOMBRE_PRODUCTO"].HeaderText = "Producto";
            dgvProductos.Columns["STOCK"].HeaderText = "Stock";
            dgvProductos.Columns["PRECIO_VENTA"].HeaderText = "Precio Normal";
            dgvProductos.Columns["ESTADO_PRODUCTO"].HeaderText = "Estado";
            dgvProductos.Columns["PORCENTAJE_DESCUENTO"].HeaderText = "Desc. (%)";
            dgvProductos.Columns["PRECIO_FINAL"].HeaderText = "Precio Final";

            dgvProductos.Columns["PRECIO_VENTA"].DefaultCellStyle.Format = "C2";
            dgvProductos.Columns["PRECIO_FINAL"].DefaultCellStyle.Format = "C2";
            dgvProductos.Columns["PORCENTAJE_DESCUENTO"].DefaultCellStyle.Format = "N2";

            dgvProductos.Columns["ID_PRODUCTO"].FillWeight = 42;
            dgvProductos.Columns["ID_CATEGORIA"].FillWeight = 42;
            dgvProductos.Columns["STOCK"].FillWeight = 48;
            dgvProductos.Columns["ESTADO_PRODUCTO"].FillWeight = 58;
            dgvProductos.Columns["PORCENTAJE_DESCUENTO"].FillWeight = 52;
        }

        private void cmbSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cargandoSucursales || cmbSucursal.SelectedValue == null) return;

            int idSucursalSeleccionada = Convert.ToInt32(cmbSucursal.SelectedValue);
            CargarProductosPorSucursal(idSucursalSeleccionada);
        }

        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            AplicarFiltroLocal();
        }

        private void AplicarFiltroLocal()
        {
            if (dtProductosSucursal == null) return;

            string filtro = txtBuscar.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {
                dtProductosSucursal.DefaultView.RowFilter = "";
                return;
            }

            dtProductosSucursal.DefaultView.RowFilter = string.Format(
                "CONVERT(ID_PRODUCTO, 'System.String') LIKE '%{0}%' OR " +
                "CONVERT(ID_CATEGORIA, 'System.String') LIKE '%{0}%' OR " +
                "NOMBRE_CATEGORIA LIKE '%{0}%' OR " +
                "NOMBRE_PRODUCTO LIKE '%{0}%' OR " +
                "CONVERT(STOCK, 'System.String') LIKE '%{0}%' OR " +
                "CONVERT(PRECIO_VENTA, 'System.String') LIKE '%{0}%' OR " +
                "ESTADO_PRODUCTO LIKE '%{0}%' OR " +
                "CONVERT(PORCENTAJE_DESCUENTO, 'System.String') LIKE '%{0}%'",
                filtro
            );
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
