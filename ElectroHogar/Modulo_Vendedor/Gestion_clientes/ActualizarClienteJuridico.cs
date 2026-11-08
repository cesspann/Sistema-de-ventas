using System;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Vendedor.Gestion_clientes
{
    public partial class ActualizarClienteJuridico : Form
    {
        private int idCliente;

        public ActualizarClienteJuridico(int idCliente = 0, string razonSocial = "", string representanteActual = "", decimal cupoActual = 0)
        {
            InitializeComponent();
            this.idCliente = idCliente;

            if (!string.IsNullOrEmpty(razonSocial))
            {
                lblClienteInfo.Text = $"Cliente: {razonSocial} (ID: {idCliente})";
            }

            txtRepresentante.Text = representanteActual;
            numCupoCredito.Value = cupoActual >= 0 ? cupoActual : 0;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            string representante = txtRepresentante.Text.Trim();
            decimal cupoCredito = numCupoCredito.Value;

            if (cupoCredito < 0)
            {
                MessageBox.Show("El cupo de crédito no puede ser negativo.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numCupoCredito.Focus();
                return;
            }

            // Mensaje temporal hasta conectar SP_ACTUALIZAR_CLIENTE_JURIDICO
            MessageBox.Show($"Datos del Cliente ID {idCliente} listos para actualizarse en la base de datos.",
                            "ElectroHogar - Actualización", MessageBoxButtons.OK, MessageBoxIcon.Information);

            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}

