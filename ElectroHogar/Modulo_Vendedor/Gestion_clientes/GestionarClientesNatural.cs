using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Vendedor.Gestion_clientes
{
    public partial class GestionarClientesNatural : Form
    {
        private const string PlaceholderText = "Buscar por ID, nombre del cliente o DUI...";
        private DataTable dtClientesNaturales;

        public GestionarClientesNatural()
        {
            InitializeComponent();
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

        // --- BOTÓN SUPERIOR: REGISTRAR CLIENTE ---
        private void btnRegistrarCliente_Click(object sender, EventArgs e)
        {
            FrmRegistrarClienteNatural modalRegistro = new FrmRegistrarClienteNatural();
            modalRegistro.ShowDialog();
        }

        // --- BOTONES INFERIORES ---
        private void btnActualizar_Click(object sender, EventArgs e)
        {
            if (dgvClientes.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un cliente de la tabla para actualizar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idCliente = Convert.ToInt32(dgvClientes.SelectedRows[0].Cells["ID_CLIENTE"].Value);
            string nombre = dgvClientes.SelectedRows[0].Cells["NOMBRE_CLIENTE"].Value.ToString();
            string correo = dgvClientes.SelectedRows[0].Cells["CORREO"].Value.ToString();
            string telefono = dgvClientes.SelectedRows[0].Cells["TELEFONO_CLIENTE"].Value.ToString();


            ActualizarClienteNatural modalActualizar = new ActualizarClienteNatural(idCliente, nombre, correo, telefono);
            modalActualizar.ShowDialog();
        }


        private void btnActivar_Click(object sender, EventArgs e)
        {
            if (dgvClientes.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un cliente de la tabla para activar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idCliente = Convert.ToInt32(dgvClientes.SelectedRows[0].Cells["ID_CLIENTE"].Value);
            MessageBox.Show($"Cliente Natural ID {idCliente} activado.", "ElectroHogar - Clientes", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnDesactivar_Click(object sender, EventArgs e)
        {
            if (dgvClientes.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un cliente de la tabla para desactivar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idCliente = Convert.ToInt32(dgvClientes.SelectedRows[0].Cells["ID_CLIENTE"].Value);
            MessageBox.Show($"Cliente Natural ID {idCliente} desactivado.", "ElectroHogar - Clientes", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        // --- BÚSQUEDA Y FILTRO DE ESTADO ---
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
