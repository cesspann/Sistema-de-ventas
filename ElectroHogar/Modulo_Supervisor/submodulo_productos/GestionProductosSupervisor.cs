using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class GestionProductosSupervisor : Form
    {
        private const string PlaceholderText = "Buscar por ID, categoría, producto, stock, precio, estado o descuento...";
        private DataTable dtProductos;
        private ContextMenuStrip menuInactivos;
        private int idEmpleadoActual;

        public GestionProductosSupervisor()
        {
            InitializeComponent();
            this.idEmpleadoActual = SesionUsuario.IdEmpleado > 0 ? SesionUsuario.IdEmpleado : 1;
            btnAgregarPromocion.Text = "Gestionar Promociones";
            ConfigurarPlaceholder();
            InicializarMenuInactivos();
            ConfigurarTabla();
            CargarProductos();
        }

        private void InicializarMenuInactivos()
        {
            menuInactivos = new ContextMenuStrip();
            menuInactivos.ImageScalingSize = new Size(20, 20);
            menuInactivos.Font = new Font("Segoe UI", 9.5F);
            menuInactivos.Items.Add(" Categorías Inactivas", null, (s, e) => AbrirCategoriasInactivas());
            menuInactivos.Items.Add(" Productos Inactivos", null, (s, e) => AbrirProductosInactivos());
        }

        private void AbrirCategoriasInactivas()
        {
            CategoriasInactivas ventanaCategorias = new CategoriasInactivas();
            if (ventanaCategorias.ShowDialog() == DialogResult.OK)
            {
                CargarProductos();
            }
        }

        private void AbrirProductosInactivos()
        {
            productosInactivos ventanaInactivos = new productosInactivos();
            if (ventanaInactivos.ShowDialog() == DialogResult.OK)
            {
                CargarProductos();
            }
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

        // Llama a SP_CONSULTAR_PRODUCTOS(P_ID_EMPLEADO, P_BUSQUEDA)
        private void CargarProductos()
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_PRODUCTOS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_EMPLEADO", this.idEmpleadoActual);
                        cmd.Parameters.AddWithValue("P_BUSQUEDA", DBNull.Value);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtProductos = new DataTable();
                        da.Fill(dtProductos);

                        dgvProductos.DataSource = dtProductos;
                        FormatearColumnas();
                        AplicarFiltroLocal();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al cargar productos: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
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

            dgvProductos.Columns["ID_PRODUCTO"].FillWeight = 45;
            dgvProductos.Columns["ID_CATEGORIA"].FillWeight = 45;
            dgvProductos.Columns["STOCK"].FillWeight = 50;
            dgvProductos.Columns["ESTADO_PRODUCTO"].FillWeight = 60;
            dgvProductos.Columns["PORCENTAJE_DESCUENTO"].FillWeight = 55;
        }

        // --- BOTONES SUPERIORES ---
        private void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            RegistrarProducto modalProducto = new RegistrarProducto();
            if (modalProducto.ShowDialog() == DialogResult.OK)
            {
                CargarProductos();
            }
        }

        private void btnAgregarCategoria_Click(object sender, EventArgs e)
        {
            FrmAgregarCategoria modalCategoria = new FrmAgregarCategoria();
            if (modalCategoria.ShowDialog() == DialogResult.OK)
            {
                CargarProductos();
            }
        }

        private void btnAgregarPromocion_Click(object sender, EventArgs e)
        {
            GestionarPromociones ventanaPromociones = new GestionarPromociones();
            if (ventanaPromociones.ShowDialog() == DialogResult.OK)
            {
                CargarProductos();
            }
        }

        private void btnProductosInactivos_Click(object sender, EventArgs e)
        {
            menuInactivos.Show(btnProductosInactivos, new Point(0, btnProductosInactivos.Height));
        }

        // --- BOTONES INFERIORES (ACCIONES SOBRE PRODUCTO SELECCIONADO) ---
        private void btnActualizarProducto_Click(object sender, EventArgs e)
        {
            if (dgvProductos.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un producto de la tabla para actualizar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idProducto = Convert.ToInt32(dgvProductos.SelectedRows[0].Cells["ID_PRODUCTO"].Value);
            string nombreProducto = dgvProductos.SelectedRows[0].Cells["NOMBRE_PRODUCTO"].Value.ToString();
            decimal precioActual = Convert.ToDecimal(dgvProductos.SelectedRows[0].Cells["PRECIO_VENTA"].Value);

            ActualizarProducto modalActualizar = new ActualizarProducto(idProducto, nombreProducto, precioActual);
            if (modalActualizar.ShowDialog() == DialogResult.OK)
            {
                CargarProductos();
            }
        }

        private void btnHistorialPrecios_Click(object sender, EventArgs e)
        {
            if (dgvProductos.SelectedRows.Count > 0)
            {
                int idProducto = Convert.ToInt32(dgvProductos.SelectedRows[0].Cells["ID_PRODUCTO"].Value);
                string nombreProducto = dgvProductos.SelectedRows[0].Cells["NOMBRE_PRODUCTO"].Value.ToString();

                bitacora_precios ventanaHistorial = new bitacora_precios(this.idEmpleadoActual, idProducto, nombreProducto);
                ventanaHistorial.ShowDialog();
            }
            else
            {
                bitacora_precios ventanaHistorial = new bitacora_precios(this.idEmpleadoActual);
                ventanaHistorial.ShowDialog();
            }
        }

        // --- BÚSQUEDA DINÁMICA ---
        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            AplicarFiltroLocal();
        }

        private void AplicarFiltroLocal()
        {
            if (dtProductos == null) return;

            string filtro = txtBuscar.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {
                dtProductos.DefaultView.RowFilter = "";
                return;
            }

            dtProductos.DefaultView.RowFilter = string.Format(
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