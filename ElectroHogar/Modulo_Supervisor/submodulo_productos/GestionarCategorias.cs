using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class GestionarCategorias : Form
    {
        private DataTable dtCategorias;

        public GestionarCategorias()
        {
            InitializeComponent();
            ConfigurarTabla();
            CargarCategorias();
        }

        private void ConfigurarTabla()
        {
            dgvCategorias.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvCategorias.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvCategorias.MultiSelect = false;
            dgvCategorias.ReadOnly = true;
            dgvCategorias.AllowUserToAddRows = false;
            dgvCategorias.RowHeadersVisible = false;
            dgvCategorias.BackgroundColor = Color.White;
            dgvCategorias.BorderStyle = BorderStyle.FixedSingle;

            dgvCategorias.EnableHeadersVisualStyles = false;
            dgvCategorias.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvCategorias.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvCategorias.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvCategorias.ColumnHeadersHeight = 38;

            dgvCategorias.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvCategorias.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvCategorias.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvCategorias.RowTemplate.Height = 32;
        }

        private void CargarCategorias()
        {
            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null) return;

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_CATEGORIAS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("BUSQUEDA", DBNull.Value);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtCategorias = new DataTable();
                        da.Fill(dtCategorias);

                        dgvCategorias.DataSource = dtCategorias;
                        if (dgvCategorias.Columns.Contains("ID_CATEGORIA"))
                            dgvCategorias.Columns["ID_CATEGORIA"].HeaderText = "ID Categoría";
                        if (dgvCategorias.Columns.Contains("NOMBRE_CATEGORIA"))
                            dgvCategorias.Columns["NOMBRE_CATEGORIA"].HeaderText = "Nombre de Categoría";
                        if (dgvCategorias.Columns.Contains("ESTADO_CATEGORIA"))
                            dgvCategorias.Columns["ESTADO_CATEGORIA"].HeaderText = "Estado";
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al consultar categorías: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        // --- 1. REGISTRAR NUEVA CATEGORÍA (SP_REGISTRAR_CATEGORIA) ---
        private void btnNueva_Click(object sender, EventArgs e)
        {
            using (Form dlg = new Form
            {
                Width = 420,
                Height = 215,
                Text = "Registrar Nueva Categoría",
                FormBorderStyle = FormBorderStyle.FixedDialog,
                StartPosition = FormStartPosition.CenterParent,
                MaximizeBox = false,
                MinimizeBox = false,
                BackColor = Color.White
            })
            {
                Label lblNom = new Label { Text = "Nombre de la Categoría:*", Left = 20, Top = 20, AutoSize = true, Font = new Font("Segoe UI", 9.5F, FontStyle.Bold), ForeColor = Color.DimGray };
                TextBox txtNom = new TextBox { Left = 20, Top = 48, Width = 360, Font = new Font("Segoe UI", 10F) };
                Button btnCancelar = new Button { Text = "Cancelar", Left = 140, Top = 105, Width = 110, Height = 36, BackColor = Color.FromArgb(240, 244, 248), ForeColor = Color.DimGray, FlatStyle = FlatStyle.Flat, Font = new Font("Segoe UI", 9.5F) };
                Button btnGuardar = new Button { Text = "Guardar", Left = 260, Top = 105, Width = 120, Height = 36, BackColor = Color.Teal, ForeColor = Color.White, FlatStyle = FlatStyle.Flat, Font = new Font("Segoe UI", 9.5F, FontStyle.Bold) };

                btnCancelar.Click += (s, ev) => { dlg.DialogResult = DialogResult.Cancel; dlg.Close(); };
                btnGuardar.Click += (s, ev) =>
                {
                    if (string.IsNullOrWhiteSpace(txtNom.Text))
                    {
                        MessageBox.Show("El nombre de la categoría es obligatorio.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        txtNom.Focus();
                        return;
                    }
                    dlg.DialogResult = DialogResult.OK;
                    dlg.Close();
                };

                dlg.Controls.AddRange(new Control[] { lblNom, txtNom, btnCancelar, btnGuardar });

                if (dlg.ShowDialog() == DialogResult.OK)
                {
                    using (MySqlConnection conn = Conexion.ObtenerConexion())
                    {
                        if (conn == null) return;
                        try
                        {
                            using (MySqlCommand cmd = new MySqlCommand("SP_REGISTRAR_CATEGORIA", conn))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("P_NOMBRE_CATEGORIA", txtNom.Text.Trim());

                                MySqlParameter paramId = new MySqlParameter("ID_REGISTRO", MySqlDbType.Int32);
                                paramId.Direction = ParameterDirection.Output;
                                cmd.Parameters.Add(paramId);

                                cmd.ExecuteNonQuery();
                                int idGen = Convert.ToInt32(paramId.Value);

                                if (idGen > 0)
                                {
                                    MessageBox.Show($"Categoría '{txtNom.Text.Trim()}' registrada correctamente (ID: {idGen}).",
                                                    "ElectroHogar - Categorías", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                    this.DialogResult = DialogResult.OK;
                                    CargarCategorias();
                                }
                                else if (idGen == -2)
                                {
                                    MessageBox.Show("El nombre de la categoría no puede estar vacío.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                                }
                                else
                                {
                                    MessageBox.Show("Error en el servidor al registrar la categoría (posible duplicado).", "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                }
                            }
                        }
                        catch (MySqlException ex)
                        {
                            MessageBox.Show("Error al registrar categoría: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
        }

        // --- 2. VER Y REACTIVAR CATEGORÍAS INACTIVAS ---
        private void btnInactivas_Click(object sender, EventArgs e)
        {
            using (Form dlg = new Form
            {
                Width = 650,
                Height = 420,
                Text = "Categorías Inactivas",
                FormBorderStyle = FormBorderStyle.FixedDialog,
                StartPosition = FormStartPosition.CenterParent,
                MaximizeBox = false,
                MinimizeBox = false,
                BackColor = Color.White
            })
            {
                DataGridView dgvInactivas = new DataGridView
                {
                    Left = 20,
                    Top = 20,
                    Width = 595,
                    Height = 285,
                    AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill,
                    SelectionMode = DataGridViewSelectionMode.FullRowSelect,
                    MultiSelect = false,
                    ReadOnly = true,
                    AllowUserToAddRows = false,
                    RowHeadersVisible = false,
                    BackgroundColor = Color.White
                };

                Button btnReactivar = new Button
                {
                    Text = "Reactivar Categoría",
                    Left = 20,
                    Top = 320,
                    Width = 190,
                    Height = 38,
                    BackColor = Color.FromArgb(46, 204, 113),
                    ForeColor = Color.White,
                    FlatStyle = FlatStyle.Flat,
                    Font = new Font("Segoe UI", 9.5F, FontStyle.Bold)
                };

                Button btnCerrar = new Button
                {
                    Text = "Cerrar",
                    Left = 495,
                    Top = 320,
                    Width = 120,
                    Height = 38,
                    BackColor = Color.FromArgb(240, 244, 248),
                    ForeColor = Color.DimGray,
                    FlatStyle = FlatStyle.Flat,
                    Font = new Font("Segoe UI", 9.5F)
                };
                btnCerrar.Click += (s, ev) => dlg.Close();


                Action cargarInactivasLocal = () =>
                {
                    using (MySqlConnection conn = Conexion.ObtenerConexion())
                    {
                        if (conn == null) return;
                        string q = "SELECT ID_CATEGORIA, NOMBRE_CATEGORIA, ESTADO_CATEGORIA FROM CATEGORIA WHERE ESTADO_CATEGORIA IN ('Inactivo', 'Inactiva') ORDER BY ID_CATEGORIA DESC;";
                        MySqlDataAdapter da = new MySqlDataAdapter(q, conn);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        dgvInactivas.DataSource = dt;
                    }
                };
                btnReactivar.Click += (s, ev) =>
                {
                    if (dgvInactivas.SelectedRows.Count == 0)
                    {
                        MessageBox.Show("Seleccione una categoría inactiva para reactivar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                    int idCat = Convert.ToInt32(dgvInactivas.SelectedRows[0].Cells["ID_CATEGORIA"].Value);
                    string nombre = dgvInactivas.SelectedRows[0].Cells["NOMBRE_CATEGORIA"].Value.ToString();
                    using (MySqlConnection conn = Conexion.ObtenerConexion())
                    {
                        if (conn == null) return;
                        using (MySqlCommand cmd = new MySqlCommand("UPDATE CATEGORIA SET ESTADO_CATEGORIA = 'Activo' WHERE ID_CATEGORIA = @id;", conn))
                        {
                            cmd.Parameters.AddWithValue("@id", idCat);
                            cmd.ExecuteNonQuery();
                        }
                    }
                    MessageBox.Show($"Categoría '{nombre}' reactivada correctamente.", "ElectroHogar - Categorías", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    this.DialogResult = DialogResult.OK;
                    cargarInactivasLocal();
                    CargarCategorias();
                };
                dlg.Controls.AddRange(new Control[] { dgvInactivas, btnReactivar, btnCerrar });
                cargarInactivasLocal();
                dlg.ShowDialog();
            }
        }

        private void btnActivar_Click(object sender, EventArgs e)
        {
            if (dgvCategorias.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione una categoría de la tabla para activar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idCat = Convert.ToInt32(dgvCategorias.SelectedRows[0].Cells["ID_CATEGORIA"].Value);
            string nombreCat = dgvCategorias.SelectedRows[0].Cells["NOMBRE_CATEGORIA"].Value.ToString();

            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null) return;
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("UPDATE CATEGORIA SET ESTADO_CATEGORIA = 'Activo' WHERE ID_CATEGORIA = @id;", conn))
                    {
                        cmd.Parameters.AddWithValue("@id", idCat);
                        cmd.ExecuteNonQuery();

                        MessageBox.Show($"Categoría '{nombreCat}' activada correctamente.", "ElectroHogar - Categorías", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        this.DialogResult = DialogResult.OK;
                        CargarCategorias();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al activar categoría: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
        // --- 3. DESACTIVAR CATEGORÍA (SP_DESACTIVAR_CATEGORIA) ---
        private void btnDesactivar_Click(object sender, EventArgs e)
        {
            if (dgvCategorias.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione una categoría de la tabla para desactivar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            int idCat = Convert.ToInt32(dgvCategorias.SelectedRows[0].Cells["ID_CATEGORIA"].Value);
            string nombreCat = dgvCategorias.SelectedRows[0].Cells["NOMBRE_CATEGORIA"].Value.ToString();
            if (MessageBox.Show($"¿Está seguro que desea desactivar la categoría '{nombreCat}'?", "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) != DialogResult.Yes)
                return;
            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null) return;
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_DESACTIVAR_CATEGORIA", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_CATEGORIA", idCat);
                        cmd.ExecuteNonQuery();
                        MessageBox.Show($"Categoría '{nombreCat}' desactivada correctamente.", "ElectroHogar - Categorías", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        this.DialogResult = DialogResult.OK;
                        CargarCategorias();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al desactivar categoría: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
