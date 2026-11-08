using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.OtrasSucursales
{
    public partial class ventas : Form
    {
        private const string PlaceholderText = "Buscar por ID factura, número de factura o cliente...";
        private DataTable dtVentasSucursal;

        public ventas()
        {
            InitializeComponent();
            ConfigurarPlaceholder();
            ConfigurarTabla();
            InicializarEstructuraTabla();
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

        // Estructura exacta según las 7 columnas de SP_CONSULTAR_FACTURAS
        private void InicializarEstructuraTabla()
        {
            dtVentasSucursal = new DataTable();
            dtVentasSucursal.Columns.Add("ID_FACTURA", typeof(int));
            dtVentasSucursal.Columns.Add("NUMERO_FACTURA", typeof(string));
            dtVentasSucursal.Columns.Add("NOMBRE_CLIENTE", typeof(string));
            dtVentasSucursal.Columns.Add("NOMBRE_SUCURSAL", typeof(string));
            dtVentasSucursal.Columns.Add("FECHA_HORA", typeof(DateTime));
            dtVentasSucursal.Columns.Add("MONTO_TOTAL", typeof(decimal));
            dtVentasSucursal.Columns.Add("METODO_PAGO", typeof(string));

            dgvVentas.DataSource = dtVentasSucursal;

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

        // --- CAMBIO DE SUCURSAL ---
        private void cmbSucursal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cmbSucursal.SelectedItem == null) return;
            // Aquí se llamará a SP_CONSULTAR_FACTURAS(idSucursalSeleccionada, busqueda)
            ActualizarResumenTotales();
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

        // --- FILTRO RÁPIDO EN MEMORIA (REPLICA EL WHERE DE SP_CONSULTAR_FACTURAS) ---
        private void txtBuscar_TextChanged(object sender, EventArgs e)
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
