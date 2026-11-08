using System;
using System.Data;
using MySql.Data.MySqlClient;

namespace ElectroHogar
{
    public static class SesionUsuario
    {
        public static int IdUsuario { get; set; }
        public static int IdEmpleado { get; set; }
        public static int IdSucursal { get; set; }
        public static string NombreUsuario { get; set; }
        public static string NombreEmpleado { get; set; }
        public static string NombreSucursal { get; set; }
        public static int Rol { get; set; } // 1 = Cajero, 2 = Vendedor, 3 = Supervisor

        public static void CargarDatosEmpleado(string nombreUsuario, int idSucursal, int rol)
        {
            NombreUsuario = nombreUsuario;
            IdSucursal = idSucursal;
            Rol = rol;

            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null) return;

                string query = @"SELECT U.ID_USUARIO, E.ID_EMPLEADO, E.NOMBRE_EMPLEADO, S.NOMBRE_SUCURSAL
                                 FROM USUARIO U
                                 INNER JOIN EMPLEADO E ON U.ID_USUARIO = E.ID_USUARIO
                                 INNER JOIN SUCURSAL S ON E.ID_SUCURSAL = S.ID_SUCURSAL
                                 WHERE U.NOMBRE_USUARIO = @usuario
                                 LIMIT 1;";

                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@usuario", nombreUsuario.Trim());
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            IdUsuario = Convert.ToInt32(reader["ID_USUARIO"]);
                            IdEmpleado = Convert.ToInt32(reader["ID_EMPLEADO"]);
                            NombreEmpleado = reader["NOMBRE_EMPLEADO"].ToString();
                            NombreSucursal = reader["NOMBRE_SUCURSAL"].ToString();
                        }
                    }
                }
            }
        }

        public static void CerrarSesion()
        {
            IdUsuario = 0;
            IdEmpleado = 0;
            IdSucursal = 0;
            NombreUsuario = string.Empty;
            NombreEmpleado = string.Empty;
            NombreSucursal = string.Empty;
            Rol = 0;
        }
    }
}
