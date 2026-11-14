namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    partial class ActualizarPromocion
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null)) components.Dispose();
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            this.pnlSuperior = new System.Windows.Forms.Panel();
            this.lblTitulo = new System.Windows.Forms.Label();
            this.lblPromoInfo = new System.Windows.Forms.Label();
            this.lblInicio = new System.Windows.Forms.Label();
            this.dtpFechaInicio = new System.Windows.Forms.DateTimePicker();
            this.lblFin = new System.Windows.Forms.Label();
            this.dtpFechaFin = new System.Windows.Forms.DateTimePicker();
            this.lblPorcentaje = new System.Windows.Forms.Label();
            this.numPorcentaje = new System.Windows.Forms.NumericUpDown();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.pnlSuperior.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numPorcentaje)).BeginInit();
            this.SuspendLayout();

            this.pnlSuperior.BackColor = System.Drawing.Color.FromArgb(51, 82, 209);
            this.pnlSuperior.Controls.Add(this.lblTitulo);
            this.pnlSuperior.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlSuperior.Size = new System.Drawing.Size(440, 60);

            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Segoe UI", 13F, System.Drawing.FontStyle.Bold);
            this.lblTitulo.ForeColor = System.Drawing.Color.White;
            this.lblTitulo.Location = new System.Drawing.Point(20, 15);
            this.lblTitulo.Text = "Actualizar Promoción";

            this.lblPromoInfo.AutoSize = true;
            this.lblPromoInfo.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Italic);
            this.lblPromoInfo.ForeColor = System.Drawing.Color.Teal;
            this.lblPromoInfo.Location = new System.Drawing.Point(25, 75);
            this.lblPromoInfo.Text = "Promoción Seleccionada";

            this.lblInicio.AutoSize = true;
            this.lblInicio.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.lblInicio.ForeColor = System.Drawing.Color.DimGray;
            this.lblInicio.Location = new System.Drawing.Point(25, 110);
            this.lblInicio.Text = "Fecha de Inicio:*";

            this.dtpFechaInicio.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.dtpFechaInicio.Location = new System.Drawing.Point(25, 136);
            this.dtpFechaInicio.Size = new System.Drawing.Size(180, 30);

            this.lblFin.AutoSize = true;
            this.lblFin.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.lblFin.ForeColor = System.Drawing.Color.DimGray;
            this.lblFin.Location = new System.Drawing.Point(230, 110);
            this.lblFin.Text = "Fecha de Fin:*";

            this.dtpFechaFin.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.dtpFechaFin.Location = new System.Drawing.Point(230, 136);
            this.dtpFechaFin.Size = new System.Drawing.Size(180, 30);

            this.lblPorcentaje.AutoSize = true;
            this.lblPorcentaje.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.lblPorcentaje.ForeColor = System.Drawing.Color.DimGray;
            this.lblPorcentaje.Location = new System.Drawing.Point(25, 180);
            this.lblPorcentaje.Text = "Porcentaje de Descuento (%):*";

            this.numPorcentaje.DecimalPlaces = 2;
            this.numPorcentaje.Font = new System.Drawing.Font("Segoe UI", 11F);
            this.numPorcentaje.Location = new System.Drawing.Point(25, 206);
            this.numPorcentaje.Maximum = new decimal(new int[] { 100, 0, 0, 0 });
            this.numPorcentaje.Size = new System.Drawing.Size(385, 32);

            this.btnGuardar.BackColor = System.Drawing.Color.Teal;
            this.btnGuardar.FlatAppearance.BorderSize = 0;
            this.btnGuardar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGuardar.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.btnGuardar.ForeColor = System.Drawing.Color.White;
            this.btnGuardar.Location = new System.Drawing.Point(280, 260);
            this.btnGuardar.Size = new System.Drawing.Size(130, 38);
            this.btnGuardar.Text = "Actualizar";
            this.btnGuardar.Click += new System.EventHandler(this.btnGuardar_Click);

            this.btnCancelar.BackColor = System.Drawing.Color.FromArgb(240, 244, 248);
            this.btnCancelar.FlatAppearance.BorderColor = System.Drawing.Color.LightGray;
            this.btnCancelar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCancelar.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.btnCancelar.ForeColor = System.Drawing.Color.DimGray;
            this.btnCancelar.Location = new System.Drawing.Point(145, 260);
            this.btnCancelar.Size = new System.Drawing.Size(120, 38);
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);

            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(440, 320);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.btnGuardar);
            this.Controls.Add(this.numPorcentaje);
            this.Controls.Add(this.lblPorcentaje);
            this.Controls.Add(this.dtpFechaFin);
            this.Controls.Add(this.lblFin);
            this.Controls.Add(this.dtpFechaInicio);
            this.Controls.Add(this.lblInicio);
            this.Controls.Add(this.lblPromoInfo);
            this.Controls.Add(this.pnlSuperior);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ActualizarPromocion";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "ElectroHogar - Actualizar Promoción";
            this.pnlSuperior.ResumeLayout(false);
            this.pnlSuperior.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numPorcentaje)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        private System.Windows.Forms.Panel pnlSuperior;
        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.Label lblPromoInfo;
        private System.Windows.Forms.Label lblInicio;
        private System.Windows.Forms.DateTimePicker dtpFechaInicio;
        private System.Windows.Forms.Label lblFin;
        private System.Windows.Forms.DateTimePicker dtpFechaFin;
        private System.Windows.Forms.Label lblPorcentaje;
        private System.Windows.Forms.NumericUpDown numPorcentaje;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Button btnCancelar;
    }
}
