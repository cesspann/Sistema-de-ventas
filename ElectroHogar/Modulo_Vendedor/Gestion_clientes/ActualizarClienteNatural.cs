using System;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Vendedor.Gestion_clientes
{
    public partial class ActualizarClienteNatural : Form
    {
        private int idCliente;

        public ActualizarClienteNatural(int idCliente = 0, string nombreCliente = "", string correoActual = "", string telefonoActual = "")
        {
            InitializeComponent();
            this.idCliente = idCliente;

            if (!string.IsNullOrEmpty(nombreCliente))
            {
                lblClienteInfo.Text = $"Cliente: {nombreCliente} (ID: {idCliente})";
            }

            txtCorreo.Text = correoActual;
            txtTelefono.Text = telefonoActual;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            string correo = txtCorreo.Text.Trim();
            string telefono = txtTelefono.Text.Trim();

            if (string.IsNullOrWhiteSpace(correo) && string.IsNullOrWhiteSpace(telefono))
            {
                MessageBox.Show("Ingrese al menos un dato (correo o teléfono) para actualizar.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtCorreo.Focus();
                return;
            }

            // Mensaje temporal hasta conectar SP_ACTUALIZAR_CLIENTE
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

