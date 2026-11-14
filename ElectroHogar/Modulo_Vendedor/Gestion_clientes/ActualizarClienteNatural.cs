using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

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
                MessageBox.Show("Ingrese al menos un dato (correo o teléfono) para actualizar.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtCorreo.Focus();
                return;
            }

            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null)
                {
                    MessageBox.Show("No se pudo conectar con la base de datos.",
                                    "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_ACTUALIZAR_CLIENTE", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_CLIENTE", this.idCliente);
                        cmd.Parameters.AddWithValue("P_CORREO", correo);
                        cmd.Parameters.AddWithValue("P_TELEFONO", telefono);

                        cmd.ExecuteNonQuery();

                        MessageBox.Show("Datos del cliente actualizados correctamente.",
                                        "ElectroHogar - Actualización", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        this.DialogResult = DialogResult.OK;
                        this.Close();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show(ex.Message, "Aviso de Base de Datos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
