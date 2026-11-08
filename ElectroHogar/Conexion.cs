using System;
using System.Configuration; 
using System.Data;
using MySql.Data.MySqlClient; 

namespace ElectroHogar
{
    public class Conexion
    {
        public static MySqlConnection ObtenerConexion()
        {
            try
            {
                string cadenaConexion = ConfigurationManager.ConnectionStrings["MiCadenaConexion"].ConnectionString;

                MySqlConnection conexion = new MySqlConnection(cadenaConexion);
                conexion.Open();

                Console.WriteLine("Conexión abierta");
                return conexion;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error de conexión MySQL: " + ex.Message);
                return null;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error general: " + ex.Message);
                return null;
            }
        }
    }
}
