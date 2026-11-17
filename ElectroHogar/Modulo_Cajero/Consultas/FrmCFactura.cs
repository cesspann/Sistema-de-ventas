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
    public partial class FrmCFactura : FormBase
    {
        public FrmCFactura()
        {
            InitializeComponent();

            // Carga inicial al abrir el formulario (Muestra todas las facturas activas de la sucursal actual)
            CargarFacturas("");
        }


        // Botón para ir a la otra ventana de consultas
        private void button2_Click(object sender, EventArgs e)
        {
            
            this.Close();
        }

        // Evento del botón de búsqueda (Ejecuta el filtro al hacer clic)

        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
        }

        // Método centralizado para conectar y ejecutar el Procedimiento Almacenado SP_CONSULTAR_FACTURAS
        private void CargarFacturas(string busqueda)
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_FACTURAS", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // 1. Sucursal obtenida automáticamente de la sesión activa
                        cmd.Parameters.Add("@P_ID_SUCURSAL", MySqlDbType.Int32).Value = SesionUsuario.IdSucursal;

                        // 2. Parámetro de búsqueda condicional: si está vacío, envía DBNull para traer todo lo de la sucursal
                        MySqlParameter paramBusqueda = cmd.Parameters.Add("@P_BUSQUEDA", MySqlDbType.VarChar);

                        if (string.IsNullOrEmpty(busqueda))
                        {
                            paramBusqueda.Value = DBNull.Value;
                        }
                        else
                        {
                            paramBusqueda.Value = busqueda;
                        }

                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            // Mostramos los resultados en la grilla de manera limpia
                            dataGridView1.DataSource = null;
                            dataGridView1.DataSource = dt;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al consultar las facturas: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnBuscar_Click_1(object sender, EventArgs e)
        {
            string filtro = txtBuscar.Text.Trim();
            CargarFacturas(filtro);
        }
    }
}