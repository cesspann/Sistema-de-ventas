using ElectroHogar.Modulo_Cajero.Consultas;
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

namespace ElectroHogar.Modulo_Cajero
{
    public partial class FrmPagoCredito : FormBase
    {
        public FrmPagoCredito()
        {
            InitializeComponent();
        }

        // Botón de pago (Ejecuta el procedimiento almacenado SP_PAGAR_CUOTA)
        private void button1_Click(object sender, EventArgs e)
        {
            // 1. Validaciones básicas de campos vacíos
            if (string.IsNullOrWhiteSpace(txtIDCredito.Text))
            {
                MessageBox.Show("Por favor, ingrese el ID del crédito.", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtIDCuota.Text))
            {
                MessageBox.Show("Por favor, ingrese el número de la cuota.", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtMonto.Text))
            {
                MessageBox.Show("Por favor, ingrese el monto del pago.", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // 2. Conversiones de tipos de datos seguras
            if (!int.TryParse(txtIDCredito.Text.Trim(), out int idCredito))
            {
                MessageBox.Show("El ID del crédito debe ser un número entero.", "Error de Formato", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (!int.TryParse(txtIDCuota.Text.Trim(), out int numeroCuota))
            {
                MessageBox.Show("El número de cuota debe ser un número entero.", "Error de Formato", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (!decimal.TryParse(txtMonto.Text.Trim(), out decimal montoPago))
            {
                MessageBox.Show("El monto de pago debe ser un valor numérico válido.", "Error de Formato", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // 3. Ejecución del pago en la base de datos
            PagarCuota(idCredito, numeroCuota, montoPago);
        }

        // Botón para regresar al menú principal del cajero
        private void button2_Click(object sender, EventArgs e)
        {
            
            this.Close();
        }

        private void txtMonto_TextChanged(object sender, EventArgs e)
        {
        }

        private void txtIDCuota_TextChanged(object sender, EventArgs e)
        {
        }

        private void txtIDCredito_TextChanged(object sender, EventArgs e)
        {
        }

        // Método centralizado para conectar y ejecutar el Procedimiento Almacenado SP_PAGAR_CUOTA
        private void PagarCuota(int idCredito, int numeroCuota, decimal montoPago)
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_PAGAR_CUOTA", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de entrada exigidos por el SP
                        cmd.Parameters.Add("@P_ID_CREDITO", MySqlDbType.Int32).Value = idCredito;
                        cmd.Parameters.Add("@P_NUMERO_CUOTA", MySqlDbType.Int32).Value = numeroCuota;
                        cmd.Parameters.Add("@P_MONTO_PAGO", MySqlDbType.Decimal).Value = montoPago;

                        // Ejecutamos la transacción
                        cmd.ExecuteNonQuery();

                        MessageBox.Show("¡Cuota pagada con éxito! El estado del crédito y la cuota se han actualizado correctamente.", "Operación Exitosa", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        // Limpiamos los campos después de un pago exitoso
                        txtIDCredito.Clear();
                        txtIDCuota.Clear();
                        txtMonto.Clear();
                    }
                }
                catch (Exception ex)
                {
                    // Captura las validaciones de negocio lanzadas por el SIGNAL SQLSTATE '45000' de MySQL (montos exactos, créditos pagados, etc.)
                    MessageBox.Show("No se pudo procesar el pago: " + ex.Message, "Error de Validación", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void tableLayoutPanel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            FrmCFactura facturaV = new FrmCFactura();
            facturaV.FormClosed += (s, args) => this.Show();
            facturaV.Show();
            this.Hide();
        }
    }
}