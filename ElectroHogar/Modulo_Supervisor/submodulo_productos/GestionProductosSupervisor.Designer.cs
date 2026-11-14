namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    partial class GestionProductosSupervisor
    {
        private System.ComponentModel.IContainer components = null;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null)) components.Dispose();
            base.Dispose(disposing);
        }

        private void InitializeComponent()
        {
            this.pnlSuperior = new System.Windows.Forms.Panel();
            this.lblTitulo = new System.Windows.Forms.Label();
            this.btnRegresar = new System.Windows.Forms.Button();
            this.pnlPrincipal = new System.Windows.Forms.Panel();
            this.btnHistorialPrecios = new System.Windows.Forms.Button();
            this.btnDesactivarProducto = new System.Windows.Forms.Button();
            this.btnActivarProducto = new System.Windows.Forms.Button();
            this.btnActualizarProducto = new System.Windows.Forms.Button();
            this.dgvProductos = new System.Windows.Forms.DataGridView();
            this.btnGestionarProveedores = new System.Windows.Forms.Button();
            this.btnGestionarPromociones = new System.Windows.Forms.Button();
            this.btnGestionarCategorias = new System.Windows.Forms.Button();
            this.btnAgregarProducto = new System.Windows.Forms.Button();
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
            this.pnlSuperior.Size = new System.Drawing.Size(1438, 75);
            this.pnlSuperior.TabIndex = 0;
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Segoe UI", 16F, System.Drawing.FontStyle.Bold);
            this.lblTitulo.ForeColor = System.Drawing.Color.White;
            this.lblTitulo.Location = new System.Drawing.Point(95, 20);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(294, 37);
            this.lblTitulo.TabIndex = 1;
            this.lblTitulo.Text = "Gestión de Inventario";
            // 
            // btnRegresar
            // 
            this.btnRegresar.BackColor = System.Drawing.Color.Transparent;
            this.btnRegresar.Cursor = System.Windows.Forms.Cursors.Hand;
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
            this.pnlPrincipal.Controls.Add(this.btnHistorialPrecios);
            this.pnlPrincipal.Controls.Add(this.btnDesactivarProducto);
            this.pnlPrincipal.Controls.Add(this.btnActivarProducto);
            this.pnlPrincipal.Controls.Add(this.btnActualizarProducto);
            this.pnlPrincipal.Controls.Add(this.dgvProductos);
            this.pnlPrincipal.Controls.Add(this.btnGestionarProveedores);
            this.pnlPrincipal.Controls.Add(this.btnGestionarPromociones);
            this.pnlPrincipal.Controls.Add(this.btnGestionarCategorias);
            this.pnlPrincipal.Controls.Add(this.btnAgregarProducto);
            this.pnlPrincipal.Controls.Add(this.txtBuscar);
            this.pnlPrincipal.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlPrincipal.Location = new System.Drawing.Point(0, 75);
            this.pnlPrincipal.Name = "pnlPrincipal";
            this.pnlPrincipal.Size = new System.Drawing.Size(1438, 690);
            this.pnlPrincipal.TabIndex = 1;
            // 
            // btnHistorialPrecios
            // 
            this.btnHistorialPrecios.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnHistorialPrecios.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.btnHistorialPrecios.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHistorialPrecios.FlatAppearance.BorderSize = 0;
            this.btnHistorialPrecios.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnHistorialPrecios.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnHistorialPrecios.ForeColor = System.Drawing.Color.White;
            this.btnHistorialPrecios.Location = new System.Drawing.Point(1135, 630);
            this.btnHistorialPrecios.Name = "btnHistorialPrecios";
            this.btnHistorialPrecios.Size = new System.Drawing.Size(268, 40);
            this.btnHistorialPrecios.TabIndex = 9;
            this.btnHistorialPrecios.Text = "Ver Historial de Precios";
            this.btnHistorialPrecios.UseVisualStyleBackColor = false;
            this.btnHistorialPrecios.Click += new System.EventHandler(this.btnHistorialPrecios_Click);
            // 
            // btnDesactivarProducto
            // 
            this.btnDesactivarProducto.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnDesactivarProducto.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(76)))), ((int)(((byte)(60)))));
            this.btnDesactivarProducto.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDesactivarProducto.FlatAppearance.BorderSize = 0;
            this.btnDesactivarProducto.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDesactivarProducto.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnDesactivarProducto.ForeColor = System.Drawing.Color.White;
            this.btnDesactivarProducto.Location = new System.Drawing.Point(1041, 18);
            this.btnDesactivarProducto.Name = "btnDesactivarProducto";
            this.btnDesactivarProducto.Size = new System.Drawing.Size(175, 40);
            this.btnDesactivarProducto.TabIndex = 8;
            this.btnDesactivarProducto.Text = "Desactivar Producto";
            this.btnDesactivarProducto.UseVisualStyleBackColor = false;
            this.btnDesactivarProducto.Click += new System.EventHandler(this.btnDesactivarProducto_Click);
            // 
            // btnActivarProducto
            // 
            this.btnActivarProducto.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnActivarProducto.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(46)))), ((int)(((byte)(204)))), ((int)(((byte)(113)))));
            this.btnActivarProducto.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnActivarProducto.FlatAppearance.BorderSize = 0;
            this.btnActivarProducto.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnActivarProducto.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnActivarProducto.ForeColor = System.Drawing.Color.White;
            this.btnActivarProducto.Location = new System.Drawing.Point(1243, 18);
            this.btnActivarProducto.Name = "btnActivarProducto";
            this.btnActivarProducto.Size = new System.Drawing.Size(160, 40);
            this.btnActivarProducto.TabIndex = 7;
            this.btnActivarProducto.Text = "Activar Producto";
            this.btnActivarProducto.UseVisualStyleBackColor = false;
            this.btnActivarProducto.Click += new System.EventHandler(this.btnActivarProducto_Click);
            // 
            // btnActualizarProducto
            // 
            this.btnActualizarProducto.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnActualizarProducto.BackColor = System.Drawing.Color.Teal;
            this.btnActualizarProducto.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnActualizarProducto.FlatAppearance.BorderSize = 0;
            this.btnActualizarProducto.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnActualizarProducto.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnActualizarProducto.ForeColor = System.Drawing.Color.White;
            this.btnActualizarProducto.Location = new System.Drawing.Point(850, 18);
            this.btnActualizarProducto.Name = "btnActualizarProducto";
            this.btnActualizarProducto.Size = new System.Drawing.Size(175, 40);
            this.btnActualizarProducto.TabIndex = 6;
            this.btnActualizarProducto.Text = "Actualizar Producto";
            this.btnActualizarProducto.UseVisualStyleBackColor = false;
            this.btnActualizarProducto.Click += new System.EventHandler(this.btnActualizarProducto_Click);
            // 
            // dgvProductos
            // 
            this.dgvProductos.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvProductos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvProductos.Location = new System.Drawing.Point(35, 75);
            this.dgvProductos.Name = "dgvProductos";
            this.dgvProductos.RowHeadersWidth = 51;
            this.dgvProductos.Size = new System.Drawing.Size(1368, 540);
            this.dgvProductos.TabIndex = 5;
            // 
            // btnGestionarProveedores
            // 
            this.btnGestionarProveedores.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnGestionarProveedores.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.btnGestionarProveedores.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnGestionarProveedores.FlatAppearance.BorderSize = 0;
            this.btnGestionarProveedores.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGestionarProveedores.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnGestionarProveedores.ForeColor = System.Drawing.Color.White;
            this.btnGestionarProveedores.Location = new System.Drawing.Point(692, 632);
            this.btnGestionarProveedores.Name = "btnGestionarProveedores";
            this.btnGestionarProveedores.Size = new System.Drawing.Size(211, 36);
            this.btnGestionarProveedores.TabIndex = 4;
            this.btnGestionarProveedores.Text = "Gestionar Proveedores";
            this.btnGestionarProveedores.UseVisualStyleBackColor = false;
            this.btnGestionarProveedores.Click += new System.EventHandler(this.btnGestionarProveedores_Click);
            // 
            // btnGestionarPromociones
            // 
            this.btnGestionarPromociones.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnGestionarPromociones.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.btnGestionarPromociones.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnGestionarPromociones.FlatAppearance.BorderSize = 0;
            this.btnGestionarPromociones.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGestionarPromociones.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnGestionarPromociones.ForeColor = System.Drawing.Color.White;
            this.btnGestionarPromociones.Location = new System.Drawing.Point(433, 634);
            this.btnGestionarPromociones.Name = "btnGestionarPromociones";
            this.btnGestionarPromociones.Size = new System.Drawing.Size(226, 36);
            this.btnGestionarPromociones.TabIndex = 3;
            this.btnGestionarPromociones.Text = "Gestionar Promociones";
            this.btnGestionarPromociones.UseVisualStyleBackColor = false;
            this.btnGestionarPromociones.Click += new System.EventHandler(this.btnGestionarPromociones_Click);
            // 
            // btnGestionarCategorias
            // 
            this.btnGestionarCategorias.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnGestionarCategorias.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.btnGestionarCategorias.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnGestionarCategorias.FlatAppearance.BorderSize = 0;
            this.btnGestionarCategorias.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGestionarCategorias.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnGestionarCategorias.ForeColor = System.Drawing.Color.White;
            this.btnGestionarCategorias.Location = new System.Drawing.Point(185, 634);
            this.btnGestionarCategorias.Name = "btnGestionarCategorias";
            this.btnGestionarCategorias.Size = new System.Drawing.Size(224, 36);
            this.btnGestionarCategorias.TabIndex = 2;
            this.btnGestionarCategorias.Text = "Gestionar Categorías";
            this.btnGestionarCategorias.UseVisualStyleBackColor = false;
            this.btnGestionarCategorias.Click += new System.EventHandler(this.btnGestionarCategorias_Click);
            // 
            // btnAgregarProducto
            // 
            this.btnAgregarProducto.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnAgregarProducto.BackColor = System.Drawing.Color.Teal;
            this.btnAgregarProducto.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnAgregarProducto.FlatAppearance.BorderSize = 0;
            this.btnAgregarProducto.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAgregarProducto.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnAgregarProducto.ForeColor = System.Drawing.Color.White;
            this.btnAgregarProducto.Location = new System.Drawing.Point(35, 632);
            this.btnAgregarProducto.Name = "btnAgregarProducto";
            this.btnAgregarProducto.Size = new System.Drawing.Size(130, 36);
            this.btnAgregarProducto.TabIndex = 1;
            this.btnAgregarProducto.Text = "+ Producto";
            this.btnAgregarProducto.UseVisualStyleBackColor = false;
            this.btnAgregarProducto.Click += new System.EventHandler(this.btnAgregarProducto_Click);
            // 
            // txtBuscar
            // 
            this.txtBuscar.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.txtBuscar.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.txtBuscar.Location = new System.Drawing.Point(35, 24);
            this.txtBuscar.Name = "txtBuscar";
            this.txtBuscar.Size = new System.Drawing.Size(624, 30);
            this.txtBuscar.TabIndex = 0;
            this.txtBuscar.TextChanged += new System.EventHandler(this.txtBuscar_TextChanged);
            // 
            // GestionProductosSupervisor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1438, 765);
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
        private System.Windows.Forms.Panel pnlSuperior;
        private System.Windows.Forms.Button btnRegresar;
        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.Panel pnlPrincipal;
        private System.Windows.Forms.TextBox txtBuscar;
        private System.Windows.Forms.Button btnAgregarProducto;
        private System.Windows.Forms.Button btnGestionarCategorias;
        private System.Windows.Forms.Button btnGestionarPromociones;
        private System.Windows.Forms.Button btnGestionarProveedores;
        private System.Windows.Forms.DataGridView dgvProductos;
        private System.Windows.Forms.Button btnActualizarProducto;
        private System.Windows.Forms.Button btnActivarProducto;
        private System.Windows.Forms.Button btnDesactivarProducto;
        private System.Windows.Forms.Button btnHistorialPrecios;
    }
}