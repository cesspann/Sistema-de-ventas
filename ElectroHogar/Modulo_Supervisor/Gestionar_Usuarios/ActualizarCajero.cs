using System;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios
{
    public partial class ActualizarCajero : Form
    {
        private int idEmpleado;

        public ActualizarCajero(int idEmpleado = 0, string nombreCajero = "", int cajaActual = 1, string turnoActual = "")
        {
            InitializeComponent();
            this.idEmpleado = idEmpleado;

            if (!string.IsNullOrEmpty(nombreCajero))
            {
                lblEmpleadoInfo.Text = $"Cajero: {nombreCajero} (ID: {idEmpleado})";
            }

            numCaja.Value = cajaActual >= 1 ? cajaActual : 1;
            txtTurno.Text = turnoActual;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            int numCajaValor = (int)numCaja.Value;
            string turnoValor = txtTurno.Text.Trim();

            // Validación idéntica a SP_ACTUALIZAR_CAJERO
            if (numCajaValor <= 0 || string.IsNullOrWhiteSpace(turnoValor))
            {
                MessageBox.Show("El número de caja y el turno son obligatorios.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtTurno.Focus();
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

