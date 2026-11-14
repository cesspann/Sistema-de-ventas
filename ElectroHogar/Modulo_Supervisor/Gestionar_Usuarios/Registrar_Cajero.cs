using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios
{
    public partial class Registrar_Cajero : Form
    {
        private int idSucursalActual;
        private int? idSupervisorActual;

        public Registrar_Cajero(int idSucursal = 0, int? idSupervisor = null)
        {
            InitializeComponent();
            this.idSucursalActual = idSucursal > 0 ? idSucursal : (SesionUsuario.IdSucursal > 0 ? SesionUsuario.IdSucursal : 1);
            this.idSupervisorActual = idSupervisor ?? (SesionUsuario.IdEmpleado > 0 ? (int?)SesionUsuario.IdEmpleado : null);
            ConfigurarCombos();
        }

        private void ConfigurarCombos()
        {
            cmbTurno.Items.AddRange(new object[] { "Matutino", "Vespertino", "Completo" });
            cmbTurno.SelectedIndex = 0;

            cmbTipoEmpleado.Items.AddRange(new object[] { "Tiempo Completo", "Medio Tiempo" });
            cmbTipoEmpleado.SelectedIndex = 0;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombreUsuario = txtUsuario.Text.Trim();
            string clave = txtClave.Text.Trim();
            string nombreEmpleado = txtNombre.Text.Trim();
            string dui = txtDui.Text.Trim();
            string correo = txtCorreo.Text.Trim();
            string direccion = txtDireccion.Text.Trim();
            string telefono = txtTelefono.Text.Trim();
            string tipoEmpleado = cmbTipoEmpleado.SelectedItem?.ToString() ?? "Tiempo Completo";
            int numeroCaja = (int)numCaja.Value;
            string turno = cmbTurno.SelectedItem?.ToString() ?? "Matutino";

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

            if (numeroCaja <= 0)
            {
                MessageBox.Show("El número de caja debe ser mayor a 0.",
                                "Caja Inválida", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numCaja.Focus();
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
                        cmd.Parameters.AddWithValue("P_ID_SUCURSAL", this.idSucursalActual);
                        cmd.Parameters.AddWithValue("P_ID_SUPERVISOR", this.idSupervisorActual.HasValue ? (object)this.idSupervisorActual.Value : DBNull.Value);
                        cmd.Parameters.AddWithValue("P_NOMBRE_EMPLEADO", nombreEmpleado);
                        cmd.Parameters.AddWithValue("P_DUI_EMPLEADO", dui);
                        cmd.Parameters.AddWithValue("P_CORREO_ELECTRONICO", string.IsNullOrWhiteSpace(correo) ? (object)DBNull.Value : correo);
                        cmd.Parameters.AddWithValue("P_DIRECCION_EMPLEADO", string.IsNullOrWhiteSpace(direccion) ? (object)DBNull.Value : direccion);
                        cmd.Parameters.AddWithValue("P_TELEFONO_EMPLEADO", string.IsNullOrWhiteSpace(telefono) ? (object)DBNull.Value : telefono);
                        cmd.Parameters.AddWithValue("P_TIPO_EMPLEADO", tipoEmpleado);

                        // 3. Rol específico
                        cmd.Parameters.AddWithValue("P_ROL_ESPECIFICO", "CAJERO");

                        // 4. Parámetros de Vendedor en NULL y Cajero con sus valores
                        cmd.Parameters.AddWithValue("P_PORCENTAJE_COMISION", DBNull.Value);
                        cmd.Parameters.AddWithValue("P_META_MENSUAL", DBNull.Value);
                        cmd.Parameters.AddWithValue("P_NUMERO_CAJA", numeroCaja);
                        cmd.Parameters.AddWithValue("P_TURNO", turno);

                        // 5. Salida
                        MySqlParameter paramId = new MySqlParameter("ID_GENERADO_OUT", MySqlDbType.Int32);
                        paramId.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramId);

                        cmd.ExecuteNonQuery();
                        int resultado = Convert.ToInt32(paramId.Value);

                        if (resultado > 0)
                        {
                            MessageBox.Show($"Cajero '{nombreEmpleado}' registrado correctamente con ID: {resultado}.",
                                            "ElectroHogar - Registro de Cajero", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
                    MessageBox.Show("Error interno en el servidor al registrar el cajero.", "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    break;
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
