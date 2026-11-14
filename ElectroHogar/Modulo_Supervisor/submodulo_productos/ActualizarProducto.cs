using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class ActualizarProducto : Form
    {
        private int idProducto;
        private int idEmpleadoSupervisor;

        public ActualizarProducto(int idProducto = 0, string nombreProducto = "", decimal precioActual = 0, int idEmpleadoSupervisor = 0)
        {
            InitializeComponent();
            this.idProducto = idProducto;
            this.idEmpleadoSupervisor = idEmpleadoSupervisor > 0
                ? idEmpleadoSupervisor
                : (SesionUsuario.IdEmpleado > 0 ? SesionUsuario.IdEmpleado : 1);

            if (!string.IsNullOrEmpty(nombreProducto))
            {
                lblProductoInfo.Text = $"Producto: {nombreProducto} (ID: {idProducto})";
            }

            txtPrecioActual.Text = precioActual.ToString("C2");
            numNuevoPrecio.Value = precioActual > 0 ? precioActual : 0;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            decimal nuevoPrecio = numNuevoPrecio.Value;

            if (nuevoPrecio <= 0)
            {
                MessageBox.Show("El precio debe ser mayor que cero.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numNuevoPrecio.Focus();
                return;
            }

            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null)
                {
                    MessageBox.Show("No se pudo conectar con la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_ACTUALIZAR_PRECIO_PRODUCTO", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_PRODUCTO", this.idProducto);
                        cmd.Parameters.AddWithValue("P_ID_EMPLEADO", this.idEmpleadoSupervisor);
                        cmd.Parameters.AddWithValue("P_NUEVO_PRECIO", nuevoPrecio);

                        cmd.ExecuteNonQuery();

                        MessageBox.Show("Precio del producto actualizado y registrado en la bitácora correctamente.",
                                        "ElectroHogar - Productos", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        this.DialogResult = DialogResult.OK;
                        this.Close();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show(ex.Message, "Aviso de Base de Datos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
