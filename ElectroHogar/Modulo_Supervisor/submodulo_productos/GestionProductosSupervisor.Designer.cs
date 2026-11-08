namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    partial class GestionProductosSupervisor
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
            this.btnActualizarProducto = new System.Windows.Forms.Button();
            this.btnHistorialPrecios = new System.Windows.Forms.Button();
            this.btnProductosInactivos = new System.Windows.Forms.Button();
            this.btnAgregarPromocion = new System.Windows.Forms.Button();
            this.btnAgregarCategoria = new System.Windows.Forms.Button();
            this.btnAgregarProducto = new System.Windows.Forms.Button();
            this.dgvProductos = new System.Windows.Forms.DataGridView();
            this.lblIconoBuscar = new System.Windows.Forms.Label();
            this.txtBuscar = new System.Windows.Forms.TextBox();
            this.pnlSuperior.SuspendLayout();
            this.pnlPrincipal.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvProductos)).BeginInit();
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
            this.lblTitulo.Size = new System.Drawing.Size(268, 37);
            this.lblTitulo.TabIndex = 1;
            this.lblTitulo.Text = "Gestión de Inventario";
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
            this.pnlPrincipal.Controls.Add(this.btnActualizarProducto);
            this.pnlPrincipal.Controls.Add(this.btnHistorialPrecios);
            this.pnlPrincipal.Controls.Add(this.btnProductosInactivos);
            this.pnlPrincipal.Controls.Add(this.btnAgregarPromocion);
            this.pnlPrincipal.Controls.Add(this.btnAgregarCategoria);
            this.pnlPrincipal.Controls.Add(this.btnAgregarProducto);
            this.pnlPrincipal.Controls.Add(this.dgvProductos);
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
            this.txtBuscar.Size = new System.Drawing.Size(390, 32);
            this.txtBuscar.TabIndex = 0;
            this.txtBuscar.TextChanged += new System.EventHandler(this.txtBuscar_TextChanged);
            // 
            // lblIconoBuscar
            // 
            this.lblIconoBuscar.AutoSize = true;
            this.lblIconoBuscar.Font = new System.Drawing.Font("Segoe UI", 14F);
            this.lblIconoBuscar.ForeColor = System.Drawing.Color.Teal;
            this.lblIconoBuscar.Location = new System.Drawing.Point(430, 25);
            this.lblIconoBuscar.Name = "lblIconoBuscar";
            this.lblIconoBuscar.Size = new System.Drawing.Size(44, 32);
            this.lblIconoBuscar.TabIndex = 1;
            this.lblIconoBuscar.Text = "🔍";
            // 
            // btnAgregarProducto
            // 
            this.btnAgregarProducto.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnAgregarProducto.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnAgregarProducto.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(214)))), ((int)(((byte)(229)))));
            this.btnAgregarProducto.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAgregarProducto.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnAgregarProducto.ForeColor = System.Drawing.Color.Teal;
            this.btnAgregarProducto.Location = new System.Drawing.Point(500, 21);
            this.btnAgregarProducto.Name = "btnAgregarProducto";
            this.btnAgregarProducto.Size = new System.Drawing.Size(135, 38);
            this.btnAgregarProducto.TabIndex = 2;
            this.btnAgregarProducto.Text = "+ Producto";
            this.btnAgregarProducto.UseVisualStyleBackColor = false;
            this.btnAgregarProducto.Click += new System.EventHandler(this.btnAgregarProducto_Click);
            // 
            // btnAgregarCategoria
            // 
            this.btnAgregarCategoria.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnAgregarCategoria.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnAgregarCategoria.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(214)))), ((int)(((byte)(229)))));
            this.btnAgregarCategoria.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAgregarCategoria.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnAgregarCategoria.ForeColor = System.Drawing.Color.Teal;
            this.btnAgregarCategoria.Location = new System.Drawing.Point(645, 21);
            this.btnAgregarCategoria.Name = "btnAgregarCategoria";
            this.btnAgregarCategoria.Size = new System.Drawing.Size(135, 38);
            this.btnAgregarCategoria.TabIndex = 3;
            this.btnAgregarCategoria.Text = "+ Categoría";
            this.btnAgregarCategoria.UseVisualStyleBackColor = false;
            this.btnAgregarCategoria.Click += new System.EventHandler(this.btnAgregarCategoria_Click);
            // 
            // btnAgregarPromocion
            // 
            this.btnAgregarPromocion.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnAgregarPromocion.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(240)))), ((int)(((byte)(244)))), ((int)(((byte)(248)))));
            this.btnAgregarPromocion.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(200)))), ((int)(((byte)(214)))), ((int)(((byte)(229)))));
            this.btnAgregarPromocion.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAgregarPromocion.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnAgregarPromocion.ForeColor = System.Drawing.Color.Teal;
            this.btnAgregarPromocion.Location = new System.Drawing.Point(790, 21);
            this.btnAgregarPromocion.Name = "btnAgregarPromocion";
            this.btnAgregarPromocion.Size = new System.Drawing.Size(140, 38);
            this.btnAgregarPromocion.TabIndex = 4;
            this.btnAgregarPromocion.Text = "+ Promoción";
            this.btnAgregarPromocion.UseVisualStyleBackColor = false;
            this.btnAgregarPromocion.Click += new System.EventHandler(this.btnAgregarPromocion_Click);
            // 
            // btnProductosInactivos
            // 

            this.btnProductosInactivos.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnProductosInactivos.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(253)))), ((int)(((byte)(237)))), ((int)(((byte)(236)))));
            this.btnProductosInactivos.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(76)))), ((int)(((byte)(60)))));
            this.btnProductosInactivos.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnProductosInactivos.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnProductosInactivos.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(57)))), ((int)(((byte)(43)))));
            this.btnProductosInactivos.Location = new System.Drawing.Point(940, 21);
            this.btnProductosInactivos.Name = "btnProductosInactivos";
            this.btnProductosInactivos.Size = new System.Drawing.Size(145, 38);
            this.btnProductosInactivos.TabIndex = 5;
            this.btnProductosInactivos.Text = "Ver Inactivos";
            this.btnProductosInactivos.UseVisualStyleBackColor = false;
            this.btnProductosInactivos.Click += new System.EventHandler(this.btnProductosInactivos_Click);
            //
            // dgvProductos
            //
            this.dgvProductos.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
            | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvProductos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvProductos.Location = new System.Drawing.Point(35, 80);
            this.dgvProductos.Name = "dgvProductos";
            this.dgvProductos.Size = new System.Drawing.Size(1050, 435);
            this.dgvProductos.TabIndex = 6;
            //
            // btnActualizarProducto
            //
            this.btnActualizarProducto.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnActualizarProducto.BackColor = System.Drawing.Color.Teal;
            this.btnActualizarProducto.FlatAppearance.BorderSize = 0;
            this.btnActualizarProducto.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnActualizarProducto.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnActualizarProducto.ForeColor = System.Drawing.Color.White;
            this.btnActualizarProducto.Location = new System.Drawing.Point(660, 532);
            this.btnActualizarProducto.Name = "btnActualizarProducto";
            this.btnActualizarProducto.Size = new System.Drawing.Size(190, 38);
            this.btnActualizarProducto.TabIndex = 7;
            this.btnActualizarProducto.Text = "Actualizar Producto";
            this.btnActualizarProducto.UseVisualStyleBackColor = false;
            this.btnActualizarProducto.Click += new System.EventHandler(this.btnActualizarProducto_Click);
            //
            // btnHistorialPrecios
            //
            this.btnHistorialPrecios.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnHistorialPrecios.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.btnHistorialPrecios.FlatAppearance.BorderSize = 0;
            this.btnHistorialPrecios.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnHistorialPrecios.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnHistorialPrecios.ForeColor = System.Drawing.Color.White;
            this.btnHistorialPrecios.Location = new System.Drawing.Point(865, 532);
            this.btnHistorialPrecios.Name = "btnHistorialPrecios";
            this.btnHistorialPrecios.Size = new System.Drawing.Size(220, 38);
            this.btnHistorialPrecios.TabIndex = 8;
            this.btnHistorialPrecios.Text = "Ver Historial de Precios";
            this.btnHistorialPrecios.UseVisualStyleBackColor = false;
            this.btnHistorialPrecios.Click += new System.EventHandler(this.btnHistorialPrecios_Click);
            //
            // GestionProductosSupervisor
            //
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1120, 670);
            this.Controls.Add(this.pnlPrincipal);
            this.Controls.Add(this.pnlSuperior);
            this.Name = "GestionProductosSupervisor";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "ElectroHogar - Gestión de Inventario";
            this.pnlSuperior.ResumeLayout(false);
            this.pnlSuperior.PerformLayout();
            this.pnlPrincipal.ResumeLayout(false);
            this.pnlPrincipal.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvProductos)).EndInit();
            this.ResumeLayout(false);
        }
        #endregion
        private System.Windows.Forms.Panel pnlSuperior;
        private System.Windows.Forms.Button btnRegresar;
        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.Panel pnlPrincipal;
        private System.Windows.Forms.TextBox txtBuscar;
        private System.Windows.Forms.Label lblIconoBuscar;
        private System.Windows.Forms.Button btnAgregarProducto;
        private System.Windows.Forms.Button btnAgregarCategoria;
        private System.Windows.Forms.Button btnAgregarPromocion;
        private System.Windows.Forms.Button btnProductosInactivos;
        private System.Windows.Forms.DataGridView dgvProductos;
        private System.Windows.Forms.Button btnActualizarProducto;
        private System.Windows.Forms.Button btnHistorialPrecios;
    }
}