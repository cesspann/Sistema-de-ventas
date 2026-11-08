using System;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor
{
    public partial class GestionarPerfilSupervisor : Form
    {
        private int idEmpleadoActual;
        private string nombreUsuarioActual;

        public GestionarPerfilSupervisor(
            int idEmpleado = 1,
            int idSucursal = 1,
            string nombreEmpleado = "Supervisor",
            string nombreUsuario = "supervisor",
            string dui = "",
            string fechaContratacion = "",
            int empleadosACargo = 0,
            string correoActual = "",
            string direccionActual = "",
            string telefonoActual = "")
        {
            InitializeComponent();
            this.idEmpleadoActual = idEmpleado;
            this.nombreUsuarioActual = nombreUsuario;

            // Datos informativos del Supervisor (SP_CONSULTAR_SUPERVISOR)
            lblEncabezadoSupervisor.Text = $"{nombreEmpleado}  |  Usuario: {nombreUsuarioActual} (ID: {idEmpleadoActual})";
            txtSucursal.Text = idSucursal.ToString();
            txtDui.Text = dui;
            txtFechaContratacion.Text = fechaContratacion;
            txtEmpleadosCargo.Text = empleadosACargo.ToString();

            // Datos editables de contacto
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
            MessageBox.Show($"Datos del Supervisor ID {idEmpleadoActual} listos para actualizarse en la base de datos.",
                            "ElectroHogar - Perfil Supervisor", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        // --- 2. RESTABLECER CONTRASEÑA (SP_RESTABLECER_CONTRASENA) ---
        private void btnCambiarContrasena_Click(object sender, EventArgs e)
        {
            string nuevaClave = txtNuevaContrasena.Text;
            string confirmarClave = txtConfirmarContrasena.Text;

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
            MessageBox.Show($"Contraseña del supervisor '{nombreUsuarioActual}' lista para actualizarse.",
                            "ElectroHogar - Seguridad", MessageBoxButtons.OK, MessageBoxIcon.Information);

            txtNuevaContrasena.Clear();
            txtConfirmarContrasena.Clear();
        }

        // --- 3. DESACTIVAR CUENTA (SP_DESACTIVAR_USUARIO) ---
        private void btnDesactivarCuenta_Click(object sender, EventArgs e)
        {
            DialogResult confirmacion = MessageBox.Show(
                $"¿Está seguro de que desea desactivar la cuenta de supervisor '{nombreUsuarioActual}'?\n\nSe cerrará su sesión actual inmediatamente.",
                "Confirmar Desactivación de Cuenta",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Warning);

            if (confirmacion == DialogResult.Yes)
            {
                // Mensaje temporal hasta conectar SP_DESACTIVAR_USUARIO(nombreUsuarioActual, OUT CONFIRMACION)
                MessageBox.Show($"Cuenta '{nombreUsuarioActual}' marcada como Inactiva. Cerrando sesión...",
                                "Cuenta Desactivada", MessageBoxButtons.OK, MessageBoxIcon.Information);

                this.DialogResult = DialogResult.Abort;
                this.Close();
            }
        }

        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}

