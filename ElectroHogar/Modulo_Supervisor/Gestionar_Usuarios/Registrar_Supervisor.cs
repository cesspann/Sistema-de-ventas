using System;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios
{
    public partial class Registrar_Supervisor : Form
    {
        public Registrar_Supervisor()
        {
            InitializeComponent();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombreUsuario = txtUsuario.Text.Trim();
            string clave = txtClave.Text.Trim();
            string nombreEmpleado = txtNombre.Text.Trim();
            string dui = txtDui.Text.Trim();

            if (string.IsNullOrWhiteSpace(nombreUsuario) ||
                string.IsNullOrWhiteSpace(clave) ||
                string.IsNullOrWhiteSpace(nombreEmpleado) ||
                string.IsNullOrWhiteSpace(dui))
            {
                MessageBox.Show("Los campos Usuario, Contraseña, Nombre Completo y DUI son obligatorios.",
                                "Campos Requeridos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (clave.Length < 4)
            {
                MessageBox.Show("La contraseña debe tener al menos 4 caracteres.",
                                "Contraseña Corta", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtClave.Focus();
                return;
            }

            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}