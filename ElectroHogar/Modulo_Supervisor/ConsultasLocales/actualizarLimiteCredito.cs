using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.ConsultasLocales
{
    public partial class actualizarLimiteCredito : Form
    {
        private int idCliente;
        private int idSucursal;

        public decimal NuevoMonto { get; private set; }

        public actualizarLimiteCredito(int idCliente = 0, string nombreCliente = "", int idSucursal = 0, decimal montoActual = 0)
        {
            InitializeComponent();
            this.idCliente = idCliente;
            this.idSucursal = idSucursal > 0 ? idSucursal : (SesionUsuario.IdSucursal > 0 ? SesionUsuario.IdSucursal : 1);

            if (!string.IsNullOrEmpty(nombreCliente))
            {
                lblClienteInfo.Text = $"Cliente: {nombreCliente} (ID: {idCliente})  |  Sucursal: {this.idSucursal}";
            }

            if (montoActual > 0)
            {
                numNuevoMonto.Value = montoActual;
            }
            else if (this.idCliente > 0)
            {
                CargarLimiteActual();
            }
        }

        private void CargarLimiteActual()
        {
            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null) return;

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_LIMITE_CREDITO_PERSONAL", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_CLIENTE", this.idCliente);
                        cmd.Parameters.AddWithValue("P_ID_SUCURSAL", this.idSucursal);

                        MySqlParameter paramMonto = new MySqlParameter("MONTO", MySqlDbType.Decimal);
                        paramMonto.Precision = 10;
                        paramMonto.Scale = 2;
                        paramMonto.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramMonto);

                        cmd.ExecuteNonQuery();
                        decimal monto = Convert.ToDecimal(paramMonto.Value);

                        if (monto > 0)
                        {
                            numNuevoMonto.Value = monto;
                        }
                    }
                }
                catch (MySqlException)
                {
                    // Si no tiene límite aún, el usuario lo verá en 0 o puede usar Registrar Límite
                }
            }
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            decimal montoIngresado = numNuevoMonto.Value;

            if (montoIngresado <= 0)
            {
                MessageBox.Show("El nuevo monto del límite de crédito debe ser mayor que cero.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numNuevoMonto.Focus();
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_ACTUALIZAR_LIMITE_CREDITO_PERSONAL", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_CLIENTE", this.idCliente);
                        cmd.Parameters.AddWithValue("P_ID_SUCURSAL", this.idSucursal);
                        cmd.Parameters.AddWithValue("P_NUEVO_MONTO", montoIngresado);

                        MySqlParameter paramConf = new MySqlParameter("CONFIRMACION", MySqlDbType.Int32);
                        paramConf.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramConf);

                        cmd.ExecuteNonQuery();
                        int confirmacion = Convert.ToInt32(paramConf.Value);

                        if (confirmacion == 1)
                        {
                            NuevoMonto = montoIngresado;
                            MessageBox.Show("Límite de crédito actualizado correctamente.",
                                            "ElectroHogar - Crédito Personal", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            this.DialogResult = DialogResult.OK;
                            this.Close();
                        }
                        else if (confirmacion == -2)
                        {
                            MessageBox.Show("El nuevo monto debe ser mayor que cero.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        else if (confirmacion == -3)
                        {
                            MessageBox.Show("El cliente aún no tiene un límite de crédito registrado en esta sucursal. Use primero la opción 'Registrar Límite'.",
                                            "Sin Registro Previo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                        else
                        {
                            MessageBox.Show("Ocurrió un error interno en el servidor.", "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error de base de datos: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
