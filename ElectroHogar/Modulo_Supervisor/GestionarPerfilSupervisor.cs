using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor
{
    public partial class GestionarPerfilSupervisor : Form
    {
        private int idEmpleadoActual;
        private string nombreUsuarioActual;

        public GestionarPerfilSupervisor(
            int idEmpleado = 0,
            int idSucursal = 0,
            string nombreEmpleado = "",
            string nombreUsuario = "",
            string dui = "",
            string fechaContratacion = "",
            int empleadosACargo = 0,
            string correoActual = "",
            string direccionActual = "",
            string telefonoActual = "")
        {
            InitializeComponent();
            this.idEmpleadoActual = idEmpleado > 0 ? idEmpleado : (SesionUsuario.IdEmpleado > 0 ? SesionUsuario.IdEmpleado : 1);
            this.nombreUsuarioActual = !string.IsNullOrEmpty(nombreUsuario) ? nombreUsuario : SesionUsuario.NombreUsuario;

            if (string.IsNullOrEmpty(dui) && string.IsNullOrEmpty(correoActual))
            {
                CargarDatosSupervisor();
            }
            else
            {
                lblEncabezadoSupervisor.Text = $"{nombreEmpleado}  |  Usuario: {nombreUsuarioActual} (ID: {idEmpleadoActual})";
                txtSucursal.Text = idSucursal.ToString();
                txtDui.Text = dui;
                txtFechaContratacion.Text = fechaContratacion;
                txtEmpleadosCargo.Text = empleadosACargo.ToString();
                txtCorreo.Text = correoActual;
                txtDireccion.Text = direccionActual;
                txtTelefono.Text = telefonoActual;
            }
        }

        private void CargarDatosSupervisor()
        {
            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null) return;

                try
                {
                    // 1. Consulta datos generales con SP_CONSULTAR_SUPERVISOR
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_SUPERVISOR", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("BUSQUEDA", this.idEmpleadoActual.ToString());

                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                if (Convert.ToInt32(reader["ID_EMPLEADO"]) == this.idEmpleadoActual)
                                {
                                    string nombre = reader["NOMBRE_EMPLEADO"].ToString();
                                    this.nombreUsuarioActual = reader["NOMBRE_USUARIO"].ToString();

                                    lblEncabezadoSupervisor.Text = $"{nombre}  |  Usuario: {this.nombreUsuarioActual} (ID: {this.idEmpleadoActual})";
                                    txtSucursal.Text = reader["ID_SUCURSAL"].ToString();
                                    txtDui.Text = reader["DUI_EMPLEADO"].ToString();
                                    txtFechaContratacion.Text = Convert.ToDateTime(reader["FECHA_CONTRATACION"]).ToString("dd/MM/yyyy");
                                    txtEmpleadosCargo.Text = reader["EMPLEADOS_A_CARGO"].ToString();
                                    txtCorreo.Text = reader["CORREO_ELECTRONICO"]?.ToString() ?? "";
                                    break;
                                }
                            }
                        }
                    }

                    // 2. Completa dirección y teléfono desde EMPLEADO
                    string queryContacto = "SELECT DIRECCION_EMPLEADO, TELEFONO_EMPLEADO FROM EMPLEADO WHERE ID_EMPLEADO = @id LIMIT 1;";
                    using (MySqlCommand cmdContacto = new MySqlCommand(queryContacto, conn))
                    {
                        cmdContacto.Parameters.AddWithValue("@id", this.idEmpleadoActual);
                        using (MySqlDataReader r = cmdContacto.ExecuteReader())
                        {
                            if (r.Read())
                            {
                                txtDireccion.Text = r["DIRECCION_EMPLEADO"]?.ToString() ?? "";
                                txtTelefono.Text = r["TELEFONO_EMPLEADO"]?.ToString() ?? "";
                            }
                        }
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al cargar datos del supervisor: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        // --- 1. ACTUALIZAR DATOS PERSONALES (SP_ACTUALIZAR_EMPLEADO) ---
        private void btnGuardarDatos_Click(object sender, EventArgs e)
        {
            string correo = txtCorreo.Text.Trim();
            string direccion = txtDireccion.Text.Trim();
            string telefono = txtTelefono.Text.Trim();

            if (string.IsNullOrWhiteSpace(correo) &&
                string.IsNullOrWhiteSpace(direccion) &&
                string.IsNullOrWhiteSpace(telefono))
            {
                MessageBox.Show("Ingrese al menos un campo (correo, dirección o teléfono) para actualizar.",
                                "Sin Cambios", MessageBoxButtons.OK, MessageBoxIcon.Warning);
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_ACTUALIZAR_EMPLEADO", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_VENDEDOR", this.idEmpleadoActual);
                        cmd.Parameters.AddWithValue("P_CORREO", correo);
                        cmd.Parameters.AddWithValue("P_DIRECCION", direccion);
                        cmd.Parameters.AddWithValue("P_TELEFONO", telefono);

                        MySqlParameter paramConf = new MySqlParameter("CONFIRMACION", MySqlDbType.Int32);
                        paramConf.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramConf);

                        cmd.ExecuteNonQuery();
                        int confirmacion = Convert.ToInt32(paramConf.Value);

                        if (confirmacion == 1)
                        {
                            MessageBox.Show("Datos personales actualizados correctamente.",
                                            "ElectroHogar - Perfil Supervisor", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        }
                        else if (confirmacion == -3)
                        {
                            MessageBox.Show("El empleado no existe en el sistema.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        else
                        {
                            MessageBox.Show("Error en el servidor al actualizar los datos.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error de base de datos: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        // --- 2. RESTABLECER CONTRASEÑA (SP_RESTABLECER_CONTRASENA) ---
        private void btnCambiarContrasena_Click(object sender, EventArgs e)
        {
            string nuevaClave = txtNuevaContrasena.Text;
            string confirmarClave = txtConfirmarContrasena.Text;

            if (string.IsNullOrWhiteSpace(nuevaClave))
            {
                MessageBox.Show("Por favor, ingrese la nueva contraseña.",
                                "Campo Requerido", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtNuevaContrasena.Focus();
                return;
            }

            if (nuevaClave != confirmarClave)
            {
                MessageBox.Show("Las contraseñas no coinciden. Verifique e intente de nuevo.",
                                "Error de Confirmación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtConfirmarContrasena.Focus();
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_RESTABLECER_CONTRASENA", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_NOMBRE_USUARIO", this.nombreUsuarioActual);
                        cmd.Parameters.AddWithValue("NUEVA_CONTRASEÑA", nuevaClave);

                        MySqlParameter paramConf = new MySqlParameter("CONFIRMACION", MySqlDbType.Int32);
                        paramConf.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramConf);

                        cmd.ExecuteNonQuery();
                        int confirmacion = Convert.ToInt32(paramConf.Value);

                        if (confirmacion == 1)
                        {

                            MessageBox.Show("Contraseña actualizada correctamente.",
"ElectroHogar - Seguridad", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            txtNuevaContrasena.Clear();
                            txtConfirmarContrasena.Clear();
                        }
                        else if (confirmacion == -2)
                        {
                            MessageBox.Show("El usuario o la contraseña no pueden estar vacíos.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        else if (confirmacion == -3)
                        {
                            MessageBox.Show("El usuario no existe en el sistema.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        else
                        {
                            MessageBox.Show("Error en el servidor al cambiar la contraseña.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error de base de datos: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
        // --- 3. DESACTIVAR CUENTA (SP_DESACTIVAR_USUARIO) ---
        private void btnDesactivarCuenta_Click(object sender, EventArgs e)
        {
            DialogResult confirmacion = MessageBox.Show(
            $"¿Está seguro de que desea desactivar la cuenta de supervisor '{nombreUsuarioActual}'?\n\nSe cerrará su sesión actual inmediatamente.",
            "Confirmar Desactivación de Cuenta",
            MessageBoxButtons.YesNo,
            MessageBoxIcon.Warning);
            if (confirmacion != DialogResult.Yes) return;
            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null)
                {
                    MessageBox.Show("No se pudo conectar con la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_DESACTIVAR_USUARIO", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_NOMBRE_USUARIO", this.nombreUsuarioActual);
                        MySqlParameter paramConf = new MySqlParameter("CONFIRMACION", MySqlDbType.Int32);
                        paramConf.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramConf);
                        cmd.ExecuteNonQuery();
                        int resultado = Convert.ToInt32(paramConf.Value);
                        if (resultado == 1)
                        {
                            MessageBox.Show($"Cuenta '{nombreUsuarioActual}' desactivada correctamente. Cerrando sesión...",
                            "Cuenta Desactivada", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            SesionUsuario.CerrarSesion();
                            this.DialogResult = DialogResult.Abort;
                            this.Close();
                        }
                        else
                        {
                            MessageBox.Show("No se pudo desactivar la cuenta en el servidor.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error de base de datos: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}