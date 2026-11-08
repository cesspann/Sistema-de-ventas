namespace ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios
{
    partial class gestiona_supervisor
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
            this.btnRegresar = new System.Windows.Forms.Button();
            this.pnlPrincipal = new System.Windows.Forms.Panel();
            this.btnDesbloquear = new System.Windows.Forms.Button();
            this.btnDesactivar = new System.Windows.Forms.Button();
            this.btnActivar = new System.Windows.Forms.Button();
            this.btnAgregar = new System.Windows.Forms.Button();
            this.dgvSupervisores = new System.Windows.Forms.DataGridView();
            this.lblIconoBuscar = new System.Windows.Forms.Label();
            this.txtBuscar = new System.Windows.Forms.TextBox();
            this.pnlSuperior.SuspendLayout();
            this.pnlPrincipal.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSupervisores)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlSuperior
            // 
            this.pnlSuperior.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.pnlSuperior.Controls.Add(this.lblTitulo);
            this.pnlSuperior.Controls.Add(this.btnRegresar);
            this.pnlSuperior.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlSuperior.Location = new System.Drawing.Point(0, 0);
            this.pnlSuperior.Name = "pnlSuperior";
            this.pnlSuperior.Size = new System.Drawing.Size(1120, 75);
            this.pnlSuperior.TabIndex = 0;
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Segoe UI", 16F, System.Drawing.FontStyle.Bold);
            this.lblTitulo.ForeColor = System.Drawing.Color.White;
            this.lblTitulo.Location = new System.Drawing.Point(95, 20);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(288, 37);
            this.lblTitulo.TabIndex = 1;
            this.lblTitulo.Text = "Gestión de Supervisores";
            // 
            // btnRegresar
            // 
            this.btnRegresar.BackColor = System.Drawing.Color.Transparent;
            this.btnRegresar.FlatAppearance.BorderSize = 0;
            this.btnRegresar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRegresar.Font = new System.Drawing.Font("Segoe UI", 20F, System.Drawing.FontStyle.Bold);
            this.btnRegresar.ForeColor = System.Drawing.Color.White;
            this.btnRegresar.Location = new System.Drawing.Point(20, 12);
            this.btnRegresar.Name = "btnRegresar";
            this.btnRegresar.Size = new System.Drawing.Size(55, 50);
            this.btnRegresar.TabIndex = 0;
            this.btnRegresar.Text = "←";
            this.btnRegresar.UseVisualStyleBackColor = false;
            this.btnRegresar.Click += new System.EventHandler(this.btnRegresar_Click);
            // 
            // pnlPrincipal
            // 
            this.pnlPrincipal.BackColor = System.Drawing.Color.White;
            this.pnlPrincipal.Controls.Add(this.btnDesbloquear);
            this.pnlPrincipal.Controls.Add(this.btnDesactivar);
            this.pnlPrincipal.Controls.Add(this.btnActivar);
            this.pnlPrincipal.Controls.Add(this.btnAgregar);
            this.pnlPrincipal.Controls.Add(this.dgvSupervisores);
            this.pnlPrincipal.Controls.Add(this.lblIconoBuscar);
            this.pnlPrincipal.Controls.Add(this.txtBuscar);
            this.pnlPrincipal.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlPrincipal.Location = new System.Drawing.Point(0, 75);
            this.pnlPrincipal.Name = "pnlPrincipal";
            this.pnlPrincipal.Size = new System.Drawing.Size(1120, 595);
            this.pnlPrincipal.TabIndex = 1;
            // 
            // txtBuscar
            // 
            this.txtBuscar.Font = new System.Drawing.Font("Segoe UI", 11F);
            this.txtBuscar.ForeColor = System.Drawing.Color.Gray;
            this.txtBuscar.Location = new System.Drawing.Point(35, 25);
            this.txtBuscar.Name = "txtBuscar";
            this.txtBuscar.Size = new System.Drawing.Size(810, 32);
            this.txtBuscar.TabIndex = 0;
            this.txtBuscar.TextChanged += new System.EventHandler(this.txtBuscar_TextChanged);
            // 
            // lblIconoBuscar
            // 
            this.lblIconoBuscar.AutoSize = true;
            this.lblIconoBuscar.Font = new System.Drawing.Font("Segoe UI", 14F);
            this.lblIconoBuscar.ForeColor = System.Drawing.Color.Teal;
            this.lblIconoBuscar.Location = new System.Drawing.Point(852, 25);
            this.lblIconoBuscar.Name = "lblIconoBuscar";
            this.lblIconoBuscar.Size = new System.Drawing.Size(44, 32);
            this.lblIconoBuscar.TabIndex = 1;
            this.lblIconoBuscar.Text = "🔍";
            // 
            // btnAgregar
            // 
            this.btnAgregar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnAgregar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnAgregar.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(214)))), ((int)(((byte)(229)))));
            this.btnAgregar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAgregar.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnAgregar.ForeColor = System.Drawing.Color.Teal;
            this.btnAgregar.Location = new System.Drawing.Point(945, 21);
            this.btnAgregar.Name = "btnAgregar";
            this.btnAgregar.Size = new System.Drawing.Size(140, 38);
            this.btnAgregar.TabIndex = 2;
            this.btnAgregar.Text = "+ Agregar";
            this.btnAgregar.UseVisualStyleBackColor = false;
            this.btnAgregar.Click += new System.EventHandler(this.btnAgregar_Click);
            // 
            // dgvSupervisores
            // 
            this.dgvSupervisores.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
            | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvSupervisores.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvSupervisores.Location = new System.Drawing.Point(35, 80);
            this.dgvSupervisores.Name = "dgvSupervisores";
            this.dgvSupervisores.Size = new System.Drawing.Size(1050, 435);
            this.dgvSupervisores.TabIndex = 3;
            // 
            // btnActivar
            // 
            this.btnActivar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnActivar.BackColor = System.Drawing.Color.Teal;
            this.btnActivar.FlatAppearance.BorderSize = 0;
            this.btnActivar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnActivar.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnActivar.ForeColor = System.Drawing.Color.White;
            this.btnActivar.Location = new System.Drawing.Point(640, 532);
            this.btnActivar.Name = "btnActivar";
            this.btnActivar.Size = new System.Drawing.Size(140, 38);
            this.btnActivar.TabIndex = 4;
            this.btnActivar.Text = "Activar";
            this.btnActivar.UseVisualStyleBackColor = false;
            this.btnActivar.Click += new System.EventHandler(this.btnActivar_Click);
            // 
            // btnDesactivar
            // 
            this.btnDesactivar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnDesactivar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(76)))), ((int)(((byte)(60)))));
            this.btnDesactivar.FlatAppearance.BorderSize = 0;
            this.btnDesactivar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDesactivar.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnDesactivar.ForeColor = System.Drawing.Color.White;
            this.btnDesactivar.Location = new System.Drawing.Point(792, 532);
            this.btnDesactivar.Name = "btnDesactivar";
            this.btnDesactivar.Size = new System.Drawing.Size(140, 38);
            this.btnDesactivar.TabIndex = 5;
            this.btnDesactivar.Text = "Desactivar";
            this.btnDesactivar.UseVisualStyleBackColor = false;
            this.btnDesactivar.Click += new System.EventHandler(this.btnDesactivar_Click);
            // 
            // btnDesbloquear
            // 
            this.btnDesbloquear.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));

            this.btnDesbloquear.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(230)))), ((int)(((byte)(126)))), ((int)(((byte)(34)))));
            this.btnDesbloquear.FlatAppearance.BorderSize = 0;
            this.btnDesbloquear.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDesbloquear.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnDesbloquear.ForeColor = System.Drawing.Color.White;
            this.btnDesbloquear.Location = new System.Drawing.Point(945, 532);
            this.btnDesbloquear.Name = "btnDesbloquear";
            this.btnDesbloquear.Size = new System.Drawing.Size(140, 38);
            this.btnDesbloquear.TabIndex = 6;
            this.btnDesbloquear.Text = "Desbloquear";
            this.btnDesbloquear.UseVisualStyleBackColor = false;
            this.btnDesbloquear.Click += new System.EventHandler(this.btnDesbloquear_Click);
            //
            // gestiona_supervisor
            //
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1120, 670);
            this.Controls.Add(this.pnlPrincipal);
            this.Controls.Add(this.pnlSuperior);
            this.Name = "gestiona_supervisor";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "ElectroHogar - Gestión de Supervisores";
            this.pnlSuperior.ResumeLayout(false);
            this.pnlSuperior.PerformLayout();
            this.pnlPrincipal.ResumeLayout(false);
            this.pnlPrincipal.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSupervisores)).EndInit();
            this.ResumeLayout(false);
        }
        #endregion
        private System.Windows.Forms.Panel pnlSuperior;
        private System.Windows.Forms.Button btnRegresar;
        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.Panel pnlPrincipal;
        private System.Windows.Forms.TextBox txtBuscar;
        private System.Windows.Forms.Label lblIconoBuscar;
        private System.Windows.Forms.Button btnAgregar;
        private System.Windows.Forms.DataGridView dgvSupervisores;
        private System.Windows.Forms.Button btnActivar;
        private System.Windows.Forms.Button btnDesactivar;
        private System.Windows.Forms.Button btnDesbloquear;
    }
}