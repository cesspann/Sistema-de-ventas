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

namespace ElectroHogar.Modulo_Cajero
{
    public partial class FrmDatosCajero : Form
    {
        public FrmDatosCajero()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            InicioCajero inicioCajero = new InicioCajero();
            this.Close();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void tableLayoutPanel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtSucursal.Text))
            {
                MessageBox.Show("Por favor, ingrese el ID de la sucursal.", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

           
            if (int.TryParse(txtSucursal.Text.Trim(), out int idSucursal))
            {
                string busqueda = txtCajero.Text.Trim(); 

                CargarCajeros(idSucursal, busqueda);
            }
            else
            {
                MessageBox.Show("El ID de la sucursal debe ser un número entero.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void CargarCajeros(int idSucursal, string busqueda)
        {
            // Usamos la clase Conexion que ya creaste
            using (MySqlConnection conexion = Conexion.ObtenerConexion())
            {
                if (conexion == null)
                {
                    MessageBox.Show("No se pudo establecer conexión con la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_CAJEROS", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Agregamos los parámetros que pide tu procedimiento almacenado
                        cmd.Parameters.AddWithValue("@P_ID_SUCURSAL", idSucursal);
                        cmd.Parameters.AddWithValue("@BUSQUEDA", string.IsNullOrEmpty(busqueda) ? (object)DBNull.Value : busqueda);

                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            // Mostramos los resultados en el DataGridView
                            dataGridView1.DataSource = dt;

                            if (dt.Rows.Count == 0)
                            {
                                MessageBox.Show("No se encontraron registros con los criterios especificados.", "Información", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al consultar los datos: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }





        private void txtCajero_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtSucursal_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
