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
    public partial class FrmCBitacoraFactura : Form
    {
        public FrmCBitacoraFactura()
        {
            InitializeComponent();
        }

        private void FrmCBitacoraFactura_Load(object sender, EventArgs e)
        {
            // Al abrir la ventana, aplicamos los filtros automáticamente usando la sesión
            AplicarFiltros();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
        }

        private void btnMain_Click(object sender, EventArgs e)
        {
            InicioCajero inicioCajero = new InicioCajero();
            inicioCajero.Show();
            this.Close();
        }

        private void btnsecond_Click(object sender, EventArgs e)
        {
            FrmConsultarDatos consultarDatos = new FrmConsultarDatos();
            consultarDatos.Show();
            this.Close();
        }

        // Búsqueda de texto
        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            AplicarFiltros();
        }

        // FECHA DESDE (Usando dateDesde)
        private void dateDesde_ValueChanged(object sender, EventArgs e)
        {
            AplicarFiltros();
        }

        // FECHA HASTA (Usando dateHasta)
        private void dateHasta_ValueChanged(object sender, EventArgs e)
        {
            AplicarFiltros();
        }

        private void AplicarFiltros()
        {
            // 1. Obtenemos el ID de la sucursal directamente desde el login (SesionUsuario)
            int idSucursal = SesionUsuario.IdSucursal;

            if (idSucursal == 0)
            {
                // Si por alguna razón no hay sesión activa o es 0, alertamos o limpiamos
                return;
            }

            // 2. Texto de búsqueda
            string busqueda = textBox1.Text.Trim();

            // 3. Fecha Desde
            DateTime? fechaDesde = dateDesde.Value.Date;

            // 4. Fecha Hasta (abarcando hasta el final del día)
            DateTime? fechaHasta = dateHasta.Value.Date.AddDays(1).AddSeconds(-1);

            // Llamamos a la consulta directa con la sucursal del login
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
                    // Armamos la consulta SQL directamente en C# sin alterar procedimientos almacenados
                    string query = @"SELECT B.ID_BITACORA_FACTURA, B.ID_FACTURA, B.ID_EMPLEADO, B.FECHA_CREACION, B.MOTIVO_DE_CANCELACION
                                     FROM BITACORAFACTURACANCELADA B
                                     INNER JOIN FACTURA F ON B.ID_FACTURA = F.ID_FACTURA
                                     WHERE F.ID_SUCURSAL = @P_ID_SUCURSAL";

                    // Si escribieron algo en la búsqueda de texto
                    if (!string.IsNullOrEmpty(busqueda))
                    {
                        query += @" AND (
                                      CAST(B.ID_BITACORA_FACTURA AS CHAR) LIKE @P_BUSQUEDA
                                      OR CAST(B.ID_FACTURA AS CHAR) LIKE @P_BUSQUEDA
                                      OR CAST(B.ID_EMPLEADO AS CHAR) LIKE @P_BUSQUEDA
                                      OR B.MOTIVO_DE_CANCELACION LIKE @P_BUSQUEDA
                                   )";
                    }

                    // Filtro de fecha desde
                    if (fechaDesde.HasValue)
                    {
                        query += " AND B.FECHA_CREACION >= @P_FECHA_DESDE";
                    }

                    // Filtro de fecha hasta
                    if (fechaHasta.HasValue)
                    {
                        query += " AND B.FECHA_CREACION <= @P_FECHA_HASTA";
                    }

                    query += " ORDER BY B.FECHA_CREACION DESC;";

                    using (MySqlCommand cmd = new MySqlCommand(query, conexion))
                    {
                        cmd.Parameters.AddWithValue("@P_ID_SUCURSAL", idSucursal);

                        if (!string.IsNullOrEmpty(busqueda))
                        {
                            cmd.Parameters.AddWithValue("@P_BUSQUEDA", "%" + busqueda + "%");
                        }

                        if (fechaDesde.HasValue)
                        {
                            cmd.Parameters.AddWithValue("@P_FECHA_DESDE", fechaDesde.Value);
                        }

                        if (fechaHasta.HasValue)
                        {
                            cmd.Parameters.AddWithValue("@P_FECHA_HASTA", fechaHasta.Value);
                        }

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
                    MessageBox.Show("Error al consultar la bitácora: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void tableLayoutPanel2_Paint(object sender, PaintEventArgs e)
        {
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {

        }

        private void tableLayoutPanel5_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}