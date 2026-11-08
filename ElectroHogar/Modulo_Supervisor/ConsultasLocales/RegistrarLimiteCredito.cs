using System;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.ConsultasLocales
{
    public partial class RegistrarLimiteCredito : Form
    {
        private int idCliente;
        private int idSucursal;

        public decimal MontoAsignado { get; private set; }

        public RegistrarLimiteCredito(int idCliente = 0, string nombreCliente = "", int idSucursal = 1)
        {
            InitializeComponent();
            this.idCliente = idCliente;
            this.idSucursal = idSucursal;

            if (!string.IsNullOrEmpty(nombreCliente))
            {
                lblClienteInfo.Text = $"Cliente: {nombreCliente} (ID: {idCliente})  |  Sucursal: {idSucursal}";
            }
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            // Validación idéntica a SP_REGISTRAR_LIMITE_CREDITO (P_MONTO_LIMITE <= 0)
            if (numMontoLimite.Value <= 0)
            {
                MessageBox.Show("El límite de crédito debe ser mayor que cero.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numMontoLimite.Focus();
                return;
            }

            MontoAsignado = numMontoLimite.Value;
            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
