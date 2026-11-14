using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class FrmAgregarCategoria : Form
    {
        public FrmAgregarCategoria()
        {
            InitializeComponent();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombreCategoria = txtNombreCategoria.Text.Trim();

            if (string.IsNullOrWhiteSpace(nombreCategoria))
            {
                MessageBox.Show("El nombre de la categoría es obligatorio.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtNombreCategoria.Focus();
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_REGISTRAR_CATEGORIA", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_NOMBRE_CATEGORIA", nombreCategoria);

                        MySqlParameter paramId = new MySqlParameter("ID_REGISTRO", MySqlDbType.Int32);
                        paramId.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramId);

                        cmd.ExecuteNonQuery();
                        int idGenerado = Convert.ToInt32(paramId.Value);

                        if (idGenerado > 0)
                        {
                            MessageBox.Show($"Categoría '{nombreCategoria}' registrada correctamente con ID: {idGenerado}.",
                                            "ElectroHogar - Categorías", MessageBoxButtons.OK, MessageBoxIcon.Information);

                            this.DialogResult = DialogResult.OK;
                            this.Close();
                        }
                        else if (idGenerado == -2)
                        {
                            MessageBox.Show("El nombre de la categoría no puede estar vacío.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        else
                        {
                            MessageBox.Show("Error en el servidor al registrar la categoría (posible duplicado).", "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error de base de datos: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}

