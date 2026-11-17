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
    public partial class FrmCCredito : FormBase
    {
        public FrmCCredito()
        {
            InitializeComponent();
        }

        // Carga inicial al abrir el formulario (Muestra los créditos de la sucursal actual)
        private void FrmCCredito_Load(object sender, EventArgs e)
        {
            CargarCreditos();
        }


        private void button2_Click(object sender, EventArgs e)
        {
            
            this.Close();
        }

        // Evento del botón de búsqueda (Ejecuta la consulta)
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarCreditos();
        }

        // Opcional: Si quieres que filtre automáticamente mientras escriben en la búsqueda o estado
        private void txtBusqueda_TextChanged(object sender, EventArgs e)
        {
            // CargarCreditos(); // Descomenta si deseas búsqueda en tiempo real
        }

        private void txtEstado_TextChanged(object sender, EventArgs e)
        {
            // CargarCreditos(); // Descomenta si deseas filtrado automático por estado
        }

        private void tableLayoutPanel4_Paint(object sender, PaintEventArgs e)
        {
        }

        // Método centralizado para conectar y ejecutar el procedimiento almacenado
        private void CargarCreditos()
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_CREDITOS", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // 1. Sucursal obtenida automáticamente del login
                        cmd.Parameters.AddWithValue("@P_ID_SUCURSAL", SesionUsuario.IdSucursal);

                        // 2. Texto de búsqueda (Si está vacío, mandamos DBNull)
                        string busqueda = txtBusqueda.Text.Trim();
                        cmd.Parameters.AddWithValue("@P_BUSQUEDA", string.IsNullOrEmpty(busqueda) ? (object)DBNull.Value : busqueda);

                        // 3. Estado del crédito (Si está vacío, mandamos DBNull para que traiga todos los estados)
                        string estado = txtEstado.Text.Trim();
                        cmd.Parameters.AddWithValue("@P_ESTADO", string.IsNullOrEmpty(estado) ? (object)DBNull.Value : estado);

                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            // Mostramos los resultados en tu DataGridView (asegúrate de que se llame dataGridView1)
                            dataGridView1.DataSource = dt;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al consultar los créditos: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}
