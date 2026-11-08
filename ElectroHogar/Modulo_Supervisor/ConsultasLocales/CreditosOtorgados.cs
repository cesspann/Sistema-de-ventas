using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.ConsultasLocales
{
    public partial class CreditosOtorgados : Form
    {
        private const string PlaceholderText = "Buscar por ID crédito, ID cliente, nombre cliente, ID factura o N° factura...";
        private DataTable dtCreditos;
        private int idSucursalActual;

        public CreditosOtorgados(int idSucursal = 1)
        {
            InitializeComponent();
            this.idSucursalActual = idSucursal;
            ConfigurarPlaceholder();
            ConfigurarComboEstado();
            ConfigurarTabla();
            InicializarEstructuraTabla();
        }

        private void ConfigurarComboEstado()
        {
            cmbEstado.Items.AddRange(new object[] { "Todos", "Activo", "Pagado", "Cancelado" });
            cmbEstado.SelectedIndex = 0;
        }

        private void ConfigurarTabla()
        {
            dgvCreditos.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvCreditos.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvCreditos.MultiSelect = false;
            dgvCreditos.ReadOnly = true;
            dgvCreditos.AllowUserToAddRows = false;
            dgvCreditos.RowHeadersVisible = false;
            dgvCreditos.BackgroundColor = Color.White;
            dgvCreditos.BorderStyle = BorderStyle.FixedSingle;

            dgvCreditos.EnableHeadersVisualStyles = false;
            dgvCreditos.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvCreditos.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvCreditos.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvCreditos.ColumnHeadersHeight = 38;

            dgvCreditos.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvCreditos.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvCreditos.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvCreditos.RowTemplate.Height = 32;
        }

        // Estructura exacta según las 10 columnas de SP_CONSULTAR_CREDITOS
        private void InicializarEstructuraTabla()
        {
            dtCreditos = new DataTable();
            dtCreditos.Columns.Add("ID_CREDITO", typeof(int));
            dtCreditos.Columns.Add("ID_CLIENTE", typeof(int));
            dtCreditos.Columns.Add("NOMBRE_CLIENTE", typeof(string));
            dtCreditos.Columns.Add("ID_FACTURA", typeof(int));
            dtCreditos.Columns.Add("NUMERO_FACTURA", typeof(string));
            dtCreditos.Columns.Add("TOTAL_FACTURA", typeof(decimal));
            dtCreditos.Columns.Add("MONTO_FINANCIADO", typeof(decimal));
            dtCreditos.Columns.Add("SALDO_PENDIENTE", typeof(decimal));
            dtCreditos.Columns.Add("ESTADO_CREDITO", typeof(string));
            dtCreditos.Columns.Add("FECHA_OTORGACION", typeof(DateTime));

            dgvCreditos.DataSource = dtCreditos;

            dgvCreditos.Columns["ID_CREDITO"].HeaderText = "ID Créd.";
            dgvCreditos.Columns["ID_CLIENTE"].HeaderText = "ID Cli.";
            dgvCreditos.Columns["NOMBRE_CLIENTE"].HeaderText = "Cliente";
            dgvCreditos.Columns["ID_FACTURA"].HeaderText = "ID Fact.";
            dgvCreditos.Columns["NUMERO_FACTURA"].HeaderText = "N° Factura";
            dgvCreditos.Columns["TOTAL_FACTURA"].HeaderText = "Total Factura";
            dgvCreditos.Columns["MONTO_FINANCIADO"].HeaderText = "Monto Financiado";
            dgvCreditos.Columns["SALDO_PENDIENTE"].HeaderText = "Saldo Pendiente";
            dgvCreditos.Columns["ESTADO_CREDITO"].HeaderText = "Estado";
            dgvCreditos.Columns["FECHA_OTORGACION"].HeaderText = "Otorgación";

            dgvCreditos.Columns["TOTAL_FACTURA"].DefaultCellStyle.Format = "C2";
            dgvCreditos.Columns["MONTO_FINANCIADO"].DefaultCellStyle.Format = "C2";
            dgvCreditos.Columns["SALDO_PENDIENTE"].DefaultCellStyle.Format = "C2";
            dgvCreditos.Columns["FECHA_OTORGACION"].DefaultCellStyle.Format = "dd/MM/yyyy";

            dgvCreditos.Columns["ID_CREDITO"].FillWeight = 42;
            dgvCreditos.Columns["ID_CLIENTE"].FillWeight = 42;
            dgvCreditos.Columns["ID_FACTURA"].FillWeight = 42;
            dgvCreditos.Columns["ESTADO_CREDITO"].FillWeight = 60;
        }

        // --- FILTRO RÁPIDO EN MEMORIA (REPLICA EL WHERE DE SP_CONSULTAR_CREDITOS) ---
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
            if (dtCreditos == null) return;

            string filtroTexto = txtBuscar.Text.Trim().Replace("'", "''");
            string estadoSeleccionado = cmbEstado.SelectedItem?.ToString() ?? "Todos";
            string condicion = "";

            if (!string.IsNullOrEmpty(filtroTexto) && filtroTexto != PlaceholderText)
            {
                condicion = string.Format(
                    "(CONVERT(ID_CLIENTE, 'System.String') LIKE '%{0}%' OR " +
                    "NOMBRE_CLIENTE LIKE '%{0}%' OR " +
                    "CONVERT(ID_FACTURA, 'System.String') LIKE '%{0}%' OR " +
                    "CONVERT(ID_CREDITO, 'System.String') LIKE '%{0}%' OR " +
                    "NUMERO_FACTURA LIKE '%{0}%')",
                    filtroTexto
                );
            }

            if (estadoSeleccionado != "Todos")
            {
                condicion += (condicion.Length > 0 ? " AND " : "") + $"ESTADO_CREDITO = '{estadoSeleccionado}'";
            }

            dtCreditos.DefaultView.RowFilter = condicion;
            ActualizarResumenTotales();
        }

        private void ActualizarResumenTotales()
        {
            if (dtCreditos == null) return;

            decimal totalFinanciado = 0;
            decimal totalSaldoPendiente = 0;

            foreach (DataRowView fila in dtCreditos.DefaultView)
            {
                totalFinanciado += Convert.ToDecimal(fila["MONTO_FINANCIADO"]);
                totalSaldoPendiente += Convert.ToDecimal(fila["SALDO_PENDIENTE"]);
            }

            lblResumenTotales.Text = $"Créditos: {dtCreditos.DefaultView.Count}   |   Total Financiado: {totalFinanciado:C2}   |   Saldo Pendiente: {totalSaldoPendiente:C2}";
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
