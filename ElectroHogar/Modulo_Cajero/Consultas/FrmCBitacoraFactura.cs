using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Cajero.Consultas
{
    public partial class FrmCBitacoraFactura : Form
    {
        // Cadena de conexión a tu base de datos MySQL
        string conexionString = "server=localhost; database=sistema_ventas; uid=root; pwd=rootAdmin";

        public FrmCBitacoraFactura()
        {
            InitializeComponent();
        }

        private void FrmCBitacoraFactura_Load(object sender, EventArgs e)
        {
            // Carga todos los registros al abrir el formulario
            CargarDatosBitacora();
        }

        private void CargarDatosBitacora()
        {
            try
            {
                using (MySqlConnection conexion = new MySqlConnection(conexionString))
                {
                    conexion.Open();

                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_BITACORA_FACTURA_ANULADA", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // 1. Enviamos el texto de búsqueda (si está vacío, manda DBNull para traer todo)
                        if (string.IsNullOrWhiteSpace(txtBuscar.Text))
                        {
                            cmd.Parameters.AddWithValue("P_BUSQUEDA", DBNull.Value);
                        }
                        else
                        {
                            cmd.Parameters.AddWithValue("P_BUSQUEDA", txtBuscar.Text.Trim());
                        }

                        // 2. Parámetros de fecha requeridos por tu procedimiento almacenado
                        cmd.Parameters.AddWithValue("P_FECHA_DESDE", DBNull.Value);
                        cmd.Parameters.AddWithValue("P_FECHA_HASTA", DBNull.Value);

                        // 3. Ejecutar la consulta y rellenar la tabla dvgBitacora
                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            dvgBitacora.DataSource = dt;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error al cargar los datos: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // Evento que se ejecuta únicamente al hacer clic en el botón "Buscar"
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarDatosBitacora();
        }

        // Método requerido por el diseñador para solucionar el error CS1061
        private void dvgBitacora_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            // Opcional
        }
    }
}