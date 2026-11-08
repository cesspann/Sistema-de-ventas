using System;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class RegistrarPromocion : Form
    {
        public RegistrarPromocion()
        {
            InitializeComponent();
            ConfigurarFechas();
        }

        private void ConfigurarFechas()
        {
            dtpFechaInicio.Format = DateTimePickerFormat.Short;
            dtpFechaFin.Format = DateTimePickerFormat.Short;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            DateTime fechaInicio = dtpFechaInicio.Value.Date;
            DateTime fechaFin = dtpFechaFin.Value.Date;
            decimal porcentaje = numPorcentaje.Value;

            // Validaciones idénticas a SP_REGISTRAR_PROMOCION
            if (fechaFin < fechaInicio)
            {
                MessageBox.Show("La fecha de finalización no puede ser anterior a la fecha de inicio.",
                                "Validación de Fechas", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                dtpFechaFin.Focus();
                return;
            }

            if (porcentaje <= 0 || porcentaje > 100)
            {
                MessageBox.Show("El porcentaje de descuento debe estar entre 0 y 100.",
                                "Validación de Descuento", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numPorcentaje.Focus();
                return;
            }

            if (clbProductos.CheckedItems.Count == 0)
            {
                MessageBox.Show("Debe seleccionar al menos un producto para aplicar la promoción.",
                                "Selección Requerida", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                clbProductos.Focus();
                return;
            }

            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
