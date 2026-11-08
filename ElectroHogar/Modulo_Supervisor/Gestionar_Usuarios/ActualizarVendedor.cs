using System;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios
{
    public partial class ActualizarVendedor : Form
    {
        private int idEmpleado;

        public ActualizarVendedor(int idEmpleado = 0, string nombreVendedor = "", decimal porcentajeActual = 0, decimal metaActual = 0)
        {
            InitializeComponent();
            this.idEmpleado = idEmpleado;

            if (!string.IsNullOrEmpty(nombreVendedor))
            {
                lblEmpleadoInfo.Text = $"Vendedor: {nombreVendedor} (ID: {idEmpleado})";
            }

            numComision.Value = porcentajeActual >= 0 ? porcentajeActual : 0;
            numMeta.Value = metaActual >= 0 ? metaActual : 0;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            decimal porcentaje = numComision.Value;
            decimal meta = numMeta.Value;

            // Validación idéntica a SP_ACTUALIZAR_VENDEDOR
            if (porcentaje < 0 || meta < 0)
            {
                MessageBox.Show("El porcentaje de comisión y la meta no pueden ser negativos.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
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

