using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class bitacora_precios : Form
    {
        private DataTable dtHistorial;
        private int idSucursalActual;
        private int idProductoSeleccionado;

        public bitacora_precios(int idSucursal = 1, int idProducto = 0, string nombreProducto = "")
        {
            InitializeComponent();
            this.idSucursalActual = idSucursal;
            this.idProductoSeleccionado = idProducto;

            if (!string.IsNullOrEmpty(nombreProducto))
            {
                lblTitulo.Text = $"Historial de Precios - {nombreProducto}";
            }

            ConfigurarFechas();
            ConfigurarTabla();
            InicializarEstructuraTabla();
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

        private void InicializarEstructuraTabla()
        {
            dtHistorial = new DataTable();
            dtHistorial.Columns.Add("ID_BITACORA", typeof(int));
            dtHistorial.Columns.Add("ID_PRODUCTO", typeof(int));
            dtHistorial.Columns.Add("NOMBRE_PRODUCTO", typeof(string));
            dtHistorial.Columns.Add("ID_EMPLEADO", typeof(int));
            dtHistorial.Columns.Add("NOMBRE_EMPLEADO", typeof(string));
            dtHistorial.Columns.Add("PRECIO_ANTERIOR", typeof(decimal));
            dtHistorial.Columns.Add("PRECIO_ACTUAL", typeof(decimal));
            dtHistorial.Columns.Add("FECHA_CAMBIO", typeof(DateTime));

            dgvHistorial.DataSource = dtHistorial;

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

            if (dtHistorial == null) return;

            string condicion = "";

            if (dtpDesde.Checked)
            {
                string fDesde = dtpDesde.Value.Date.ToString("MM/dd/yyyy");
                condicion = $"FECHA_CAMBIO >= #{fDesde}#";
            }

            if (dtpHasta.Checked)
            {
                string fHasta = dtpHasta.Value.Date.AddDays(1).AddSeconds(-1).ToString("MM/dd/yyyy HH:mm:ss");
                condicion += (condicion.Length > 0 ? " AND " : "") + $"FECHA_CAMBIO <= #{fHasta}#";
            }

            dtHistorial.DefaultView.RowFilter = condicion;
        }

        private void btnRegresar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
