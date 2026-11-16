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
    public partial class FrmCClienteJuridico : Form
    {
        public FrmCClienteJuridico()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string filtro = btnBusqueda.Text.Trim();
            CargarClientesJuridicos(filtro);
        }

        private void btnBusqueda_TextChanged(object sender, EventArgs e)
        {
           
        }
        private void CargarClientesJuridicos(string busqueda)
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_CLIENTE_JURIDICO", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Enviamos el parámetro al procedimiento almacenado
                        cmd.Parameters.AddWithValue("@P_BUSQUEDA", string.IsNullOrEmpty(busqueda) ? (object)DBNull.Value : busqueda);

                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            // Muestra los resultados en el DataGridView
                            dataGridView1.DataSource = dt;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al consultar los clientes jurídicos: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
    

private void button1_Click(object sender, EventArgs e)
        {
            FrmConsultarDatos consultarDatos = new FrmConsultarDatos();
            this.Close();
        }

        private void tableLayoutPanel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnsubmenu_Click(object sender, EventArgs e)
        {
            InicioCajero inicioCajero = new InicioCajero();
            this.Close();
           
        }

        private void tableLayoutPanel4_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
