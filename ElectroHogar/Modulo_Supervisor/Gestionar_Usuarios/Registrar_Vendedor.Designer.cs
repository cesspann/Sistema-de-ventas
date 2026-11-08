namespace ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios
{
    partial class Registrar_Vendedor
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
            this.grpCuenta = new System.Windows.Forms.GroupBox();
            this.txtClave = new System.Windows.Forms.TextBox();
            this.lblClave = new System.Windows.Forms.Label();
            this.txtUsuario = new System.Windows.Forms.TextBox();
            this.lblUsuario = new System.Windows.Forms.Label();
            this.grpDatosPersonales = new System.Windows.Forms.GroupBox();
            this.txtDireccion = new System.Windows.Forms.TextBox();
            this.lblDireccion = new System.Windows.Forms.Label();
            this.txtTelefono = new System.Windows.Forms.TextBox();
            this.lblTelefono = new System.Windows.Forms.Label();
            this.txtCorreo = new System.Windows.Forms.TextBox();
            this.lblCorreo = new System.Windows.Forms.Label();
            this.txtDui = new System.Windows.Forms.TextBox();
            this.lblDui = new System.Windows.Forms.Label();
            this.txtNombre = new System.Windows.Forms.TextBox();
            this.lblNombre = new System.Windows.Forms.Label();
            this.grpDatosVendedor = new System.Windows.Forms.GroupBox();
            this.numMetaMensual = new System.Windows.Forms.NumericUpDown();
            this.lblMetaMensual = new System.Windows.Forms.Label();
            this.numComision = new System.Windows.Forms.NumericUpDown();
            this.lblComision = new System.Windows.Forms.Label();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.btnCancelar = new System.Windows.Forms.Button();
            this.pnlSuperior.SuspendLayout();
            this.grpCuenta.SuspendLayout();
            this.grpDatosPersonales.SuspendLayout();
            this.grpDatosVendedor.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numMetaMensual)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numComision)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlSuperior
            // 
            this.pnlSuperior.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.pnlSuperior.Controls.Add(this.lblTitulo);
            this.pnlSuperior.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlSuperior.Location = new System.Drawing.Point(0, 0);
            this.pnlSuperior.Name = "pnlSuperior";
            this.pnlSuperior.Size = new System.Drawing.Size(560, 60);
            this.pnlSuperior.TabIndex = 0;
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Segoe UI", 13.5F, System.Drawing.FontStyle.Bold);
            this.lblTitulo.ForeColor = System.Drawing.Color.White;
            this.lblTitulo.Location = new System.Drawing.Point(20, 14);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(228, 31);
            this.lblTitulo.TabIndex = 0;
            this.lblTitulo.Text = "Registrar Vendedor";
            // 
            // grpCuenta
            // 
            this.grpCuenta.Controls.Add(this.txtClave);
            this.grpCuenta.Controls.Add(this.lblClave);
            this.grpCuenta.Controls.Add(this.txtUsuario);
            this.grpCuenta.Controls.Add(this.lblUsuario);
            this.grpCuenta.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.grpCuenta.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.grpCuenta.Location = new System.Drawing.Point(20, 75);
            this.grpCuenta.Name = "grpCuenta";
            this.grpCuenta.Size = new System.Drawing.Size(520, 95);
            this.grpCuenta.TabIndex = 1;
            this.grpCuenta.TabStop = false;
            this.grpCuenta.Text = "Credenciales de Acceso";
            // 
            // lblUsuario
            // 
            this.lblUsuario.AutoSize = true;
            this.lblUsuario.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblUsuario.ForeColor = System.Drawing.Color.DimGray;
            this.lblUsuario.Location = new System.Drawing.Point(15, 28);
            this.lblUsuario.Name = "lblUsuario";
            this.lblUsuario.Size = new System.Drawing.Size(75, 20);
            this.lblUsuario.TabIndex = 0;
            this.lblUsuario.Text = "Usuario:*";
            // 
            // txtUsuario
            // 
            this.txtUsuario.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtUsuario.Location = new System.Drawing.Point(15, 50);
            this.txtUsuario.MaxLength = 50;
            this.txtUsuario.Name = "txtUsuario";
            this.txtUsuario.Size = new System.Drawing.Size(235, 29);
            this.txtUsuario.TabIndex = 1;
            // 
            // lblClave
            // 
            this.lblClave.AutoSize = true;
            this.lblClave.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblClave.ForeColor = System.Drawing.Color.DimGray;
            this.lblClave.Location = new System.Drawing.Point(270, 28);
            this.lblClave.Name = "lblClave";
            this.lblClave.Size = new System.Drawing.Size(104, 20);
            this.lblClave.TabIndex = 2;
            this.lblClave.Text = "Contraseña:*";
            // 
            // txtClave
            // 
            this.txtClave.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtClave.Location = new System.Drawing.Point(270, 50);
            this.txtClave.MaxLength = 100;
            this.txtClave.Name = "txtClave";
            this.txtClave.PasswordChar = '●';
            this.txtClave.Size = new System.Drawing.Size(235, 29);
            this.txtClave.TabIndex = 3;
            // 
            // grpDatosPersonales
            // 
            this.grpDatosPersonales.Controls.Add(this.txtDireccion);
            this.grpDatosPersonales.Controls.Add(this.lblDireccion);
            this.grpDatosPersonales.Controls.Add(this.txtTelefono);
            this.grpDatosPersonales.Controls.Add(this.lblTelefono);
            this.grpDatosPersonales.Controls.Add(this.txtCorreo);
            this.grpDatosPersonales.Controls.Add(this.lblCorreo);
            this.grpDatosPersonales.Controls.Add(this.txtDui);
            this.grpDatosPersonales.Controls.Add(this.lblDui);
            this.grpDatosPersonales.Controls.Add(this.txtNombre);
            this.grpDatosPersonales.Controls.Add(this.lblNombre);
            this.grpDatosPersonales.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.grpDatosPersonales.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.grpDatosPersonales.Location = new System.Drawing.Point(20, 182);
            this.grpDatosPersonales.Name = "grpDatosPersonales";
            this.grpDatosPersonales.Size = new System.Drawing.Size(520, 225);
            this.grpDatosPersonales.TabIndex = 2;
            this.grpDatosPersonales.TabStop = false;
            this.grpDatosPersonales.Text = "Datos Personales del Empleado";
            // 
            // lblNombre
            // 
            this.lblNombre.AutoSize = true;
            this.lblNombre.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblNombre.ForeColor = System.Drawing.Color.DimGray;
            this.lblNombre.Location = new System.Drawing.Point(15, 28);
            this.lblNombre.Name = "lblNombre";
            this.lblNombre.Size = new System.Drawing.Size(154, 20);
            this.lblNombre.TabIndex = 0;
            this.lblNombre.Text = "Nombre Completo:*";
            // 
            // txtNombre
            // 
            this.txtNombre.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtNombre.Location = new System.Drawing.Point(15, 50);
            this.txtNombre.MaxLength = 150;
            this.txtNombre.Name = "txtNombre";
            this.txtNombre.Size = new System.Drawing.Size(320, 29);
            this.txtNombre.TabIndex = 1;
            // 
            // lblDui
            // 
            this.lblDui.AutoSize = true;
            this.lblDui.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblDui.ForeColor = System.Drawing.Color.DimGray;
            this.lblDui.Location = new System.Drawing.Point(350, 28);
            this.lblDui.Name = "lblDui";
            this.lblDui.Size = new System.Drawing.Size(48, 20);
            this.lblDui.TabIndex = 2;
            this.lblDui.Text = "DUI:*";
            // 
            // txtDui
            // 
            this.txtDui.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtDui.Location = new System.Drawing.Point(350, 50);
            this.txtDui.MaxLength = 12;
            this.txtDui.Name = "txtDui";
            this.txtDui.Size = new System.Drawing.Size(155, 29);
            this.txtDui.TabIndex = 3;
            // 
            // lblCorreo
            // 
            this.lblCorreo.AutoSize = true;

            this.lblCorreo.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblCorreo.ForeColor = System.Drawing.Color.DimGray;
            this.lblCorreo.Location = new System.Drawing.Point(15, 88);
            this.lblCorreo.Name = "lblCorreo";
            this.lblCorreo.Size = new System.Drawing.Size(150, 20);
            this.lblCorreo.TabIndex = 4;
            this.lblCorreo.Text = "Correo Electrónico:";
            //
            // txtCorreo
            //
            this.txtCorreo.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtCorreo.Location = new System.Drawing.Point(15, 110);
            this.txtCorreo.MaxLength = 150;
            this.txtCorreo.Name = "txtCorreo";
            this.txtCorreo.Size = new System.Drawing.Size(320, 29);
            this.txtCorreo.TabIndex = 5;
            //
            // lblTelefono
            //
            this.lblTelefono.AutoSize = true;
            this.lblTelefono.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblTelefono.ForeColor = System.Drawing.Color.DimGray;
            this.lblTelefono.Location = new System.Drawing.Point(350, 88);
            this.lblTelefono.Name = "lblTelefono";
            this.lblTelefono.Size = new System.Drawing.Size(78, 20);
            this.lblTelefono.TabIndex = 6;
            this.lblTelefono.Text = "Teléfono:";
            //
            // txtTelefono
            //
            this.txtTelefono.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtTelefono.Location = new System.Drawing.Point(350, 110);
            this.txtTelefono.MaxLength = 20;
            this.txtTelefono.Name = "txtTelefono";
            this.txtTelefono.Size = new System.Drawing.Size(155, 29);
            this.txtTelefono.TabIndex = 7;
            //
            // lblDireccion
            //
            this.lblDireccion.AutoSize = true;
            this.lblDireccion.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblDireccion.ForeColor = System.Drawing.Color.DimGray;
            this.lblDireccion.Location = new System.Drawing.Point(15, 148);
            this.lblDireccion.Name = "lblDireccion";
            this.lblDireccion.Size = new System.Drawing.Size(83, 20);
            this.lblDireccion.TabIndex = 8;
            this.lblDireccion.Text = "Dirección:";
            //
            // txtDireccion
            //
            this.txtDireccion.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtDireccion.Location = new System.Drawing.Point(15, 170);
            this.txtDireccion.MaxLength = 200;
            this.txtDireccion.Name = "txtDireccion";
            this.txtDireccion.Size = new System.Drawing.Size(490, 29);
            this.txtDireccion.TabIndex = 9;
            //
            // grpDatosVendedor
            //
            this.grpDatosVendedor.Controls.Add(this.numMetaMensual);
            this.grpDatosVendedor.Controls.Add(this.lblMetaMensual);
            this.grpDatosVendedor.Controls.Add(this.numComision);
            this.grpDatosVendedor.Controls.Add(this.lblComision);
            this.grpDatosVendedor.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.grpDatosVendedor.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.grpDatosVendedor.Location = new System.Drawing.Point(20, 420);
            this.grpDatosVendedor.Name = "grpDatosVendedor";
            this.grpDatosVendedor.Size = new System.Drawing.Size(520, 95);
            this.grpDatosVendedor.TabIndex = 3;
            this.grpDatosVendedor.TabStop = false;
            this.grpDatosVendedor.Text = "Condiciones del Vendedor";
            //
            // lblComision
            //
            this.lblComision.AutoSize = true;
            this.lblComision.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblComision.ForeColor = System.Drawing.Color.DimGray;
            this.lblComision.Location = new System.Drawing.Point(15, 28);
            this.lblComision.Name = "lblComision";
            this.lblComision.Size = new System.Drawing.Size(113, 20);
            this.lblComision.TabIndex = 0;
            this.lblComision.Text = "Comisión (%):";
            //
            // numComision
            //
            this.numComision.DecimalPlaces = 2;
            this.numComision.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.numComision.Increment = new decimal(new int[] { 5, 0, 0, 65536 });
            this.numComision.Location = new System.Drawing.Point(15, 50);
            this.numComision.Name = "numComision";
            this.numComision.Size = new System.Drawing.Size(235, 29);
            this.numComision.TabIndex = 1;
            //
            // lblMetaMensual
            //
            this.lblMetaMensual.AutoSize = true;
            this.lblMetaMensual.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblMetaMensual.ForeColor = System.Drawing.Color.DimGray;
            this.lblMetaMensual.Location = new System.Drawing.Point(270, 28);
            this.lblMetaMensual.Name = "lblMetaMensual";
            this.lblMetaMensual.Size = new System.Drawing.Size(140, 20);
            this.lblMetaMensual.TabIndex = 2;
            this.lblMetaMensual.Text = "Meta Mensual ($):";
            //
            // numMetaMensual
            //
            this.numMetaMensual.DecimalPlaces = 2;
            this.numMetaMensual.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.numMetaMensual.Increment = new decimal(new int[] { 100, 0, 0, 0 });
            this.numMetaMensual.Location = new System.Drawing.Point(270, 50);
            this.numMetaMensual.Maximum = new decimal(new int[] { 10000000, 0, 0, 0 });
            this.numMetaMensual.Name = "numMetaMensual";
            this.numMetaMensual.Size = new System.Drawing.Size(235, 29);
            this.numMetaMensual.TabIndex = 3;
            //
            // btnGuardar
            //
            this.btnGuardar.BackColor = System.Drawing.Color.Teal;
            this.btnGuardar.FlatAppearance.BorderSize = 0;
            this.btnGuardar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGuardar.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.btnGuardar.ForeColor = System.Drawing.Color.White;
            this.btnGuardar.Location = new System.Drawing.Point(400, 535);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(140, 38);
            this.btnGuardar.TabIndex = 4;
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
            this.btnCancelar.Location = new System.Drawing.Point(265, 535);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(120, 38);
            this.btnCancelar.TabIndex = 5;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = false;
            this.btnCancelar.Click += new System.EventHandler(this.btnCancelar_Click);
            //
            // Registrar_Vendedor
            //
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(560, 595);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.btnGuardar);
            this.Controls.Add(this.grpDatosVendedor);
            this.Controls.Add(this.grpDatosPersonales);
            this.Controls.Add(this.grpCuenta);
            this.Controls.Add(this.pnlSuperior);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "Registrar_Vendedor";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "ElectroHogar - Registrar Vendedor";
            this.pnlSuperior.ResumeLayout(false);
            this.pnlSuperior.PerformLayout();
            this.grpCuenta.ResumeLayout(false);
            this.grpCuenta.PerformLayout();
            this.grpDatosPersonales.ResumeLayout(false);
            this.grpDatosPersonales.PerformLayout();
            this.grpDatosVendedor.ResumeLayout(false);
            this.grpDatosVendedor.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numMetaMensual)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numComision)).EndInit();
            this.ResumeLayout(false);
        }
        #endregion
        private System.Windows.Forms.Panel pnlSuperior;
        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.GroupBox grpCuenta;
        private System.Windows.Forms.Label lblUsuario;
        private System.Windows.Forms.TextBox txtUsuario;
        private System.Windows.Forms.Label lblClave;
        private System.Windows.Forms.TextBox txtClave;
        private System.Windows.Forms.GroupBox grpDatosPersonales;
        private System.Windows.Forms.Label lblNombre;
        private System.Windows.Forms.TextBox txtNombre;
        private System.Windows.Forms.Label lblDui;
        private System.Windows.Forms.TextBox txtDui;
        private System.Windows.Forms.Label lblCorreo;
        private System.Windows.Forms.TextBox txtCorreo;
        private System.Windows.Forms.Label lblTelefono;
        private System.Windows.Forms.TextBox txtTelefono;
        private System.Windows.Forms.Label lblDireccion;
        private System.Windows.Forms.TextBox txtDireccion;
        private System.Windows.Forms.GroupBox grpDatosVendedor;
        private System.Windows.Forms.Label lblComision;
        private System.Windows.Forms.NumericUpDown numComision;
        private System.Windows.Forms.Label lblMetaMensual;
        private System.Windows.Forms.NumericUpDown numMetaMensual;
        private System.Windows.Forms.Button btnGuardar;
        private System.Windows.Forms.Button btnCancelar;
    }
}