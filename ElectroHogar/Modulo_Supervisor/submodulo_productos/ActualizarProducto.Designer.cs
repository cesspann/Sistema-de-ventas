namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    partial class ActualizarProducto
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
            this.lblProductoInfo = new System.Windows.Forms.Label();
            this.lblPrecioActual = new System.Windows.Forms.Label();
            this.txtPrecioActual = new System.Windows.Forms.TextBox();
            this.lblNuevoPrecio = new System.Windows.Forms.Label();
            this.numNuevoPrecio = new System.Windows.Forms.NumericUpDown();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.pnlSuperior.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numNuevoPrecio)).BeginInit();
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
            this.lblTitulo.Size = new System.Drawing.Size(277, 30);
            this.lblTitulo.TabIndex = 0;
            this.lblTitulo.Text = "Actualizar Precio Producto";
            // 
            // lblProductoInfo
            // 
            this.lblProductoInfo.AutoSize = true;
            this.lblProductoInfo.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Italic);
            this.lblProductoInfo.ForeColor = System.Drawing.Color.Teal;
            this.lblProductoInfo.Location = new System.Drawing.Point(25, 75);
            this.lblProductoInfo.Name = "lblProductoInfo";
            this.lblProductoInfo.Size = new System.Drawing.Size(164, 21);
            this.lblProductoInfo.TabIndex = 1;
            this.lblProductoInfo.Text = "Producto Seleccionado";
            // 
            // lblPrecioActual
            // 
            this.lblPrecioActual.AutoSize = true;
            this.lblPrecioActual.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.lblPrecioActual.ForeColor = System.Drawing.Color.DimGray;
            this.lblPrecioActual.Location = new System.Drawing.Point(25, 110);
            this.lblPrecioActual.Name = "lblPrecioActual";
            this.lblPrecioActual.Size = new System.Drawing.Size(119, 23);
            this.lblPrecioActual.TabIndex = 2;
            this.lblPrecioActual.Text = "Precio Actual:";
            // 
            // txtPrecioActual
            // 
            this.txtPrecioActual.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(245)))), ((int)(((byte)(247)))), ((int)(((byte)(250)))));
            this.txtPrecioActual.Font = new System.Drawing.Font("Segoe UI", 10.5F);
            this.txtPrecioActual.Location = new System.Drawing.Point(25, 136);
            this.txtPrecioActual.Name = "txtPrecioActual";
            this.txtPrecioActual.ReadOnly = true;
            this.txtPrecioActual.Size = new System.Drawing.Size(385, 31);
            this.txtPrecioActual.TabIndex = 3;
            // 
            // lblNuevoPrecio
            // 
            this.lblNuevoPrecio.AutoSize = true;
            this.lblNuevoPrecio.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.lblNuevoPrecio.ForeColor = System.Drawing.Color.DimGray;
            this.lblNuevoPrecio.Location = new System.Drawing.Point(25, 185);
            this.lblNuevoPrecio.Name = "lblNuevoPrecio";
            this.lblNuevoPrecio.Size = new System.Drawing.Size(166, 23);
            this.lblNuevoPrecio.TabIndex = 4;
            this.lblNuevoPrecio.Text = "Nuevo Precio ($):*";
            // 
            // numNuevoPrecio
            // 
            this.numNuevoPrecio.DecimalPlaces = 2;
            this.numNuevoPrecio.Font = new System.Drawing.Font("Segoe UI", 10.5F);
            this.numNuevoPrecio.Location = new System.Drawing.Point(25, 211);
            this.numNuevoPrecio.Maximum = new decimal(new int[] { 10000000, 0, 0, 0 });
            this.numNuevoPrecio.Name = "numNuevoPrecio";
            this.numNuevoPrecio.Size = new System.Drawing.Size(385, 31);
            this.numNuevoPrecio.TabIndex = 5;
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
            // ActualizarProducto
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(440, 330);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.btnGuardar);
            this.Controls.Add(this.numNuevoPrecio);
            this.Controls.Add(this.lblNuevoPrecio);
            this.Controls.Add(this.txtPrecioActual);
            this.Controls.Add(this.lblPrecioActual);
            this.Controls.Add(this.lblProductoInfo);
            this.Controls.Add(this.pnlSuperior);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "ActualizarProducto";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "ElectroHogar - Actualizar Precio Producto";
            this.pnlSuperior.ResumeLayout(false);
            this.pnlSuperior.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numNuevoPrecio)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();
        }

        #endregion

        private System.Windows.Forms.Panel pnlSuperior;
        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.Label lblProductoInfo;
        private System.Windows.Forms.Label lblPrecioActual;
        private System.Windows.Forms.TextBox txtPrecioActual;
        private System.Windows.Forms.Label lblNuevoPrecio;
        private System.Windows.Forms.NumericUpDown numNuevoPrecio;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Button btnCancelar;
    }
}
