using System;
using System;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios
{
    public partial class Registrar_Cajero : Form
    {
        private int idSucursalActual;
        private int? idSupervisorActual;

        public Registrar_Cajero(int idSucursal = 1, int? idSupervisor = null)
        {
            InitializeComponent();
            this.idSucursalActual = idSucursal;
            this.idSupervisorActual = idSupervisor;
            ConfigurarCombos();
        }

        private void ConfigurarCombos()
        {
            cmbTurno.Items.AddRange(new object[] { "Matutino", "Vespertino", "Completo" });
            cmbTurno.SelectedIndex = 0;

            cmbTipoEmpleado.Items.AddRange(new object[] { "Tiempo Completo", "Medio Tiempo" });
            cmbTipoEmpleado.SelectedIndex = 0;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombreUsuario = txtUsuario.Text.Trim();
            string clave = txtClave.Text.Trim();
            string nombreEmpleado = txtNombre.Text.Trim();
            string dui = txtDui.Text.Trim();
            string correo = txtCorreo.Text.Trim();
            string direccion = txtDireccion.Text.Trim();
            string telefono = txtTelefono.Text.Trim();
            string tipoEmpleado = cmbTipoEmpleado.SelectedItem?.ToString() ?? "Tiempo Completo";
            int numeroCaja = (int)numCaja.Value;
            string turno = cmbTurno.SelectedItem?.ToString() ?? "Matutino";

            // Validaciones idénticas a SP_REGISTRAR_EMPLEADO
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

            if (numeroCaja <= 0)
            {
                MessageBox.Show("El número de caja debe ser mayor a 0.",
                                "Caja Inválida", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numCaja.Focus();
                return;
            }

            // Mensaje temporal hasta conectar SP_REGISTRAR_EMPLEADO con P_ROL_ESPECIFICO = 'CAJERO'
            MessageBox.Show($"Cajero '{nombreEmpleado}' (Caja #{numeroCaja}, Turno {turno}) listo para registrarse en la Sucursal {idSucursalActual}.",
                            "ElectroHogar - Registro de Cajero", MessageBoxButtons.OK, MessageBoxIcon.Information);

            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}

