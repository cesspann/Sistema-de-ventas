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
    public partial class FrmEliminarFactura : Form
    {
        public FrmEliminarFactura()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {
        }

        private void label1_Click_1(object sender, EventArgs e)
        {
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            InicioCajero inicioCajero = new InicioCajero();
            inicioCajero.Show();
            this.Close();
        }

        private void txtID_TextChanged(object sender, EventArgs e)
        {
        }

        private void txtIDFactura_TextChanged(object sender, EventArgs e)
        {
        }

        private void txtIDEmpleado_TextChanged(object sender, EventArgs e)
        {
        }

        private void txtMotivo_TextChanged(object sender, EventArgs e)
        {
        }

        // Botón para ejecutar la anulación de la factura
        private void btnEliminar_Click(object sender, EventArgs e)
        {
            // 1. Validaciones básicas de campos vacíos
            if (string.IsNullOrWhiteSpace(txtIDFactura.Text))
            {
                MessageBox.Show("Por favor, ingrese el ID de la factura que desea anular.", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtIDEmpleado.Text))
            {
                MessageBox.Show("Por favor, ingrese el ID del empleado responsable.", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            if (string.IsNullOrWhiteSpace(txtMotivo.Text))
            {
                MessageBox.Show("Debe indicar el motivo de cancelación.", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // 2. Conversiones numéricas seguras
            if (!int.TryParse(txtIDFactura.Text.Trim(), out int idFactura))
            {
                MessageBox.Show("El ID de la factura debe ser un valor numérico.", "Error de Formato", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (!int.TryParse(txtIDEmpleado.Text.Trim(), out int idEmpleado))
            {
                MessageBox.Show("El ID del empleado debe ser un valor numérico.", "Error de Formato", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            string motivoCancelacion = txtMotivo.Text.Trim();

            // 3. Llamada al método que ejecuta la transacción en la base de datos
            AnularFactura(idFactura, idEmpleado, motivoCancelacion);
        }

        // Método centralizado para conectar y ejecutar el Procedimiento Almacenado SP_ANULAR_FACTURA
        private void AnularFactura(int idFactura, int idEmpleado, string motivo)
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_ANULAR_FACTURA", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetro 1: ID de la Factura a anular
                        cmd.Parameters.Add("@P_ID_FACTURA", MySqlDbType.Int32).Value = idFactura;

                        // Parámetro 2: ID del Empleado obtenido de la caja de texto
                        cmd.Parameters.Add("@P_ID_EMPLEADO", MySqlDbType.Int32).Value = idEmpleado;

                        // Parámetro 3: Motivo de cancelación
                        cmd.Parameters.Add("@P_MOTIVO_CANCELACION", MySqlDbType.VarChar).Value = motivo;

                        // Ejecutamos el procedimiento almacenado
                        cmd.ExecuteNonQuery();

                        MessageBox.Show("La factura ha sido anulada exitosamente y los productos regresaron al inventario.", "Operación Exitosa", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        // Limpiamos los campos después de una anulación exitosa
                        txtIDFactura.Clear();
                        txtIDEmpleado.Clear();
                        txtMotivo.Clear();
                    }
                }
                catch (Exception ex)
                {
                    // Captura cualquier mensaje de error enviado por el SIGNAL SQLSTATE '45000' desde MySQL
                    MessageBox.Show("No se pudo anular la factura: " + ex.Message, "Error de Validación", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
    }
}