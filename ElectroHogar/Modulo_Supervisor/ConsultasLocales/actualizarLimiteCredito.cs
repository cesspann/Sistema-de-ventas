using System;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.ConsultasLocales
{
    public partial class actualizarLimiteCredito : Form
    {
        private int idCliente;
        private int idSucursal;

        public decimal NuevoMonto { get; private set; }

        public actualizarLimiteCredito(int idCliente = 0, string nombreCliente = "", int idSucursal = 1, decimal montoActual = 0)
        {
            InitializeComponent();
            this.idCliente = idCliente;
            this.idSucursal = idSucursal;

            if (!string.IsNullOrEmpty(nombreCliente))
            {
                lblClienteInfo.Text = $"Cliente: {nombreCliente} (ID: {idCliente})  |  Sucursal: {idSucursal}";
            }

            if (montoActual > 0)
            {
                numNuevoMonto.Value = montoActual;
            }
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            // Validación idéntica a SP_ACTUALIZAR_LIMITE_CREDITO_PERSONAL (P_NUEVO_MONTO <= 0.0)
            if (numNuevoMonto.Value <= 0)
            {
                MessageBox.Show("El nuevo monto del límite de crédito debe ser mayor que cero.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numNuevoMonto.Focus();
                return;
            }

            NuevoMonto = numNuevoMonto.Value;
            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
