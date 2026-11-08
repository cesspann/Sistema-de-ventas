using System;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class RegistrarProducto : Form
    {
        public RegistrarProducto()
        {
            InitializeComponent();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            string nombreProducto = txtNombreProducto.Text.Trim();
            decimal precioVenta = numPrecioVenta.Value;
            int stockInicial = (int)numStock.Value;

            // Validaciones idénticas a SP_REGISTRAR_PRODUCTO
            if (string.IsNullOrWhiteSpace(nombreProducto))
            {
                MessageBox.Show("El nombre del producto es obligatorio.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtNombreProducto.Focus();
                return;
            }

            if (precioVenta <= 0)
            {
                MessageBox.Show("El precio de venta debe ser mayor a cero.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numPrecioVenta.Focus();
                return;
            }

            if (stockInicial < 0)
            {
                MessageBox.Show("El stock inicial no puede ser negativo.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numStock.Focus();
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