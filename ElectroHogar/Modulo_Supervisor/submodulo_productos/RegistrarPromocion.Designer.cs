namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    partial class RegistrarPromocion
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        private void InitializeComponent()
        {
            this.pnlSuperior = new System.Windows.Forms.Panel();
            this.lblTitulo = new System.Windows.Forms.Label();
            this.grpCondiciones = new System.Windows.Forms.GroupBox();
            this.numPorcentaje = new System.Windows.Forms.NumericUpDown();
            this.lblPorcentaje = new System.Windows.Forms.Label();
            this.dtpFechaFin = new System.Windows.Forms.DateTimePicker();
            this.lblFechaFin = new System.Windows.Forms.Label();
            this.dtpFechaInicio = new System.Windows.Forms.DateTimePicker();
            this.lblFechaInicio = new System.Windows.Forms.Label();
            this.grpProductos = new System.Windows.Forms.GroupBox();
            this.clbProductos = new System.Windows.Forms.CheckedListBox();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.pnlSuperior.SuspendLayout();
            this.grpCondiciones.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numPorcentaje)).BeginInit();
            this.grpProductos.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlSuperior
            // 
            this.pnlSuperior.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.pnlSuperior.Controls.Add(this.lblTitulo);
            this.pnlSuperior.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlSuperior.Location = new System.Drawing.Point(0, 0);
            this.pnlSuperior.Name = "pnlSuperior";
            this.pnlSuperior.Size = new System.Drawing.Size(520, 60);
            this.pnlSuperior.TabIndex = 0;
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Segoe UI", 13.5F, System.Drawing.FontStyle.Bold);
            this.lblTitulo.ForeColor = System.Drawing.Color.White;
            this.lblTitulo.Location = new System.Drawing.Point(20, 14);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(232, 31);
            this.lblTitulo.TabIndex = 0;
            this.lblTitulo.Text = "Registrar Promoción";
            // 
            // grpCondiciones
            // 
            this.grpCondiciones.Controls.Add(this.numPorcentaje);
            this.grpCondiciones.Controls.Add(this.lblPorcentaje);
            this.grpCondiciones.Controls.Add(this.dtpFechaFin);
            this.grpCondiciones.Controls.Add(this.lblFechaFin);
            this.grpCondiciones.Controls.Add(this.dtpFechaInicio);
            this.grpCondiciones.Controls.Add(this.lblFechaInicio);
            this.grpCondiciones.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.grpCondiciones.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.grpCondiciones.Location = new System.Drawing.Point(20, 75);
            this.grpCondiciones.Name = "grpCondiciones";
            this.grpCondiciones.Size = new System.Drawing.Size(480, 105);
            this.grpCondiciones.TabIndex = 1;
            this.grpCondiciones.TabStop = false;
            this.grpCondiciones.Text = "Vigencia y Descuento";
            // 
            // lblFechaInicio
            // 
            this.lblFechaInicio.AutoSize = true;
            this.lblFechaInicio.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblFechaInicio.ForeColor = System.Drawing.Color.DimGray;
            this.lblFechaInicio.Location = new System.Drawing.Point(15, 30);
            this.lblFechaInicio.Name = "lblFechaInicio";
            this.lblFechaInicio.Size = new System.Drawing.Size(102, 20);
            this.lblFechaInicio.TabIndex = 0;
            this.lblFechaInicio.Text = "Fecha Inicio:*";
            // 
            // dtpFechaInicio
            // 
            this.dtpFechaInicio.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.dtpFechaInicio.Location = new System.Drawing.Point(15, 53);
            this.dtpFechaInicio.Name = "dtpFechaInicio";
            this.dtpFechaInicio.Size = new System.Drawing.Size(145, 29);
            this.dtpFechaInicio.TabIndex = 1;
            // 
            // lblFechaFin
            // 
            this.lblFechaFin.AutoSize = true;
            this.lblFechaFin.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblFechaFin.ForeColor = System.Drawing.Color.DimGray;
            this.lblFechaFin.Location = new System.Drawing.Point(175, 30);
            this.lblFechaFin.Name = "lblFechaFin";
            this.lblFechaFin.Size = new System.Drawing.Size(84, 20);
            this.lblFechaFin.TabIndex = 2;
            this.lblFechaFin.Text = "Fecha Fin:*";
            // 
            // dtpFechaFin
            // 
            this.dtpFechaFin.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.dtpFechaFin.Location = new System.Drawing.Point(175, 53);
            this.dtpFechaFin.Name = "dtpFechaFin";
            this.dtpFechaFin.Size = new System.Drawing.Size(145, 29);
            this.dtpFechaFin.TabIndex = 3;
            // 
            // lblPorcentaje
            // 
            this.lblPorcentaje.AutoSize = true;
            this.lblPorcentaje.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblPorcentaje.ForeColor = System.Drawing.Color.DimGray;
            this.lblPorcentaje.Location = new System.Drawing.Point(335, 30);
            this.lblPorcentaje.Name = "lblPorcentaje";
            this.lblPorcentaje.Size = new System.Drawing.Size(120, 20);
            this.lblPorcentaje.TabIndex = 4;
            this.lblPorcentaje.Text = "Descuento (%):*";
            // 
            // numPorcentaje
            // 
            this.numPorcentaje.DecimalPlaces = 2;
            this.numPorcentaje.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.numPorcentaje.Increment = new decimal(new int[] { 5, 0, 0, 0 });
            this.numPorcentaje.Location = new System.Drawing.Point(335, 53);
            this.numPorcentaje.Name = "numPorcentaje";
            this.numPorcentaje.Size = new System.Drawing.Size(130, 29);
            this.numPorcentaje.TabIndex = 5;
            // 
            // grpProductos
            // 
            this.grpProductos.Controls.Add(this.clbProductos);
            this.grpProductos.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.grpProductos.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.grpProductos.Location = new System.Drawing.Point(20, 192);
            this.grpProductos.Name = "grpProductos";
            this.grpProductos.Size = new System.Drawing.Size(480, 240);
            this.grpProductos.TabIndex = 2;
            this.grpProductos.TabStop = false;
            this.grpProductos.Text = "Productos Incluidos en la Promoción:*";
            // 
            // clbProductos
            // 
            this.clbProductos.CheckOnClick = true;
            this.clbProductos.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.clbProductos.FormattingEnabled = true;
            this.clbProductos.Location = new System.Drawing.Point(15, 28);
            this.clbProductos.Name = "clbProductos";
            this.clbProductos.Size = new System.Drawing.Size(450, 196);
            this.clbProductos.TabIndex = 0;
            // 
            // btnGuardar
            // 
            this.btnGuardar.BackColor = System.Drawing.Color.Teal;
            this.btnGuardar.FlatAppearance.BorderSize = 0;
            this.btnGuardar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGuardar.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.btnGuardar.ForeColor = System.Drawing.Color.White;
            this.btnGuardar.Location = new System.Drawing.Point(360, 450);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(140, 38);
            this.btnGuardar.TabIndex = 3;
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.UseVisualStyleBackColor = false;
            this.btnGuardar.Click += new System.EventHandler(this.btnGuardar_Click);
            // 
            // btnCancelar
            // 
            this.btnCancelar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnCancelar.FlatAppearance.BorderColor = System.Drawing.Color.LightGray;
            this.btnCancelar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCancelar.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.btnCancelar.ForeColor = System.Drawing.Color.DimGray;
            this.btnCancelar.Location = new System.Drawing.Point(225, 450);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(120, 38);
            this.btnCancelar.TabIndex = 4;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = false;

            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            //
            // RegistrarPromocion
            //
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(520, 510);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.btnGuardar);
            this.Controls.Add(this.grpProductos);
            this.Controls.Add(this.grpCondiciones);
            this.Controls.Add(this.pnlSuperior);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "RegistrarPromocion";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "ElectroHogar - Registrar Promoción";
            this.pnlSuperior.ResumeLayout(false);
            this.pnlSuperior.PerformLayout();
            this.grpCondiciones.ResumeLayout(false);
            this.grpCondiciones.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numPorcentaje)).EndInit();
            this.grpProductos.ResumeLayout(false);
            this.ResumeLayout(false);
        }
        #endregion
        private System.Windows.Forms.Panel pnlSuperior;
        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.GroupBox grpCondiciones;
        private System.Windows.Forms.Label lblFechaInicio;
        private System.Windows.Forms.DateTimePicker dtpFechaInicio;
        private System.Windows.Forms.Label lblFechaFin;
        private System.Windows.Forms.DateTimePicker dtpFechaFin;
        private System.Windows.Forms.Label lblPorcentaje;
        private System.Windows.Forms.NumericUpDown numPorcentaje;
        private System.Windows.Forms.GroupBox grpProductos;
        private System.Windows.Forms.CheckedListBox clbProductos;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Button btnCancelar;
    }
}