namespace ElectroHogar.Modulo_Supervisor
{
    partial class GestionarPerfilSupervisor
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
            this.lblEncabezadoSupervisor = new System.Windows.Forms.Label();
            this.grpInfoLaboral = new System.Windows.Forms.GroupBox();
            this.txtEmpleadosCargo = new System.Windows.Forms.TextBox();
            this.lblEmpleadosCargo = new System.Windows.Forms.Label();
            this.txtFechaContratacion = new System.Windows.Forms.TextBox();
            this.lblFechaContratacion = new System.Windows.Forms.Label();
            this.txtDui = new System.Windows.Forms.TextBox();
            this.lblDui = new System.Windows.Forms.Label();
            this.txtSucursal = new System.Windows.Forms.TextBox();
            this.lblSucursal = new System.Windows.Forms.Label();
            this.grpDatosContacto = new System.Windows.Forms.GroupBox();
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
            this.grpInfoLaboral.SuspendLayout();
            this.grpDatosContacto.SuspendLayout();
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
            this.pnlSuperior.Size = new System.Drawing.Size(620, 65);
            this.pnlSuperior.TabIndex = 0;
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Segoe UI", 15F, System.Drawing.FontStyle.Bold);
            this.lblTitulo.ForeColor = System.Drawing.Color.White;
            this.lblTitulo.Location = new System.Drawing.Point(85, 16);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(222, 35);
            this.lblTitulo.TabIndex = 1;
            this.lblTitulo.Text = "Perfil del Supervisor";
            // 
            // btnRegresar
            // 
            this.btnRegresar.BackColor = System.Drawing.Color.Transparent;
            this.btnRegresar.FlatAppearance.BorderSize = 0;
            this.btnRegresar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRegresar.Font = new System.Drawing.Font("Segoe UI", 20F, System.Drawing.FontStyle.Bold);
            this.btnRegresar.ForeColor = System.Drawing.Color.White;
            this.btnRegresar.Location = new System.Drawing.Point(15, 8);
            this.btnRegresar.Name = "btnRegresar";
            this.btnRegresar.Size = new System.Drawing.Size(55, 50);
            this.btnRegresar.TabIndex = 0;
            this.btnRegresar.Text = "←";
            this.btnRegresar.UseVisualStyleBackColor = false;
            this.btnRegresar.Click += new System.EventHandler(this.btnRegresar_Click);
            // 
            // lblEncabezadoSupervisor
            // 
            this.lblEncabezadoSupervisor.AutoSize = true;
            this.lblEncabezadoSupervisor.Font = new System.Drawing.Font("Segoe UI", 10.5F, System.Drawing.FontStyle.Bold);
            this.lblEncabezadoSupervisor.ForeColor = System.Drawing.Color.Teal;
            this.lblEncabezadoSupervisor.Location = new System.Drawing.Point(25, 78);
            this.lblEncabezadoSupervisor.Name = "lblEncabezadoSupervisor";
            this.lblEncabezadoSupervisor.Size = new System.Drawing.Size(344, 25);
            this.lblEncabezadoSupervisor.TabIndex = 1;
            this.lblEncabezadoSupervisor.Text = "Supervisor  |  Usuario: supervisor (ID: 1)";
            // 
            // grpInfoLaboral
            // 
            this.grpInfoLaboral.Controls.Add(this.txtEmpleadosCargo);
            this.grpInfoLaboral.Controls.Add(this.lblEmpleadosCargo);
            this.grpInfoLaboral.Controls.Add(this.txtFechaContratacion);
            this.grpInfoLaboral.Controls.Add(this.lblFechaContratacion);
            this.grpInfoLaboral.Controls.Add(this.txtDui);
            this.grpInfoLaboral.Controls.Add(this.lblDui);
            this.grpInfoLaboral.Controls.Add(this.txtSucursal);
            this.grpInfoLaboral.Controls.Add(this.lblSucursal);
            this.grpInfoLaboral.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.grpInfoLaboral.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.grpInfoLaboral.Location = new System.Drawing.Point(25, 110);
            this.grpInfoLaboral.Name = "grpInfoLaboral";
            this.grpInfoLaboral.Size = new System.Drawing.Size(570, 125);
            this.grpInfoLaboral.TabIndex = 2;
            this.grpInfoLaboral.TabStop = false;
            this.grpInfoLaboral.Text = "Información del Supervisor (Solo Lectura)";
            // 
            // lblSucursal
            // 
            this.lblSucursal.AutoSize = true;
            this.lblSucursal.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblSucursal.ForeColor = System.Drawing.Color.DimGray;
            this.lblSucursal.Location = new System.Drawing.Point(18, 34);
            this.lblSucursal.Name = "lblSucursal";
            this.lblSucursal.Size = new System.Drawing.Size(92, 20);
            this.lblSucursal.TabIndex = 0;
            this.lblSucursal.Text = "ID Sucursal:";
            // 
            // txtSucursal
            // 
            this.txtSucursal.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(245)))), ((int)(((byte)(247)))), ((int)(((byte)(250)))));
            this.txtSucursal.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtSucursal.Location = new System.Drawing.Point(130, 30);
            this.txtSucursal.Name = "txtSucursal";
            this.txtSucursal.ReadOnly = true;
            this.txtSucursal.Size = new System.Drawing.Size(120, 29);
            this.txtSucursal.TabIndex = 1;
            // 
            // lblDui
            // 
            this.lblDui.AutoSize = true;
            this.lblDui.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblDui.ForeColor = System.Drawing.Color.DimGray;
            this.lblDui.Location = new System.Drawing.Point(280, 34);
            this.lblDui.Name = "lblDui";
            this.lblDui.Size = new System.Drawing.Size(41, 20);
            this.lblDui.TabIndex = 2;
            this.lblDui.Text = "DUI:";
            // 
            // txtDui
            // 
            this.txtDui.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(245)))), ((int)(((byte)(247)))), ((int)(((byte)(250)))));
            this.txtDui.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtDui.Location = new System.Drawing.Point(410, 30);
            this.txtDui.Name = "txtDui";
            this.txtDui.ReadOnly = true;
            this.txtDui.Size = new System.Drawing.Size(140, 29);
            this.txtDui.TabIndex = 3;
            // 
            // lblFechaContratacion
            // 
            this.lblFechaContratacion.AutoSize = true;
            this.lblFechaContratacion.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblFechaContratacion.ForeColor = System.Drawing.Color.DimGray;
            this.lblFechaContratacion.Location = new System.Drawing.Point(18, 78);
            this.lblFechaContratacion.Name = "lblFechaContratacion";
            this.lblFechaContratacion.Size = new System.Drawing.Size(106, 20);
            this.lblFechaContratacion.TabIndex = 4;
            this.lblFechaContratacion.Text = "Contratación:";
            // 
            // txtFechaContratacion
            // 
            this.txtFechaContratacion.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(245)))), ((int)(((byte)(247)))), ((int)(((byte)(250)))));

            this.txtFechaContratacion.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtFechaContratacion.Location = new System.Drawing.Point(130, 74);
            this.txtFechaContratacion.Name = "txtFechaContratacion";
            this.txtFechaContratacion.ReadOnly = true;
            this.txtFechaContratacion.Size = new System.Drawing.Size(120, 29);
            this.txtFechaContratacion.TabIndex = 5;
            //
            // lblEmpleadosCargo
            //
            this.lblEmpleadosCargo.AutoSize = true;
            this.lblEmpleadosCargo.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.lblEmpleadosCargo.ForeColor = System.Drawing.Color.DimGray;
            this.lblEmpleadosCargo.Location = new System.Drawing.Point(280, 78);
            this.lblEmpleadosCargo.Name = "lblEmpleadosCargo";
            this.lblEmpleadosCargo.Size = new System.Drawing.Size(124, 20);
            this.lblEmpleadosCargo.TabIndex = 6;
            this.lblEmpleadosCargo.Text = "Emp. a Cargo:";
            //
            // txtEmpleadosCargo
            //
            this.txtEmpleadosCargo.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(245)))), ((int)(((byte)(247)))), ((int)(((byte)(250)))));
            this.txtEmpleadosCargo.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtEmpleadosCargo.Location = new System.Drawing.Point(410, 74);
            this.txtEmpleadosCargo.Name = "txtEmpleadosCargo";
            this.txtEmpleadosCargo.ReadOnly = true;
            this.txtEmpleadosCargo.Size = new System.Drawing.Size(140, 29);
            this.txtEmpleadosCargo.TabIndex = 7;
            //
            // grpDatosContacto
            //
            this.grpDatosContacto.Controls.Add(this.btnGuardarDatos);
            this.grpDatosContacto.Controls.Add(this.txtTelefono);
            this.grpDatosContacto.Controls.Add(this.lblTelefono);
            this.grpDatosContacto.Controls.Add(this.txtDireccion);
            this.grpDatosContacto.Controls.Add(this.lblDireccion);
            this.grpDatosContacto.Controls.Add(this.txtCorreo);
            this.grpDatosContacto.Controls.Add(this.lblCorreo);
            this.grpDatosContacto.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.grpDatosContacto.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.grpDatosContacto.Location = new System.Drawing.Point(25, 245);
            this.grpDatosContacto.Name = "grpDatosContacto";
            this.grpDatosContacto.Size = new System.Drawing.Size(570, 210);
            this.grpDatosContacto.TabIndex = 3;
            this.grpDatosContacto.TabStop = false;
            this.grpDatosContacto.Text = "Datos de Contacto (Editables)";
            //
            // lblCorreo
            //
            this.lblCorreo.AutoSize = true;
            this.lblCorreo.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.lblCorreo.ForeColor = System.Drawing.Color.DimGray;
            this.lblCorreo.Location = new System.Drawing.Point(18, 32);
            this.lblCorreo.Name = "lblCorreo";
            this.lblCorreo.Size = new System.Drawing.Size(156, 21);
            this.lblCorreo.TabIndex = 0;
            this.lblCorreo.Text = "Correo Electrónico:";
            //
            // txtCorreo
            //
            this.txtCorreo.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtCorreo.Location = new System.Drawing.Point(190, 28);
            this.txtCorreo.MaxLength = 150;
            this.txtCorreo.Name = "txtCorreo";
            this.txtCorreo.Size = new System.Drawing.Size(360, 29);
            this.txtCorreo.TabIndex = 1;
            //
            // lblDireccion
            //
            this.lblDireccion.AutoSize = true;
            this.lblDireccion.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.lblDireccion.ForeColor = System.Drawing.Color.DimGray;
            this.lblDireccion.Location = new System.Drawing.Point(18, 72);
            this.lblDireccion.Name = "lblDireccion";
            this.lblDireccion.Size = new System.Drawing.Size(87, 21);
            this.lblDireccion.TabIndex = 2;
            this.lblDireccion.Text = "Dirección:";
            //
            // txtDireccion
            //
            this.txtDireccion.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtDireccion.Location = new System.Drawing.Point(190, 68);
            this.txtDireccion.MaxLength = 200;
            this.txtDireccion.Name = "txtDireccion";
            this.txtDireccion.Size = new System.Drawing.Size(360, 29);
            this.txtDireccion.TabIndex = 3;
            //
            // lblTelefono
            //
            this.lblTelefono.AutoSize = true;
            this.lblTelefono.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.lblTelefono.ForeColor = System.Drawing.Color.DimGray;
            this.lblTelefono.Location = new System.Drawing.Point(18, 112);
            this.lblTelefono.Name = "lblTelefono";
            this.lblTelefono.Size = new System.Drawing.Size(82, 21);
            this.lblTelefono.TabIndex = 4;
            this.lblTelefono.Text = "Teléfono:";
            //
            // txtTelefono
            //
            this.txtTelefono.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtTelefono.Location = new System.Drawing.Point(190, 108);
            this.txtTelefono.MaxLength = 12;
            this.txtTelefono.Name = "txtTelefono";
            this.txtTelefono.Size = new System.Drawing.Size(360, 29);
            this.txtTelefono.TabIndex = 5;
            //
            // btnGuardarDatos
            //
            this.btnGuardarDatos.BackColor = System.Drawing.Color.Teal;
            this.btnGuardarDatos.FlatAppearance.BorderSize = 0;
            this.btnGuardarDatos.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGuardarDatos.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnGuardarDatos.ForeColor = System.Drawing.Color.White;
            this.btnGuardarDatos.Location = new System.Drawing.Point(360, 155);
            this.btnGuardarDatos.Name = "btnGuardarDatos";
            this.btnGuardarDatos.Size = new System.Drawing.Size(190, 38);
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
            this.grpSeguridad.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.grpSeguridad.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.grpSeguridad.Location = new System.Drawing.Point(25, 465);
            this.grpSeguridad.Name = "grpSeguridad";
            this.grpSeguridad.Size = new System.Drawing.Size(570, 170);
            this.grpSeguridad.TabIndex = 4;
            this.grpSeguridad.TabStop = false;
            this.grpSeguridad.Text = "Seguridad y Contraseña";
            //
            // lblNuevaContra
            //
            this.lblNuevaContra.AutoSize = true;
            this.lblNuevaContra.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.lblNuevaContra.ForeColor = System.Drawing.Color.DimGray;
            this.lblNuevaContra.Location = new System.Drawing.Point(18, 32);
            this.lblNuevaContra.Name = "lblNuevaContra";
            this.lblNuevaContra.Size = new System.Drawing.Size(156, 21);
            this.lblNuevaContra.TabIndex = 0;
            this.lblNuevaContra.Text = "Nueva Contraseña:";
            //
            // txtNuevaContrasena
            //
            this.txtNuevaContrasena.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtNuevaContrasena.Location = new System.Drawing.Point(190, 28);
            this.txtNuevaContrasena.MaxLength = 100;
            this.txtNuevaContrasena.Name = "txtNuevaContrasena";
            this.txtNuevaContrasena.PasswordChar = '●';
            this.txtNuevaContrasena.Size = new System.Drawing.Size(360, 29);
            this.txtNuevaContrasena.TabIndex = 1;
            //
            // lblConfirmar
            //
            this.lblConfirmar.AutoSize = true;
            this.lblConfirmar.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.lblConfirmar.ForeColor = System.Drawing.Color.DimGray;
            this.lblConfirmar.Location = new System.Drawing.Point(18, 72);
            this.lblConfirmar.Name = "lblConfirmar";
            this.lblConfirmar.Size = new System.Drawing.Size(134, 21);
            this.lblConfirmar.TabIndex = 2;
            this.lblConfirmar.Text = "Confirmar Clave:";
            //
            // txtConfirmarContrasena
            //
            this.txtConfirmarContrasena.Font = new System.Drawing.Font("Segoe UI", 9.5F);
            this.txtConfirmarContrasena.Location = new System.Drawing.Point(190, 68);
            this.txtConfirmarContrasena.MaxLength = 100;
            this.txtConfirmarContrasena.Name = "txtConfirmarContrasena";
            this.txtConfirmarContrasena.PasswordChar = '●';
            this.txtConfirmarContrasena.Size = new System.Drawing.Size(360, 29);
            this.txtConfirmarContrasena.TabIndex = 3;
            //
            // btnCambiarContrasena
            //
            this.btnCambiarContrasena.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.btnCambiarContrasena.FlatAppearance.BorderSize = 0;
            this.btnCambiarContrasena.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCambiarContrasena.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnCambiarContrasena.ForeColor = System.Drawing.Color.White;
            this.btnCambiarContrasena.Location = new System.Drawing.Point(340, 115);
            this.btnCambiarContrasena.Name = "btnCambiarContrasena";
            this.btnCambiarContrasena.Size = new System.Drawing.Size(210, 38);
            this.btnCambiarContrasena.TabIndex = 4;
            this.btnCambiarContrasena.Text = "Cambiar Contraseña";
            this.btnCambiarContrasena.UseVisualStyleBackColor = false;
            this.btnCambiarContrasena.Click += new System.EventHandler(this.btnCambiarContrasena_Click);
            //
            // grpZonaPeligro
            //
            this.grpZonaPeligro.Controls.Add(this.lblAvisoDesactivar);
            this.grpZonaPeligro.Controls.Add(this.btnDesactivarCuenta);
            this.grpZonaPeligro.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.grpZonaPeligro.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(57)))), ((int)(((byte)(43)))));
            this.grpZonaPeligro.Location = new System.Drawing.Point(25, 645);
            this.grpZonaPeligro.Name = "grpZonaPeligro";
            this.grpZonaPeligro.Size = new System.Drawing.Size(570, 82);
            this.grpZonaPeligro.TabIndex = 5;
            this.grpZonaPeligro.TabStop = false;
            this.grpZonaPeligro.Text = "Estado de la Cuenta";
            //
            // lblAvisoDesactivar
            //
            this.lblAvisoDesactivar.AutoSize = true;
            this.lblAvisoDesactivar.Font = new System.Drawing.Font("Segoe UI", 8.5F);
            this.lblAvisoDesactivar.ForeColor = System.Drawing.Color.DimGray;
            this.lblAvisoDesactivar.Location = new System.Drawing.Point(18, 30);
            this.lblAvisoDesactivar.Name = "lblAvisoDesactivar";
            this.lblAvisoDesactivar.Size = new System.Drawing.Size(316, 38);
            this.lblAvisoDesactivar.TabIndex = 0;
            this.lblAvisoDesactivar.Text = "Desactivar tu cuenta cerrará la sesión actual.\r\nOtro supervisor deberá reactivarla para ingresar.";
            //
            // btnDesactivarCuenta
            //
            this.btnDesactivarCuenta.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(231)))), ((int)(((byte)(76)))), ((int)(((byte)(60)))));
            this.btnDesactivarCuenta.FlatAppearance.BorderSize = 0;
            this.btnDesactivarCuenta.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDesactivarCuenta.Font = new System.Drawing.Font("Segoe UI", 9.5F, System.Drawing.FontStyle.Bold);
            this.btnDesactivarCuenta.ForeColor = System.Drawing.Color.White;
            this.btnDesactivarCuenta.Location = new System.Drawing.Point(360, 28);
            this.btnDesactivarCuenta.Name = "btnDesactivarCuenta";
            this.btnDesactivarCuenta.Size = new System.Drawing.Size(190, 38);
            this.btnDesactivarCuenta.TabIndex = 1;
            this.btnDesactivarCuenta.Text = "Desactivar Cuenta";
            this.btnDesactivarCuenta.UseVisualStyleBackColor = false;
            this.btnDesactivarCuenta.Click += new System.EventHandler(this.btnDesactivarCuenta_Click);
            //
            // GestionarPerfilSupervisor
            //
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(620, 745);
            this.Controls.Add(this.grpZonaPeligro);
            this.Controls.Add(this.grpSeguridad);
            this.Controls.Add(this.grpDatosContacto);
            this.Controls.Add(this.grpInfoLaboral);
            this.Controls.Add(this.lblEncabezadoSupervisor);
            this.Controls.Add(this.pnlSuperior);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "GestionarPerfilSupervisor";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "ElectroHogar - Perfil del Supervisor";
            this.pnlSuperior.ResumeLayout(false);
            this.pnlSuperior.PerformLayout();
            this.grpInfoLaboral.ResumeLayout(false);
            this.grpInfoLaboral.PerformLayout();
            this.grpDatosContacto.ResumeLayout(false);
            this.grpDatosContacto.PerformLayout();
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
        private System.Windows.Forms.Label lblEncabezadoSupervisor;
        private System.Windows.Forms.GroupBox grpInfoLaboral;
        private System.Windows.Forms.Label lblSucursal;
        private System.Windows.Forms.TextBox txtSucursal;
        private System.Windows.Forms.Label lblDui;
        private System.Windows.Forms.TextBox txtDui;
        private System.Windows.Forms.Label lblFechaContratacion;
        private System.Windows.Forms.TextBox txtFechaContratacion;
        private System.Windows.Forms.Label lblEmpleadosCargo;
        private System.Windows.Forms.TextBox txtEmpleadosCargo;
        private System.Windows.Forms.GroupBox grpDatosContacto;
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