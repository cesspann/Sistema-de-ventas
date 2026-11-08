using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.OtrasSucursales
{
    public partial class productos : Form
    {
        private const string PlaceholderText = "Buscar por ID, categoría, producto, stock, precio, estado o descuento...";
        private DataTable dtProductosSucursal;
        private int idEmpleadoActual;

        public productos(int idEmpleado = 1)
        {
            InitializeComponent();
            this.idEmpleadoActual = idEmpleado;
            ConfigurarPlaceholder();
            ConfigurarTabla();
            InicializarEstructuraTabla();
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

        // Estructura exacta según las 9 columnas de SP_CONSULTAR_PRODUCTOS_SUCURSAL
        private void InicializarEstructuraTabla()
        {
            dtProductosSucursal = new DataTable();
            dtProductosSucursal.Columns.Add("ID_PRODUCTO", typeof(int));
            dtProductosSucursal.Columns.Add("ID_CATEGORIA", typeof(int));
            dtProductosSucursal.Columns.Add("NOMBRE_CATEGORIA", typeof(string));
            dtProductosSucursal.Columns.Add("NOMBRE_PRODUCTO", typeof(string));
            dtProductosSucursal.Columns.Add("STOCK", typeof(int));
            dtProductosSucursal.Columns.Add("PRECIO_VENTA", typeof(decimal));
            dtProductosSucursal.Columns.Add("ESTADO_PRODUCTO", typeof(string));
            dtProductosSucursal.Columns.Add("PORCENTAJE_DESCUENTO", typeof(decimal));
            dtProductosSucursal.Columns.Add("PRECIO_FINAL", typeof(decimal));

            dgvProductos.DataSource = dtProductosSucursal;

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

        // --- CAMBIO DE SUCURSAL ---
        private void cmbSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbSucursal.SelectedItem == null) return;
            // Aquí se llamará a SP_CONSULTAR_PRODUCTOS_SUCURSAL(idEmpleadoActual, busqueda, idSucursalSeleccionada)
        }

        // --- FILTRO RÁPIDO EN MEMORIA (REPLICA EL WHERE DE SP_CONSULTAR_PRODUCTOS_SUCURSAL) ---
        private void txtBuscar_TextChanged(object sender, EventArgs e)
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
