using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Cajero.Consultas
{
    public partial class FrmCClienteNatural : FormBase
    {
        public FrmCClienteNatural()
        {
            InitializeComponent();
        }

        // Carga inicial al abrir el formulario (Muestra todos los clientes naturales por defecto)
        private void FrmCClienteNatural_Load(object sender, EventArgs e)
        {
            CargarClientesNaturales("");
        }



        // Botón para ir a la otra ventana de consultas
        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        // Evento del botón de búsqueda (Ejecuta la consulta al hacer clic)
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            // Asegúrate de cambiar 'txtBusqueda' por el nombre real de tu caja de texto en el diseñador
            string filtro = textBox1.Text.Trim();
            CargarClientesNaturales(filtro);
        }

        // Método centralizado para conectar y ejecutar el Procedimiento Almacenado
        private void CargarClientesNaturales(string busqueda)
        {
            using (MySqlConnection conexion = Conexion.ObtenerConexion())
            {
                if (conexion == null)
                {
                    MessageBox.Show("No se pudo establecer conexión con la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_CLIENTE_NATURAL", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Enviamos el parámetro que pide tu SP (si está vacío, manda DBNull para traer todo)
                        cmd.Parameters.AddWithValue("@P_BUSQUEDA", string.IsNullOrEmpty(busqueda) ? (object)DBNull.Value : busqueda);

                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            // Mostramos los resultados en la grilla (asegúrate de que se llame dataGridView1)
                            dataGridView1.DataSource = dt;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al consultar los clientes naturales: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
    }
}
