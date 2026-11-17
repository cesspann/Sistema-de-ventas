using System;
using System.Data;
using System.Windows.Forms;
using Google.Protobuf.WellKnownTypes;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class ActualizarProducto : FormBase
    {
        private int idProducto;
        private int idEmpleadoSupervisor;
        private int stock;
        private decimal precioActual;

        

        public ActualizarProducto(int idProducto = 0, string nombreProducto = "", decimal precioActual = 0, int idEmpleadoSupervisor = 0, int stock = 0)
        {
            InitializeComponent();
            this.idProducto = idProducto;
            this.idEmpleadoSupervisor = idEmpleadoSupervisor > 0
                ? idEmpleadoSupervisor
                : (SesionUsuario.IdEmpleado > 0 ? SesionUsuario.IdEmpleado : 1);
            this.stock = stock;
            this.precioActual = precioActual;

            if (!string.IsNullOrEmpty(nombreProducto))
            {
                lblProductoInfo.Text = $"Producto: {nombreProducto} (ID: {idProducto})";
            }

            txtPrecioActual.Text = precioActual.ToString("C2");
            numNuevoPrecio.Value = precioActual > 0 ? precioActual : 0;

            masStock.Value = 0;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            decimal nuevoPrecio = numNuevoPrecio.Value;
            int stockAgregado = (int)masStock.Value;
            int nuevoStock = this.stock + stockAgregado;
            bool cambiaPrecio = nuevoPrecio != this.precioActual;
            bool cambiaStock = stockAgregado > 0;
            bool seActualizoAlgo = false;

            if (!cambiaPrecio && !cambiaStock)
            {
                MessageBox.Show("No hay cambios para guardar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            if (cambiaPrecio && nuevoPrecio <= 0)
            {
                MessageBox.Show("El precio debe ser mayor que cero.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numNuevoPrecio.Focus();
                return;
            } 

            if (stockAgregado < 0)
            {
                MessageBox.Show("No se puede reducir el stock desde esta ventana.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                masStock.Focus();
                return;
            }

            bool actualizarStock = cambiaStock && MessageBox.Show(
                "¿Desea actualizar el stock del producto?",
                "Confirmar actualización de stock",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question) == DialogResult.Yes;

            bool actualizarPrecio = cambiaPrecio && MessageBox.Show(
                "¿Desea actualizar el precio y registrar el cambio en la bitácora?",
                "Confirmar actualización de precio",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question) == DialogResult.Yes;

            if (!actualizarStock && !actualizarPrecio)
                return;

            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null)
                {
                    MessageBox.Show("No se pudo conectar con la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                if (actualizarStock)
                {
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand("SP_ACTUALIZAR_STOCK", conn))
                        {
                            int idSucursal = SesionUsuario.IdSucursal > 0 ? SesionUsuario.IdSucursal : 1;
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("P_ID_PRODUCTO", this.idProducto);
                            cmd.Parameters.AddWithValue("P_ID_SUCURSAL", idSucursal);
                            cmd.Parameters.AddWithValue("P_STOCK", nuevoStock);
                            cmd.ExecuteNonQuery();
                            seActualizoAlgo = true;
                        }
                    }
                    catch (MySqlException ex)
                    {
                        MessageBox.Show(ex.Message, "Aviso de Base de Datos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }

                if (actualizarPrecio)
                {
                    try
                    {
                        using (MySqlCommand cmd = new MySqlCommand("SP_ACTUALIZAR_PRECIO_PRODUCTO", conn))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("P_ID_PRODUCTO", this.idProducto);
                            cmd.Parameters.AddWithValue("P_ID_EMPLEADO", this.idEmpleadoSupervisor);
                            cmd.Parameters.AddWithValue("P_NUEVO_PRECIO", nuevoPrecio);
                            cmd.ExecuteNonQuery();
                            seActualizoAlgo = true;
                        }
                    }
                    catch (MySqlException ex)
                    {
                        MessageBox.Show(ex.Message, "Aviso de Base de Datos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
            }

            if (seActualizoAlgo)
            {
                MessageBox.Show("La actualización se realizó correctamente.",
                                "ElectroHogar - Productos", MessageBoxButtons.OK, MessageBoxIcon.Information);
                this.DialogResult = DialogResult.OK;
                this.Close();
            }
        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void txtPrecioActual_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
