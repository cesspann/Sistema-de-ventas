using System;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class ActualizarProducto : Form
    {
        private int idProducto;
        private int idEmpleadoSupervisor;

        public ActualizarProducto(int idProducto = 0, string nombreProducto = "", decimal precioActual = 0, int idEmpleadoSupervisor = 1)
        {
            InitializeComponent();
            this.idProducto = idProducto;
            this.idEmpleadoSupervisor = idEmpleadoSupervisor;

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

            // Validación idéntica a SP_ACTUALIZAR_PRECIO_PRODUCTO (P_NUEVO_PRECIO IS NULL OR P_NUEVO_PRECIO <= 0)
            if (nuevoPrecio <= 0)
            {
                MessageBox.Show("El precio debe ser mayor que cero.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numNuevoPrecio.Focus();
                return;
            }

            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
