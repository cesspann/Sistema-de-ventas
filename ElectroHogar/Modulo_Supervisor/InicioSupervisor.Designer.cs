namespace ElectroHogar
{
    partial class InicioSupervisor
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
            this.btnRegresar = new System.Windows.Forms.Button();
            this.btnPerfil = new System.Windows.Forms.Button();
            this.pnlContenido = new System.Windows.Forms.Panel();
            this.txtBuscar = new System.Windows.Forms.TextBox();
            this.lblBuscarIcono = new System.Windows.Forms.Label();
            this.btnAgregarRegistro = new System.Windows.Forms.Button();
            this.btnVerReportes = new System.Windows.Forms.Button();
            this.btnGestionarUsuarios = new System.Windows.Forms.Button();
            this.btnOtrasSucursales = new System.Windows.Forms.Button();
            this.pnlLateral.SuspendLayout();
            this.pnlContenido.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlLateral
            // 
            this.pnlLateral.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.pnlLateral.Controls.Add(this.btnRegresar);
            this.pnlLateral.Controls.Add(this.btnPerfil);
            this.pnlLateral.Dock = System.Windows.Forms.DockStyle.Left;
            this.pnlLateral.Location = new System.Drawing.Point(0, 0);
            this.pnlLateral.Name = "pnlLateral";
            this.pnlLateral.Size = new System.Drawing.Size(220, 600);
            this.pnlLateral.TabIndex = 0;
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
            this.btnPerfil.Location = new System.Drawing.Point(20, 500);
            this.btnPerfil.Name = "btnPerfil";
            this.btnPerfil.Size = new System.Drawing.Size(60, 60);
            this.btnPerfil.TabIndex = 1;
            this.btnPerfil.Text = "👤";
            this.btnPerfil.UseVisualStyleBackColor = false;
            // 
            // pnlContenido
            // 
            this.pnlContenido.BackColor = System.Drawing.Color.White;
            this.pnlContenido.Controls.Add(this.txtBuscar);
            this.pnlContenido.Controls.Add(this.lblBuscarIcono);
            this.pnlContenido.Controls.Add(this.btnAgregarRegistro);
            this.pnlContenido.Controls.Add(this.btnVerReportes);
            this.pnlContenido.Controls.Add(this.btnGestionarUsuarios);
            this.pnlContenido.Controls.Add(this.btnOtrasSucursales);
            this.pnlContenido.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlContenido.Location = new System.Drawing.Point(220, 0);
            this.pnlContenido.Name = "pnlContenido";
            this.pnlContenido.Size = new System.Drawing.Size(680, 600);
            this.pnlContenido.TabIndex = 1;
            // 
            // txtBuscar
            // 
            this.txtBuscar.Font = new System.Drawing.Font("Segoe UI", 12F);
            this.txtBuscar.ForeColor = System.Drawing.Color.Gray;
            this.txtBuscar.Location = new System.Drawing.Point(50, 40);
            this.txtBuscar.Name = "txtBuscar";
            this.txtBuscar.Size = new System.Drawing.Size(420, 34);
            this.txtBuscar.TabIndex = 0;
            this.txtBuscar.Text = "Buscar herramientas o registros...";
            // 
            // lblBuscarIcono
            // 
            this.lblBuscarIcono.AutoSize = true;
            this.lblBuscarIcono.Font = new System.Drawing.Font("Segoe UI", 14F);
            this.lblBuscarIcono.ForeColor = System.Drawing.SystemColors.HotTrack;
            this.lblBuscarIcono.Location = new System.Drawing.Point(480, 40);
            this.lblBuscarIcono.Name = "lblBuscarIcono";
            this.lblBuscarIcono.Size = new System.Drawing.Size(47, 32);
            this.lblBuscarIcono.TabIndex = 1;
            this.lblBuscarIcono.Text = "🔍";
            // 
            // btnAgregarRegistro
            // 
            this.btnAgregarRegistro.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnAgregarRegistro.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(214)))), ((int)(((byte)(229)))));
            this.btnAgregarRegistro.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAgregarRegistro.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold);
            this.btnAgregarRegistro.ForeColor = System.Drawing.Color.DarkSlateGray;
            this.btnAgregarRegistro.Location = new System.Drawing.Point(50, 140);
            this.btnAgregarRegistro.Name = "btnAgregarRegistro";
            this.btnAgregarRegistro.Size = new System.Drawing.Size(250, 160);
            this.btnAgregarRegistro.TabIndex = 2;
            this.btnAgregarRegistro.Text = "➕\n\nAgregar Registro";
            this.btnAgregarRegistro.UseVisualStyleBackColor = false;
            this.btnAgregarRegistro.Click += new System.EventHandler(this.btnAgregarRegistro_Click);
            // 
            // btnVerReportes
            // 
            this.btnVerReportes.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnVerReportes.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(214)))), ((int)(((byte)(229)))));
            this.btnVerReportes.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnVerReportes.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold);
            this.btnVerReportes.ForeColor = System.Drawing.Color.DarkSlateGray;
            this.btnVerReportes.Location = new System.Drawing.Point(350, 140);
            this.btnVerReportes.Name = "btnVerReportes";
            this.btnVerReportes.Size = new System.Drawing.Size(250, 160);
            this.btnVerReportes.TabIndex = 3;
            this.btnVerReportes.Text = "📋\n\nVer Reportes";
            this.btnVerReportes.UseVisualStyleBackColor = false;
            // 
            // btnGestionarUsuarios
            // 
            this.btnGestionarUsuarios.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnGestionarUsuarios.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(214)))), ((int)(((byte)(229)))));
            this.btnGestionarUsuarios.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGestionarUsuarios.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Bold);
            this.btnGestionarUsuarios.ForeColor = System.Drawing.Color.DarkSlateGray;
            this.btnGestionarUsuarios.Location = new System.Drawing.Point(50, 350);
            this.btnGestionarUsuarios.Name = "btnGestionarUsuarios";
            this.btnGestionarUsuarios.Size = new System.Drawing.Size(250, 160);
            this.btnGestionarUsuarios.TabIndex = 4;
            this.btnGestionarUsuarios.Text = "⚙️\n\nGestionar Usuarios";
            this.btnGestionarUsuarios.UseVisualStyleBackColor = false;
            // 
            // btnOtrasSucursales
            // 
            this.btnOtrasSucursales.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnOtrasSucursales.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(214)))), ((int)(((byte)(229)))));
            this.btnOtrasSucursales.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnOtrasSucursales.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Bold);
            this.btnOtrasSucursales.ForeColor = System.Drawing.Color.DarkSlateGray;
            this.btnOtrasSucursales.Location = new System.Drawing.Point(350, 350);
            this.btnOtrasSucursales.Name = "btnOtrasSucursales";
            this.btnOtrasSucursales.Size = new System.Drawing.Size(250, 160);
            this.btnOtrasSucursales.TabIndex = 5;
            this.btnOtrasSucursales.Text = "🏢\n\nOtras Sucursales";
            this.btnOtrasSucursales.UseVisualStyleBackColor = false;
            // 
            // InicioSupervisor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(900, 600);
            this.Controls.Add(this.pnlContenido);
            this.Controls.Add(this.pnlLateral);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "InicioSupervisor";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "ElectroHogar - Inicio Supervisor";
            this.pnlLateral.ResumeLayout(false);
            this.pnlContenido.ResumeLayout(false);
            this.pnlContenido.PerformLayout();
            this.ResumeLayout(false);

        }
        #endregion
        private System.Windows.Forms.Panel pnlLateral;
        private System.Windows.Forms.Button btnRegresar;
        private System.Windows.Forms.Button btnPerfil;
        private System.Windows.Forms.Panel pnlContenido;
        private System.Windows.Forms.TextBox txtBuscar;
        private System.Windows.Forms.Label lblBuscarIcono;
        private System.Windows.Forms.Button btnAgregarRegistro;
        private System.Windows.Forms.Button btnVerReportes;
        private System.Windows.Forms.Button btnGestionarUsuarios;
        private System.Windows.Forms.Button btnOtrasSucursales;
    }
}