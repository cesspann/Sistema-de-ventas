using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using Newtonsoft.Json;

namespace ElectroHogar.Modulo_Cajero
{
    public partial class FrmNuevaVenta : Form
    {
        // Estructura auxiliar para serializar los productos a JSON que espera SP_REALIZAR_VENTA
        public class DetalleVentaJson
        {
            public int ID_PRODUCTO { get; set; }
            public int CANTIDAD { get; set; }
        }

        public FrmNuevaVenta()
        {
            InitializeComponent();
            InicializarGrilla(); // Asegura que la grilla tenga las columnas listas
        }

        private void FrmNuevaVenta_Load(object sender, EventArgs e)
        {
            // Opcional al cargar la ventana
        }

        // Método para configurar las columnas de la grilla por código si no están creadas en el diseñador
        private void InicializarGrilla()
        {
            if (dataProductos.Columns.Count == 0)
            {
                dataProductos.Columns.Add("ID_PRODUCTO", "ID Producto");
                dataProductos.Columns.Add("CANTIDAD", "Cantidad");
            }
        }

        // Botón para añadir productos a la grilla usando las cajas de texto (txtAñadirProducto y txtcantidad)
        private void btnAñadirProducto_Click(object sender, EventArgs e)
        {
            string textoId = txtAñadirProducto.Text.Trim();
            string textoCantidad = txtcantidad.Text.Trim();

            if (string.IsNullOrEmpty(textoId))
            {
                MessageBox.Show("Por favor ingrese el ID del producto.", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // Validamos que el ID sea un número entero válido
            if (int.TryParse(textoId, out int idProducto))
            {
                int cantidad = 1;
                if (!string.IsNullOrEmpty(textoCantidad))
                {
                    if (!int.TryParse(textoCantidad, out cantidad) || cantidad <= 0)
                    {
                        MessageBox.Show("La cantidad debe ser un número entero mayor a 0.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }
                }

                // Añadimos el producto y su cantidad a la grilla visual
                dataProductos.Rows.Add(idProducto, cantidad);

                // Limpiamos los campos y regresamos el cursor al campo de ID para agilizar
                txtAñadirProducto.Clear();
                txtcantidad.Clear();
                txtAñadirProducto.Focus();
            }
            else
            {
                MessageBox.Show("El ID del producto debe ser un número válido.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // Botón principal para procesar, serializar en JSON y cobrar la venta completa
        private void btnProcesarVenta_Click(object sender, EventArgs e)
        {
            // 1. Recorrer el DataGridView para armar la lista de productos
            List<DetalleVentaJson> listaProductos = new List<DetalleVentaJson>();

            foreach (DataGridViewRow row in dataProductos.Rows)
            {
                if (row.IsNewRow) continue;

                // Se lee por índice (0 y 1) para evitar errores si los nombres de columna del diseñador difieren
                int idProducto = Convert.ToInt32(row.Cells[0].Value);
                int cantidad = Convert.ToInt32(row.Cells[1].Value);

                listaProductos.Add(new DetalleVentaJson
                {
                    ID_PRODUCTO = idProducto,
                    CANTIDAD = cantidad
                });
            }

            if (listaProductos.Count == 0)
            {
                MessageBox.Show("Debe agregar al menos un producto a la venta.", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // 2. Serializar la lista de objetos a formato JSON plano
            string jsonProductos = JsonConvert.SerializeObject(listaProductos);

            // 3. Capturar datos generales desde los controles de la interfaz
            int idCliente;
            if (!int.TryParse(txtIDCliente.Text.Trim(), out idCliente))
            {
                MessageBox.Show("Ingrese un ID de cliente válido.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idEmpleado = SesionUsuario.IdEmpleado; // Obtenido de tu sesión activa
            int idSucursal = 1; // Ajustar según la sucursal del empleado

            // Captura dinámica desde txtPago (si está vacío, usa "Efectivo" por defecto)
            string metodoPago = string.IsNullOrWhiteSpace(txtPago.Text) ? "Efectivo" : txtPago.Text.Trim();

            // Valores de crédito opcionales con validación segura
            decimal montoPrima = 0.00m;
            if (!string.IsNullOrWhiteSpace(txtPrima.Text) && !decimal.TryParse(txtPrima.Text.Trim(), out montoPrima))
            {
                MessageBox.Show("Ingrese un monto de prima válido.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            decimal tasaInteres = 0.00m;
            if (!string.IsNullOrWhiteSpace(txtInteres.Text) && !decimal.TryParse(txtInteres.Text.Trim(), out tasaInteres))
            {
                MessageBox.Show("Ingrese una tasa de interés válida.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int numeroCuotas = 0;
            if (!string.IsNullOrWhiteSpace(txtCuotas.Text) && !int.TryParse(txtCuotas.Text.Trim(), out numeroCuotas))
            {
                MessageBox.Show("Ingrese un número de cuotas válido.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // 4. Ejecutar el procedimiento almacenado principal SP_REALIZAR_VENTA en MySQL
            using (MySqlConnection conexion = Conexion.ObtenerConexion())
            {
                if (conexion == null)
                {
                    MessageBox.Show("No se pudo conectar a la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_REALIZAR_VENTA", conexion))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Parámetros de Entrada (IN)
                        cmd.Parameters.Add("@P_ID_CLIENTE", MySqlDbType.Int32).Value = idCliente;
                        cmd.Parameters.Add("@P_ID_EMPLEADO", MySqlDbType.Int32).Value = idEmpleado;
                        cmd.Parameters.Add("@P_ID_SUCURSAL", MySqlDbType.Int32).Value = idSucursal;
                        cmd.Parameters.Add("@P_METODO_PAGO", MySqlDbType.VarChar).Value = metodoPago;

                        // Enviamos el JSON como VarChar para máxima compatibilidad con el conector
                        cmd.Parameters.Add("@P_PRODUCTOS", MySqlDbType.VarChar).Value = jsonProductos;

                        cmd.Parameters.Add("@P_MONTO_PRIMA", MySqlDbType.Decimal).Value = montoPrima;
                        cmd.Parameters.Add("@P_TASA_INTERES", MySqlDbType.Decimal).Value = tasaInteres;
                        cmd.Parameters.Add("@P_NUMERO_CUOTAS", MySqlDbType.Int32).Value = numeroCuotas;

                        // Parámetros de Salida (OUT)
                        MySqlParameter outIdFactura = new MySqlParameter("@P_ID_FACTURA", MySqlDbType.Int32);
                        outIdFactura.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(outIdFactura);

                        MySqlParameter outNumFactura = new MySqlParameter("@P_NUMERO_FACTURA", MySqlDbType.VarChar, 20);
                        outNumFactura.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(outNumFactura);

                        MySqlParameter outIdCredito = new MySqlParameter("@P_ID_CREDITO", MySqlDbType.Int32);
                        outIdCredito.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(outIdCredito);

                        // Ejecutar la transacción completa en la base de datos
                        cmd.ExecuteNonQuery();

                        // Capturar resultados devueltos por el SP
                        string numFacturaGen = outNumFactura.Value.ToString();
                        string mensaje = $"¡Venta registrada con éxito!\nFactura N°: {numFacturaGen}";

                        if (outIdCredito.Value != DBNull.Value && outIdCredito.Value != null)
                        {
                            mensaje += $"\nCrédito ID: {outIdCredito.Value} generado correctamente.";
                        }

                        MessageBox.Show(mensaje, "Proceso Exitoso", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        this.Close();
                    }
                }
                catch (Exception ex)
                {
                    // Atrapa cualquier validación o error de inventario insuficiente lanzado por MySQL
                    MessageBox.Show("Error al procesar la venta: " + ex.Message, "Validación de Negocio", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        // Métodos auxiliares y eventos secundarios
        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnMain_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void panel1_Paint(object sender, PaintEventArgs e) { }
        private void txtIDCliente_TextChanged(object sender, EventArgs e) { }
        private void txtPrima_TextChanged(object sender, EventArgs e) { }
        private void txtPago_TextChanged(object sender, EventArgs e) { }
        private void txtInteres_TextChanged(object sender, EventArgs e) { }
        private void txtCuotas_TextChanged(object sender, EventArgs e) { }
        private void dataProductos_CellContentClick(object sender, DataGridViewCellEventArgs e) { }
        private void btnView_Click(object sender, EventArgs e) { }
        private void txtAñadirProducto_TextChanged(object sender, EventArgs e) { }
        private void txtcantidad_TextChanged(object sender, EventArgs e) { }
    }
}