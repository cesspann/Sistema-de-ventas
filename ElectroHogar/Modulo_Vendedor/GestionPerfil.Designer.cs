namespace ElectroHogar.Modulo_Vendedor
{
    partial class GestionPerfil
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
            this.lblUsuarioTitulo = new System.Windows.Forms.Label();
            this.grpDatosPersonales = new System.Windows.Forms.GroupBox();
            this.btnGuardarDatos = new System.Windows.Forms.Button();
            this.txtTelefono = new System.Windows.Forms.TextBox();
            this.lblTelefono = new System.Windows.Forms.Label();
            this.txtDireccion = new System.Windows.Forms.TextBox();
            this.lblDireccion = new System.Windows.Forms.Label();
            this.txtCorreo = new System.Windows.Forms.TextBox();
            this.lblCorreo = new System.Windows.Forms.Label();
            this.grpSeguridad = new System.Windows.Forms.GroupBox();
            this.btnCambiarContrasena = new System.Windows.Forms.Button();
            this.txtConfirmarContrasena = new System.Windows.Forms.TextBox();
            this.lblConfirmar = new System.Windows.Forms.Label();
            this.txtNuevaContrasena = new System.Windows.Forms.TextBox();
            this.lblNuevaContra = new System.Windows.Forms.Label();
            this.grpZonaPeligro = new System.Windows.Forms.GroupBox();
            this.lblAvisoDesactivar = new System.Windows.Forms.Label();
            this.btnDesactivarCuenta = new System.Windows.Forms.Button();
            this.pnlSuperior.SuspendLayout();
            this.grpDatosPersonales.SuspendLayout();
            this.grpSeguridad.SuspendLayout();
            this.grpZonaPeligro.SuspendLayout();
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
            this.pnlSuperior.Size = new System.Drawing.Size(580, 68);
            this.pnlSuperior.TabIndex = 0;
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Segoe UI", 15F, System.Drawing.FontStyle.Bold);
            this.lblTitulo.ForeColor = System.Drawing.Color.White;
            this.lblTitulo.Location = new System.Drawing.Point(85, 17);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(198, 35);
            this.lblTitulo.TabIndex = 1;
            this.lblTitulo.Text = "Gestión de Perfil";
            // 
            // btnRegresar
            // 
            this.btnRegresar.BackColor = System.Drawing.Color.Transparent;
            this.btnRegresar.FlatAppearance.BorderSize = 0;
            this.btnRegresar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRegresar.Font = new System.Drawing.Font("Segoe UI", 20F, System.Drawing.FontStyle.Bold);
            this.btnRegresar.ForeColor = System.Drawing.Color.White;
            this.btnRegresar.Location = new System.Drawing.Point(15, 9);
            this.btnRegresar.Name = "btnRegresar";
            this.btnRegresar.Size = new System.Drawing.Size(55, 50);
            this.btnRegresar.TabIndex = 0;
            this.btnRegresar.Text = "←";
            this.btnRegresar.UseVisualStyleBackColor = false;
            this.btnRegresar.Click += new System.EventHandler(this.btnRegresar_Click);
            // 
            // lblUsuarioTitulo
            // 
            this.lblUsuarioTitulo.AutoSize = true;
            this.lblUsuarioTitulo.Font = new System.Drawing.Font("Segoe UI", 10.5F, System.Drawing.FontStyle.Bold);
            this.lblUsuarioTitulo.ForeColor = System.Drawing.Color.Teal;
            this.lblUsuarioTitulo.Location = new System.Drawing.Point(25, 82);
            this.lblUsuarioTitulo.Name = "lblUsuarioTitulo";
            this.lblUsuarioTitulo.Size = new System.Drawing.Size(262, 25);
            this.lblUsuarioTitulo.TabIndex = 1;
            this.lblUsuarioTitulo.Text = "Usuario: vendedor (ID Empleado: 1)";
            // 
            // grpDatosPersonales
            // 
            this.grpDatosPersonales.Controls.Add(this.btnGuardarDatos);
            this.grpDatosPersonales.Controls.Add(this.txtTelefono);
            this.grpDatosPersonales.Controls.Add(this.lblTelefono);
            this.grpDatosPersonales.Controls.Add(this.txtDireccion);
            this.grpDatosPersonales.Controls.Add(this.lblDireccion);
            this.grpDatosPersonales.Controls.Add(this.txtCorreo);
            this.grpDatosPersonales.Controls.Add(this.lblCorreo);
            this.grpDatosPersonales.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.grpDatosPersonales.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.grpDatosPersonales.Location = new System.Drawing.Point(25, 118);
            this.grpDatosPersonales.Name = "grpDatosPersonales";
            this.grpDatosPersonales.Size = new System.Drawing.Size(530, 235);
            this.grpDatosPersonales.TabIndex = 2;
            this.grpDatosPersonales.TabStop = false;
            this.grpDatosPersonales.Text = "Datos de Contacto";
            // 
            // lblCorreo
            // 
            this.lblCorreo.AutoSize = true;
            this.lblCorreo.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.lblCorreo.ForeColor = System.Drawing.Color.DimGray;
            this.lblCorreo.Location = new System.Drawing.Point(18, 35);
            this.lblCorreo.Name = "lblCorreo";
            this.lblCorreo.Size = new System.Drawing.Size(156, 21);
            this.lblCorreo.TabIndex = 0;
            this.lblCorreo.Text = "Correo Electrónico:";
            // 
            // txtCorreo
            // 
            this.txtCorreo.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.txtCorreo.Location = new System.Drawing.Point(190, 31);
            this.txtCorreo.MaxLength = 150;
            this.txtCorreo.Name = "txtCorreo";
            this.txtCorreo.Size = new System.Drawing.Size(315, 30);
            this.txtCorreo.TabIndex = 1;
            // 
            // lblDireccion
            // 
            this.lblDireccion.AutoSize = true;
            this.lblDireccion.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.lblDireccion.ForeColor = System.Drawing.Color.DimGray;
            this.lblDireccion.Location = new System.Drawing.Point(18, 80);
            this.lblDireccion.Name = "lblDireccion";
            this.lblDireccion.Size = new System.Drawing.Size(87, 21);
            this.lblDireccion.TabIndex = 2;
            this.lblDireccion.Text = "Dirección:";
            // 
            // txtDireccion
            // 
            this.txtDireccion.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.txtDireccion.Location = new System.Drawing.Point(190, 76);
            this.txtDireccion.MaxLength = 200;
            this.txtDireccion.Name = "txtDireccion";
            this.txtDireccion.Size = new System.Drawing.Size(315, 30);
            this.txtDireccion.TabIndex = 3;
            // 
            // lblTelefono
            // 
            this.lblTelefono.AutoSize = true;
            this.lblTelefono.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.lblTelefono.ForeColor = System.Drawing.Color.DimGray;
            this.lblTelefono.Location = new System.Drawing.Point(18, 125);
            this.lblTelefono.Name = "lblTelefono";
            this.lblTelefono.Size = new System.Drawing.Size(82, 21);
            this.lblTelefono.TabIndex = 4;
            this.lblTelefono.Text = "Teléfono:";
            // 
            // txtTelefono
            // 
            this.txtTelefono.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.txtTelefono.Location = new System.Drawing.Point(190, 121);
            this.txtTelefono.MaxLength = 12;
            this.txtTelefono.Name = "txtTelefono";
            this.txtTelefono.Size = new System.Drawing.Size(315, 30);
            this.txtTelefono.TabIndex = 5;
            // 
            // btnGuardarDatos
            // 
            this.btnGuardarDatos.BackColor = System.Drawing.Color.Teal;
            this.btnGuardarDatos.FlatAppearance.BorderSize = 0;
            this.btnGuardarDatos.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGuardarDatos.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnGuardarDatos.ForeColor = System.Drawing.Color.White;
            this.btnGuardarDatos.Location = new System.Drawing.Point(335, 172);
            this.btnGuardarDatos.Name = "btnGuardarDatos";
            this.btnGuardarDatos.Size = new System.Drawing.Size(170, 38);
            this.btnGuardarDatos.TabIndex = 6;
            this.btnGuardarDatos.Text = "Actualizar Datos";
            this.btnGuardarDatos.UseVisualStyleBackColor = false;

            this.btnGuardarDatos.Click += new System.EventHandler(this.btnGuardarDatos_Click);
            //
            // grpSeguridad
            //
            this.grpSeguridad.Controls.Add(this.btnCambiarContrasena);
            this.grpSeguridad.Controls.Add(this.txtConfirmarContrasena);
            this.grpSeguridad.Controls.Add(this.lblConfirmar);
            this.grpSeguridad.Controls.Add(this.txtNuevaContrasena);
            this.grpSeguridad.Controls.Add(this.lblNuevaContra);
            this.grpSeguridad.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.grpSeguridad.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.grpSeguridad.Location = new System.Drawing.Point(25, 368);
            this.grpSeguridad.Name = "grpSeguridad";
            this.grpSeguridad.Size = new System.Drawing.Size(530, 185);
            this.grpSeguridad.TabIndex = 3;
            this.grpSeguridad.TabStop = false;
            this.grpSeguridad.Text = "Seguridad y Contraseña";
            //
            // lblNuevaContra
            //
            this.lblNuevaContra.AutoSize = true;
            this.lblNuevaContra.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.lblNuevaContra.ForeColor = System.Drawing.Color.DimGray;
            this.lblNuevaContra.Location = new System.Drawing.Point(18, 35);
            this.lblNuevaContra.Name = "lblNuevaContra";
            this.lblNuevaContra.Size = new System.Drawing.Size(156, 21);
            this.lblNuevaContra.TabIndex = 0;
            this.lblNuevaContra.Text = "Nueva Contraseña:";
            //
            // txtNuevaContrasena
            //
            this.txtNuevaContrasena.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.txtNuevaContrasena.Location = new System.Drawing.Point(190, 31);
            this.txtNuevaContrasena.MaxLength = 100;
            this.txtNuevaContrasena.Name = "txtNuevaContrasena";
            this.txtNuevaContrasena.PasswordChar = '●';
            this.txtNuevaContrasena.Size = new System.Drawing.Size(315, 30);
            this.txtNuevaContrasena.TabIndex = 1;
            //
            // lblConfirmar
            //
            this.lblConfirmar.AutoSize = true;
            this.lblConfirmar.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.lblConfirmar.ForeColor = System.Drawing.Color.DimGray;
            this.lblConfirmar.Location = new System.Drawing.Point(18, 80);
            this.lblConfirmar.Name = "lblConfirmar";
            this.lblConfirmar.Size = new System.Drawing.Size(134, 21);
            this.lblConfirmar.TabIndex = 2;
            this.lblConfirmar.Text = "Confirmar Clave:";
            //
            // txtConfirmarContrasena
            //
            this.txtConfirmarContrasena.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.txtConfirmarContrasena.Location = new System.Drawing.Point(190, 76);
            this.txtConfirmarContrasena.MaxLength = 100;
            this.txtConfirmarContrasena.Name = "txtConfirmarContrasena";
            this.txtConfirmarContrasena.PasswordChar = '●';
            this.txtConfirmarContrasena.Size = new System.Drawing.Size(315, 30);
            this.txtConfirmarContrasena.TabIndex = 3;
            //
            // btnCambiarContrasena
            //
            this.btnCambiarContrasena.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.btnCambiarContrasena.FlatAppearance.BorderSize = 0;
            this.btnCambiarContrasena.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCambiarContrasena.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnCambiarContrasena.ForeColor = System.Drawing.Color.White;
            this.btnCambiarContrasena.Location = new System.Drawing.Point(325, 125);
            this.btnCambiarContrasena.Name = "btnCambiarContrasena";
            this.btnCambiarContrasena.Size = new System.Drawing.Size(180, 38);
            this.btnCambiarContrasena.TabIndex = 4;
            this.btnCambiarContrasena.Text = "Cambiar Contraseña";
            this.btnCambiarContrasena.UseVisualStyleBackColor = false;
            this.btnCambiarContrasena.Click += new System.EventHandler(this.btnCambiarContrasena_Click);
            //
            // grpZonaPeligro
            //
            this.grpZonaPeligro.Controls.Add(this.lblAvisoDesactivar);
            this.grpZonaPeligro.Controls.Add(this.btnDesactivarCuenta);
            this.grpZonaPeligro.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.grpZonaPeligro.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(57)))), ((int)(((byte)(43)))));
            this.grpZonaPeligro.Location = new System.Drawing.Point(25, 568);
            this.grpZonaPeligro.Name = "grpZonaPeligro";
            this.grpZonaPeligro.Size = new System.Drawing.Size(530, 88);
            this.grpZonaPeligro.TabIndex = 4;
            this.grpZonaPeligro.TabStop = false;
            this.grpZonaPeligro.Text = "Estado de la Cuenta";
            //
            // lblAvisoDesactivar
            //
            this.lblAvisoDesactivar.AutoSize = true;
            this.lblAvisoDesactivar.Font = new System.Drawing.Font("Segoe UI", 8.5F);
            this.lblAvisoDesactivar.ForeColor = System.Drawing.Color.DimGray;
            this.lblAvisoDesactivar.Location = new System.Drawing.Point(18, 35);
            this.lblAvisoDesactivar.Name = "lblAvisoDesactivar";
            this.lblAvisoDesactivar.Size = new System.Drawing.Size(294, 38);
            this.lblAvisoDesactivar.TabIndex = 0;
            this.lblAvisoDesactivar.Text = "Desactivar tu cuenta cerrará la sesión actual.\r\nSolo un supervisor podrá volver a activarla.";
            //
            // btnDesactivarCuenta
            //
            this.btnDesactivarCuenta.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(76)))), ((int)(((byte)(60)))));
            this.btnDesactivarCuenta.FlatAppearance.BorderSize = 0;
            this.btnDesactivarCuenta.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDesactivarCuenta.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnDesactivarCuenta.ForeColor = System.Drawing.Color.White;
            this.btnDesactivarCuenta.Location = new System.Drawing.Point(335, 32);
            this.btnDesactivarCuenta.Name = "btnDesactivarCuenta";
            this.btnDesactivarCuenta.Size = new System.Drawing.Size(170, 38);
            this.btnDesactivarCuenta.TabIndex = 1;
            this.btnDesactivarCuenta.Text = "Desactivar Cuenta";
            this.btnDesactivarCuenta.UseVisualStyleBackColor = false;
            this.btnDesactivarCuenta.Click += new System.EventHandler(this.btnDesactivarCuenta_Click);
            //
            // GestionPerfil
            //
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(580, 675);
            this.Controls.Add(this.grpZonaPeligro);
            this.Controls.Add(this.grpSeguridad);
            this.Controls.Add(this.grpDatosPersonales);
            this.Controls.Add(this.lblUsuarioTitulo);
            this.Controls.Add(this.pnlSuperior);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "GestionPerfil";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "ElectroHogar - Gestión de Perfil";
            this.pnlSuperior.ResumeLayout(false);
            this.pnlSuperior.PerformLayout();
            this.grpDatosPersonales.ResumeLayout(false);
            this.grpDatosPersonales.PerformLayout();
            this.grpSeguridad.ResumeLayout(false);
            this.grpSeguridad.PerformLayout();
            this.grpZonaPeligro.ResumeLayout(false);
            this.grpZonaPeligro.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();
        }
        #endregion
        private System.Windows.Forms.Panel pnlSuperior;
        private System.Windows.Forms.Button btnRegresar;
        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.Label lblUsuarioTitulo;
        private System.Windows.Forms.GroupBox grpDatosPersonales;
        private System.Windows.Forms.Label lblCorreo;
        private System.Windows.Forms.TextBox txtCorreo;
        private System.Windows.Forms.Label lblDireccion;
        private System.Windows.Forms.TextBox txtDireccion;
        private System.Windows.Forms.Label lblTelefono;
        private System.Windows.Forms.TextBox txtTelefono;
        private System.Windows.Forms.Button btnGuardarDatos;
        private System.Windows.Forms.GroupBox grpSeguridad;
        private System.Windows.Forms.Label lblNuevaContra;
        private System.Windows.Forms.TextBox txtNuevaContrasena;
        private System.Windows.Forms.Label lblConfirmar;
        private System.Windows.Forms.TextBox txtConfirmarContrasena;
        private System.Windows.Forms.Button btnCambiarContrasena;
        private System.Windows.Forms.GroupBox grpZonaPeligro;
        private System.Windows.Forms.Label lblAvisoDesactivar;
        private System.Windows.Forms.Button btnDesactivarCuenta;
    }
}