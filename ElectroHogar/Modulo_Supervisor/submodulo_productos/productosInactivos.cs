using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class productosInactivos : Form
    {
        private const string PlaceholderText = "Buscar por ID, producto, categoría, stock o precio...";
        private DataTable dtProductosInactivos;
        private int idEmpleadoActual;

        public productosInactivos(int idEmpleado = 0)
        {
            InitializeComponent();
            this.idEmpleadoActual = idEmpleado > 0 ? idEmpleado : (SesionUsuario.IdEmpleado > 0 ? SesionUsuario.IdEmpleado : 1);
            ConfigurarPlaceholder();
            ConfigurarTabla();
            CargarProductosInactivos();
        }

        private void ConfigurarTabla()
        {
            dgvProductosInactivos.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvProductosInactivos.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvProductosInactivos.MultiSelect = false;
            dgvProductosInactivos.ReadOnly = true;
            dgvProductosInactivos.AllowUserToAddRows = false;
            dgvProductosInactivos.RowHeadersVisible = false;
            dgvProductosInactivos.BackgroundColor = Color.White;
            dgvProductosInactivos.BorderStyle = BorderStyle.FixedSingle;

            dgvProductosInactivos.EnableHeadersVisualStyles = false;
            dgvProductosInactivos.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvProductosInactivos.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvProductosInactivos.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvProductosInactivos.ColumnHeadersHeight = 38;

            dgvProductosInactivos.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvProductosInactivos.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvProductosInactivos.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvProductosInactivos.RowTemplate.Height = 32;

            dgvProductosInactivos.SelectionChanged += (s, e) =>
            {
                btnActivarProducto.Enabled = (dgvProductosInactivos.SelectedRows.Count > 0);
            };
            dgvProductosInactivos.CellDoubleClick += (s, e) =>
            {
                if (e.RowIndex >= 0) ReactivarProductoSeleccionado();
            };
        }

        // Llama a SP_CONSULTAR_PRODUCTOS_INACTIVOS(P_ID_EMPLEADO)
        private void CargarProductosInactivos()
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_PRODUCTOS_INACTIVOS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_EMPLEADO", this.idEmpleadoActual);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtProductosInactivos = new DataTable();
                        da.Fill(dtProductosInactivos);

                        dgvProductosInactivos.DataSource = dtProductosInactivos;
                        FormatearColumnas();
                        AplicarFiltroLocal();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show(ex.Message, "Aviso de Base de Datos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void FormatearColumnas()
        {
            if (dgvProductosInactivos.Columns.Count == 0) return;

            dgvProductosInactivos.Columns["ID_PRODUCTO"].HeaderText = "ID";
            dgvProductosInactivos.Columns["NOMBRE_PRODUCTO"].HeaderText = "Producto";
            dgvProductosInactivos.Columns["NOMBRE_CATEGORIA"].HeaderText = "Categoría";
            dgvProductosInactivos.Columns["STOCK"].HeaderText = "Stock";
            dgvProductosInactivos.Columns["PRECIO_VENTA"].HeaderText = "Precio Venta";
            dgvProductosInactivos.Columns["ESTADO_PRODUCTO"].HeaderText = "Estado";

            dgvProductosInactivos.Columns["PRECIO_VENTA"].DefaultCellStyle.Format = "C2";
            dgvProductosInactivos.Columns["ID_PRODUCTO"].FillWeight = 45;
            dgvProductosInactivos.Columns["STOCK"].FillWeight = 55;
        }

        // --- BOTÓN INFERIOR: REACTIVAR PRODUCTO ---
        private void btnActivarProducto_Click(object sender, EventArgs e)
        {
            ReactivarProductoSeleccionado();
        }

        private void ReactivarProductoSeleccionado()
        {
            if (dgvProductosInactivos.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un producto de la tabla para reactivarlo.",
                                "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idProducto = Convert.ToInt32(dgvProductosInactivos.SelectedRows[0].Cells["ID_PRODUCTO"].Value);
            string nombreProducto = dgvProductosInactivos.SelectedRows[0].Cells["NOMBRE_PRODUCTO"].Value.ToString();

            DialogResult confirmacion = MessageBox.Show(
                $"¿Desea reactivar el producto '{nombreProducto}' (ID: {idProducto})?",
                "Confirmar Reactivación",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question);

            if (confirmacion != DialogResult.Yes) return;

            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null)
                {
                    MessageBox.Show("No se pudo conectar con la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    string query = "UPDATE PRODUCTO SET ESTADO_PRODUCTO = 'Activo' WHERE ID_PRODUCTO = @id;";
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@id", idProducto);
                        cmd.ExecuteNonQuery();

                        MessageBox.Show($"Producto '{nombreProducto}' reactivado correctamente.",
                                        "ElectroHogar - Inventario", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        this.DialogResult = DialogResult.OK;
                        CargarProductosInactivos();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al reactivar el producto: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        // --- BÚSQUEDA DINÁMICA ---
        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            AplicarFiltroLocal();
        }

        private void AplicarFiltroLocal()
        {
            if (dtProductosInactivos == null) return;

            string filtro = txtBuscar.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {
                dtProductosInactivos.DefaultView.RowFilter = "";
                return;
            }

            dtProductosInactivos.DefaultView.RowFilter = string.Format(
                "CONVERT(ID_PRODUCTO, 'System.String') LIKE '%{0}%' OR " +
                "NOMBRE_PRODUCTO LIKE '%{0}%' OR " +
                "NOMBRE_CATEGORIA LIKE '%{0}%' OR " +
                "CONVERT(STOCK, 'System.String') LIKE '%{0}%' OR " +
                "CONVERT(PRECIO_VENTA, 'System.String') LIKE '%{0}%'",
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
