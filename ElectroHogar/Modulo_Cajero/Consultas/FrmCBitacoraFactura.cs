using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Cajero.Consultas
{
    public partial class FrmCBitacoraFactura : FormBase
    {
        
        private bool _cargando = true;

        public FrmCBitacoraFactura()
        {
            InitializeComponent();

            
            dateDesde.Value = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
            dateHasta.Value = DateTime.Today;

            Load += FrmCBitacoraFactura_Load;
        }

        private void FrmCBitacoraFactura_Load(object sender, EventArgs e)
        {
            _cargando = false;
            AplicarFiltros();
        }

        private void btnsecond_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            if (!_cargando) AplicarFiltros();
        }

        private void dateDesde_ValueChanged(object sender, EventArgs e)
        {
            if (!_cargando) AplicarFiltros();
        }

        private void dateHasta_ValueChanged(object sender, EventArgs e)
        {
            if (!_cargando) AplicarFiltros();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            AplicarFiltros();
        }

        private void AplicarFiltros()
        {
            int idSucursal = SesionUsuario.IdSucursal > 0 ? SesionUsuario.IdSucursal : 1;
            string busqueda = textBox1.Text.Trim();

            DateTime fechaDesde = dateDesde.Value.Date;
            DateTime fechaHasta = dateHasta.Value.Date.AddDays(1).AddSeconds(-1);

            CargarBitacoraDirecta(idSucursal, busqueda, fechaDesde, fechaHasta);
        }

        private void CargarBitacoraDirecta(int idSucursal, string busqueda, DateTime? fechaDesde, DateTime? fechaHasta)
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_BITACORA_FACTURA_ANULADA", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Verifica que estos nombres coincidan exactamente con los de tu SP en MySQL
                        cmd.Parameters.AddWithValue("P_ID_SUCURSAL", idSucursal);
                        cmd.Parameters.AddWithValue("P_BUSQUEDA", string.IsNullOrWhiteSpace(busqueda) ? (object)DBNull.Value : busqueda);
                        cmd.Parameters.AddWithValue("P_FECHA_DESDE", fechaDesde.HasValue ? (object)fechaDesde.Value : DBNull.Value);
                        cmd.Parameters.AddWithValue("P_FECHA_HASTA", fechaHasta.HasValue ? (object)fechaHasta.Value : DBNull.Value);

                        using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            dataGridView1.AutoGenerateColumns = true;
                            dataGridView1.DataSource = dt;
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al consultar la bitácora: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        // Eventos vacíos del diseñador (puedes dejarlos o eliminarlos desde la vista de propiedades)
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e) { }
        private void tableLayoutPanel2_Paint(object sender, PaintEventArgs e) { }
        private void tableLayoutPanel5_Paint(object sender, PaintEventArgs e) { }
        private void tableLayoutPanel3_Paint(object sender, PaintEventArgs e) { }

        private void tableLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
