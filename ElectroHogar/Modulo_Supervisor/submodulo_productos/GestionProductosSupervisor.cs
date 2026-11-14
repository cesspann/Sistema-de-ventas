using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class GestionProductosSupervisor : Form
    {
        private const string PlaceholderText = "Buscar por ID, categoría, producto, stock, precio, estado o descuento...";
        private DataTable dtProductos;
        private int idEmpleadoActual;

        public GestionProductosSupervisor()
        {
            InitializeComponent();
            this.idEmpleadoActual = SesionUsuario.IdEmpleado > 0 ? SesionUsuario.IdEmpleado : 1;
            ConfigurarPlaceholder();
            ConfigurarTabla();
            CargarProductos();
        }

        private void ConfigurarTabla()
        {
            dgvProductos.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvProductos.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvProductos.MultiSelect = false;
            dgvProductos.ReadOnly = true;
            dgvProductos.AllowUserToAddRows = false;
            dgvProductos.RowHeadersVisible = false;
            dgvProductos.BackgroundColor = Color.White;
            dgvProductos.BorderStyle = BorderStyle.FixedSingle;

            dgvProductos.EnableHeadersVisualStyles = false;
            dgvProductos.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvProductos.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvProductos.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvProductos.ColumnHeadersHeight = 38;

            dgvProductos.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvProductos.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvProductos.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvProductos.RowTemplate.Height = 32;
        }

        private void CargarProductos()
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_PRODUCTOS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_EMPLEADO", this.idEmpleadoActual);
                        cmd.Parameters.AddWithValue("P_BUSQUEDA", DBNull.Value);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtProductos = new DataTable();
                        da.Fill(dtProductos);

                        dgvProductos.DataSource = dtProductos;
                        FormatearColumnas();
                        AplicarFiltroLocal();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al cargar productos: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void FormatearColumnas()
        {
            if (dgvProductos.Columns.Count == 0) return;

            dgvProductos.Columns["ID_PRODUCTO"].HeaderText = "ID Prod.";
            dgvProductos.Columns["ID_CATEGORIA"].HeaderText = "ID Cat.";
            dgvProductos.Columns["NOMBRE_CATEGORIA"].HeaderText = "Categoría";
            dgvProductos.Columns["NOMBRE_PRODUCTO"].HeaderText = "Producto";
            dgvProductos.Columns["STOCK"].HeaderText = "Stock";
            dgvProductos.Columns["PRECIO_VENTA"].HeaderText = "Precio Normal";
            dgvProductos.Columns["ESTADO_PRODUCTO"].HeaderText = "Estado";
            dgvProductos.Columns["PORCENTAJE_DESCUENTO"].HeaderText = "Desc. (%)";
            dgvProductos.Columns["PRECIO_FINAL"].HeaderText = "Precio Final";

            dgvProductos.Columns["PRECIO_VENTA"].DefaultCellStyle.Format = "C2";
            dgvProductos.Columns["PRECIO_FINAL"].DefaultCellStyle.Format = "C2";
            dgvProductos.Columns["PORCENTAJE_DESCUENTO"].DefaultCellStyle.Format = "N2";

            dgvProductos.Columns["ID_PRODUCTO"].FillWeight = 45;
            dgvProductos.Columns["ID_CATEGORIA"].FillWeight = 45;
            dgvProductos.Columns["STOCK"].FillWeight = 50;
            dgvProductos.Columns["ESTADO_PRODUCTO"].FillWeight = 60;
            dgvProductos.Columns["PORCENTAJE_DESCUENTO"].FillWeight = 55;
        }

        // --- BOTONES SUPERIORES ---
        private void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            RegistrarProducto modalProducto = new RegistrarProducto();
            if (modalProducto.ShowDialog() == DialogResult.OK)
            {
                CargarProductos();
            }
        }

        private void btnGestionarCategorias_Click(object sender, EventArgs e)
        {
            GestionarCategorias ventanaCategorias = new GestionarCategorias();
            if (ventanaCategorias.ShowDialog() == DialogResult.OK)
            {
                CargarProductos();
            }
        }

        private void btnGestionarPromociones_Click(object sender, EventArgs e)
        {
            GestionarPromociones ventanaPromociones = new GestionarPromociones();
            if (ventanaPromociones.ShowDialog() == DialogResult.OK)
            {
                CargarProductos();
            }
        }

        private void btnGestionarProveedores_Click(object sender, EventArgs e)
        {
            GestionarProveedores ventanaProveedores = new GestionarProveedores();
            ventanaProveedores.ShowDialog();
        }

        // --- BOTONES INFERIORES ---
        private void btnActualizarProducto_Click(object sender, EventArgs e)
        {
            if (dgvProductos.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un producto de la tabla para actualizar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idProducto = Convert.ToInt32(dgvProductos.SelectedRows[0].Cells["ID_PRODUCTO"].Value);
            string nombreProducto = dgvProductos.SelectedRows[0].Cells["NOMBRE_PRODUCTO"].Value.ToString();
            decimal precioActual = Convert.ToDecimal(dgvProductos.SelectedRows[0].Cells["PRECIO_VENTA"].Value);

            ActualizarProducto modalActualizar = new ActualizarProducto(idProducto, nombreProducto, precioActual);
            if (modalActualizar.ShowDialog() == DialogResult.OK)
            {
                CargarProductos();
            }
        }

        private void btnActivarProducto_Click(object sender, EventArgs e)
        {
            CambiarEstadoProducto("Activo");
        }

        private void btnDesactivarProducto_Click(object sender, EventArgs e)
        {
            CambiarEstadoProducto("Inactivo");
        }

        private void CambiarEstadoProducto(string nuevoEstado)
        {
            if (dgvProductos.SelectedRows.Count == 0)
            {
                MessageBox.Show($"Seleccione un producto de la tabla para marcarlo como {nuevoEstado}.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idProducto = Convert.ToInt32(dgvProductos.SelectedRows[0].Cells["ID_PRODUCTO"].Value);
            string nombreProducto = dgvProductos.SelectedRows[0].Cells["NOMBRE_PRODUCTO"].Value.ToString();
            string estadoActual = dgvProductos.SelectedRows[0].Cells["ESTADO_PRODUCTO"].Value.ToString();

            if (estadoActual.Equals(nuevoEstado, StringComparison.OrdinalIgnoreCase))
            {
                MessageBox.Show($"El producto '{nombreProducto}' ya se encuentra en estado '{nuevoEstado}'.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            string accion = nuevoEstado == "Activo" ? "activar" : "desactivar";
            if (MessageBox.Show($"¿Está seguro que desea {accion} el producto '{nombreProducto}'?", "Confirmar Acción", MessageBoxButtons.YesNo, MessageBoxIcon.Question) != DialogResult.Yes)
                return;

            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null) return;

                try
                {
                    string query = "UPDATE PRODUCTO SET ESTADO_PRODUCTO = @estado WHERE ID_PRODUCTO = @id;";
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@estado", nuevoEstado);
                        cmd.Parameters.AddWithValue("@id", idProducto);
                        cmd.ExecuteNonQuery();

                        MessageBox.Show($"Producto '{nombreProducto}' actualizado a '{nuevoEstado}' correctamente.",
                                        "ElectroHogar - Inventario", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        CargarProductos();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al cambiar estado del producto: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnHistorialPrecios_Click(object sender, EventArgs e)
        {
            int idProducto = 0;
            string nombreProducto = "";

            if (dgvProductos.SelectedRows.Count > 0)
            {
                idProducto = Convert.ToInt32(dgvProductos.SelectedRows[0].Cells["ID_PRODUCTO"].Value);

                nombreProducto = dgvProductos.SelectedRows[0].Cells["NOMBRE_PRODUCTO"].Value.ToString();
            }
            // Verifica antes si existen registros en la bitácora de precios
            if (!TieneHistorialPrecios(idProducto))
            {
                string mensaje = idProducto > 0
                ? $"El producto '{nombreProducto}' aún no tiene registros de cambios de precios."
                : "Aún no existen registros de cambios de precios en la bitácora.";
                MessageBox.Show(mensaje, "Sin Historial de Precios", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            bitacora_precios ventanaHistorial = idProducto > 0
            ? new bitacora_precios(this.idEmpleadoActual, idProducto, nombreProducto)
            : new bitacora_precios(this.idEmpleadoActual);
            ventanaHistorial.ShowDialog();
        }
        private bool TieneHistorialPrecios(int idProducto)
        {
            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null) return false;

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_HISTORIAL_PRECIOS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_EMPLEADO", this.idEmpleadoActual);
                        cmd.Parameters.AddWithValue("P_BUSQUEDA", idProducto > 0 ? (object)idProducto.ToString() : DBNull.Value);
                        cmd.Parameters.AddWithValue("P_FECHA_DESDE", DBNull.Value);
                        cmd.Parameters.AddWithValue("P_FECHA_HASTA", DBNull.Value);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (idProducto > 0)
                        {
                            DataRow[] coincidencias = dt.Select($"ID_PRODUCTO = {idProducto}");
                            return coincidencias.Length > 0;
                        }

                        return dt.Rows.Count > 0;
                    }
                }
                catch
                {
                    return false;
                }
            }
        }

        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            AplicarFiltroLocal();
        }
        private void AplicarFiltroLocal()
        {
            if (dtProductos == null) return;
            string filtro = txtBuscar.Text.Trim().Replace("'", "''");
            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {
                dtProductos.DefaultView.RowFilter = "";
                return;
            }
            dtProductos.DefaultView.RowFilter = string.Format(
            "CONVERT(ID_PRODUCTO, 'System.String') LIKE '%{0}%' OR " +
            "CONVERT(ID_CATEGORIA, 'System.String') LIKE '%{0}%' OR " +
            "NOMBRE_CATEGORIA LIKE '%{0}%' OR " +
            "NOMBRE_PRODUCTO LIKE '%{0}%' OR " +
            "CONVERT(STOCK, 'System.String') LIKE '%{0}%' OR " +
            "CONVERT(PRECIO_VENTA, 'System.String') LIKE '%{0}%' OR " +
            "ESTADO_PRODUCTO LIKE '%{0}%' OR " +
            "CONVERT(PORCENTAJE_DESCUENTO, 'System.String') LIKE '%{0}%'",
            filtro
            );
        }
        private void ConfigurarPlaceholder()
        {
            txtBuscar.Text = PlaceholderText;
            txtBuscar.ForeColor = Color.Gray;
            txtBuscar.Enter += (s, e) =>
            {
                if (txtBuscar.Text == PlaceholderText)
                {
                    txtBuscar.Text = "";
                    txtBuscar.ForeColor = Color.Black;
                }
            };
            txtBuscar.Leave += (s, e) =>
            {
                if (string.IsNullOrWhiteSpace(txtBuscar.Text))
                {
                    txtBuscar.Text = PlaceholderText;
                    txtBuscar.ForeColor = Color.Gray;
                }
            };
        }
        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}