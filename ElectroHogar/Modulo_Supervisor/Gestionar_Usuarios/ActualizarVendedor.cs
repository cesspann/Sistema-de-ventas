using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

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

            if (porcentaje < 0 || meta < 0)
            {
                MessageBox.Show("El porcentaje de comisión y la meta no pueden ser negativos.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_ACTUALIZAR_VENDEDOR", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_VENDEDOR", this.idEmpleado);
                        cmd.Parameters.AddWithValue("P_PORCENTAJE", porcentaje);
                        cmd.Parameters.AddWithValue("P_META", meta);

                        MySqlParameter paramConf = new MySqlParameter("P_CONFIRMACION", MySqlDbType.Int32);
                        paramConf.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramConf);

                        cmd.ExecuteNonQuery();
                        int confirmacion = Convert.ToInt32(paramConf.Value);

                        if (confirmacion == 1)
                        {
                            MessageBox.Show("Datos del vendedor actualizados correctamente.",
                                            "ElectroHogar - Vendedores", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            this.DialogResult = DialogResult.OK;
                            this.Close();
                        }
                        else if (confirmacion == -2)
                        {
                            MessageBox.Show("Datos inválidos o valores negativos.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        else if (confirmacion == -3)
                        {
                            MessageBox.Show("El vendedor indicado no existe en el sistema.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        else
                        {
                            MessageBox.Show("Ocurrió un error en el servidor al actualizar el vendedor.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
