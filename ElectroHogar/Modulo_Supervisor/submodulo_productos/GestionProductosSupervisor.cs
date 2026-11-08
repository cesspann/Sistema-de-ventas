using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class GestionProductosSupervisor : Form
    {
        private const string PlaceholderText = "Buscar por ID, categoría, producto, stock, precio, estado o promoción...";
        private DataTable dtProductos;
        private ContextMenuStrip menuInactivos;

        public GestionProductosSupervisor()
        {
            InitializeComponent();
            ConfigurarPlaceholder();
            InicializarMenuInactivos();
            ConfigurarTabla();
            InicializarEstructuraTabla();
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
            ventanaCategorias.ShowDialog();
        }


        private void AbrirProductosInactivos()
        {
            productosInactivos ventanaInactivos = new productosInactivos();
            ventanaInactivos.ShowDialog();
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
            dgvProductos.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            dgvProductos.ColumnHeadersHeight = 38;

            dgvProductos.DefaultCellStyle.Font = new Font("Segoe UI", 10F);
            dgvProductos.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvProductos.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvProductos.RowTemplate.Height = 32;
        }

        private void InicializarEstructuraTabla()
        {
            dtProductos = new DataTable();
            dtProductos.Columns.Add("ID_PRODUCTO", typeof(int));
            dtProductos.Columns.Add("NOMBRE_CATEGORIA", typeof(string));
            dtProductos.Columns.Add("NOMBRE_PRODUCTO", typeof(string));
            dtProductos.Columns.Add("STOCK", typeof(int));
            dtProductos.Columns.Add("PRECIO_VENTA", typeof(decimal));
            dtProductos.Columns.Add("ESTADO_PRODUCTO", typeof(string));
            dtProductos.Columns.Add("PROMOCION", typeof(string));

            dgvProductos.DataSource = dtProductos;

            dgvProductos.Columns["ID_PRODUCTO"].HeaderText = "ID Producto";
            dgvProductos.Columns["NOMBRE_CATEGORIA"].HeaderText = "Categoría";
            dgvProductos.Columns["NOMBRE_PRODUCTO"].HeaderText = "Nombre Producto";
            dgvProductos.Columns["STOCK"].HeaderText = "Stock";
            dgvProductos.Columns["PRECIO_VENTA"].HeaderText = "Precio Venta";
            dgvProductos.Columns["ESTADO_PRODUCTO"].HeaderText = "Estado";
            dgvProductos.Columns["PROMOCION"].HeaderText = "Promoción";

            dgvProductos.Columns["PRECIO_VENTA"].DefaultCellStyle.Format = "C2";
        }

        // --- BOTONES SUPERIORES ---
        private void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            RegistrarProducto modalProducto = new RegistrarProducto();
            modalProducto.ShowDialog();
        }

        private void btnAgregarCategoria_Click(object sender, EventArgs e)
        {
            FrmAgregarCategoria modalCategoria = new FrmAgregarCategoria();
            modalCategoria.ShowDialog();
        }

        private void btnAgregarPromocion_Click(object sender, EventArgs e)
        {
            RegistrarPromocion modalPromocion = new RegistrarPromocion();
            modalPromocion.ShowDialog();
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
            modalActualizar.ShowDialog();
        }

        private void btnHistorialPrecios_Click(object sender, EventArgs e)
        {
            if (dgvProductos.SelectedRows.Count > 0)
            {
                int idProducto = Convert.ToInt32(dgvProductos.SelectedRows[0].Cells["ID_PRODUCTO"].Value);
                string nombreProducto = dgvProductos.SelectedRows[0].Cells["NOMBRE_PRODUCTO"].Value.ToString();

                bitacora_precios ventanaHistorial = new bitacora_precios(1, idProducto, nombreProducto);
                ventanaHistorial.ShowDialog();
            }
            else
            {
                bitacora_precios ventanaHistorial = new bitacora_precios(1);
                ventanaHistorial.ShowDialog();
            }
        }

        // --- BÚSQUEDA DINÁMICA ---
        private void txtBuscar_TextChanged(object sender, EventArgs e)
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
                "NOMBRE_CATEGORIA LIKE '%{0}%' OR " +
                "NOMBRE_PRODUCTO LIKE '%{0}%' OR " +
                "CONVERT(STOCK, 'System.String') LIKE '%{0}%' OR " +
                "CONVERT(PRECIO_VENTA, 'System.String') LIKE '%{0}%' OR " +
                "ESTADO_PRODUCTO LIKE '%{0}%' OR " +
                "PROMOCION LIKE '%{0}%'",
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
