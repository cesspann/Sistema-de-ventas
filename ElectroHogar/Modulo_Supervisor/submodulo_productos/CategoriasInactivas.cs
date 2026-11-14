using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class CategoriasInactivas : Form
    {
        private const string PlaceholderText = "Buscar por ID o nombre de categoría...";
        private DataTable dtCategoriasInactivas;

        public CategoriasInactivas()
        {
            InitializeComponent();
            ConfigurarPlaceholder();
            ConfigurarTabla();
            CargarCategoriasInactivas();
        }

        private void ConfigurarTabla()
        {
            dgvCategoriasInactivas.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvCategoriasInactivas.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvCategoriasInactivas.MultiSelect = false;
            dgvCategoriasInactivas.ReadOnly = true;
            dgvCategoriasInactivas.AllowUserToAddRows = false;
            dgvCategoriasInactivas.RowHeadersVisible = false;
            dgvCategoriasInactivas.BackgroundColor = Color.White;
            dgvCategoriasInactivas.BorderStyle = BorderStyle.FixedSingle;

            dgvCategoriasInactivas.EnableHeadersVisualStyles = false;
            dgvCategoriasInactivas.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvCategoriasInactivas.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvCategoriasInactivas.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvCategoriasInactivas.ColumnHeadersHeight = 38;

            dgvCategoriasInactivas.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvCategoriasInactivas.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvCategoriasInactivas.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvCategoriasInactivas.RowTemplate.Height = 32;

            dgvCategoriasInactivas.SelectionChanged += (s, e) =>
            {
                btnActivarCategoria.Enabled = (dgvCategoriasInactivas.SelectedRows.Count > 0);
            };
            dgvCategoriasInactivas.CellDoubleClick += (s, e) =>
            {
                if (e.RowIndex >= 0) ReactivarCategoriaSeleccionada();
            };
        }

        // Llama a SP_CONSULTAR_CATEGORIAS_INACTIVAS()
        private void CargarCategoriasInactivas()
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_CATEGORIAS_INACTIVAS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtCategoriasInactivas = new DataTable();
                        da.Fill(dtCategoriasInactivas);

                        dgvCategoriasInactivas.DataSource = dtCategoriasInactivas;
                        FormatearColumnas();
                        AplicarFiltroLocal();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al consultar categorías inactivas: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void FormatearColumnas()
        {
            if (dgvCategoriasInactivas.Columns.Count == 0) return;

            dgvCategoriasInactivas.Columns["ID_CATEGORIA"].HeaderText = "ID Categoría";
            dgvCategoriasInactivas.Columns["NOMBRE_CATEGORIA"].HeaderText = "Nombre de Categoría";
            dgvCategoriasInactivas.Columns["ESTADO_CATEGORIA"].HeaderText = "Estado";

            dgvCategoriasInactivas.Columns["ID_CATEGORIA"].FillWeight = 35;
            dgvCategoriasInactivas.Columns["ESTADO_CATEGORIA"].FillWeight = 45;
        }

        // --- BOTÓN INFERIOR: REACTIVAR CATEGORÍA ---
        private void btnActivarCategoria_Click(object sender, EventArgs e)
        {
            ReactivarCategoriaSeleccionada();
        }

        private void ReactivarCategoriaSeleccionada()
        {
            if (dgvCategoriasInactivas.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione una categoría de la tabla para reactivarla.",
                                "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idCategoria = Convert.ToInt32(dgvCategoriasInactivas.SelectedRows[0].Cells["ID_CATEGORIA"].Value);
            string nombreCategoria = dgvCategoriasInactivas.SelectedRows[0].Cells["NOMBRE_CATEGORIA"].Value.ToString();

            DialogResult confirmacion = MessageBox.Show(
                $"¿Desea reactivar la categoría '{nombreCategoria}' (ID: {idCategoria})?",
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
                    string query = "UPDATE CATEGORIA SET ESTADO_CATEGORIA = 'Activa' WHERE ID_CATEGORIA = @id;";
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@id", idCategoria);
                        cmd.ExecuteNonQuery();

                        MessageBox.Show($"Categoría '{nombreCategoria}' reactivada correctamente.",
                                        "ElectroHogar - Inventario", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        this.DialogResult = DialogResult.OK;
                        CargarCategoriasInactivas();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al reactivar la categoría: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
            if (dtCategoriasInactivas == null) return;

            string filtro = txtBuscar.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {
                dtCategoriasInactivas.DefaultView.RowFilter = "";
                return;
            }

            dtCategoriasInactivas.DefaultView.RowFilter = string.Format(
                "CONVERT(ID_CATEGORIA, 'System.String') LIKE '%{0}%' OR " +
                "NOMBRE_CATEGORIA LIKE '%{0}%'",
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
