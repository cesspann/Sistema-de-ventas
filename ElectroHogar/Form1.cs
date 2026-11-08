using ElectroHogar.Modulo_Cajero;
using ElectroHogar.Modulo_Vendedor;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Windows.Forms;

namespace ElectroHogar
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            ConfigurarLogoRedondo();
        }

        private void ConfigurarLogoRedondo()
        {
            picLogo.Width = 160;
            picLogo.Height = 160;
            picLogo.Left = (this.ClientSize.Width - picLogo.Width) / 2;

            GraphicsPath path = new GraphicsPath();
            path.AddEllipse(0, 0, picLogo.Width, picLogo.Height);
            picLogo.Region = new Region(path);

            string imagePath = Path.Combine(Application.StartupPath, "logo.jpg");

            if (File.Exists(imagePath))
            {
                picLogo.Image = Image.FromFile(imagePath);
            }
            else
            {
                string folderPath = @"C:\Users\Saa Vasquez\Desktop\Proyecto-BAD215\ElectroHogar";
                string fallbackPath = Path.Combine(folderPath, "logo.jpg");

                if (File.Exists(fallbackPath))
                {
                    picLogo.Image = Image.FromFile(fallbackPath);
                }
            }
        }

        private void btnIngresar_Click(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text.Trim();
            string contrasena = txtContrasena.Text.Trim();

            if (string.IsNullOrWhiteSpace(usuario) || string.IsNullOrWhiteSpace(contrasena))
            {
                MessageBox.Show("Por favor, escriba su usuario y contraseña.",
                                "Campos Vacíos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null)
                {
                    MessageBox.Show("No se pudo conectar con la base de datos. Verifique la conexión a MySQL.",
                                    "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    // 1. Validar credenciales y obtener ID_SUCURSAL con SP_VALIDAR_USUARIO
                    int confirmacion = 0;
                    using (MySqlCommand cmdValidar = new MySqlCommand("SP_VALIDAR_USUARIO", conn))
                    {
                        cmdValidar.CommandType = CommandType.StoredProcedure;
                        cmdValidar.Parameters.AddWithValue("P_NOMBRE_USUARIO", usuario);
                        cmdValidar.Parameters.AddWithValue("P_CLAVE", contrasena);

                        MySqlParameter paramConf = new MySqlParameter("CONFIRMACION", MySqlDbType.Int32);
                        paramConf.Direction = ParameterDirection.Output;
                        cmdValidar.Parameters.Add(paramConf);

                        cmdValidar.ExecuteNonQuery();
                        confirmacion = Convert.ToInt32(paramConf.Value);
                    }

                    if (confirmacion <= 0)
                    {
                        switch (confirmacion)
                        {
                            case -2:
                                MessageBox.Show("Por favor, escriba su usuario y contraseña.", "Campos Vacíos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                break;
                            case -3:
                                MessageBox.Show("El usuario ingresado no existe.", "Acceso Denegado", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                break;
                            case -4:
                                MessageBox.Show("Contraseña incorrecta. Verifique sus credenciales.", "Acceso Denegado", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                txtContrasena.Clear();
                                txtContrasena.Focus();
                                break;
                            case -5:
                                MessageBox.Show("Su cuenta se encuentra bloqueada o inactiva. Contacte al supervisor.", "Usuario Bloqueado", MessageBoxButtons.OK, MessageBoxIcon.Stop);
                                break;
                            default:
                                MessageBox.Show("Error en el servidor al validar las credenciales.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                break;
                        }
                        return;
                    }

                    int idSucursal = confirmacion;

                    // 2. Definir rol con SP_DEFINIR_ROL_USUARIO (1 = Cajero, 2 = Vendedor, 3 = Supervisor)
                    int rolUsuario = 0;
                    using (MySqlCommand cmdRol = new MySqlCommand("SP_DEFINIR_ROL_USUARIO", conn))
                    {
                        cmdRol.CommandType = CommandType.StoredProcedure;
                        cmdRol.Parameters.AddWithValue("NOMUSUARIO", usuario);

                        MySqlParameter paramRol = new MySqlParameter("ROL", MySqlDbType.Int32);
                        paramRol.Direction = ParameterDirection.Output;
                        cmdRol.Parameters.Add(paramRol);

                        cmdRol.ExecuteNonQuery();
                        rolUsuario = Convert.ToInt32(paramRol.Value);
                    }

                    if (rolUsuario <= 0)
                    {
                        MessageBox.Show("No se pudo determinar el rol asignado a este usuario.", "Error de Rol", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }

                    // 3. Guardar datos globales en SesionUsuario
                    SesionUsuario.CargarDatosEmpleado(usuario, idSucursal, rolUsuario);

                    // 4. Abrir el panel correspondiente según el rol
                    if (rolUsuario == 1)
                    {
                        InicioCajero pantallaCajero = new InicioCajero();
                        pantallaCajero.Show();
                        this.Hide();
                    }
                    else if (rolUsuario == 2)
                    {
                        InicioVendedor pantallaVendedor = new InicioVendedor();
                        pantallaVendedor.Show();
                        this.Hide();
                    }
                    else if (rolUsuario == 3)
                    {
                        InicioSupervisor pantallaSupervisor = new InicioSupervisor();
                        pantallaSupervisor.Show();
                        this.Hide();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error de base de datos: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
