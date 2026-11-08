using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.ConsultasLocales
{
    public partial class ClienteJuridico : Form
    {
        private const string PlaceholderText = "Buscar por ID, razón social, NIT o representante legal...";
        private DataTable dtClientesJuridicos;

        public ClienteJuridico()
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

        // Estructura exacta según las 9 columnas de SP_CONSULTAR_CLIENTE_JURIDICO
        private void InicializarEstructuraTabla()
        {
            dtClientesJuridicos = new DataTable();
            dtClientesJuridicos.Columns.Add("ID_CLIENTE", typeof(int));
            dtClientesJuridicos.Columns.Add("RAZON_SOCIAL", typeof(string));
            dtClientesJuridicos.Columns.Add("NIT", typeof(string));
            dtClientesJuridicos.Columns.Add("CORREO", typeof(string));
            dtClientesJuridicos.Columns.Add("TELEFONO_CLIENTE", typeof(string));
            dtClientesJuridicos.Columns.Add("NOMBRE_REPRESENTANTE_LEGAL", typeof(string));
            dtClientesJuridicos.Columns.Add("CUPO_CREDITO_CORPORATIVO", typeof(decimal));
            dtClientesJuridicos.Columns.Add("ESTADO_CLIENTE", typeof(string));
            dtClientesJuridicos.Columns.Add("TIPO", typeof(string));

            dgvClientes.DataSource = dtClientesJuridicos;

            dgvClientes.Columns["ID_CLIENTE"].HeaderText = "ID";
            dgvClientes.Columns["RAZON_SOCIAL"].HeaderText = "Razón Social";
            dgvClientes.Columns["NIT"].HeaderText = "NIT";
            dgvClientes.Columns["CORREO"].HeaderText = "Correo";
            dgvClientes.Columns["TELEFONO_CLIENTE"].HeaderText = "Teléfono";
            dgvClientes.Columns["NOMBRE_REPRESENTANTE_LEGAL"].HeaderText = "Representante Legal";
            dgvClientes.Columns["CUPO_CREDITO_CORPORATIVO"].HeaderText = "Cupo Crédito";
            dgvClientes.Columns["ESTADO_CLIENTE"].HeaderText = "Estado";
            dgvClientes.Columns["TIPO"].HeaderText = "Tipo";

            dgvClientes.Columns["CUPO_CREDITO_CORPORATIVO"].DefaultCellStyle.Format = "C2";
            dgvClientes.Columns["ID_CLIENTE"].FillWeight = 40;
            dgvClientes.Columns["ESTADO_CLIENTE"].FillWeight = 60;
            dgvClientes.Columns["TIPO"].FillWeight = 60;
        }

        // --- FILTRO RÁPIDO EN MEMORIA (REPLICA EL WHERE DE SP_CONSULTAR_CLIENTE_JURIDICO) ---
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
            if (dtClientesJuridicos == null) return;

            string filtroTexto = txtBuscar.Text.Trim().Replace("'", "''");
            string estadoSeleccionado = cmbEstado.SelectedItem?.ToString() ?? "Todos";
            string condicion = "";

            if (!string.IsNullOrEmpty(filtroTexto) && filtroTexto != PlaceholderText)
            {
                condicion = string.Format(
                    "(CONVERT(ID_CLIENTE, 'System.String') LIKE '%{0}%' OR " +
                    "RAZON_SOCIAL LIKE '%{0}%' OR " +
                    "NIT LIKE '%{0}%' OR " +
                    "NOMBRE_REPRESENTANTE_LEGAL LIKE '%{0}%')",
                    filtroTexto
                );
            }

            if (estadoSeleccionado != "Todos")
            {
                condicion += (condicion.Length > 0 ? " AND " : "") + $"ESTADO_CLIENTE = '{estadoSeleccionado}'";
            }

            dtClientesJuridicos.DefaultView.RowFilter = condicion;
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
