using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios
{
    public partial class Registrar_Vendedor : Form
    {
        public Registrar_Vendedor()
        {
            InitializeComponent();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombreUsuario = txtUsuario.Text.Trim();
            string clave = txtClave.Text.Trim();
            string nombreEmpleado = txtNombre.Text.Trim();
            string dui = txtDui.Text.Trim();

            int idSucursal = SesionUsuario.IdSucursal > 0 ? SesionUsuario.IdSucursal : 1;
            int? idSupervisor = SesionUsuario.IdEmpleado > 0 ? (int?)SesionUsuario.IdEmpleado : null;

            if (string.IsNullOrWhiteSpace(nombreUsuario) ||
                string.IsNullOrWhiteSpace(clave) ||
                string.IsNullOrWhiteSpace(nombreEmpleado) ||
                string.IsNullOrWhiteSpace(dui))
            {
                MessageBox.Show("Los campos Usuario, Contraseña, Nombre Completo y DUI son obligatorios.",
                                "Campos Requeridos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (clave.Length < 4)
            {
                MessageBox.Show("La contraseña debe tener al menos 4 caracteres.",
                                "Contraseña Corta", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtClave.Focus();
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_REGISTRAR_EMPLEADO", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // 1. Usuario
                        cmd.Parameters.AddWithValue("P_NOMBRE_USUARIO", nombreUsuario);
                        cmd.Parameters.AddWithValue("P_CLAVE", clave);

                        // 2. Empleado
                        cmd.Parameters.AddWithValue("P_ID_SUCURSAL", idSucursal);
                        cmd.Parameters.AddWithValue("P_ID_SUPERVISOR", idSupervisor.HasValue ? (object)idSupervisor.Value : DBNull.Value);
                        cmd.Parameters.AddWithValue("P_NOMBRE_EMPLEADO", nombreEmpleado);
                        cmd.Parameters.AddWithValue("P_DUI_EMPLEADO", dui);
                        cmd.Parameters.AddWithValue("P_CORREO_ELECTRONICO", DBNull.Value);
                        cmd.Parameters.AddWithValue("P_DIRECCION_EMPLEADO", DBNull.Value);
                        cmd.Parameters.AddWithValue("P_TELEFONO_EMPLEADO", DBNull.Value);
                        cmd.Parameters.AddWithValue("P_TIPO_EMPLEADO", "Tiempo Completo");

                        // 3. Rol específico
                        cmd.Parameters.AddWithValue("P_ROL_ESPECIFICO", "VENDEDOR");

                        // 4. Datos iniciales de Vendedor y NULL para Cajero
                        cmd.Parameters.AddWithValue("P_PORCENTAJE_COMISION", 0.00m);
                        cmd.Parameters.AddWithValue("P_META_MENSUAL", 0.00m);
                        cmd.Parameters.AddWithValue("P_NUMERO_CAJA", DBNull.Value);
                        cmd.Parameters.AddWithValue("P_TURNO", DBNull.Value);

                        // 5. Salida
                        MySqlParameter paramId = new MySqlParameter("ID_GENERADO_OUT", MySqlDbType.Int32);
                        paramId.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramId);

                        cmd.ExecuteNonQuery();
                        int resultado = Convert.ToInt32(paramId.Value);

                        if (resultado > 0)
                        {
                            MessageBox.Show($"Vendedor '{nombreEmpleado}' registrado correctamente con ID: {resultado}.",
                                            "ElectroHogar - Registro de Vendedor", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            this.DialogResult = DialogResult.OK;
                            this.Close();
                        }
                        else
                        {
                            MostrarErrorRegistro(resultado);
                        }
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error de base de datos: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void MostrarErrorRegistro(int codigo)
        {
            switch (codigo)
            {
                case -2:
                    MessageBox.Show("Faltan campos obligatorios por completar.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    break;
                case -3:
                    MessageBox.Show("La contraseña debe tener al menos 4 caracteres.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    break;
                case -4:
                    MessageBox.Show("El nombre de usuario ya está en uso. Elija otro.", "Usuario Duplicado", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    break;
                case -5:
                    MessageBox.Show("Ya existe un empleado registrado con ese número de DUI.", "DUI Duplicado", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    break;
                case -6:
                    MessageBox.Show("El rol especificado no es válido.", "Error de Rol", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
                default:
                    MessageBox.Show("Error interno en el servidor al registrar el vendedor.", "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
