namespace ElectroHogar.Modulo_Vendedor.Gestion_clientes
{
    partial class ActualizarClienteJuridico
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
            this.lblRepresentante = new System.Windows.Forms.Label();
            this.txtRepresentante = new System.Windows.Forms.TextBox();
            this.lblCupo = new System.Windows.Forms.Label();
            this.numCupoCredito = new System.Windows.Forms.NumericUpDown();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.pnlSuperior.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numCupoCredito)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlSuperior
            // 
            this.pnlSuperior.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.pnlSuperior.Controls.Add(this.lblTitulo);
            this.pnlSuperior.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlSuperior.Location = new System.Drawing.Point(0, 0);
            this.pnlSuperior.Name = "pnlSuperior";
            this.pnlSuperior.Size = new System.Drawing.Size(460, 60);
            this.pnlSuperior.TabIndex = 0;
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Segoe UI", 13F, System.Drawing.FontStyle.Bold);
            this.lblTitulo.ForeColor = System.Drawing.Color.White;
            this.lblTitulo.Location = new System.Drawing.Point(20, 15);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(277, 30);
            this.lblTitulo.TabIndex = 0;
            this.lblTitulo.Text = "Actualizar Cliente Jurídico";
            // 
            // lblClienteInfo
            // 
            this.lblClienteInfo.AutoSize = true;
            this.lblClienteInfo.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Italic);
            this.lblClienteInfo.ForeColor = System.Drawing.Color.Teal;
            this.lblClienteInfo.Location = new System.Drawing.Point(25, 75);
            this.lblClienteInfo.Name = "lblClienteInfo";
            this.lblClienteInfo.Size = new System.Drawing.Size(147, 21);
            this.lblClienteInfo.TabIndex = 1;
            this.lblClienteInfo.Text = "Cliente Seleccionado";
            // 
            // lblRepresentante
            // 
            this.lblRepresentante.AutoSize = true;
            this.lblRepresentante.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.lblRepresentante.Location = new System.Drawing.Point(25, 110);
            this.lblRepresentante.Name = "lblRepresentante";
            this.lblRepresentante.Size = new System.Drawing.Size(190, 23);
            this.lblRepresentante.TabIndex = 2;
            this.lblRepresentante.Text = "Representante Legal:";
            // 
            // txtRepresentante
            // 
            this.txtRepresentante.Font = new System.Drawing.Font("Segoe UI", 10.5F);
            this.txtRepresentante.Location = new System.Drawing.Point(25, 136);
            this.txtRepresentante.MaxLength = 100;
            this.txtRepresentante.Name = "txtRepresentante";
            this.txtRepresentante.Size = new System.Drawing.Size(405, 31);
            this.txtRepresentante.TabIndex = 3;
            // 
            // lblCupo
            // 
            this.lblCupo.AutoSize = true;
            this.lblCupo.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.lblCupo.Location = new System.Drawing.Point(25, 185);
            this.lblCupo.Name = "lblCupo";
            this.lblCupo.Size = new System.Drawing.Size(238, 23);
            this.lblCupo.TabIndex = 4;
            this.lblCupo.Text = "Cupo Crédito Corporativo ($):";
            // 
            // numCupoCredito
            // 
            this.numCupoCredito.DecimalPlaces = 2;
            this.numCupoCredito.Font = new System.Drawing.Font("Segoe UI", 10.5F);
            this.numCupoCredito.Location = new System.Drawing.Point(25, 211);
            this.numCupoCredito.Maximum = new decimal(new int[] { 10000000, 0, 0, 0 });
            this.numCupoCredito.Name = "numCupoCredito";
            this.numCupoCredito.Size = new System.Drawing.Size(405, 31);
            this.numCupoCredito.TabIndex = 5;
            // 
            // btnGuardar
            // 
            this.btnGuardar.BackColor = System.Drawing.Color.Teal;
            this.btnGuardar.FlatAppearance.BorderSize = 0;
            this.btnGuardar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGuardar.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.btnGuardar.ForeColor = System.Drawing.Color.White;
            this.btnGuardar.Location = new System.Drawing.Point(300, 270);
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
            this.btnCancelar.Location = new System.Drawing.Point(165, 270);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(120, 38);
            this.btnCancelar.TabIndex = 7;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = false;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            // 
            // ActualizarClienteJuridico
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(460, 330);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.btnGuardar);
            this.Controls.Add(this.numCupoCredito);
            this.Controls.Add(this.lblCupo);
            this.Controls.Add(this.txtRepresentante);
            this.Controls.Add(this.lblRepresentante);
            this.Controls.Add(this.lblClienteInfo);
            this.Controls.Add(this.pnlSuperior);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ActualizarClienteJuridico";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "ElectroHogar - Actualizar Cliente Jurídico";
            this.pnlSuperior.ResumeLayout(false);
            this.pnlSuperior.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numCupoCredito)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        #endregion

        private System.Windows.Forms.Panel pnlSuperior;
        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.Label lblClienteInfo;
        private System.Windows.Forms.Label lblRepresentante;
        private System.Windows.Forms.TextBox txtRepresentante;
        private System.Windows.Forms.Label lblCupo;
        private System.Windows.Forms.NumericUpDown numCupoCredito;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Button btnCancelar;
    }
}
