using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Vendedor.Modulo_consultasVendedor
{
    public partial class ConsultarProductosPromocion : Form
    {
        private const string PlaceholderText = "Buscar por ID, producto, precio, promoción o estado...";
        private DataTable dtProductos;

        public ConsultarProductosPromocion()
        {
            InitializeComponent();
            ConfigurarPlaceholder();
            ConfigurarTabla();
            CargarDatosSimulados();
        }

        private void ConfigurarTabla()
        {
            // Estilizado limpio para el DataGridView
            dgvProductos.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvProductos.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvProductos.MultiSelect = false;
            dgvProductos.ReadOnly = true;
            dgvProductos.AllowUserToAddRows = false;
            dgvProductos.RowHeadersVisible = false;
            dgvProductos.BackgroundColor = Color.White;
            dgvProductos.BorderStyle = BorderStyle.FixedSingle;

            // Estilo de encabezados
            dgvProductos.EnableHeadersVisualStyles = false;
            dgvProductos.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvProductos.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvProductos.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 10F, FontStyle.Bold);
            dgvProductos.ColumnHeadersHeight = 38;

            // Estilo de filas
            dgvProductos.DefaultCellStyle.Font = new Font("Segoe UI", 10F);
            dgvProductos.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvProductos.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvProductos.RowTemplate.Height = 32;
        }

        // Simula los datos que devolverá SP_CONSULTAR_PRODUCTOS + el JOIN de Promociones
        private void CargarDatosSimulados()
        {
            dtProductos = new DataTable();
            dtProductos.Columns.Add("ID_PRODUCTO", typeof(int));
            dtProductos.Columns.Add("ID_CATEGORIA", typeof(int));
            dtProductos.Columns.Add("NOMBRE_PRODUCTO", typeof(string));
            dtProductos.Columns.Add("STOCK", typeof(int));
            dtProductos.Columns.Add("PRECIO_VENTA", typeof(decimal));
            dtProductos.Columns.Add("PROMOCION", typeof(string)); // Campo del futuro JOIN
            dtProductos.Columns.Add("ESTADO_PRODUCTO", typeof(string));

            // Filas de ejemplo para visualizar la interfaz
            dtProductos.Rows.Add(105, 2, "Refrigeradora Samsung 14 Pies", 8, 649.99m, "15% Descuento Verano", "Activo");
            dtProductos.Rows.Add(104, 1, "Smart TV LG 55\" 4K UHD", 12, 520.00m, "Sin promoción", "Activo");
            dtProductos.Rows.Add(103, 3, "Lavadora Whirlpool 18Kg", 4, 480.50m, "2x1 en Garantía Extendida", "Activo");
            dtProductos.Rows.Add(102, 4, "Licuadora Oster 3 Velocidades", 25, 45.00m, "10% Descuento", "Activo");
            dtProductos.Rows.Add(101, 2, "Microondas Panasonic Inverter", 0, 135.00m, "Sin promoción", "Agotado");

            dgvProductos.DataSource = dtProductos;

            // Renombramos los encabezados visibles para que se vean amigables al vendedor
            dgvProductos.Columns["ID_PRODUCTO"].HeaderText = "ID Producto";
            dgvProductos.Columns["ID_CATEGORIA"].HeaderText = "Categoría";
            dgvProductos.Columns["NOMBRE_PRODUCTO"].HeaderText = "Nombre del Producto";
            dgvProductos.Columns["STOCK"].HeaderText = "Stock";
            dgvProductos.Columns["PRECIO_VENTA"].HeaderText = "Precio Venta ($)";
            dgvProductos.Columns["PROMOCION"].HeaderText = "Promoción Activa";
            dgvProductos.Columns["ESTADO_PRODUCTO"].HeaderText = "Estado";

            // Formato de moneda para el precio
            dgvProductos.Columns["PRECIO_VENTA"].DefaultCellStyle.Format = "C2";
        }

        // Replica el comportamiento del parámetro P_BUSQUEDA de tu Stored Procedure
        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            if (dtProductos == null) return;

            string filtro = txtBuscar.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {
                dtProductos.DefaultView.RowFilter = "";
                return;
            }

            // Filtra por cualquiera de las columnas igual que el WHERE LIKE de tu SP
            dtProductos.DefaultView.RowFilter = string.Format(
                "CONVERT(ID_PRODUCTO, 'System.String') LIKE '%{0}%' OR " +
                "CONVERT(ID_CATEGORIA, 'System.String') LIKE '%{0}%' OR " +
                "NOMBRE_PRODUCTO LIKE '%{0}%' OR " +
                "CONVERT(STOCK, 'System.String') LIKE '%{0}%' OR " +
                "CONVERT(PRECIO_VENTA, 'System.String') LIKE '%{0}%' OR " +
                "PROMOCION LIKE '%{0}%' OR " +
                "ESTADO_PRODUCTO LIKE '%{0}%'",
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
