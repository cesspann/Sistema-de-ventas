namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    partial class productosInactivos
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
            this.btnActivarProducto = new System.Windows.Forms.Button();
            this.dgvProductosInactivos = new System.Windows.Forms.DataGridView();
            this.lblIconoBuscar = new System.Windows.Forms.Label();
            this.txtBuscar = new System.Windows.Forms.TextBox();
            this.pnlSuperior.SuspendLayout();
            this.pnlPrincipal.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvProductosInactivos)).BeginInit();
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
            this.pnlSuperior.Size = new System.Drawing.Size(1020, 70);
            this.pnlSuperior.TabIndex = 0;
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Segoe UI", 15F, System.Drawing.FontStyle.Bold);
            this.lblTitulo.ForeColor = System.Drawing.Color.White;
            this.lblTitulo.Location = new System.Drawing.Point(85, 18);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(244, 35);
            this.lblTitulo.TabIndex = 1;
            this.lblTitulo.Text = "Productos Inactivos";
            // 
            // btnRegresar
            // 
            this.btnRegresar.BackColor = System.Drawing.Color.Transparent;
            this.btnRegresar.FlatAppearance.BorderSize = 0;
            this.btnRegresar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRegresar.Font = new System.Drawing.Font("Segoe UI", 20F, System.Drawing.FontStyle.Bold);
            this.btnRegresar.ForeColor = System.Drawing.Color.White;
            this.btnRegresar.Location = new System.Drawing.Point(18, 10);
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
            this.pnlPrincipal.Controls.Add(this.btnActivarProducto);
            this.pnlPrincipal.Controls.Add(this.dgvProductosInactivos);
            this.pnlPrincipal.Controls.Add(this.lblIconoBuscar);
            this.pnlPrincipal.Controls.Add(this.txtBuscar);
            this.pnlPrincipal.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlPrincipal.Location = new System.Drawing.Point(0, 70);
            this.pnlPrincipal.Name = "pnlPrincipal";
            this.pnlPrincipal.Size = new System.Drawing.Size(1020, 540);
            this.pnlPrincipal.TabIndex = 1;
            // 
            // txtBuscar
            // 
            this.txtBuscar.Font = new System.Drawing.Font("Segoe UI", 10.5F);
            this.txtBuscar.ForeColor = System.Drawing.Color.Gray;
            this.txtBuscar.Location = new System.Drawing.Point(30, 22);
            this.txtBuscar.Name = "txtBuscar";
            this.txtBuscar.Size = new System.Drawing.Size(905, 31);
            this.txtBuscar.TabIndex = 0;
            this.txtBuscar.TextChanged += new System.EventHandler(this.txtBuscar_TextChanged);
            // 
            // lblIconoBuscar
            // 
            this.lblIconoBuscar.AutoSize = true;
            this.lblIconoBuscar.Font = new System.Drawing.Font("Segoe UI", 14F);
            this.lblIconoBuscar.ForeColor = System.Drawing.Color.Teal;
            this.lblIconoBuscar.Location = new System.Drawing.Point(942, 21);
            this.lblIconoBuscar.Name = "lblIconoBuscar";
            this.lblIconoBuscar.Size = new System.Drawing.Size(44, 32);
            this.lblIconoBuscar.TabIndex = 1;
            this.lblIconoBuscar.Text = "🔍";
            // 
            // dgvProductosInactivos
            // 
            this.dgvProductosInactivos.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
            | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvProductosInactivos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvProductosInactivos.Location = new System.Drawing.Point(30, 72);
            this.dgvProductosInactivos.Name = "dgvProductosInactivos";
            this.dgvProductosInactivos.Size = new System.Drawing.Size(955, 395);
            this.dgvProductosInactivos.TabIndex = 2;
            // 
            // btnActivarProducto
            // 
            this.btnActivarProducto.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnActivarProducto.BackColor = System.Drawing.Color.Teal;
            this.btnActivarProducto.FlatAppearance.BorderSize = 0;
            this.btnActivarProducto.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnActivarProducto.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnActivarProducto.ForeColor = System.Drawing.Color.White;
            this.btnActivarProducto.Location = new System.Drawing.Point(795, 483);
            this.btnActivarProducto.Name = "btnActivarProducto";
            this.btnActivarProducto.Size = new System.Drawing.Size(190, 38);
            this.btnActivarProducto.TabIndex = 3;
            this.btnActivarProducto.Text = "Activar Producto";
            this.btnActivarProducto.UseVisualStyleBackColor = false;
            this.btnActivarProducto.Click += new System.EventHandler(this.btnActivarProducto_Click);
            // 
            // productosInactivos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1020, 610);
            this.Controls.Add(this.pnlPrincipal);
            this.Controls.Add(this.pnlSuperior);
            this.Name = "productosInactivos";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "ElectroHogar - Productos Inactivos";
            this.pnlSuperior.ResumeLayout(false);
            this.pnlSuperior.PerformLayout();
            this.pnlPrincipal.ResumeLayout(false);
            this.pnlPrincipal.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvProductosInactivos)).EndInit();
            this.ResumeLayout(false);
        }

        #endregion

        private System.Windows.Forms.Panel pnlSuperior;
        private System.Windows.Forms.Button btnRegresar;
        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.Panel pnlPrincipal;
        private System.Windows.Forms.TextBox txtBuscar;
        private System.Windows.Forms.Label lblIconoBuscar;
        private System.Windows.Forms.DataGridView dgvProductosInactivos;
        private System.Windows.Forms.Button btnActivarProducto;
    }
}
