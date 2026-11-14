using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class bitacora_precios : Form
    {
        private DataTable dtHistorial;
        private int idEmpleadoActual;
        private int idProductoSeleccionado;
        private string nombreProductoSeleccionado;

        public bitacora_precios(int idEmpleado = 0, int idProducto = 0, string nombreProducto = "")
        {
            InitializeComponent();
            this.idEmpleadoActual = idEmpleado > 0 ? idEmpleado : (SesionUsuario.IdEmpleado > 0 ? SesionUsuario.IdEmpleado : 1);
            this.idProductoSeleccionado = idProducto;
            this.nombreProductoSeleccionado = nombreProducto;

            if (!string.IsNullOrEmpty(nombreProducto))
            {
                lblTitulo.Text = $"Historial de Precios - {nombreProducto}";
            }

            ConfigurarFechas();
            ConfigurarTabla();
            CargarHistorialPrecios();
        }

        private void ConfigurarFechas()
        {
            dtpDesde.ShowCheckBox = true;
            dtpDesde.Checked = false;
            dtpDesde.Format = DateTimePickerFormat.Short;

            dtpHasta.ShowCheckBox = true;
            dtpHasta.Checked = false;
            dtpHasta.Format = DateTimePickerFormat.Short;
        }

        private void ConfigurarTabla()
        {
            dgvHistorial.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvHistorial.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvHistorial.MultiSelect = false;
            dgvHistorial.ReadOnly = true;
            dgvHistorial.AllowUserToAddRows = false;
            dgvHistorial.RowHeadersVisible = false;
            dgvHistorial.BackgroundColor = Color.White;
            dgvHistorial.BorderStyle = BorderStyle.FixedSingle;

            dgvHistorial.EnableHeadersVisualStyles = false;
            dgvHistorial.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvHistorial.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvHistorial.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvHistorial.ColumnHeadersHeight = 38;

            dgvHistorial.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvHistorial.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvHistorial.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvHistorial.RowTemplate.Height = 32;
        }

        // Llama a SP_CONSULTAR_HISTORIAL_PRECIOS(P_ID_EMPLEADO, P_BUSQUEDA, P_FECHA_DESDE, P_FECHA_HASTA)
        private void CargarHistorialPrecios()
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
                    using (MySqlCommand cmd = new MySqlCommand("SP_CONSULTAR_HISTORIAL_PRECIOS", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_EMPLEADO", this.idEmpleadoActual);

                        // Si se abrió seleccionando un producto específico, filtra por su ID; si no, trae todo
                        cmd.Parameters.AddWithValue("P_BUSQUEDA",
                            this.idProductoSeleccionado > 0 ? (object)this.idProductoSeleccionado.ToString() : DBNull.Value);

                        cmd.Parameters.AddWithValue("P_FECHA_DESDE",
                            dtpDesde.Checked ? (object)dtpDesde.Value.Date : DBNull.Value);

                        cmd.Parameters.AddWithValue("P_FECHA_HASTA",
                            dtpHasta.Checked ? (object)dtpHasta.Value.Date.AddDays(1).AddSeconds(-1) : DBNull.Value);

                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        dtHistorial = new DataTable();
                        da.Fill(dtHistorial);

                        // Asegura coincidencia exacta de producto si se abrió para uno específico
                        if (this.idProductoSeleccionado > 0)
                        {
                            dtHistorial.DefaultView.RowFilter = $"ID_PRODUCTO = {this.idProductoSeleccionado}";
                        }

                        dgvHistorial.DataSource = dtHistorial;
                        FormatearColumnas();
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
            if (dgvHistorial.Columns.Count == 0) return;

            dgvHistorial.Columns["ID_BITACORA"].HeaderText = "ID Bitácora";
            dgvHistorial.Columns["ID_PRODUCTO"].HeaderText = "ID Prod.";
            dgvHistorial.Columns["NOMBRE_PRODUCTO"].HeaderText = "Producto";
            dgvHistorial.Columns["ID_EMPLEADO"].HeaderText = "ID Emp.";
            dgvHistorial.Columns["NOMBRE_EMPLEADO"].HeaderText = "Modificado Por";
            dgvHistorial.Columns["PRECIO_ANTERIOR"].HeaderText = "Precio Anterior";
            dgvHistorial.Columns["PRECIO_ACTUAL"].HeaderText = "Precio Actual";
            dgvHistorial.Columns["FECHA_CAMBIO"].HeaderText = "Fecha Cambio";

            dgvHistorial.Columns["PRECIO_ANTERIOR"].DefaultCellStyle.Format = "C2";
            dgvHistorial.Columns["PRECIO_ACTUAL"].DefaultCellStyle.Format = "C2";
            dgvHistorial.Columns["FECHA_CAMBIO"].DefaultCellStyle.Format = "dd/MM/yyyy HH:mm";

            dgvHistorial.Columns["ID_BITACORA"].FillWeight = 65;
            dgvHistorial.Columns["ID_PRODUCTO"].FillWeight = 55;
            dgvHistorial.Columns["ID_EMPLEADO"].FillWeight = 55;
        }

        private void btnFiltrarFechas_Click(object sender, EventArgs e)
        {
            if (dtpDesde.Checked && dtpHasta.Checked && dtpDesde.Value.Date > dtpHasta.Value.Date)
            {
                MessageBox.Show("La fecha inicial no puede ser mayor que la fecha final.",
                                "Rango de Fechas Inválido", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            CargarHistorialPrecios();
        }

        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
