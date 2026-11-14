using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class GestionarPromociones : Form
    {
        private DataTable dtPromociones;

        public GestionarPromociones()
        {
            InitializeComponent();
            cmbEstado.Items.AddRange(new object[] { "Todos", "Activa", "Inactiva" });
            cmbEstado.SelectedIndex = 0;
            ConfigurarTabla();
            CargarPromociones();
        }

        private void ConfigurarTabla()
        {
            dgvPromociones.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvPromociones.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvPromociones.MultiSelect = false;
            dgvPromociones.ReadOnly = true;
            dgvPromociones.AllowUserToAddRows = false;
            dgvPromociones.RowHeadersVisible = false;
            dgvPromociones.BackgroundColor = Color.White;
            dgvPromociones.BorderStyle = BorderStyle.FixedSingle;

            dgvPromociones.EnableHeadersVisualStyles = false;
            dgvPromociones.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvPromociones.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvPromociones.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvPromociones.ColumnHeadersHeight = 38;

            dgvPromociones.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvPromociones.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvPromociones.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvPromociones.RowTemplate.Height = 32;
        }

        private void CargarPromociones()
        {
            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null) return;

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_PROMOCIONES", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_BUSQUEDA", DBNull.Value);

                        string estado = cmbEstado.SelectedItem?.ToString() ?? "Todos";
                        cmd.Parameters.AddWithValue("P_ESTADO", estado == "Todos" ? (object)DBNull.Value : estado);
                        cmd.Parameters.AddWithValue("P_FECHA_INICIO", DBNull.Value);
                        cmd.Parameters.AddWithValue("P_FECHA_FIN", DBNull.Value);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtPromociones = new DataTable();
                        da.Fill(dtPromociones);

                        dgvPromociones.DataSource = dtPromociones;
                        FormatearColumnas();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show("Error al cargar promociones: " + ex.Message, "Error MySQL", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void FormatearColumnas()
        {
            if (dgvPromociones.Columns.Count == 0) return;

            dgvPromociones.Columns["ID_PROMOCION"].HeaderText = "ID Promoción";
            dgvPromociones.Columns["FECHA_INICIO"].HeaderText = "Fecha Inicio";
            dgvPromociones.Columns["FECHA_FIN"].HeaderText = "Fecha Fin";
            dgvPromociones.Columns["PORCENTAJE_DESCUENTO"].HeaderText = "Descuento (%)";
            dgvPromociones.Columns["ESTADO_PROMOCION"].HeaderText = "Estado";

            dgvPromociones.Columns["FECHA_INICIO"].DefaultCellStyle.Format = "dd/MM/yyyy";
            dgvPromociones.Columns["FECHA_FIN"].DefaultCellStyle.Format = "dd/MM/yyyy";
            dgvPromociones.Columns["PORCENTAJE_DESCUENTO"].DefaultCellStyle.Format = "N2";
        }

        private void cmbEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarPromociones();
        }

        private void btnNueva_Click(object sender, EventArgs e)
        {
            RegistrarPromocion modalNueva = new RegistrarPromocion();
            if (modalNueva.ShowDialog() == DialogResult.OK)
            {
                this.DialogResult = DialogResult.OK;
                CargarPromociones();
            }
        }

        private void btnActualizar_Click(object sender, EventArgs e)
        {
            if (dgvPromociones.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione una promoción de la tabla para actualizar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idPromo = Convert.ToInt32(dgvPromociones.SelectedRows[0].Cells["ID_PROMOCION"].Value);
            DateTime inicio = Convert.ToDateTime(dgvPromociones.SelectedRows[0].Cells["FECHA_INICIO"].Value);
            DateTime fin = Convert.ToDateTime(dgvPromociones.SelectedRows[0].Cells["FECHA_FIN"].Value);
            decimal descuento = Convert.ToDecimal(dgvPromociones.SelectedRows[0].Cells["PORCENTAJE_DESCUENTO"].Value);

            ActualizarPromocion modalEditar = new ActualizarPromocion(idPromo, inicio, fin, descuento);
            if (modalEditar.ShowDialog() == DialogResult.OK)
            {
                this.DialogResult = DialogResult.OK;
                CargarPromociones();
            }
        }

        private void btnDesactivar_Click(object sender, EventArgs e)
        {
            if (dgvPromociones.SelectedRows.Count == 0)
            {
                MessageBox.Show("Seleccione una promoción de la tabla para desactivar.", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            int idPromo = Convert.ToInt32(dgvPromociones.SelectedRows[0].Cells["ID_PROMOCION"].Value);

            if (MessageBox.Show($"¿Desea desactivar la promoción #{idPromo}?", "Confirmar", MessageBoxButtons.YesNo, MessageBoxIcon.Question) != DialogResult.Yes)
                return;

            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null) return;

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_DESACTIVAR_PROMOCION", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_PROMOCION", idPromo);
                        cmd.ExecuteNonQuery();

                        MessageBox.Show($"Promoción #{idPromo} desactivada.", "ElectroHogar - Promociones", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        this.DialogResult = DialogResult.OK;
                        CargarPromociones();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show(ex.Message, "Aviso de Base de Datos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
