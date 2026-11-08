using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios
{
    public partial class gestiona_vendedor : Form
    {
        private const string PlaceholderText = "Buscar por ID, nombre, usuario, correo, DUI, comisión o estado...";
        private DataTable dtVendedores;
        private int idSucursalActual;

        public gestiona_vendedor(int idSucursal = 1)
        {
            InitializeComponent();
            this.idSucursalActual = idSucursal;
            ConfigurarPlaceholder();
            ConfigurarTabla();
            InicializarEstructuraTabla();
        }

        private void ConfigurarTabla()
        {
            dgvVendedores.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvVendedores.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvVendedores.MultiSelect = false;
            dgvVendedores.ReadOnly = true;
            dgvVendedores.AllowUserToAddRows = false;
            dgvVendedores.RowHeadersVisible = false;
            dgvVendedores.BackgroundColor = Color.White;
            dgvVendedores.BorderStyle = BorderStyle.FixedSingle;

            dgvVendedores.EnableHeadersVisualStyles = false;
            dgvVendedores.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvVendedores.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvVendedores.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvVendedores.ColumnHeadersHeight = 38;

            dgvVendedores.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvVendedores.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvVendedores.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvVendedores.RowTemplate.Height = 32;
        }

        // Estructura exacta según las 8 columnas de SP_CONSULTAR_VENDEDORES
        private void InicializarEstructuraTabla()
        {
            dtVendedores = new DataTable();
            dtVendedores.Columns.Add("ID_EMPLEADO", typeof(int));
            dtVendedores.Columns.Add("NOMBRE_EMPLEADO", typeof(string));
            dtVendedores.Columns.Add("NOMBRE_USUARIO", typeof(string));
            dtVendedores.Columns.Add("CORREO_ELECTRONICO", typeof(string));
            dtVendedores.Columns.Add("DUI_EMPLEADO", typeof(string));
            dtVendedores.Columns.Add("FECHA_CONTRATACION", typeof(DateTime));
            dtVendedores.Columns.Add("PORCENTAJE_COMISION", typeof(decimal));
            dtVendedores.Columns.Add("ESTADO_USUARIO", typeof(string));

            dgvVendedores.DataSource = dtVendedores;

            dgvVendedores.Columns["ID_EMPLEADO"].HeaderText = "ID";
            dgvVendedores.Columns["NOMBRE_EMPLEADO"].HeaderText = "Nombre";
            dgvVendedores.Columns["NOMBRE_USUARIO"].HeaderText = "Usuario";
            dgvVendedores.Columns["CORREO_ELECTRONICO"].HeaderText = "Correo";
            dgvVendedores.Columns["DUI_EMPLEADO"].HeaderText = "DUI";
            dgvVendedores.Columns["FECHA_CONTRATACION"].HeaderText = "Contratación";
            dgvVendedores.Columns["PORCENTAJE_COMISION"].HeaderText = "Comisión (%)";
            dgvVendedores.Columns["ESTADO_USUARIO"].HeaderText = "Estado";

            dgvVendedores.Columns["FECHA_CONTRATACION"].DefaultCellStyle.Format = "dd/MM/yyyy";
            dgvVendedores.Columns["ID_EMPLEADO"].FillWeight = 45;
            dgvVendedores.Columns["PORCENTAJE_COMISION"].FillWeight = 65;
        }

        // --- BOTÓN SUPERIOR ---
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            MessageBox.Show($"Abriendo ventana para Agregar Vendedor (Sucursal ID: {idSucursalActual})...", "ElectroHogar - Vendedores", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        // --- BOTONES DE CAMBIO DE ESTADO (INFERIORES) ---
        private void btnActivar_Click(object sender, EventArgs e)
        {
            if (dgvVendedores.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un vendedor para activar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            MessageBox.Show("Vendedor activado.", "ElectroHogar - Vendedores", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnDesactivar_Click(object sender, EventArgs e)
        {
            if (dgvVendedores.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un vendedor para desactivar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            MessageBox.Show("Vendedor desactivado.", "ElectroHogar - Vendedores", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnDesbloquear_Click(object sender, EventArgs e)
        {
            if (dgvVendedores.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un vendedor para desbloquear.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            MessageBox.Show("Vendedor desbloqueado.", "ElectroHogar - Vendedores", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        // --- BÚSQUEDA DINÁMICA ---
        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            if (dtVendedores == null) return;

            string filtro = txtBuscar.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {
                dtVendedores.DefaultView.RowFilter = "";
                return;
            }

            dtVendedores.DefaultView.RowFilter = string.Format(
                "CONVERT(ID_EMPLEADO, 'System.String') LIKE '%{0}%' OR " +
                "NOMBRE_EMPLEADO LIKE '%{0}%' OR " +
                "NOMBRE_USUARIO LIKE '%{0}%' OR " +
                "CORREO_ELECTRONICO LIKE '%{0}%' OR " +
                "DUI_EMPLEADO LIKE '%{0}%' OR " +
                "CONVERT(FECHA_CONTRATACION, 'System.String') LIKE '%{0}%' OR " +
                "CONVERT(PORCENTAJE_COMISION, 'System.String') LIKE '%{0}%' OR " +
                "ESTADO_USUARIO LIKE '%{0}%'",
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
