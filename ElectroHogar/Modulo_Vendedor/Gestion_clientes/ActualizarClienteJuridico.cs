using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

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
                MessageBox.Show("El cupo de crédito no puede ser negativo.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numCupoCredito.Focus();
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_ACTUALIZAR_CLIENTE_JURIDICO", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_CLIENTE", this.idCliente);
                        cmd.Parameters.AddWithValue("P_REPRESENTANTE", string.IsNullOrWhiteSpace(representante) ? (object)DBNull.Value : representante);
                        cmd.Parameters.AddWithValue("P_CUPO_CREDITO", cupoCredito);

                        cmd.ExecuteNonQuery();

                        MessageBox.Show("Cliente jurídico actualizado correctamente.",
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
