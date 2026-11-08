using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.ConsultasLocales
{
    public partial class ClienteNatural : Form
    {
        private const string PlaceholderText = "Buscar por ID, nombre del cliente o DUI...";
        private DataTable dtClientesNaturales;
        private int idSucursalActual;

        public ClienteNatural(int idSucursal = 1)
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
            cmbEstado.Items.AddRange(new object[] { "Todos", "Activo", "Inactivo" });
            cmbEstado.SelectedIndex = 0;
        }

        private void ConfigurarTabla()
        {
            dgvClientes.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvClientes.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvClientes.MultiSelect = false;
            dgvClientes.ReadOnly = true;
            dgvClientes.AllowUserToAddRows = false;
            dgvClientes.RowHeadersVisible = false;
            dgvClientes.BackgroundColor = Color.White;
            dgvClientes.BorderStyle = BorderStyle.FixedSingle;

            dgvClientes.EnableHeadersVisualStyles = false;
            dgvClientes.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvClientes.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvClientes.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvClientes.ColumnHeadersHeight = 38;

            dgvClientes.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvClientes.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvClientes.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvClientes.RowTemplate.Height = 32;
        }

        // Estructura exacta según las 7 columnas de SP_CONSULTAR_CLIENTE_NATURAL
        private void InicializarEstructuraTabla()
        {
            dtClientesNaturales = new DataTable();
            dtClientesNaturales.Columns.Add("ID_CLIENTE", typeof(int));
            dtClientesNaturales.Columns.Add("NOMBRE_CLIENTE", typeof(string));
            dtClientesNaturales.Columns.Add("DUI_CLIENTE", typeof(string));
            dtClientesNaturales.Columns.Add("CORREO", typeof(string));
            dtClientesNaturales.Columns.Add("TELEFONO_CLIENTE", typeof(string));
            dtClientesNaturales.Columns.Add("ESTADO_CLIENTE", typeof(string));
            dtClientesNaturales.Columns.Add("TIPO", typeof(string));

            dgvClientes.DataSource = dtClientesNaturales;

            dgvClientes.Columns["ID_CLIENTE"].HeaderText = "ID";
            dgvClientes.Columns["NOMBRE_CLIENTE"].HeaderText = "Nombre del Cliente";
            dgvClientes.Columns["DUI_CLIENTE"].HeaderText = "DUI";
            dgvClientes.Columns["CORREO"].HeaderText = "Correo Electrónico";
            dgvClientes.Columns["TELEFONO_CLIENTE"].HeaderText = "Teléfono";
            dgvClientes.Columns["ESTADO_CLIENTE"].HeaderText = "Estado";
            dgvClientes.Columns["TIPO"].HeaderText = "Tipo";

            dgvClientes.Columns["ID_CLIENTE"].FillWeight = 45;
            dgvClientes.Columns["TIPO"].FillWeight = 65;
        }

        // --- BOTÓN 1: ASIGNAR LÍMITE DE CRÉDITO (SP_REGISTRAR_LIMITE_CREDITO) ---
        private void btnAsignarLimite_Click(object sender, EventArgs e)
        {
            if (dgvClientes.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un cliente natural de la tabla para asignarle límite de crédito.",
                                "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idCliente = Convert.ToInt32(dgvClientes.SelectedRows[0].Cells["ID_CLIENTE"].Value);
            string nombreCliente = dgvClientes.SelectedRows[0].Cells["NOMBRE_CLIENTE"].Value.ToString();
            string estadoCliente = dgvClientes.SelectedRows[0].Cells["ESTADO_CLIENTE"].Value.ToString();


            if (!estadoCliente.Equals("Activo", StringComparison.OrdinalIgnoreCase))
            {
                MessageBox.Show("El cliente seleccionado se encuentra inactivo y no puede recibir límite de crédito.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            decimal? montoAutorizado = SolicitarMontoCredito("Asignar Límite de Crédito Personal", nombreCliente, idCliente);

            if (montoAutorizado.HasValue)
            {
                // Aquí se llamará a SP_REGISTRAR_LIMITE_CREDITO(idCliente, idSucursalActual, montoAutorizado.Value)
                MessageBox.Show($"Límite de crédito de {montoAutorizado.Value:C2} listo para registrarse a '{nombreCliente}' en la Sucursal {idSucursalActual}.",
                                "ElectroHogar - Crédito Personal", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        // --- BOTÓN 2: ACTUALIZAR LÍMITE DE CRÉDITO (SP_ACTUALIZAR_LIMITE_CREDITO_PERSONAL) ---
        private void btnActualizarLimite_Click(object sender, EventArgs e)
        {
            if (dgvClientes.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un cliente natural de la tabla para actualizar su límite de crédito.",
                                "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idCliente = Convert.ToInt32(dgvClientes.SelectedRows[0].Cells["ID_CLIENTE"].Value);
            string nombreCliente = dgvClientes.SelectedRows[0].Cells["NOMBRE_CLIENTE"].Value.ToString();


            decimal? nuevoMonto = SolicitarMontoCredito("Actualizar Límite de Crédito Personal", nombreCliente, idCliente);

            if (nuevoMonto.HasValue)
            {
                // Aquí se llamará a SP_ACTUALIZAR_LIMITE_CREDITO_PERSONAL(idCliente, idSucursalActual, nuevoMonto.Value, OUT CONFIRMACION)
                MessageBox.Show($"Nuevo límite de crédito de {nuevoMonto.Value:C2} listo para actualizarse para '{nombreCliente}' en la Sucursal {idSucursalActual}.",
                                "ElectroHogar - Crédito Personal", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        // Cuadro modal limpio para capturar el monto de crédito (validación > 0)
        private decimal? SolicitarMontoCredito(string tituloModal, string nombreCliente, int idCliente)
        {
            decimal? resultado = null;

            Form prompt = new Form()
            {
                Width = 440,
                Height = 250,
                FormBorderStyle = FormBorderStyle.FixedDialog,
                Text = tituloModal,
                StartPosition = FormStartPosition.CenterParent,
                MaximizeBox = false,
                MinimizeBox = false,
                BackColor = Color.White
            };

            Panel pnlTop = new Panel()
            {
                Dock = DockStyle.Top,
                Height = 52,
                BackColor = Color.FromArgb(51, 82, 209)
            };

            Label lblHeader = new Label()
            {
                Text = tituloModal,
                ForeColor = Color.White,
                Font = new Font("Segoe UI", 12F, FontStyle.Bold),
                AutoSize = true,
                Left = 18,
                Top = 13
            };
            pnlTop.Controls.Add(lblHeader);

            Label lblCliente = new Label()
            {
                Left = 22,
                Top = 68,
                Width = 385,
                Font = new Font("Segoe UI", 9.5F, FontStyle.Italic),
                ForeColor = Color.Teal,
                Text = $"Cliente: {nombreCliente} (ID: {idCliente})  |  Sucursal: {idSucursalActual}"
            };

            Label lblMonto = new Label()
            {
                Left = 22,
                Top = 100,
                Width = 385,
                Font = new Font("Segoe UI", 10F, FontStyle.Bold),
                ForeColor = Color.DimGray,
                Text = "Monto Límite Autorizado ($):*"
            };

            NumericUpDown numMonto = new NumericUpDown()
            {
                Left = 22,
                Top = 128,
                Width = 385,
                DecimalPlaces = 2,
                Maximum = 10000000,
                Minimum = 0,
                Increment = 50,
                Font = new Font("Segoe UI", 10.5F)
            };

            Button btnCancelar = new Button()
            {
                Text = "Cancelar",
                Left = 152,
                Top = 172,
                Width = 115,
                Height = 36,
                FlatStyle = FlatStyle.Flat,
                BackColor = Color.FromArgb(240, 244, 248),
                ForeColor = Color.DimGray,
                Font = new Font("Segoe UI", 9.5F)
            };
            btnCancelar.FlatAppearance.BorderColor = Color.LightGray;
            btnCancelar.Click += (s, ev) => { prompt.DialogResult = DialogResult.Cancel; prompt.Close(); };

            Button btnGuardar = new Button()
            {
                Text = "Guardar",
                Left = 277,
                Top = 172,
                Width = 130,
                Height = 36,
                FlatStyle = FlatStyle.Flat,
                BackColor = Color.Teal,
                ForeColor = Color.White,
                Font = new Font("Segoe UI", 9.5F, FontStyle.Bold)
            };
            btnGuardar.FlatAppearance.BorderSize = 0;
            btnGuardar.Click += (s, ev) =>
            {
            if (numMonto.Value <= 0)
            {

                    MessageBox.Show("El límite de crédito debe ser mayor que cero.",
"Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    numMonto.Focus();
                    return;
                }
                resultado = numMonto.Value;
                prompt.DialogResult = DialogResult.OK;
                prompt.Close();
            };
            prompt.Controls.Add(pnlTop);
            prompt.Controls.Add(lblCliente);
            prompt.Controls.Add(lblMonto);
            prompt.Controls.Add(numMonto);
            prompt.Controls.Add(btnCancelar);
            prompt.Controls.Add(btnGuardar);
            return prompt.ShowDialog() == DialogResult.OK ? resultado : null;
        }
        // --- FILTRO RÁPIDO EN MEMORIA ---
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
            if (dtClientesNaturales == null) return;
            string filtroTexto = txtBuscar.Text.Trim().Replace("'", "''");
            string estadoSeleccionado = cmbEstado.SelectedItem?.ToString() ?? "Todos";
            string condicion = "";
            if (!string.IsNullOrEmpty(filtroTexto) && filtroTexto != PlaceholderText)
            {
                condicion = string.Format(
                "(CONVERT(ID_CLIENTE, 'System.String') LIKE '%{0}%' OR " +
                "NOMBRE_CLIENTE LIKE '%{0}%' OR " +
                "DUI_CLIENTE LIKE '%{0}%')",
                filtroTexto
                );
            }
            if (estadoSeleccionado != "Todos")
            {
                condicion += (condicion.Length > 0 ? " AND " : "") + $"ESTADO_CLIENTE = '{estadoSeleccionado}'";
            }
            dtClientesNaturales.DefaultView.RowFilter = condicion;
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