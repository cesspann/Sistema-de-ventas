using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.ReportesLocales
{
    public partial class ventas_general : Form
    {
        private const string PlaceholderText = "Buscar por ID factura, número de factura o cliente...";
        private DataTable dtFacturas;
        private int idSucursalActual;
        private int idEmpleadoActual;

        public ventas_general(int idSucursal = 1, int idEmpleado = 1)
        {
            InitializeComponent();
            this.idSucursalActual = idSucursal;
            this.idEmpleadoActual = idEmpleado;
            ConfigurarPlaceholder();
            ConfigurarTabla();
            InicializarEstructuraTabla();
        }

        private void ConfigurarTabla()
        {
            dgvFacturas.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvFacturas.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvFacturas.MultiSelect = false;
            dgvFacturas.ReadOnly = true;
            dgvFacturas.AllowUserToAddRows = false;
            dgvFacturas.RowHeadersVisible = false;
            dgvFacturas.BackgroundColor = Color.White;
            dgvFacturas.BorderStyle = BorderStyle.FixedSingle;

            dgvFacturas.EnableHeadersVisualStyles = false;
            dgvFacturas.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvFacturas.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvFacturas.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvFacturas.ColumnHeadersHeight = 38;

            dgvFacturas.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvFacturas.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvFacturas.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvFacturas.RowTemplate.Height = 32;
        }

        // Estructura exacta según las 7 columnas de SP_CONSULTAR_FACTURAS
        private void InicializarEstructuraTabla()
        {
            dtFacturas = new DataTable();
            dtFacturas.Columns.Add("ID_FACTURA", typeof(int));
            dtFacturas.Columns.Add("NUMERO_FACTURA", typeof(string));
            dtFacturas.Columns.Add("NOMBRE_CLIENTE", typeof(string));
            dtFacturas.Columns.Add("NOMBRE_SUCURSAL", typeof(string));
            dtFacturas.Columns.Add("FECHA_HORA", typeof(DateTime));
            dtFacturas.Columns.Add("MONTO_TOTAL", typeof(decimal));
            dtFacturas.Columns.Add("METODO_PAGO", typeof(string));

            dgvFacturas.DataSource = dtFacturas;

            dgvFacturas.Columns["ID_FACTURA"].HeaderText = "ID";
            dgvFacturas.Columns["NUMERO_FACTURA"].HeaderText = "N° Factura";
            dgvFacturas.Columns["NOMBRE_CLIENTE"].HeaderText = "Cliente";
            dgvFacturas.Columns["NOMBRE_SUCURSAL"].HeaderText = "Sucursal";
            dgvFacturas.Columns["FECHA_HORA"].HeaderText = "Fecha y Hora";
            dgvFacturas.Columns["MONTO_TOTAL"].HeaderText = "Monto Total";
            dgvFacturas.Columns["METODO_PAGO"].HeaderText = "Método Pago";

            dgvFacturas.Columns["FECHA_HORA"].DefaultCellStyle.Format = "dd/MM/yyyy HH:mm";
            dgvFacturas.Columns["MONTO_TOTAL"].DefaultCellStyle.Format = "C2";
            dgvFacturas.Columns["ID_FACTURA"].FillWeight = 40;
            dgvFacturas.Columns["NUMERO_FACTURA"].FillWeight = 75;
        }

        // --- BOTÓN INFERIOR: ANULAR FACTURA (SP_ANULAR_FACTURA) ---
        private void btnAnularFactura_Click(object sender, EventArgs e)
        {
            if (dgvFacturas.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione una factura activa de la tabla para anularla.",
                                "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idFactura = Convert.ToInt32(dgvFacturas.SelectedRows[0].Cells["ID_FACTURA"].Value);
            string numeroFactura = dgvFacturas.SelectedRows[0].Cells["NUMERO_FACTURA"].Value.ToString();
            string cliente = dgvFacturas.SelectedRows[0].Cells["NOMBRE_CLIENTE"].Value.ToString();

            string motivo = SolicitarMotivoCancelacion(numeroFactura, cliente);

            if (string.IsNullOrWhiteSpace(motivo))
            {
                return;
            }

            // Aquí se llamará a SP_ANULAR_FACTURA(idFactura, idEmpleadoActual, motivo)
            MessageBox.Show($"Factura '{numeroFactura}' (ID: {idFactura}) lista para anularse.\nMotivo: {motivo}",
                            "ElectroHogar - Anulación de Factura", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        // Cuadro de diálogo modal limpio para capturar P_MOTIVO_CANCELACION (VARCHAR 500)
        private string SolicitarMotivoCancelacion(string numeroFactura, string cliente)
        {
            Form prompt = new Form()
            {
                Width = 450,
                Height = 265,
                FormBorderStyle = FormBorderStyle.FixedDialog,
                Text = "Anular Factura",
                StartPosition = FormStartPosition.CenterParent,
                MaximizeBox = false,
                MinimizeBox = false,
                BackColor = Color.White
            };

            Label lblInfo = new Label()
            {
                Left = 20,
                Top = 18,
                Width = 395,
                Font = new Font("Segoe UI", 9.5F, FontStyle.Bold),
                ForeColor = Color.FromArgb(51, 82, 209),
                Text = $"Factura: {numeroFactura}  |  Cliente: {cliente}"
            };

            Label lblMotivo = new Label()
            {
                Left = 20,
                Top = 48,
                Width = 395,
                Font = new Font("Segoe UI", 9.5F, FontStyle.Bold),
                ForeColor = Color.DimGray,
                Text = "Motivo de cancelación (Obligatorio):*"
            };

            TextBox txtMotivo = new TextBox()
            {
                Left = 20,
                Top = 74,
                Width = 395,
                Height = 80,
                Multiline = true,
                MaxLength = 500,
                Font = new Font("Segoe UI", 9.5F)
            };

            Button btnCancelar = new Button()
            {
                Text = "Cancelar",
                Left = 175,
                Top = 172,
                Width = 110,
                Height = 36,
                FlatStyle = FlatStyle.Flat,
                BackColor = Color.FromArgb(240, 244, 248),
                ForeColor = Color.DimGray,
                Font = new Font("Segoe UI", 9.5F)
            };
            btnCancelar.FlatAppearance.BorderColor = Color.LightGray;
            btnCancelar.Click += (s, ev) => { prompt.DialogResult = DialogResult.Cancel; prompt.Close(); };

            Button btnConfirmar = new Button()
            {
                Text = "Confirmar Anulación",
                Left = 295,
                Top = 172,
                Width = 120,
                Height = 36,
                FlatStyle = FlatStyle.Flat,
                BackColor = Color.FromArgb(231, 76, 60),
                ForeColor = Color.White,
                Font = new Font("Segoe UI", 9F, FontStyle.Bold)
            };
            btnConfirmar.FlatAppearance.BorderSize = 0;
            btnConfirmar.Click += (s, ev) =>
            {
                if (string.IsNullOrWhiteSpace(txtMotivo.Text))
                {
                    MessageBox.Show("Debe indicar el motivo de cancelación.",
                                    "Campo Requerido", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtMotivo.Focus();
                    return;
                }
                prompt.DialogResult = DialogResult.OK;
                prompt.Close();
            };

            prompt.Controls.Add(lblInfo);
            prompt.Controls.Add(lblMotivo);
            prompt.Controls.Add(txtMotivo);
            prompt.Controls.Add(btnCancelar);
            prompt.Controls.Add(btnConfirmar);

            return prompt.ShowDialog() == DialogResult.OK ? txtMotivo.Text.Trim() : null;
        }

        private void ActualizarTotalesResumen()
        {
            if (dtFacturas == null) return;

            int totalFacturas = dtFacturas.DefaultView.Count;
            decimal sumaMonto = 0;

            foreach (DataRowView fila in dtFacturas.DefaultView)
            {
                sumaMonto += Convert.ToDecimal(fila["MONTO_TOTAL"]);
            }

            lblResumenTotales.Text = $"Facturas Activas: {totalFacturas}   |   Monto Total: {sumaMonto:C2}";
        }

        // --- BÚSQUEDA DINÁMICA (REPLICA EL WHERE DE SP_CONSULTAR_FACTURAS) ---
        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            if (dtFacturas == null) return;

            string filtro = txtBuscar.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {
                dtFacturas.DefaultView.RowFilter = "";
            }
            else
            {
                dtFacturas.DefaultView.RowFilter = string.Format(
                    "CONVERT(ID_FACTURA, 'System.String') LIKE '%{0}%' OR " +
                    "NUMERO_FACTURA LIKE '%{0}%' OR " +
                    "NOMBRE_CLIENTE LIKE '%{0}%'",
                    filtro
                );
            }

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