using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

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

            if (numCajaValor <= 0 || string.IsNullOrWhiteSpace(turnoValor))
            {
                MessageBox.Show("El número de caja y el turno son obligatorios.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtTurno.Focus();
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_ACTUALIZAR_CAJERO", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_VENDEDOR", this.idEmpleado);
                        cmd.Parameters.AddWithValue("P_NUM_CAJA", numCajaValor);
                        cmd.Parameters.AddWithValue("P_TURNO", turnoValor);

                        MySqlParameter paramConf = new MySqlParameter("P_CONFIRMACION", MySqlDbType.Int32);
                        paramConf.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramConf);

                        cmd.ExecuteNonQuery();
                        int confirmacion = Convert.ToInt32(paramConf.Value);

                        if (confirmacion == 1)
                        {
                            MessageBox.Show("Datos del cajero actualizados correctamente.",
                                            "ElectroHogar - Cajeros", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            this.DialogResult = DialogResult.OK;
                            this.Close();
                        }
                        else if (confirmacion == -2)
                        {
                            MessageBox.Show("Datos incompletos o inválidos.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        else if (confirmacion == -3)
                        {
                            MessageBox.Show("El cajero indicado no existe en el sistema.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        else
                        {
                            MessageBox.Show("Ocurrió un error en el servidor al actualizar el cajero.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
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

