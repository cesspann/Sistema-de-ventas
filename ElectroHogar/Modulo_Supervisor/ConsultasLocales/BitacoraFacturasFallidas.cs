using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.ConsultasLocales
{
    public partial class BitacoraFacturasFallidas : Form
    {
        private const string PlaceholderText = "Buscar por ID bitácora, ID factura, ID empleado o motivo...";
        private DataTable dtBitacora;

        public BitacoraFacturasFallidas()
        {
            InitializeComponent();
            ConfigurarFechas();
            ConfigurarPlaceholder();
            ConfigurarTabla();
            InicializarEstructuraTabla();
        }

        private void ConfigurarFechas()
        {
            dtpFechaDesde.Format = DateTimePickerFormat.Short;
            dtpFechaHasta.Format = DateTimePickerFormat.Short;

            // Permiten enviar NULL al SP si el usuario desmarca la casilla
            dtpFechaDesde.ShowCheckBox = true;
            dtpFechaHasta.ShowCheckBox = true;

            dtpFechaDesde.Value = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
            dtpFechaHasta.Value = DateTime.Today;

            dtpFechaDesde.Checked = false;
            dtpFechaHasta.Checked = false;
        }

        private void ConfigurarTabla()
        {
            dgvBitacora.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvBitacora.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvBitacora.MultiSelect = false;
            dgvBitacora.ReadOnly = true;
            dgvBitacora.AllowUserToAddRows = false;
            dgvBitacora.RowHeadersVisible = false;
            dgvBitacora.BackgroundColor = Color.White;
            dgvBitacora.BorderStyle = BorderStyle.FixedSingle;

            dgvBitacora.EnableHeadersVisualStyles = false;
            dgvBitacora.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvBitacora.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvBitacora.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvBitacora.ColumnHeadersHeight = 38;

            dgvBitacora.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvBitacora.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvBitacora.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvBitacora.RowTemplate.Height = 32;
        }

        // Estructura exacta según las 5 columnas de SP_CONSULTAR_BITACORA_FACTURA_ANULADA
        private void InicializarEstructuraTabla()
        {
            dtBitacora = new DataTable();
            dtBitacora.Columns.Add("ID_BITACORA_FACTURA", typeof(int));
            dtBitacora.Columns.Add("ID_FACTURA", typeof(int));
            dtBitacora.Columns.Add("ID_EMPLEADO", typeof(int));
            dtBitacora.Columns.Add("FECHA_CREACION", typeof(DateTime));
            dtBitacora.Columns.Add("MOTIVO_DE_CANCELACION", typeof(string));

            dgvBitacora.DataSource = dtBitacora;

            dgvBitacora.Columns["ID_BITACORA_FACTURA"].HeaderText = "ID Bitácora";
            dgvBitacora.Columns["ID_FACTURA"].HeaderText = "ID Factura";
            dgvBitacora.Columns["ID_EMPLEADO"].HeaderText = "ID Empleado";
            dgvBitacora.Columns["FECHA_CREACION"].HeaderText = "Fecha Anulación";
            dgvBitacora.Columns["MOTIVO_DE_CANCELACION"].HeaderText = "Motivo de Cancelación";

            dgvBitacora.Columns["FECHA_CREACION"].DefaultCellStyle.Format = "dd/MM/yyyy HH:mm";
            dgvBitacora.Columns["ID_BITACORA_FACTURA"].FillWeight = 45;
            dgvBitacora.Columns["ID_FACTURA"].FillWeight = 45;
            dgvBitacora.Columns["ID_EMPLEADO"].FillWeight = 45;
            dgvBitacora.Columns["FECHA_CREACION"].FillWeight = 65;
            dgvBitacora.Columns["MOTIVO_DE_CANCELACION"].FillWeight = 140;
        }

        // --- BOTÓN CONSULTAR ---
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (dtpFechaDesde.Checked && dtpFechaHasta.Checked && dtpFechaDesde.Value.Date > dtpFechaHasta.Value.Date)
            {
                MessageBox.Show("La fecha inicial no puede ser mayor que la fecha final.",
                                "Periodo Inválido", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                dtpFechaDesde.Focus();
                return;
            }

            // Parámetros listos para SP_CONSULTAR_BITACORA_FACTURA_ANULADA:
            // P_BUSQUEDA = (txtBuscar.Text == PlaceholderText) ? null : txtBuscar.Text.Trim()
            // P_FECHA_DESDE = dtpFechaDesde.Checked ? (DateTime?)dtpFechaDesde.Value.Date : null
            // P_FECHA_HASTA = dtpFechaHasta.Checked ? (DateTime?)dtpFechaHasta.Value.Date.AddDays(1).AddSeconds(-1) : null
            AplicarFiltrosLocales();
        }

        // --- FILTRO RÁPIDO EN MEMORIA ---
        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            AplicarFiltrosLocales();
        }

        private void dtpFecha_ValueChanged(object sender, EventArgs e)
        {
            AplicarFiltrosLocales();
        }

        private void AplicarFiltrosLocales()
        {
            if (dtBitacora == null) return;

            string filtroTexto = txtBuscar.Text.Trim().Replace("'", "''");
            string condicion = "";

            if (!string.IsNullOrEmpty(filtroTexto) && filtroTexto != PlaceholderText)
            {
                condicion = string.Format(
                    "(CONVERT(ID_BITACORA_FACTURA, 'System.String') LIKE '%{0}%' OR " +
                    "CONVERT(ID_FACTURA, 'System.String') LIKE '%{0}%' OR " +
                    "CONVERT(ID_EMPLEADO, 'System.String') LIKE '%{0}%' OR " +
                    "MOTIVO_DE_CANCELACION LIKE '%{0}%')",
                    filtroTexto
                );
            }

            if (dtpFechaDesde.Checked)
            {
                string fechaInicio = dtpFechaDesde.Value.Date.ToString("MM/dd/yyyy");
                condicion += (condicion.Length > 0 ? " AND " : "") + $"FECHA_CREACION >= #{fechaInicio}#";
            }

            if (dtpFechaHasta.Checked)
            {
                string fechaFin = dtpFechaHasta.Value.Date.AddDays(1).ToString("MM/dd/yyyy");
                condicion += (condicion.Length > 0 ? " AND " : "") + $"FECHA_CREACION < #{fechaFin}#";
            }

            dtBitacora.DefaultView.RowFilter = condicion;
            lblTotalRegistros.Text = $"Registros encontrados: {dtBitacora.DefaultView.Count}";
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
