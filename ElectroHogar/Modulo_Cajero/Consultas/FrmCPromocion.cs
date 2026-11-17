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
    public partial class FrmCPromocion : FormBase
    {
        public FrmCPromocion()
        {
            InitializeComponent();
        }


        // Botón de búsqueda
        private void button1_Click(object sender, EventArgs e)
        {
            string busqueda = txtBusqueda.Text.Trim();
            string estado = txtEstado.Text.Trim();

            // Obtenemos los valores de los DateTimePicker
            DateTime? fechaInicio = dateInicio.Value;
            DateTime? fechaFin = dateFin.Value;

            ConsultarPromociones(busqueda, estado, fechaInicio, fechaFin);
        }

        // Botón para regresar a FrmConsultarDatos
        private void button3_Click(object sender, EventArgs e)
        {
            
            this.Close();
        }

        private void txtBusqueda_TextChanged(object sender, EventArgs e)
        {
        }

        private void txtEstado_TextChanged(object sender, EventArgs e)
        {
        }

        private void dateInicio_ValueChanged(object sender, EventArgs e)
        {
        }

        private void dateFin_ValueChanged(object sender, EventArgs e)
        {
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
        }

        // Método centralizado para ejecutar el Procedimiento Almacenado SP_CONSULTAR_PROMOCIONES
        private void ConsultarPromociones(string busqueda, string estado, DateTime? fechaInicio, DateTime? fechaFin)
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_PROMOCIONES", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // 1. Parámetro P_BUSQUEDA
                        MySqlParameter paramBusqueda = cmd.Parameters.Add("@P_BUSQUEDA", MySqlDbType.VarChar);
                        paramBusqueda.Value = string.IsNullOrEmpty(busqueda) ? (object)DBNull.Value : busqueda;

                        // 2. Parámetro P_ESTADO
                        MySqlParameter paramEstado = cmd.Parameters.Add("@P_ESTADO", MySqlDbType.VarChar);
                        paramEstado.Value = string.IsNullOrEmpty(estado) ? (object)DBNull.Value : estado;

                        // 3. Parámetro P_FECHA_INICIO
                        MySqlParameter paramFechaInicio = cmd.Parameters.Add("@P_FECHA_INICIO", MySqlDbType.Date);
                        paramFechaInicio.Value = fechaInicio.HasValue ? (object)fechaInicio.Value.Date : DBNull.Value;

                        // 4. Parámetro P_FECHA_FIN
                        MySqlParameter paramFechaFin = cmd.Parameters.Add("@P_FECHA_FIN", MySqlDbType.Date);
                        paramFechaFin.Value = fechaFin.HasValue ? (object)fechaFin.Value.Date : DBNull.Value;

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
                    MessageBox.Show("Error al consultar las promociones: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
    }
}