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
    public partial class FrmCInventario : Form
    {
        public FrmCInventario()
        {
            InitializeComponent();

            // Cargamos los datos automáticamente al iniciar el formulario desde el código,
            // sin depender de que el evento Load esté enlazado en el diseñador.
            CargarInventario();
        }

        // Botón para regresar a InicioCajero
        private void button2_Click(object sender, EventArgs e)
        {
            InicioCajero inicioCajero = new InicioCajero();
            inicioCajero.Show();
            this.Close();
        }

        // Botón para ir a la otra ventana de consultas
        private void button3_Click(object sender, EventArgs e)
        {
            FrmConsultarDatos c1 = new FrmConsultarDatos();
            c1.Show();
            this.Close();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
        }

        private void label1_Click(object sender, EventArgs e)
        {
        }

        private void dataGridView1_CellContentClick_1(object sender, DataGridViewCellEventArgs e)
        {
        }

        // Método centralizado para conectar y ejecutar el Procedimiento Almacenado SP_CONSULTAR_INVENTARIO
        private void CargarInventario()
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_INVENTARIO", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Pasamos el ID de la sucursal del usuario logueado automáticamente
                        cmd.Parameters.Add("@P_ID_SUCURSAL", MySqlDbType.Int32).Value = SesionUsuario.IdSucursal;

                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            // Mostramos los resultados en el DataGridView de manera forzada y limpia
                            dataGridView1.DataSource = null;
                            dataGridView1.DataSource = dt;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al consultar el inventario: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
    }
}
