using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.ConsultasLocales
{
    public partial class RegistrarLimiteCredito : Form
    {
        private int idCliente;
        private int idSucursal;

        public decimal MontoAsignado { get; private set; }

        public RegistrarLimiteCredito(int idCliente = 0, string nombreCliente = "", int idSucursal = 0)
        {
            InitializeComponent();
            this.idCliente = idCliente;
            this.idSucursal = idSucursal > 0 ? idSucursal : (SesionUsuario.IdSucursal > 0 ? SesionUsuario.IdSucursal : 1);

            if (!string.IsNullOrEmpty(nombreCliente))
            {
                lblClienteInfo.Text = $"Cliente: {nombreCliente} (ID: {idCliente})  |  Sucursal: {this.idSucursal}";
            }
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            decimal montoLimite = numMontoLimite.Value;

            if (montoLimite <= 0)
            {
                MessageBox.Show("El límite de crédito debe ser mayor que cero.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numMontoLimite.Focus();
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_REGISTRAR_LIMITE_CREDITO", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_CLIENTE", this.idCliente);
                        cmd.Parameters.AddWithValue("P_ID_SUCURSAL", this.idSucursal);
                        cmd.Parameters.AddWithValue("P_MONTO_LIMITE", montoLimite);

                        cmd.ExecuteNonQuery();

                        MontoAsignado = montoLimite;
                        MessageBox.Show($"Límite de crédito de {montoLimite:C2} registrado correctamente.",
                                        "ElectroHogar - Crédito Personal", MessageBoxButtons.OK, MessageBoxIcon.Information);

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
