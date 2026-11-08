using System;
using System.Data;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.ReportesLocales
{
    public partial class ventas_vendedor : Form
    {
        private const string PlaceholderText = "Filtrar resultados por ID o nombre del vendedor...";
        private DataTable dtReporteVendedor;
        private int idSucursalActual;

        public ventas_vendedor(int idSucursal = 1)
        {
            InitializeComponent();
            this.idSucursalActual = idSucursal;
            ConfigurarFechas();
            ConfigurarPlaceholder();
            ConfigurarTabla();
            InicializarEstructuraTabla();
        }

        private void ConfigurarFechas()
        {
            dtpFechaInicio.Format = DateTimePickerFormat.Short;
            dtpFechaFin.Format = DateTimePickerFormat.Short;

            // Por defecto inicia en el primer día del mes actual hasta hoy
            dtpFechaInicio.Value = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
            dtpFechaFin.Value = DateTime.Today;
        }

        private void ConfigurarTabla()
        {
            dgvReporte.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            dgvReporte.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvReporte.MultiSelect = false;
            dgvReporte.ReadOnly = true;
            dgvReporte.AllowUserToAddRows = false;
            dgvReporte.RowHeadersVisible = false;
            dgvReporte.BackgroundColor = Color.White;
            dgvReporte.BorderStyle = BorderStyle.FixedSingle;

            dgvReporte.EnableHeadersVisualStyles = false;
            dgvReporte.ColumnHeadersDefaultCellStyle.BackColor = Color.FromArgb(51, 82, 209);
            dgvReporte.ColumnHeadersDefaultCellStyle.ForeColor = Color.White;
            dgvReporte.ColumnHeadersDefaultCellStyle.Font = new Font("Segoe UI", 9.5F, FontStyle.Bold);
            dgvReporte.ColumnHeadersHeight = 38;

            dgvReporte.DefaultCellStyle.Font = new Font("Segoe UI", 9.5F);
            dgvReporte.DefaultCellStyle.SelectionBackColor = Color.FromArgb(224, 242, 241);
            dgvReporte.DefaultCellStyle.SelectionForeColor = Color.Black;
            dgvReporte.RowTemplate.Height = 32;
        }

        // Estructura exacta según las 6 columnas de SP_REPORTE_VENTAS_POR_VENDEDOR
        private void InicializarEstructuraTabla()
        {
            dtReporteVendedor = new DataTable();
            dtReporteVendedor.Columns.Add("ID_EMPLEADO", typeof(int));
            dtReporteVendedor.Columns.Add("NOMBRE_EMPLEADO", typeof(string));
            dtReporteVendedor.Columns.Add("ID_SUCURSAL", typeof(int));
            dtReporteVendedor.Columns.Add("NOMBRE_SUCURSAL", typeof(string));
            dtReporteVendedor.Columns.Add("TOTAL_FACTURAS", typeof(int));
            dtReporteVendedor.Columns.Add("TOTAL_VENTAS", typeof(decimal));

            dgvReporte.DataSource = dtReporteVendedor;

            dgvReporte.Columns["ID_EMPLEADO"].HeaderText = "ID Vendedor";
            dgvReporte.Columns["NOMBRE_EMPLEADO"].HeaderText = "Nombre del Vendedor";
            dgvReporte.Columns["ID_SUCURSAL"].HeaderText = "ID Suc.";
            dgvReporte.Columns["NOMBRE_SUCURSAL"].HeaderText = "Sucursal";
            dgvReporte.Columns["TOTAL_FACTURAS"].HeaderText = "Facturas Emitidas";
            dgvReporte.Columns["TOTAL_VENTAS"].HeaderText = "Total Vendido";

            dgvReporte.Columns["TOTAL_VENTAS"].DefaultCellStyle.Format = "C2";
            dgvReporte.Columns["ID_EMPLEADO"].FillWeight = 55;
            dgvReporte.Columns["ID_SUCURSAL"].FillWeight = 45;
            dgvReporte.Columns["TOTAL_FACTURAS"].FillWeight = 65;
        }

        // --- BOTÓN GENERAR REPORTE ---
        private void btnGenerarReporte_Click(object sender, EventArgs e)
        {
            DateTime fechaInicio = dtpFechaInicio.Value.Date;
            DateTime fechaFin = dtpFechaFin.Value.Date;

            // Validación idéntica a SP_REPORTE_VENTAS_POR_VENDEDOR
            if (fechaInicio > fechaFin)
            {
                MessageBox.Show("Debe indicar un periodo de fechas válido (la fecha inicial no puede ser mayor a la final).",
                                "Periodo Inválido", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                dtpFechaInicio.Focus();
                return;
            }

            // Aquí se llamará a SP_REPORTE_VENTAS_POR_VENDEDOR(fechaInicio, fechaFin, idSucursalActual)
            ActualizarTotalesResumen();
        }

        private void ActualizarTotalesResumen()
        {
            if (dtReporteVendedor == null) return;

            int sumaFacturas = 0;
            decimal sumaVentas = 0;

            foreach (DataRowView fila in dtReporteVendedor.DefaultView)
            {
                sumaFacturas += Convert.ToInt32(fila["TOTAL_FACTURAS"]);
                sumaVentas += Convert.ToDecimal(fila["TOTAL_VENTAS"]);
            }

            lblResumenTotales.Text = $"Total Facturas: {sumaFacturas}   |   Monto Total Vendido: {sumaVentas:C2}";
        }

        // --- FILTRO RÁPIDO EN MEMORIA ---
        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            if (dtReporteVendedor == null) return;

            string filtro = txtBuscar.Text.Trim().Replace("'", "''");

            if (string.IsNullOrEmpty(filtro) || filtro == PlaceholderText)
            {
                dtReporteVendedor.DefaultView.RowFilter = "";
            }
            else
            {
                dtReporteVendedor.DefaultView.RowFilter = string.Format(
                    "CONVERT(ID_EMPLEADO, 'System.String') LIKE '%{0}%' OR " +
                    "NOMBRE_EMPLEADO LIKE '%{0}%' OR " +
                    "NOMBRE_SUCURSAL LIKE '%{0}%'",
                    filtro
                );
            }

            ActualizarTotalesResumen();
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
