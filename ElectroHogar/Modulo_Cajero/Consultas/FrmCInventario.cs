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
    public partial class FrmCInventario : FormBase
    {
        public FrmCInventario()
        {
            InitializeComponent();

            // Cargamos los datos automáticamente al iniciar el formulario desde el código,
            // sin depender de que el evento Load esté enlazado en el diseñador.
            CargarInventario(null); 
        }


        // Botón para ir a la otra ventana de consultas
        private void button3_Click(object sender, EventArgs e)
        {
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

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarInventario(txtBusqueda.Text);
        }

        // Consulta el inventario de la sucursal usando SP_CONSULTAR_PRODUCTOS_SUCURSAL.
        private void CargarInventario(string busqueda)
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_PRODUCTOS_SUCURSAL", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        int idSucursal = SesionUsuario.IdSucursal > 0 ? SesionUsuario.IdSucursal : 1;
                        string criterio = string.IsNullOrWhiteSpace(busqueda) ? null : busqueda.Trim();

                        cmd.Parameters.AddWithValue("P_ID_EMPLEADO", SesionUsuario.IdEmpleado);
                        cmd.Parameters.AddWithValue("P_BUSQUEDA", criterio == null ? (object)DBNull.Value : criterio);
                        cmd.Parameters.AddWithValue("ID_SUCURSAL", idSucursal);

                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

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
