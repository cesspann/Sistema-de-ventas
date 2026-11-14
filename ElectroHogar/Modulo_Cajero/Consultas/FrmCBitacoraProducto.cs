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
    public partial class FrmCBitacoraProducto : Form
    {
        public FrmCBitacoraProducto()
        {
            InitializeComponent();
        }

        private void FrmCBitacoraProducto_Load(object sender, EventArgs e)
        {
            // Al abrir la ventana, cargamos todos los productos de la sucursal del cajero logueado
            CargarProductos("");
        }

        private void tableLayoutPanel4_Paint(object sender, PaintEventArgs e)
        {
        }

        private void button1_Click(object sender, EventArgs e)
        {
            InicioCajero inicioCajero = new InicioCajero();
            inicioCajero.Show();
            this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            FrmConsultarDatos consultarDatos = new FrmConsultarDatos();
            consultarDatos.Show();
            this.Close();
        }

        private void txtEmpleado_TextChanged(object sender, EventArgs e)
        {
        }

        private void txtSucursal_TextChanged(object sender, EventArgs e)
        {
        }

        // AQUÍ YA NO HACE NADA AL ESCRIBIR (queda libre para que escribas tranquilo)
        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
        }

        // LA BÚSQUEDA SE EJECUTA ÚNICAMENTE AL DAR CLIC EN EL BOTÓN
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            string filtro = txtBuscar.Text.Trim();
            CargarProductos(filtro);
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
        }

        // Método centralizado que conecta y ejecuta tu procedimiento almacenado
        private void CargarProductos(string busqueda)
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

                        // 1. Enviamos el empleado desde la sesión
                        cmd.Parameters.AddWithValue("@P_ID_EMPLEADO", SesionUsuario.IdEmpleado);

                        // 2. Enviamos el texto de búsqueda (o DBNull si está vacío)
                        cmd.Parameters.AddWithValue("@P_BUSQUEDA", string.IsNullOrEmpty(busqueda) ? (object)DBNull.Value : busqueda);

                        // 3. Enviamos la sucursal desde la sesión
                        cmd.Parameters.AddWithValue("@ID_SUCURSAL", SesionUsuario.IdSucursal);

                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            // Mostramos los productos en el DataGridView
                            dataGridView1.DataSource = dt;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al consultar los productos: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
    }
}