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
    public partial class FrmCCuota : FormBase
    {
        public FrmCCuota()
        {
            InitializeComponent();
        }

        // Carga inicial al abrir el formulario (Muestra las cuotas de la sucursal actual)
        private void FrmCCuota_Load(object sender, EventArgs e)
        {
            CargarCuotas();
        }


        private void button2_Click(object sender, EventArgs e)
        {
            
            this.Close();
        }

        // Evento del botón de búsqueda (Ejecuta la consulta con los filtros ingresados)
        private void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarCuotas();
        }

        private void txtEstado_TextChanged(object sender, EventArgs e)
        {
            // Opcional: Si deseas que filtre en tiempo real al escribir el estado, puedes descomentar CargarCuotas();
        }

        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            // Opcional: Si deseas que filtre en tiempo real al escribir en la búsqueda, puedes descomentar CargarCuotas();
        }

        // Método centralizado para conectar y ejecutar el procedimiento almacenado de cuotas
        private void CargarCuotas()
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_CUOTAS", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // 1. Sucursal obtenida automáticamente del login (SesionUsuario)
                        cmd.Parameters.AddWithValue("@P_ID_SUCURSAL", SesionUsuario.IdSucursal);

                        // 2. Texto de búsqueda (Si está vacío, mandamos DBNull)
                        string busqueda = txtBuscar.Text.Trim();
                        cmd.Parameters.AddWithValue("@P_BUSQUEDA", string.IsNullOrEmpty(busqueda) ? (object)DBNull.Value : busqueda);

                        // 3. Estado de la cuota (Si está vacío, mandamos DBNull para que traiga todos los estados)
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
                    MessageBox.Show("Error al consultar las cuotas: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void tableLayoutPanel4_Paint(object sender, PaintEventArgs e)
        {


        }
    }
}
