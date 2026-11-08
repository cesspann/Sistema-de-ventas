namespace ElectroHogar.Modulo_Vendedor
{
    partial class InicioVendedor
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
            this.pnlLateral = new System.Windows.Forms.Panel();
            this.lblPerfil = new System.Windows.Forms.Label();
            this.btnRegresar = new System.Windows.Forms.Button();
            this.btnPerfil = new System.Windows.Forms.Button();
            this.pnlContenido = new System.Windows.Forms.Panel();
            this.txtBuscar = new System.Windows.Forms.TextBox();
            this.lblBuscarIcono = new System.Windows.Forms.Label();
            this.btnConsultarCliente = new System.Windows.Forms.Button();
            this.btnConsultarProductos = new System.Windows.Forms.Button();
            this.pnlLateral.SuspendLayout();
            this.pnlContenido.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlLateral
            // 
            this.pnlLateral.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.pnlLateral.Controls.Add(this.lblPerfil);
            this.pnlLateral.Controls.Add(this.btnRegresar);
            this.pnlLateral.Controls.Add(this.btnPerfil);
            this.pnlLateral.Dock = System.Windows.Forms.DockStyle.Left;
            this.pnlLateral.Location = new System.Drawing.Point(0, 0);
            this.pnlLateral.Name = "pnlLateral";
            this.pnlLateral.Size = new System.Drawing.Size(220, 686);
            this.pnlLateral.TabIndex = 0;
            // 
            // lblPerfil
            // 
            this.lblPerfil.AutoSize = true;
            this.lblPerfil.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.lblPerfil.Location = new System.Drawing.Point(81, 618);
            this.lblPerfil.Name = "lblPerfil";
            this.lblPerfil.Size = new System.Drawing.Size(37, 16);
            this.lblPerfil.TabIndex = 2;
            this.lblPerfil.Text = "Perfil";
            // 
            // btnRegresar
            // 
            this.btnRegresar.BackColor = System.Drawing.Color.Transparent;
            this.btnRegresar.FlatAppearance.BorderSize = 0;
            this.btnRegresar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRegresar.Font = new System.Drawing.Font("Segoe UI", 24F, System.Drawing.FontStyle.Bold);
            this.btnRegresar.ForeColor = System.Drawing.Color.White;
            this.btnRegresar.Location = new System.Drawing.Point(20, 20);
            this.btnRegresar.Name = "btnRegresar";
            this.btnRegresar.Size = new System.Drawing.Size(60, 60);
            this.btnRegresar.TabIndex = 0;
            this.btnRegresar.Text = "←";
            this.btnRegresar.UseVisualStyleBackColor = false;
            this.btnRegresar.Click += new System.EventHandler(this.btnRegresar_Click);
            // 
            // btnPerfil
            // 
            this.btnPerfil.BackColor = System.Drawing.Color.Transparent;
            this.btnPerfil.FlatAppearance.BorderSize = 0;
            this.btnPerfil.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnPerfil.Font = new System.Drawing.Font("Segoe UI", 24F);
            this.btnPerfil.ForeColor = System.Drawing.Color.White;
            this.btnPerfil.Location = new System.Drawing.Point(20, 510);
            this.btnPerfil.Name = "btnPerfil";
            this.btnPerfil.Size = new System.Drawing.Size(167, 151);
            this.btnPerfil.TabIndex = 1;
            this.btnPerfil.Text = "👤";
            this.btnPerfil.UseVisualStyleBackColor = false;
            this.btnPerfil.Click += new System.EventHandler(this.btnPerfil_Click);
            // 
            // pnlContenido
            // 
            this.pnlContenido.BackColor = System.Drawing.Color.White;
            this.pnlContenido.Controls.Add(this.txtBuscar);
            this.pnlContenido.Controls.Add(this.lblBuscarIcono);
            this.pnlContenido.Controls.Add(this.btnConsultarCliente);
            this.pnlContenido.Controls.Add(this.btnConsultarProductos);
            this.pnlContenido.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlContenido.Location = new System.Drawing.Point(220, 0);
            this.pnlContenido.Name = "pnlContenido";
            this.pnlContenido.Size = new System.Drawing.Size(752, 686);
            this.pnlContenido.TabIndex = 1;
            // 
            // txtBuscar
            // 
            this.txtBuscar.Font = new System.Drawing.Font("Segoe UI", 12F);
            this.txtBuscar.ForeColor = System.Drawing.Color.Gray;
            this.txtBuscar.Location = new System.Drawing.Point(50, 40);
            this.txtBuscar.Name = "txtBuscar";
            this.txtBuscar.Size = new System.Drawing.Size(497, 34);
            this.txtBuscar.TabIndex = 0;
            this.txtBuscar.TextChanged += new System.EventHandler(this.txtBuscar_TextChanged);
            // 
            // lblBuscarIcono
            // 
            this.lblBuscarIcono.AutoSize = true;
            this.lblBuscarIcono.Font = new System.Drawing.Font("Segoe UI", 14F);
            this.lblBuscarIcono.ForeColor = System.Drawing.Color.Teal;
            this.lblBuscarIcono.Location = new System.Drawing.Point(553, 40);
            this.lblBuscarIcono.Name = "lblBuscarIcono";
            this.lblBuscarIcono.Size = new System.Drawing.Size(47, 32);
            this.lblBuscarIcono.TabIndex = 1;
            this.lblBuscarIcono.Text = "🔍";
            // 
            // btnConsultarCliente
            // 
            this.btnConsultarCliente.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnConsultarCliente.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(214)))), ((int)(((byte)(229)))));
            this.btnConsultarCliente.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnConsultarCliente.Font = new System.Drawing.Font("Segoe UI", 13F, System.Drawing.FontStyle.Bold);
            this.btnConsultarCliente.ForeColor = System.Drawing.Color.Teal;
            this.btnConsultarCliente.Location = new System.Drawing.Point(80, 220);
            this.btnConsultarCliente.Name = "btnConsultarCliente";
            this.btnConsultarCliente.Size = new System.Drawing.Size(260, 190);
            this.btnConsultarCliente.TabIndex = 2;
            this.btnConsultarCliente.Text = "👥\n\nConsultar Cliente";
            this.btnConsultarCliente.UseVisualStyleBackColor = false;
            this.btnConsultarCliente.Click += new System.EventHandler(this.btnConsultarCliente_Click);
            // 
            // btnConsultarProductos
            // 
            this.btnConsultarProductos.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnConsultarProductos.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(214)))), ((int)(((byte)(229)))));
            this.btnConsultarProductos.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnConsultarProductos.Font = new System.Drawing.Font("Segoe UI", 13F, System.Drawing.FontStyle.Bold);
            this.btnConsultarProductos.ForeColor = System.Drawing.Color.Teal;
            this.btnConsultarProductos.Location = new System.Drawing.Point(390, 220);
            this.btnConsultarProductos.Name = "btnConsultarProductos";
            this.btnConsultarProductos.Size = new System.Drawing.Size(260, 190);
            this.btnConsultarProductos.TabIndex = 3;
            this.btnConsultarProductos.Text = "📦\n\nConsultar Productos";
            this.btnConsultarProductos.UseVisualStyleBackColor = false;
            this.btnConsultarProductos.Click += new System.EventHandler(this.btnConsultarProductos_Click);
            // 
            // InicioVendedor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(972, 686);
            this.Controls.Add(this.pnlContenido);
            this.Controls.Add(this.pnlLateral);
            this.Name = "InicioVendedor";
            this.Text = "ElectroHogar - Panel de Vendedor";
            this.pnlLateral.ResumeLayout(false);
            this.pnlLateral.PerformLayout();
            this.pnlContenido.ResumeLayout(false);
            this.pnlContenido.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnlLateral;
        private System.Windows.Forms.Label lblPerfil;
        private System.Windows.Forms.Button btnRegresar;
        private System.Windows.Forms.Button btnPerfil;
        private System.Windows.Forms.Panel pnlContenido;
        private System.Windows.Forms.TextBox txtBuscar;
        private System.Windows.Forms.Label lblBuscarIcono;
        private System.Windows.Forms.Button btnConsultarCliente;
        private System.Windows.Forms.Button btnConsultarProductos;
    }
}
