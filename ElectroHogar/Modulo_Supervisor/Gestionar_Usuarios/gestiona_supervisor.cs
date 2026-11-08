using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios
{
    public partial class gestiona_supervisor : Form
    {
        private const string PlaceholderText = "Buscar por ID, sucursal, nombre, usuario, correo, DUI, a cargo o estado...";
        private DataTable dtSupervisores;

        public gestiona_supervisor()
        {
            InitializeComponent();
            ConfigurarPlaceholder();
            ConfigurarTabla();
            InicializarEstructuraTabla();
        }

        private void ConfigurarTabla()
        {
            dgvSupervisores.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvSupervisores.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvSupervisores.MultiSelect = false;
            dgvSupervisores.ReadOnly = true;
            dgvSupervisores.AllowUserToAddRows = false;
            dgvSupervisores.RowHeadersVisible = false;
            dgvSupervisores.BackgroundColor = Color.White;
            dgvSupervisores.BorderStyle = BorderStyle.FixedSingle;

            dgvSupervisores.EnableHeadersVisualStyles = false;
            dgvSupervisores.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvSupervisores.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvSupervisores.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvSupervisores.ColumnHeadersHeight = 38;

            dgvSupervisores.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvSupervisores.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvSupervisores.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvSupervisores.RowTemplate.Height = 32;
        }

        private void InicializarEstructuraTabla()
        {
            dtSupervisores = new DataTable();
            dtSupervisores.Columns.Add("ID_EMPLEADO", typeof(int));
            dtSupervisores.Columns.Add("ID_SUCURSAL", typeof(int));
            dtSupervisores.Columns.Add("NOMBRE_EMPLEADO", typeof(string));
            dtSupervisores.Columns.Add("NOMBRE_USUARIO", typeof(string));
            dtSupervisores.Columns.Add("CORREO_ELECTRONICO", typeof(string));
            dtSupervisores.Columns.Add("DUI_EMPLEADO", typeof(string));
            dtSupervisores.Columns.Add("FECHA_CONTRATACION", typeof(DateTime));
            dtSupervisores.Columns.Add("EMPLEADOS_A_CARGO", typeof(int));
            dtSupervisores.Columns.Add("ESTADO_USUARIO", typeof(string));

            dgvSupervisores.DataSource = dtSupervisores;

            dgvSupervisores.Columns["ID_EMPLEADO"].HeaderText = "ID";
            dgvSupervisores.Columns["ID_SUCURSAL"].HeaderText = "Sucursal";
            dgvSupervisores.Columns["NOMBRE_EMPLEADO"].HeaderText = "Nombre";
            dgvSupervisores.Columns["NOMBRE_USUARIO"].HeaderText = "Usuario";
            dgvSupervisores.Columns["CORREO_ELECTRONICO"].HeaderText = "Correo";
            dgvSupervisores.Columns["DUI_EMPLEADO"].HeaderText = "DUI";
            dgvSupervisores.Columns["FECHA_CONTRATACION"].HeaderText = "Contratación";
            dgvSupervisores.Columns["EMPLEADOS_A_CARGO"].HeaderText = "A Cargo";
            dgvSupervisores.Columns["ESTADO_USUARIO"].HeaderText = "Estado";

            dgvSupervisores.Columns["FECHA_CONTRATACION"].DefaultCellStyle.Format = "dd/MM/yyyy";
            dgvSupervisores.Columns["ID_EMPLEADO"].FillWeight = 45;
            dgvSupervisores.Columns["ID_SUCURSAL"].FillWeight = 55;
            dgvSupervisores.Columns["EMPLEADOS_A_CARGO"].FillWeight = 60;
        }

        // --- BOTÓN SUPERIOR ---
        private void btnAgregar_Click(object sender, EventArgs e)
        {
            Registrar_Supervisor modalSupervisor = new Registrar_Supervisor();
            modalSupervisor.ShowDialog();
        }


        // --- BOTONES DE CAMBIO DE ESTADO (INFERIORES) ---
        private void btnActivar_Click(object sender, EventArgs e)
        {
            if (dgvSupervisores.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un supervisor para activar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            MessageBox.Show("Supervisor activado.", "ElectroHogar - Supervisores", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnDesactivar_Click(object sender, EventArgs e)
        {
            if (dgvSupervisores.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un supervisor para desactivar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            MessageBox.Show("Supervisor desactivado.", "ElectroHogar - Supervisores", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void btnDesbloquear_Click(object sender, EventArgs e)
        {
            if (dgvSupervisores.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un supervisor para desbloquear.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            MessageBox.Show("Supervisor desbloqueado.", "ElectroHogar - Supervisores", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        // --- BÚSQUEDA DINÁMICA ---
        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            if (dtSupervisores == null) return;

            string filtro = txtBuscar.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {
                dtSupervisores.DefaultView.RowFilter = "";
                return;
            }

            dtSupervisores.DefaultView.RowFilter = string.Format(
                "CONVERT(ID_EMPLEADO, 'System.String') LIKE '%{0}%' OR " +
                "CONVERT(ID_SUCURSAL, 'System.String') LIKE '%{0}%' OR " +
                "NOMBRE_EMPLEADO LIKE '%{0}%' OR " +
                "NOMBRE_USUARIO LIKE '%{0}%' OR " +
                "CORREO_ELECTRONICO LIKE '%{0}%' OR " +
                "DUI_EMPLEADO LIKE '%{0}%' OR " +
                "CONVERT(FECHA_CONTRATACION, 'System.String') LIKE '%{0}%' OR " +
                "CONVERT(EMPLEADOS_A_CARGO, 'System.String') LIKE '%{0}%' OR " +
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
