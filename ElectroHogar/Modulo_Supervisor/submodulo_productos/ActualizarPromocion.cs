using System;
using System.Data;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    public partial class ActualizarPromocion : Form
    {
        private int idPromocion;

        public ActualizarPromocion(int idPromocion = 0, DateTime? fechaInicio = null, DateTime? fechaFin = null, decimal porcentaje = 0)
        {
            InitializeComponent();
            this.idPromocion = idPromocion;

            lblPromoInfo.Text = $"Editando Promoción ID: {idPromocion}";
            dtpFechaInicio.Format = DateTimePickerFormat.Short;
            dtpFechaFin.Format = DateTimePickerFormat.Short;

            if (fechaInicio.HasValue) dtpFechaInicio.Value = fechaInicio.Value;
            if (fechaFin.HasValue) dtpFechaFin.Value = fechaFin.Value;
            numPorcentaje.Value = porcentaje > 0 ? porcentaje : 1;
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            DateTime inicio = dtpFechaInicio.Value.Date;
            DateTime fin = dtpFechaFin.Value.Date;
            decimal porcentaje = numPorcentaje.Value;

            if (fin < inicio)
            {
                MessageBox.Show("La fecha de finalización no puede ser anterior a la fecha de inicio.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                dtpFechaFin.Focus();
                return;
            }

            if (porcentaje <= 0 || porcentaje > 100)
            {
                MessageBox.Show("El porcentaje de descuento debe estar entre 0 y 100.",
                                "Validación", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                numPorcentaje.Focus();
                return;
            }

            using (MySqlConnection conn = Conexion.ObtenerConexion())
            {
                if (conn == null)
                {
                    MessageBox.Show("No se pudo conectar con la base de datos.", "Error de Conexión", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    using (MySqlCommand cmd = new MySqlCommand("SP_ACTUALIZAR_PROMOCION", conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("P_ID_PROMOCION", this.idPromocion);
                        cmd.Parameters.AddWithValue("P_FECHA_INICIO", inicio);
                        cmd.Parameters.AddWithValue("P_FECHA_FIN", fin);
                        cmd.Parameters.AddWithValue("P_PORCENTAJE_DESCUENTO", porcentaje);

                        cmd.ExecuteNonQuery();

                        MessageBox.Show($"Promoción #{this.idPromocion} actualizada correctamente.",
                                        "ElectroHogar - Promociones", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        this.DialogResult = DialogResult.OK;
                        this.Close();
                    }
                }
                catch (MySqlException ex)
                {
                    MessageBox.Show(ex.Message, "Aviso de Base de Datos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
