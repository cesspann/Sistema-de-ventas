using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Vendedor.Gestion_clientes
{
    public partial class RegistrarClienteJuridico : Form
    {
        public RegistrarClienteJuridico()
        {
            InitializeComponent();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            string razonSocial = txtRazonSocial.Text.Trim();
            string nit = txtNit.Text.Trim();
            string representante = txtRepresentante.Text.Trim();
            string correo = txtCorreo.Text.Trim();
            string telefono = txtTelefono.Text.Trim();
            decimal cupoCredito = numCupoCredito.Value;

            // Validaciones idénticas a SP_REGISTRAR_CLIENTE_JURIDICO
            if (string.IsNullOrWhiteSpace(razonSocial))
            {
                MessageBox.Show("La razón social es obligatoria.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtRazonSocial.Focus();
                return;
            }

            if (nit.Length < 14)
            {
                MessageBox.Show("El NIT ingresado no es válido o está incompleto (mínimo 14 caracteres).", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtNit.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(representante))
            {
                MessageBox.Show("El nombre del representante legal es obligatorio.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtRepresentante.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(correo) || string.IsNullOrWhiteSpace(telefono))
            {
                MessageBox.Show("Por favor, complete el correo y teléfono del cliente.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (cupoCredito < 0)
            {
                MessageBox.Show("El cupo de crédito corporativo no puede ser negativo.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numCupoCredito.Focus();
                return;
            }

            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null)
                {
                    MessageBox.Show("No se pudo conectar con la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_REGISTRAR_CLIENTE_JURIDICO", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_CORREO", correo);
                        cmd.Parameters.AddWithValue("P_TELEFONO", telefono);
                        cmd.Parameters.AddWithValue("P_REPRESENTANTE", representante);
                        cmd.Parameters.AddWithValue("P_NIT", nit);
                        cmd.Parameters.AddWithValue("P_RAZON_SOCIAL", razonSocial);
                        cmd.Parameters.AddWithValue("P_CUPO_CREDITO", cupoCredito);

                        MySqlParameter paramId = new MySqlParameter("P_ID_CLIENTE", MySqlDbType.Int32);
                        paramId.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramId);

                        cmd.ExecuteNonQuery();
                        int idGenerado = Convert.ToInt32(paramId.Value);

                        MessageBox.Show($"Cliente Jurídico '{razonSocial}' registrado correctamente con ID: {idGenerado}.",
                                        "ElectroHogar - Registro", MessageBoxButtons.OK, MessageBoxIcon.Information);

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
