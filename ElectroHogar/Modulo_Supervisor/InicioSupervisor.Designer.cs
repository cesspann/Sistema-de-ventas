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
            this.components = new System.ComponentModel.Container();
            this.pnlLateral = new System.Windows.Forms.Panel();
            this.btnPerfil = new System.Windows.Forms.Button();
            this.btnRegresar = new System.Windows.Forms.Button();
            this.pnlContenido = new System.Windows.Forms.Panel();
            this.btnConsultasLocales = new System.Windows.Forms.Button();
            this.btnOtrasSucursales = new System.Windows.Forms.Button();
            this.btnGestionarUsuarios = new System.Windows.Forms.Button();
            this.btnVerReportes = new System.Windows.Forms.Button();
            this.btnGestionarInventario = new System.Windows.Forms.Button();
            this.lblIconoBuscar = new System.Windows.Forms.Label();
            this.txtBuscar = new System.Windows.Forms.TextBox();
            this.menuReportes = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.menuUsuarios = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.pnlLateral.SuspendLayout();
            this.pnlContenido.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlLateral
            // 
            this.pnlLateral.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.pnlLateral.Controls.Add(this.btnPerfil);
            this.pnlLateral.Controls.Add(this.btnRegresar);
            this.pnlLateral.Dock = System.Windows.Forms.DockStyle.Left;
            this.pnlLateral.Location = new System.Drawing.Point(0, 0);
            this.pnlLateral.Name = "pnlLateral";
            this.pnlLateral.Size = new System.Drawing.Size(147, 624);
            this.pnlLateral.TabIndex = 0;
            // 
            // btnPerfil
            // 
            this.btnPerfil.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnPerfil.BackColor = System.Drawing.Color.Transparent;
            this.btnPerfil.FlatAppearance.BorderSize = 0;
            this.btnPerfil.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnPerfil.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.btnPerfil.ForeColor = System.Drawing.Color.White;
            this.btnPerfil.Location = new System.Drawing.Point(10, 519);
            this.btnPerfil.Name = "btnPerfil";
            this.btnPerfil.Size = new System.Drawing.Size(90, 85);
            this.btnPerfil.TabIndex = 1;
            this.btnPerfil.Text = "👤\nPerfil";
            this.btnPerfil.UseVisualStyleBackColor = false;
            // 
            // btnRegresar
            // 
            this.btnRegresar.BackColor = System.Drawing.Color.Transparent;
            this.btnRegresar.FlatAppearance.BorderSize = 0;
            this.btnRegresar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRegresar.Font = new System.Drawing.Font("Segoe UI", 22F, System.Drawing.FontStyle.Bold);
            this.btnRegresar.ForeColor = System.Drawing.Color.White;
            this.btnRegresar.Location = new System.Drawing.Point(20, 20);
            this.btnRegresar.Name = "btnRegresar";
            this.btnRegresar.Size = new System.Drawing.Size(70, 55);
            this.btnRegresar.TabIndex = 0;
            this.btnRegresar.Text = "←";
            this.btnRegresar.UseVisualStyleBackColor = false;
            this.btnRegresar.Click += new System.EventHandler(this.btnRegresar_Click);
            // 
            // pnlContenido
            // 
            this.pnlContenido.BackColor = System.Drawing.Color.White;
            this.pnlContenido.Controls.Add(this.btnConsultasLocales);
            this.pnlContenido.Controls.Add(this.btnOtrasSucursales);
            this.pnlContenido.Controls.Add(this.btnGestionarUsuarios);
            this.pnlContenido.Controls.Add(this.btnVerReportes);
            this.pnlContenido.Controls.Add(this.btnGestionarInventario);
            this.pnlContenido.Controls.Add(this.lblIconoBuscar);
            this.pnlContenido.Controls.Add(this.txtBuscar);
            this.pnlContenido.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlContenido.Location = new System.Drawing.Point(147, 0);
            this.pnlContenido.Name = "pnlContenido";
            this.pnlContenido.Size = new System.Drawing.Size(906, 624);
            this.pnlContenido.TabIndex = 1;
            // 
            // btnConsultasLocales
            // 
            this.btnConsultasLocales.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnConsultasLocales.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(214)))), ((int)(((byte)(229)))));
            this.btnConsultasLocales.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnConsultasLocales.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Bold);
            this.btnConsultasLocales.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(47)))), ((int)(((byte)(62)))));
            this.btnConsultasLocales.Location = new System.Drawing.Point(173, 365);
            this.btnConsultasLocales.Name = "btnConsultasLocales";
            this.btnConsultasLocales.Size = new System.Drawing.Size(250, 175);
            this.btnConsultasLocales.TabIndex = 6;
            this.btnConsultasLocales.Text = "📋\n\nConsultas Locales";
            this.btnConsultasLocales.UseVisualStyleBackColor = false;
            this.btnConsultasLocales.Click += new System.EventHandler(this.btnConsultasLocales_Click);
            // 
            // btnOtrasSucursales
            // 
            this.btnOtrasSucursales.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnOtrasSucursales.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(214)))), ((int)(((byte)(229)))));
            this.btnOtrasSucursales.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnOtrasSucursales.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Bold);
            this.btnOtrasSucursales.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(47)))), ((int)(((byte)(62)))));
            this.btnOtrasSucursales.Location = new System.Drawing.Point(483, 365);
            this.btnOtrasSucursales.Name = "btnOtrasSucursales";
            this.btnOtrasSucursales.Size = new System.Drawing.Size(250, 175);
            this.btnOtrasSucursales.TabIndex = 7;
            this.btnOtrasSucursales.Text = "🏢\n\nOtras Sucursales";
            this.btnOtrasSucursales.UseVisualStyleBackColor = false;
            this.btnOtrasSucursales.Click += new System.EventHandler(this.btnOtrasSucursales_Click);
            // 
            // btnGestionarUsuarios
            // 
            this.btnGestionarUsuarios.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnGestionarUsuarios.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(214)))), ((int)(((byte)(229)))));
            this.btnGestionarUsuarios.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGestionarUsuarios.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Bold);
            this.btnGestionarUsuarios.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(47)))), ((int)(((byte)(62)))));
            this.btnGestionarUsuarios.Location = new System.Drawing.Point(601, 145);
            this.btnGestionarUsuarios.Name = "btnGestionarUsuarios";
            this.btnGestionarUsuarios.Size = new System.Drawing.Size(250, 175);
            this.btnGestionarUsuarios.TabIndex = 5;
            this.btnGestionarUsuarios.Text = "👥\n\nGestionar Usuarios";
            this.btnGestionarUsuarios.UseVisualStyleBackColor = false;
            this.btnGestionarUsuarios.Click += new System.EventHandler(this.btnGestionarUsuarios_Click);
            // 
            // btnVerReportes
            // 
            this.btnVerReportes.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnVerReportes.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(214)))), ((int)(((byte)(229)))));
            this.btnVerReportes.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnVerReportes.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Bold);
            this.btnVerReportes.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(47)))), ((int)(((byte)(62)))));
            this.btnVerReportes.Location = new System.Drawing.Point(326, 145);
            this.btnVerReportes.Name = "btnVerReportes";
            this.btnVerReportes.Size = new System.Drawing.Size(250, 175);
            this.btnVerReportes.TabIndex = 4;
            this.btnVerReportes.Text = "📊\n\nVer Reportes";
            this.btnVerReportes.UseVisualStyleBackColor = false;
            this.btnVerReportes.Click += new System.EventHandler(this.btnVerReportes_Click);
            // 
            // btnGestionarInventario
            // 
            this.btnGestionarInventario.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnGestionarInventario.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(214)))), ((int)(((byte)(229)))));
            this.btnGestionarInventario.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGestionarInventario.Font = new System.Drawing.Font("Segoe UI", 11F, System.Drawing.FontStyle.Bold);
            this.btnGestionarInventario.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(47)))), ((int)(((byte)(62)))));
            this.btnGestionarInventario.Location = new System.Drawing.Point(55, 145);
            this.btnGestionarInventario.Name = "btnGestionarInventario";
            this.btnGestionarInventario.Size = new System.Drawing.Size(250, 175);
            this.btnGestionarInventario.TabIndex = 3;
            this.btnGestionarInventario.Text = "📦\n\nGestionar Inventario";
            this.btnGestionarInventario.UseVisualStyleBackColor = false;
            this.btnGestionarInventario.Click += new System.EventHandler(this.btnGestionarInventario_Click);
            // 
            // lblIconoBuscar
            // 
            this.lblIconoBuscar.AutoSize = true;
            this.lblIconoBuscar.Font = new System.Drawing.Font("Segoe UI", 16F);
            this.lblIconoBuscar.ForeColor = System.Drawing.Color.Teal;
            this.lblIconoBuscar.Location = new System.Drawing.Point(797, 56);
            this.lblIconoBuscar.Name = "lblIconoBuscar";
            this.lblIconoBuscar.Size = new System.Drawing.Size(54, 37);
            this.lblIconoBuscar.TabIndex = 1;
            this.lblIconoBuscar.Text = "🔍";
            // 
            // txtBuscar
            // 
            this.txtBuscar.Font = new System.Drawing.Font("Segoe UI", 12F);
            this.txtBuscar.ForeColor = System.Drawing.Color.Gray;
            this.txtBuscar.Location = new System.Drawing.Point(92, 56);
            this.txtBuscar.Name = "txtBuscar";
            this.txtBuscar.Size = new System.Drawing.Size(688, 34);
            this.txtBuscar.TabIndex = 0;
            this.txtBuscar.TextChanged += new System.EventHandler(this.txtBuscar_TextChanged);
            // 
            // menuReportes
            // 
            this.menuReportes.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuReportes.Name = "menuReportes";
            this.menuReportes.Size = new System.Drawing.Size(61, 4);
            // 
            // menuUsuarios
            // 
            this.menuUsuarios.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuUsuarios.Name = "menuUsuarios";
            this.menuUsuarios.Size = new System.Drawing.Size(61, 4);
            // 
            // InicioSupervisor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1053, 624);
            this.Controls.Add(this.pnlContenido);
            this.Controls.Add(this.pnlLateral);
            this.Name = "InicioSupervisor";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "ElectroHogar - Menú Supervisor";
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
        private System.Windows.Forms.Label lblIconoBuscar;
        private System.Windows.Forms.Button btnGestionarInventario;
        private System.Windows.Forms.Button btnVerReportes;
        private System.Windows.Forms.Button btnGestionarUsuarios;
        private System.Windows.Forms.Button btnConsultasLocales;
        private System.Windows.Forms.Button btnOtrasSucursales;
        private System.Windows.Forms.ContextMenuStrip menuReportes;
        private System.Windows.Forms.ContextMenuStrip menuUsuarios;
    }
}