using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class GestionarProveedores : Form
    {
        private DataTable dtProveedores;
        private int idEmpleadoActual;

        public GestionarProveedores()
        {
            InitializeComponent();
            this.idEmpleadoActual = SesionUsuario.IdEmpleado > 0 ? SesionUsuario.IdEmpleado : 1;
            ConfigurarTabla();
            CargarProveedores();
        }

        private void ConfigurarTabla()
        {
            dgvProveedores.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvProveedores.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvProveedores.MultiSelect = false;
            dgvProveedores.ReadOnly = true;
            dgvProveedores.AllowUserToAddRows = false;
            dgvProveedores.RowHeadersVisible = false;
            dgvProveedores.BackgroundColor = Color.White;
            dgvProveedores.BorderStyle = BorderStyle.FixedSingle;

            dgvProveedores.EnableHeadersVisualStyles = false;
            dgvProveedores.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvProveedores.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvProveedores.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvProveedores.ColumnHeadersHeight = 38;

            dgvProveedores.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvProveedores.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvProveedores.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvProveedores.RowTemplate.Height = 32;
        }

        private void CargarProveedores()
        {
            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null) return;

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_PROVEEDORES", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_EMPLEADO", this.idEmpleadoActual);
                        cmd.Parameters.AddWithValue("P_BUSQUEDA", string.IsNullOrWhiteSpace(txtBuscar.Text) ? (object)DBNull.Value : txtBuscar.Text.Trim());

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtProveedores = new DataTable();
                        da.Fill(dtProveedores);

                        dgvProveedores.DataSource = dtProveedores;
                        if (dgvProveedores.Columns.Contains("ID_PROVEEDOR"))
                            dgvProveedores.Columns["ID_PROVEEDOR"].HeaderText = "ID";
                        if (dgvProveedores.Columns.Contains("NOMBRE_PROVEEDOR"))
                            dgvProveedores.Columns["NOMBRE_PROVEEDOR"].HeaderText = "Proveedor";
                        if (dgvProveedores.Columns.Contains("TELEFONO_PROVEEDOR"))
                            dgvProveedores.Columns["TELEFONO_PROVEEDOR"].HeaderText = "Teléfono";
                        if (dgvProveedores.Columns.Contains("ESTADO_PROVEEDOR"))
                            dgvProveedores.Columns["ESTADO_PROVEEDOR"].HeaderText = "Estado";
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show(ex.Message, "Aviso de Base de Datos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            CargarProveedores();
        }

        private void btnNuevo_Click(object sender, EventArgs e)
        {
            using (Form dlg = new Form { Width = 420, Height = 260, Text = "Registrar Proveedor", FormBorderStyle = FormBorderStyle.FixedDialog, StartPosition = FormStartPosition.CenterParent, MaximizeBox = false, MinimizeBox = false, BackColor = Color.White })
            {
                Label lblNom = new Label { Text = "Nombre del Proveedor:*", Left = 20, Top = 20, AutoSize = true, Font = new Font("Segoe UI", 9.5F, FontStyle.Bold) };
                TextBox txtNom = new TextBox { Left = 20, Top = 45, Width = 360, Font = new Font("Segoe UI", 10F) };
                Label lblTel = new Label { Text = "Teléfono:*", Left = 20, Top = 85, AutoSize = true, Font = new Font("Segoe UI", 9.5F, FontStyle.Bold) };
                TextBox txtTel = new TextBox { Left = 20, Top = 110, Width = 360, Font = new Font("Segoe UI", 10F) };
                Button btnOk = new Button { Text = "Guardar", Left = 260, Top = 160, Width = 120, Height = 36, BackColor = Color.Teal, ForeColor = Color.White, FlatStyle = FlatStyle.Flat, Font = new Font("Segoe UI", 9.5F, FontStyle.Bold) };

                btnOk.Click += (s, ev) =>
                {
                    if (string.IsNullOrWhiteSpace(txtNom.Text) || string.IsNullOrWhiteSpace(txtTel.Text))
                    {
                        MessageBox.Show("Complete nombre y teléfono.", "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                    dlg.DialogResult = DialogResult.OK;
                    dlg.Close();
                };

                dlg.Controls.AddRange(new Control[] { lblNom, txtNom, lblTel, txtTel, btnOk });

                if (dlg.ShowDialog() == DialogResult.OK)
                {
                    using (MySqlConnection conn = Conexion.ObtenerConexion())
                    {
                        if (conn == null) return;
                        try
                        {
                            using (MySqlCommand cmd = new MySqlCommand("SP_REGISTRAR_PROVEEDOR", conn))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("P_NOMBRE_PROVEEDOR", txtNom.Text.Trim());
                                cmd.Parameters.AddWithValue("P_TELEFONO_PROVEEDOR", txtTel.Text.Trim());
                                cmd.Parameters.AddWithValue("P_ESTADO_PROVEEDOR", "Activo");
                                cmd.ExecuteNonQuery();

                                MessageBox.Show("Proveedor registrado correctamente.", "ElectroHogar - Proveedores", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                CargarProveedores();
                            }
                        }
                        catch (MySqlException ex)
                        {
                            MessageBox.Show("Error al registrar proveedor: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
        }

        private void btnActualizarTelefono_Click(object sender, EventArgs e)
        {
            if (dgvProveedores.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un proveedor de la tabla.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idProv = Convert.ToInt32(dgvProveedores.SelectedRows[0].Cells["ID_PROVEEDOR"].Value);
            string nombreProv = dgvProveedores.SelectedRows[0].Cells["NOMBRE_PROVEEDOR"].Value.ToString();
            string telActual = dgvProveedores.SelectedRows[0].Cells["TELEFONO_PROVEEDOR"].Value.ToString();

            using (Form dlg = new Form { Width = 400, Height = 210, Text = "Actualizar Teléfono", FormBorderStyle = FormBorderStyle.FixedDialog, StartPosition = FormStartPosition.CenterParent, MaximizeBox = false, MinimizeBox = false, BackColor = Color.White })
            {
                Label lblInfo = new Label { Text = $"Proveedor: {nombreProv}", Left = 20, Top = 18, AutoSize = true, Font = new Font("Segoe UI", 9.5F, FontStyle.Bold), ForeColor = Color.FromArgb(51, 82, 209) };
                TextBox txtTel = new TextBox { Text = telActual, Left = 20, Top = 55, Width = 340, Font = new Font("Segoe UI", 10F) };
                Button btnOk = new Button { Text = "Actualizar", Left = 240, Top = 105, Width = 120, Height = 36, BackColor = Color.Teal, ForeColor = Color.White, FlatStyle = FlatStyle.Flat, Font = new Font("Segoe UI", 9.5F, FontStyle.Bold) };

                btnOk.Click += (s, ev) =>
                {
                    if (string.IsNullOrWhiteSpace(txtTel.Text)) return;
                    dlg.DialogResult = DialogResult.OK;
                    dlg.Close();
                };

                dlg.Controls.AddRange(new Control[] { lblInfo, txtTel, btnOk });

                if (dlg.ShowDialog() == DialogResult.OK)
                {
                    using (MySqlConnection conn = Conexion.ObtenerConexion())
                    {
                        if (conn == null) return;
                        try
                        {
                            using (MySqlCommand cmd = new MySqlCommand("SP_ACTUALIZAR_PROVEEDOR_TELEFONO", conn))
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.AddWithValue("P_ID_PROVEEDOR", idProv);
                                cmd.Parameters.AddWithValue("P_TELEFONO_PROVEEDOR", txtTel.Text.Trim());
                                cmd.ExecuteNonQuery();

                                MessageBox.Show("Teléfono actualizado correctamente.", "ElectroHogar - Proveedores", MessageBoxButtons.OK, MessageBoxIcon.Information);
                                CargarProveedores();
                            }
                        }
                        catch (MySqlException ex)
                        {

                            MessageBox.Show("Error al actualizar teléfono: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
            }
        }
        private void btnActivar_Click(object sender, EventArgs e)
        {
            CambiarEstadoProveedor("Activo");
        }
        private void btnDesactivar_Click(object sender, EventArgs e)
        {
            CambiarEstadoProveedor("Inactivo");
        }
        private void CambiarEstadoProveedor(string nuevoEstado)
        {
            if (dgvProveedores.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione un proveedor de la tabla.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            int idProv = Convert.ToInt32(dgvProveedores.SelectedRows[0].Cells["ID_PROVEEDOR"].Value);
            string nombreProv = dgvProveedores.SelectedRows[0].Cells["NOMBRE_PROVEEDOR"].Value.ToString();
            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null) return;
                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_DESACTIVAR_PROVEEDOR", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_PROVEEDOR", idProv);
                        cmd.Parameters.AddWithValue("P_ESTADO_PROVEEDOR", nuevoEstado);
                        cmd.ExecuteNonQuery();
                        MessageBox.Show($"Proveedor '{nombreProv}' marcado como '{nuevoEstado}'.", "ElectroHogar - Proveedores", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        CargarProveedores();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al cambiar estado: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }
        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}