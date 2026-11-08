using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios
{
    public partial class GestionCajerosSupervisor : Form
    {
        private const string PlaceholderText = "Buscar por ID, nombre, usuario, correo, DUI, caja, turno o estado...";
        private DataTable dtCajeros;
        private int idSucursalActual;

        public GestionCajerosSupervisor(int idSucursal = 1)
        {
            InitializeComponent();
            this.idSucursalActual = idSucursal;
            ConfigurarPlaceholder();
            ConfigurarTabla();
            InicializarEstructuraTabla();
        }

        private void ConfigurarTabla()
        {
            dgvCajeros.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvCajeros.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvCajeros.MultiSelect = false;
            dgvCajeros.ReadOnly = true;
            dgvCajeros.AllowUserToAddRows = false;
            dgvCajeros.RowHeadersVisible = false;
            dgvCajeros.BackgroundColor = Color.White;
            dgvCajeros.BorderStyle = BorderStyle.FixedSingle;

            dgvCajeros.EnableHeadersVisualStyles = false;
            dgvCajeros.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvCajeros.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvCajeros.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvCajeros.ColumnHeadersHeight = 38;

            dgvCajeros.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvCajeros.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvCajeros.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvCajeros.RowTemplate.Height = 32;
        }

        private void InicializarEstructuraTabla()
        {
            dtCajeros = new DataTable();
            dtCajeros.Columns.Add("ID_EMPLEADO", typeof(int));
            dtCajeros.Columns.Add("NOMBRE_EMPLEADO", typeof(string));
            dtCajeros.Columns.Add("NOMBRE_USUARIO", typeof(string));
            dtCajeros.Columns.Add("CORREO_ELECTRONICO", typeof(string));
            dtCajeros.Columns.Add("DUI_EMPLEADO", typeof(string));
            dtCajeros.Columns.Add("FECHA_CONTRATACION", typeof(DateTime));
            dtCajeros.Columns.Add("NUMERO_CAJA", typeof(int));
            dtCajeros.Columns.Add("TURNO", typeof(string));
            dtCajeros.Columns.Add("ESTADO_USUARIO", typeof(string));

            dgvCajeros.DataSource = dtCajeros;

            dgvCajeros.Columns["ID_EMPLEADO"].HeaderText = "ID";
            dgvCajeros.Columns["NOMBRE_EMPLEADO"].HeaderText = "Nombre";
            dgvCajeros.Columns["NOMBRE_USUARIO"].HeaderText = "Usuario";
            dgvCajeros.Columns["CORREO_ELECTRONICO"].HeaderText = "Correo";
            dgvCajeros.Columns["DUI_EMPLEADO"].HeaderText = "DUI";
            dgvCajeros.Columns["FECHA_CONTRATACION"].HeaderText = "Contratación";
            dgvCajeros.Columns["NUMERO_CAJA"].HeaderText = "Caja";
            dgvCajeros.Columns["TURNO"].HeaderText = "Turno";
            dgvCajeros.Columns["ESTADO_USUARIO"].HeaderText = "Estado";

            dgvCajeros.Columns["FECHA_CONTRATACION"].DefaultCellStyle.Format = "dd/MM/yyyy";
            dgvCajeros.Columns["ID_EMPLEADO"].FillWeight = 45;
            dgvCajeros.Columns["NUMERO_CAJA"].FillWeight = 50;
        }

        // --- BOTÓN SUPERIOR ---
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            MessageBox.Show($"Abriendo ventana para Agregar Cajero (Sucursal ID: {idSucursalActual})...", "ElectroHogar - Cajeros", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        // --- BOTONES DE CAMBIO DE ESTADO (INFERIORES) ---
        private void btnActivar_Click(object sender, EventArgs e)
        {
            if (dgvCajeros.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un cajero para activar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            MessageBox.Show("Cajero activado.", "ElectroHogar - Cajeros", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnDesactivar_Click(object sender, EventArgs e)
        {
            if (dgvCajeros.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un cajero para desactivar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            MessageBox.Show("Cajero desactivado.", "ElectroHogar - Cajeros", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnDesbloquear_Click(object sender, EventArgs e)
        {
            if (dgvCajeros.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un cajero para desbloquear.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            MessageBox.Show("Cajero desbloqueado.", "ElectroHogar - Cajeros", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        // --- BÚSQUEDA DINÁMICA ---
        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            if (dtCajeros == null) return;

            string filtro = txtBuscar.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {
                dtCajeros.DefaultView.RowFilter = "";
                return;
            }

            dtCajeros.DefaultView.RowFilter = string.Format(
                "CONVERT(ID_EMPLEADO, 'System.String') LIKE '%{0}%' OR " +
                "NOMBRE_EMPLEADO LIKE '%{0}%' OR " +
                "NOMBRE_USUARIO LIKE '%{0}%' OR " +
                "CORREO_ELECTRONICO LIKE '%{0}%' OR " +
                "DUI_EMPLEADO LIKE '%{0}%' OR " +
                "CONVERT(FECHA_CONTRATACION, 'System.String') LIKE '%{0}%' OR " +
                "CONVERT(NUMERO_CAJA, 'System.String') LIKE '%{0}%' OR " +
                "TURNO LIKE '%{0}%' OR " +
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