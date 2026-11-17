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
    public partial class FrmCDetalleFactura : FormBase
    {
        public FrmCDetalleFactura()
        {
            InitializeComponent();
        }

        // Carga inicial al abrir el formulario (Muestra el listado completo de la sucursal)
        private void FrmCDetalleFactura_Load(object sender, EventArgs e)
        {
            CargarDetallesFactura("");
        }


        private void button3_Click(object sender, EventArgs e)
        {
            
            this.Close();
        }

        // Ya no hace nada al escribir para evitar que busque letra por letra
        private void txtbuscar_TextChanged(object sender, EventArgs e)
        {
        }

        // LA BÚSQUEDA SE EJECUTA ÚNICAMENTE AL DAR CLIC EN EL BOTÓN
        private void btnGuardar_Click(object sender, EventArgs e) // (O el nombre real de tu botón de búsqueda si se llama diferente)
        {
            string filtro = txtbuscar.Text.Trim();
            CargarDetallesFactura(filtro);
        }

        // Método centralizado para conectar y ejecutar el Procedimiento Almacenado
        private void CargarDetallesFactura(string busqueda)
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_DETALLE_FACTURA", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // 1. Pasamos la sucursal del usuario logueado automáticamente
                        cmd.Parameters.AddWithValue("@P_ID_SUCURSAL", SesionUsuario.IdSucursal);

                        // 2. Texto de búsqueda (si está vacío, manda DBNull para traer todo)
                        cmd.Parameters.AddWithValue("@P_BUSQUEDA", string.IsNullOrEmpty(busqueda) ? (object)DBNull.Value : busqueda);

                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            // Mostramos los resultados en la grilla
                            dataGridView1.DataSource = dt;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al consultar el detalle de factura: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
    }
}