using System;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Vendedor.Gestion_clientes
{
    public partial class FrmRegistrarClienteNatural : Form
    {
        public FrmRegistrarClienteNatural()
        {
            InitializeComponent();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text.Trim();
            string dui = txtDui.Text.Trim();
            string correo = txtCorreo.Text.Trim();
            string telefono = txtTelefono.Text.Trim();

            // Validaciones idénticas a SP_REGISTRAR_CLIENTE_NATURAL
            if (string.IsNullOrWhiteSpace(nombre))
            {
                MessageBox.Show("Error: El nombre del cliente natural es obligatorio.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtNombre.Focus();
                return;
            }

            if (dui.Length < 10)
            {
                MessageBox.Show("Error: El DUI del cliente no es válido o está incompleto (mínimo 10 caracteres, ej. 00000000-0).", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtDui.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(correo) || string.IsNullOrWhiteSpace(telefono))
            {
                MessageBox.Show("Por favor, complete el correo y teléfono del cliente.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            MessageBox.Show($"Cliente Natural '{nombre}' listo para registrarse con SP_REGISTRAR_CLIENTE_NATURAL.",
                            "ElectroHogar - Registro", MessageBoxButtons.OK, MessageBoxIcon.Information);

            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}