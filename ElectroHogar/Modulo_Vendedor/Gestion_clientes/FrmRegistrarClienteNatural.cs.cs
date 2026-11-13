using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Vendedor.Gestion_clientes
{
    public partial class FrmRegistrarClienteNatural : Form
    {
        public FrmRegistrarClienteNatural()
        {
            InitializeComponent();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text.Trim();
            string dui = txtDui.Text.Trim();
            string correo = txtCorreo.Text.Trim();
            string telefono = txtTelefono.Text.Trim();

            // Validaciones idénticas a SP_REGISTRAR_CLIENTE_NATURAL
            if (string.IsNullOrWhiteSpace(nombre))
            {
                MessageBox.Show("Error: El nombre del cliente natural es obligatorio.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtNombre.Focus();
                return;
            }

            if (dui.Length < 10)
            {
                MessageBox.Show("Error: El DUI del cliente no es válido o está incompleto (mínimo 10 caracteres, ej. 00000000-0).", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtDui.Focus();
                return;
            }

            if (string.IsNullOrWhiteSpace(correo) || string.IsNullOrWhiteSpace(telefono))
            {
                MessageBox.Show("Por favor, complete el correo y teléfono del cliente.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_REGISTRAR_CLIENTE_NATURAL", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_CORREO", correo);
                        cmd.Parameters.AddWithValue("P_TELEFONO", telefono);
                        cmd.Parameters.AddWithValue("P_NOMBRE_CLIENTE", nombre);
                        cmd.Parameters.AddWithValue("P_DUI_CLIENTE", dui);

                        MySqlParameter paramId = new MySqlParameter("P_ID_CLIENTE", MySqlDbType.Int32);
                        paramId.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramId);

                        cmd.ExecuteNonQuery();
                        int idGenerado = Convert.ToInt32(paramId.Value);

                        MessageBox.Show($"Cliente Natural '{nombre}' registrado correctamente con ID: {idGenerado}.",
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
