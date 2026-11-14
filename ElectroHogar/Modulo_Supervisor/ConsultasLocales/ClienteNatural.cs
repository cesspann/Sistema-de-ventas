using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.ConsultasLocales
{
    public partial class ClienteNatural : Form
    {
        private const string PlaceholderText = "Buscar por ID, nombre del cliente o DUI...";
        private DataTable dtClientesNaturales;
        private int idSucursalActual;

        public ClienteNatural(int idSucursal = 0)
        {
            InitializeComponent();
            this.idSucursalActual = idSucursal > 0 ? idSucursal : (SesionUsuario.IdSucursal > 0 ? SesionUsuario.IdSucursal : 1);
            ConfigurarPlaceholder();
            ConfigurarComboEstado();
            ConfigurarTabla();
            CargarClientesNaturales();
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

        // Llama a SP_CONSULTAR_CLIENTE_NATURAL(P_BUSQUEDA)
        private void CargarClientesNaturales()
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_CLIENTE_NATURAL", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_BUSQUEDA", DBNull.Value);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtClientesNaturales = new DataTable();
                        da.Fill(dtClientesNaturales);

                        dgvClientes.DataSource = dtClientesNaturales;
                        FormatearColumnas();
                        AplicarFiltros();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al consultar clientes naturales: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void FormatearColumnas()
        {
            if (dgvClientes.Columns.Count == 0) return;

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

            RegistrarLimiteCredito modalRegistrar = new RegistrarLimiteCredito(idCliente, nombreCliente, this.idSucursalActual);
            modalRegistrar.ShowDialog();
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

            actualizarLimiteCredito modalActualizar = new actualizarLimiteCredito(idCliente, nombreCliente, this.idSucursalActual);
            modalActualizar.ShowDialog();
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
