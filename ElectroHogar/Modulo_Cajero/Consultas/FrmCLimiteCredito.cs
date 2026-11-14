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
    public partial class FrmCLimiteCredito : Form
    {
        public FrmCLimiteCredito()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            InicioCajero inicioCajero = new InicioCajero();
            inicioCajero.Show();
            this.Close();
        }

        // Evento del botón de búsqueda vinculado a tu diseño
        private void btnBuscar(object sender, EventArgs e)
        {
            // Validamos que la caja de texto (textBox1) no esté vacía
            if (string.IsNullOrWhiteSpace(textBox1.Text))
            {
                MessageBox.Show("Por favor, ingrese el ID del cliente.", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (!int.TryParse(textBox1.Text.Trim(), out int idCliente))
            {
                MessageBox.Show("El ID del cliente debe ser un valor numérico.", "Error de Formato", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            ConsultarLimiteCredito(idCliente);
        }

        private void button1_DockChanged(object sender, EventArgs e)
        {
        }

        private void tableLayoutPanel3_Paint(object sender, PaintEventArgs e)
        {
        }

        private void labelCredito_Click(object sender, EventArgs e)
        {
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
        }

        private void button3_Click(object sender, EventArgs e)
        {
            FrmConsultarDatos c1 = new FrmConsultarDatos();
            c1.Show();
            this.Close();
        }

        // Método centralizado para ejecutar el Procedimiento Almacenado con parámetro OUT
        private void ConsultarLimiteCredito(int idCliente)
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_LIMITE_CREDITO_PERSONAL", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // 1. Parámetro de entrada: ID del cliente
                        cmd.Parameters.Add("@P_ID_CLIENTE", MySqlDbType.Int32).Value = idCliente;

                        // 2. Parámetro de entrada: ID de la sucursal actual de la sesión
                        cmd.Parameters.Add("@P_ID_SUCURSAL", MySqlDbType.Int32).Value = SesionUsuario.IdSucursal;

                        // 3. Parámetro de salida: MONTO (OUT)
                        MySqlParameter paramMonto = new MySqlParameter("@MONTO", MySqlDbType.Decimal);
                        paramMonto.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramMonto);

                        // Ejecutamos el comando
                        cmd.ExecuteNonQuery();

                        // Obtenemos el valor devuelto por el procedimiento
                        object resultado = paramMonto.Value;

                        if (resultado != DBNull.Value && resultado != null)
                        {
                            decimal montoLimite = Convert.ToDecimal(resultado);

                            // Evaluamos los códigos de control definidos en tu procedimiento almacenado
                            if (montoLimite == -1.00m)
                            {
                                MessageBox.Show("Ocurrió un error en la base de datos al procesar la consulta.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            }
                            else if (montoLimite == -2.00m)
                            {
                                MessageBox.Show("No se encontró un límite de crédito registrado para este cliente en la sucursal actual.", "Sin Resultados", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                labelCredito.Text = "$0.00"; // Se muestra 0 en la etiqueta cuando no hay registro
                            }
                            else
                            {
                                // Mostramos el límite de crédito encontrado directamente en labelCredito
                                labelCredito.Text = "$" + montoLimite.ToString("N2");
                            }
                        }
                        else
                        {
                            MessageBox.Show("No se pudo obtener el límite de crédito.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        }
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error al consultar el límite de crédito: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
    }
}