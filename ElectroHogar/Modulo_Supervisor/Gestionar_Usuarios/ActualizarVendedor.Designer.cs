namespace ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios
{
    partial class ActualizarVendedor
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
            this.lblEmpleadoInfo = new System.Windows.Forms.Label();
            this.lblComision = new System.Windows.Forms.Label();
            this.numComision = new System.Windows.Forms.NumericUpDown();
            this.lblMeta = new System.Windows.Forms.Label();
            this.numMeta = new System.Windows.Forms.NumericUpDown();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.pnlSuperior.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numComision)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numMeta)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlSuperior
            // 
            this.pnlSuperior.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.pnlSuperior.Controls.Add(this.lblTitulo);
            this.pnlSuperior.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlSuperior.Location = new System.Drawing.Point(0, 0);
            this.pnlSuperior.Name = "pnlSuperior";
            this.pnlSuperior.Size = new System.Drawing.Size(440, 60);
            this.pnlSuperior.TabIndex = 0;
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Segoe UI", 13F, System.Drawing.FontStyle.Bold);
            this.lblTitulo.ForeColor = System.Drawing.Color.White;
            this.lblTitulo.Location = new System.Drawing.Point(20, 15);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(225, 30);
            this.lblTitulo.TabIndex = 0;
            this.lblTitulo.Text = "Actualizar Vendedor";
            // 
            // lblEmpleadoInfo
            // 
            this.lblEmpleadoInfo.AutoSize = true;
            this.lblEmpleadoInfo.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Italic);
            this.lblEmpleadoInfo.ForeColor = System.Drawing.Color.Teal;
            this.lblEmpleadoInfo.Location = new System.Drawing.Point(25, 75);
            this.lblEmpleadoInfo.Name = "lblEmpleadoInfo";
            this.lblEmpleadoInfo.Size = new System.Drawing.Size(162, 21);
            this.lblEmpleadoInfo.TabIndex = 1;
            this.lblEmpleadoInfo.Text = "Vendedor Seleccionado";
            // 
            // lblComision
            // 
            this.lblComision.AutoSize = true;
            this.lblComision.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.lblComision.Location = new System.Drawing.Point(25, 110);
            this.lblComision.Name = "lblComision";
            this.lblComision.Size = new System.Drawing.Size(218, 23);
            this.lblComision.TabIndex = 2;
            this.lblComision.Text = "Porcentaje de Comisión (%):*";
            // 
            // numComision
            // 
            this.numComision.DecimalPlaces = 2;
            this.numComision.Font = new System.Drawing.Font("Segoe UI", 10.5F);
            this.numComision.Increment = new decimal(new int[] { 5, 0, 0, 65536 });
            this.numComision.Location = new System.Drawing.Point(25, 136);
            this.numComision.Name = "numComision";
            this.numComision.Size = new System.Drawing.Size(385, 31);
            this.numComision.TabIndex = 3;
            // 
            // lblMeta
            // 
            this.lblMeta.AutoSize = true;
            this.lblMeta.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.lblMeta.Location = new System.Drawing.Point(25, 185);
            this.lblMeta.Name = "lblMeta";
            this.lblMeta.Size = new System.Drawing.Size(156, 23);
            this.lblMeta.TabIndex = 4;
            this.lblMeta.Text = "Meta de Ventas ($):*";
            // 
            // numMeta
            // 
            this.numMeta.DecimalPlaces = 2;
            this.numMeta.Font = new System.Drawing.Font("Segoe UI", 10.5F);
            this.numMeta.Increment = new decimal(new int[] { 100, 0, 0, 0 });
            this.numMeta.Location = new System.Drawing.Point(25, 211);
            this.numMeta.Maximum = new decimal(new int[] { 10000000, 0, 0, 0 });
            this.numMeta.Name = "numMeta";
            this.numMeta.Size = new System.Drawing.Size(385, 31);
            this.numMeta.TabIndex = 5;
            // 
            // btnGuardar
            // 
            this.btnGuardar.BackColor = System.Drawing.Color.Teal;
            this.btnGuardar.FlatAppearance.BorderSize = 0;
            this.btnGuardar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGuardar.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.btnGuardar.ForeColor = System.Drawing.Color.White;
            this.btnGuardar.Location = new System.Drawing.Point(280, 270);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(130, 38);
            this.btnGuardar.TabIndex = 6;
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
            this.btnCancelar.Location = new System.Drawing.Point(145, 270);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(120, 38);
            this.btnCancelar.TabIndex = 7;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = false;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // ActualizarVendedor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(440, 330);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.btnGuardar);
            this.Controls.Add(this.numMeta);
            this.Controls.Add(this.lblMeta);
            this.Controls.Add(this.numComision);
            this.Controls.Add(this.lblComision);
            this.Controls.Add(this.lblEmpleadoInfo);
            this.Controls.Add(this.pnlSuperior);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ActualizarVendedor";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "ElectroHogar - Actualizar Vendedor";
            this.pnlSuperior.ResumeLayout(false);
            this.pnlSuperior.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numComision)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numMeta)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        #endregion

        private System.Windows.Forms.Panel pnlSuperior;
        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.Label lblEmpleadoInfo;
        private System.Windows.Forms.Label lblComision;
        private System.Windows.Forms.NumericUpDown numComision;
        private System.Windows.Forms.Label lblMeta;
        private System.Windows.Forms.NumericUpDown numMeta;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Button btnCancelar;
    }
}
