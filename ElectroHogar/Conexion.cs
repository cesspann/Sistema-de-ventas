using System;
using System.Configuration;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar
{
    public class Conexion
    {
        public static MySqlConnection ObtenerConexion()
        {
            string server = ConfigurationManager.AppSettings["DbServer"] ?? "localhost";
            string port = ConfigurationManager.AppSettings["DbPort"] ?? "3306";
            string db = ConfigurationManager.AppSettings["DbName"] ?? "sistema_ventas";

            // Credenciales por defecto (para el Login inicial antes de definir el rol)
            string uid = "user_vendedor";
            string pwd = "Vendedor2026!";

            
            switch (SesionUsuario.Rol)
            {
                case 1:
                    uid = "user_cajero";
                    pwd = "Cajero2026!";
                    break;
                case 2:
                    uid = "user_vendedor";
                    pwd = "Vendedor2026!";
                    break;
                case 3:
                    uid = "user_supervisor";
                    pwd = "Supervisor2026!";
                    break;
            }

            string cadena = $"Server={server};Port={port};Database={db};Uid={uid};Pwd={pwd};";
            MySqlConnection conexion = new MySqlConnection(cadena);

            try
            {
                conexion.Open();
                return conexion;
            }
            catch (MySqlException ex)
            {
                MessageBox.Show("Error al conectar con la base de datos: " + ex.Message,
                                "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return null;
            }
        }
    }
}
