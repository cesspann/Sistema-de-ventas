using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class RegistrarProducto : Form
    {
        private int idSucursalActual;

        public RegistrarProducto()
        {
            InitializeComponent();
            this.idSucursalActual = SesionUsuario.IdSucursal > 0 ? SesionUsuario.IdSucursal : 1;
            CargarCategoriasActivas();
        }

        private void CargarCategoriasActivas()
        {
            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null)
                {
                    MessageBox.Show("No se pudo conectar con la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    string query = "SELECT ID_CATEGORIA, NOMBRE_CATEGORIA FROM CATEGORIA WHERE ESTADO_CATEGORIA = 'Activo' ORDER BY NOMBRE_CATEGORIA ASC;";
                    MySqlDataAdapter da = new MySqlDataAdapter(query, conn);
                    DataTable dtCategorias = new DataTable();
                    da.Fill(dtCategorias);

                    cmbCategoria.DisplayMember = "NOMBRE_CATEGORIA";
                    cmbCategoria.ValueMember = "ID_CATEGORIA";
                    cmbCategoria.DataSource = dtCategorias;
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al cargar categorías: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            if (cmbCategoria.SelectedValue == null)
            {
                MessageBox.Show("Seleccione una categoría válida para el producto.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                cmbCategoria.Focus();
                return;
            }

            int idCategoria = Convert.ToInt32(cmbCategoria.SelectedValue);
            string nombreProducto = txtNombreProducto.Text.Trim();
            decimal precioVenta = numPrecioVenta.Value;
            int stockInicial = (int)numStock.Value;

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

            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null)
                {
                    MessageBox.Show("No se pudo conectar con la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_REGISTRAR_PRODUCTO", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_CATEGORIA", idCategoria);
                        cmd.Parameters.AddWithValue("P_ID_SUCURSAL", this.idSucursalActual);
                        cmd.Parameters.AddWithValue("P_NOMBRE_PRODUCTO", nombreProducto);
                        cmd.Parameters.AddWithValue("P_PRECIO_VENTA", precioVenta);
                        cmd.Parameters.AddWithValue("P_STOCK", stockInicial);

                        MySqlParameter paramId = new MySqlParameter("P_ID_PRODUCTO", MySqlDbType.Int32);
                        paramId.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add(paramId);

                        cmd.ExecuteNonQuery();
                        int idGenerado = Convert.ToInt32(paramId.Value);

                        MessageBox.Show($"Producto '{nombreProducto}' registrado correctamente con ID: {idGenerado}.",
                                        "ElectroHogar - Productos", MessageBoxButtons.OK, MessageBoxIcon.Information);

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
