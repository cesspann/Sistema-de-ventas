namespace ElectroHogar.Modulo_Supervisor.ConsultasLocales
{
    partial class actualizarLimiteCredito
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
            this.lblClienteInfo = new System.Windows.Forms.Label();
            this.lblNuevoMonto = new System.Windows.Forms.Label();
            this.numNuevoMonto = new System.Windows.Forms.NumericUpDown();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.pnlSuperior.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numNuevoMonto)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlSuperior
            // 
            this.pnlSuperior.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.pnlSuperior.Controls.Add(this.lblTitulo);
            this.pnlSuperior.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlSuperior.Location = new System.Drawing.Point(0, 0);
            this.pnlSuperior.Name = "pnlSuperior";
            this.pnlSuperior.Size = new System.Drawing.Size(450, 60);
            this.pnlSuperior.TabIndex = 0;
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Segoe UI", 13F, System.Drawing.FontStyle.Bold);
            this.lblTitulo.ForeColor = System.Drawing.Color.White;
            this.lblTitulo.Location = new System.Drawing.Point(20, 15);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(296, 30);
            this.lblTitulo.TabIndex = 0;
            this.lblTitulo.Text = "Actualizar Límite de Crédito";
            // 
            // lblClienteInfo
            // 
            this.lblClienteInfo.AutoSize = true;
            this.lblClienteInfo.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Italic);
            this.lblClienteInfo.ForeColor = System.Drawing.Color.Teal;
            this.lblClienteInfo.Location = new System.Drawing.Point(25, 76);
            this.lblClienteInfo.Name = "lblClienteInfo";
            this.lblClienteInfo.Size = new System.Drawing.Size(156, 21);
            this.lblClienteInfo.TabIndex = 1;
            this.lblClienteInfo.Text = "Cliente Seleccionado";
            // 
            // lblNuevoMonto
            // 
            this.lblNuevoMonto.AutoSize = true;
            this.lblNuevoMonto.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.lblNuevoMonto.ForeColor = System.Drawing.Color.DimGray;
            this.lblNuevoMonto.Location = new System.Drawing.Point(25, 112);
            this.lblNuevoMonto.Name = "lblNuevoMonto";
            this.lblNuevoMonto.Size = new System.Drawing.Size(218, 23);
            this.lblNuevoMonto.TabIndex = 2;
            this.lblNuevoMonto.Text = "Nuevo Monto Límite ($):*";
            // 
            // numNuevoMonto
            // 
            this.numNuevoMonto.DecimalPlaces = 2;
            this.numNuevoMonto.Font = new System.Drawing.Font("Segoe UI", 11F);
            this.numNuevoMonto.Increment = new decimal(new int[] { 50, 0, 0, 0 });
            this.numNuevoMonto.Location = new System.Drawing.Point(25, 140);
            this.numNuevoMonto.Maximum = new decimal(new int[] { 10000000, 0, 0, 0 });
            this.numNuevoMonto.Name = "numNuevoMonto";
            this.numNuevoMonto.Size = new System.Drawing.Size(395, 32);
            this.numNuevoMonto.TabIndex = 3;
            // 
            // btnGuardar
            // 
            this.btnGuardar.BackColor = System.Drawing.Color.Teal;
            this.btnGuardar.FlatAppearance.BorderSize = 0;
            this.btnGuardar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGuardar.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.btnGuardar.ForeColor = System.Drawing.Color.White;
            this.btnGuardar.Location = new System.Drawing.Point(290, 195);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(130, 38);
            this.btnGuardar.TabIndex = 4;
            this.btnGuardar.Text = "Actualizar";
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
            this.btnCancelar.Location = new System.Drawing.Point(155, 195);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(120, 38);
            this.btnCancelar.TabIndex = 5;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = false;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // actualizarLimiteCredito
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(450, 255);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.btnGuardar);
            this.Controls.Add(this.numNuevoMonto);
            this.Controls.Add(this.lblNuevoMonto);
            this.Controls.Add(this.lblClienteInfo);
            this.Controls.Add(this.pnlSuperior);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "actualizarLimiteCredito";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "ElectroHogar - Actualizar Límite de Crédito";
            this.pnlSuperior.ResumeLayout(false);
            this.pnlSuperior.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numNuevoMonto)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        #endregion

        private System.Windows.Forms.Panel pnlSuperior;
        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.Label lblClienteInfo;
        private System.Windows.Forms.Label lblNuevoMonto;
        private System.Windows.Forms.NumericUpDown numNuevoMonto;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Button btnCancelar;
    }
}
