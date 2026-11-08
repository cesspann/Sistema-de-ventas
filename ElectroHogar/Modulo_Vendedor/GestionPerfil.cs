using System;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Vendedor
{
    public partial class GestionPerfil : Form
    {
        private int idEmpleadoActual;
        private string nombreUsuarioActual;

        // Constructor flexible: recibe los datos del usuario logueado (con valores por defecto mientras conectas la BD)
        public GestionPerfil(
            int idEmpleado = 1,
            string nombreUsuario = "vendedor",
            string correoActual = "",
            string direccionActual = "",
            string telefonoActual = "")
        {
            InitializeComponent();
            this.idEmpleadoActual = idEmpleado;
            this.nombreUsuarioActual = nombreUsuario;

            lblUsuarioTitulo.Text = $"Usuario: {nombreUsuarioActual} (ID Empleado: {idEmpleadoActual})";
            txtCorreo.Text = correoActual;
            txtDireccion.Text = direccionActual;
            txtTelefono.Text = telefonoActual;
        }

        // --- 1. ACTUALIZAR DATOS PERSONALES (SP_ACTUALIZAR_EMPLEADO) ---
        private void btnGuardarDatos_Click(object sender, EventArgs e)
        {
            string correo = txtCorreo.Text.Trim();
            string direccion = txtDireccion.Text.Trim();
            string telefono = txtTelefono.Text.Trim();

            if (string.IsNullOrWhiteSpace(correo) &&
                string.IsNullOrWhiteSpace(direccion) &&
                string.IsNullOrWhiteSpace(telefono))
            {
                MessageBox.Show("Ingrese al menos un campo (correo, dirección o teléfono) para actualizar.",
                                "Sin Cambios", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // Mensaje temporal hasta conectar SP_ACTUALIZAR_EMPLEADO(idEmpleadoActual, correo, direccion, telefono, OUT CONFIRMACION)
            MessageBox.Show($"Datos del empleado ID {idEmpleadoActual} listos para actualizarse en la base de datos.",
                            "ElectroHogar - Perfil", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        // --- 2. RESTABLECER CONTRASEÑA (SP_RESTABLECER_CONTRASENA) ---
        private void btnCambiarContrasena_Click(object sender, EventArgs e)
        {
            string nuevaClave = txtNuevaContrasena.Text;
            string confirmarClave = txtConfirmarContrasena.Text;

            // Validación idéntica al SP (NUEVA_CONTRASEÑA IS NULL OR TRIM(NUEVA_CONTRASEÑA) = '')
            if (string.IsNullOrWhiteSpace(nuevaClave))
            {
                MessageBox.Show("Por favor, ingrese la nueva contraseña.",
                                "Campo Requerido", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtNuevaContrasena.Focus();
                return;
            }

            if (nuevaClave != confirmarClave)
            {
                MessageBox.Show("Las contraseñas no coinciden. Verifique e intente de nuevo.",
                                "Error de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtConfirmarContrasena.Focus();
                return;
            }

            // Mensaje temporal hasta conectar SP_RESTABLECER_CONTRASENA(nombreUsuarioActual, nuevaClave, OUT CONFIRMACION)
            MessageBox.Show($"Contraseña del usuario '{nombreUsuarioActual}' lista para actualizarse.",
                            "ElectroHogar - Seguridad", MessageBoxButtons.OK, MessageBoxIcon.Information);

            txtNuevaContrasena.Clear();
            txtConfirmarContrasena.Clear();
        }

        // --- 3. DESACTIVAR CUENTA (SP_DESACTIVAR_USUARIO) ---
        private void btnDesactivarCuenta_Click(object sender, EventArgs e)
        {
            DialogResult confirmacion = MessageBox.Show(
                $"¿Está seguro de que desea desactivar la cuenta '{nombreUsuarioActual}'?\n\nUna vez desactivada, no podrá volver a iniciar sesión hasta que un supervisor la reactive.",
                "Confirmar Desactivación de Cuenta",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Warning);

            if (confirmacion == DialogResult.Yes)
            {
                // Mensaje temporal hasta conectar SP_DESACTIVAR_USUARIO(nombreUsuarioActual, OUT CONFIRMACION)
                MessageBox.Show($"Cuenta '{nombreUsuarioActual}' marcada como Inactiva. Cerrando sesión...",
                                "Cuenta Desactivada", MessageBoxButtons.OK, MessageBoxIcon.Information);

                this.DialogResult = DialogResult.Abort; // Señal para cerrar sesión y volver al Login
                this.Close();
            }
        }

        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
