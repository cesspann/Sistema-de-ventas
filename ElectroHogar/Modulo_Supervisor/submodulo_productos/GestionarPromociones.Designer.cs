namespace ElectroHogar.Modulo_Supervisor.submodulo_productos
{
    partial class GestionarPromociones
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
            this.btnDesactivar = new System.Windows.Forms.Button();
            this.btnActualizar = new System.Windows.Forms.Button();
            this.dgvPromociones = new System.Windows.Forms.DataGridView();
            this.btnNueva = new System.Windows.Forms.Button();
            this.cmbEstado = new System.Windows.Forms.ComboBox();
            this.lblEstado = new System.Windows.Forms.Label();
            this.pnlSuperior.SuspendLayout();
            this.pnlPrincipal.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPromociones)).BeginInit();
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
            this.pnlSuperior.Size = new System.Drawing.Size(1071, 75);
            this.pnlSuperior.TabIndex = 1;
            // 
            // lblTitulo
            // 
            this.lblTitulo.AutoSize = true;
            this.lblTitulo.Font = new System.Drawing.Font("Segoe UI", 16F, System.Drawing.FontStyle.Bold);
            this.lblTitulo.ForeColor = System.Drawing.Color.White;
            this.lblTitulo.Location = new System.Drawing.Point(95, 20);
            this.lblTitulo.Name = "lblTitulo";
            this.lblTitulo.Size = new System.Drawing.Size(329, 37);
            this.lblTitulo.TabIndex = 0;
            this.lblTitulo.Text = "Gestión de Promociones";
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
            this.btnRegresar.TabIndex = 1;
            this.btnRegresar.Text = "←";
            this.btnRegresar.UseVisualStyleBackColor = false;
            this.btnRegresar.Click += new System.EventHandler(this.btnRegresar_Click);
            // 
            // pnlPrincipal
            // 
            this.pnlPrincipal.BackColor = System.Drawing.Color.White;
            this.pnlPrincipal.Controls.Add(this.btnDesactivar);
            this.pnlPrincipal.Controls.Add(this.btnActualizar);
            this.pnlPrincipal.Controls.Add(this.dgvPromociones);
            this.pnlPrincipal.Controls.Add(this.btnNueva);
            this.pnlPrincipal.Controls.Add(this.cmbEstado);
            this.pnlPrincipal.Controls.Add(this.lblEstado);
            this.pnlPrincipal.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlPrincipal.Location = new System.Drawing.Point(0, 75);
            this.pnlPrincipal.Name = "pnlPrincipal";
            this.pnlPrincipal.Size = new System.Drawing.Size(1071, 585);
            this.pnlPrincipal.TabIndex = 0;
            // 
            // btnDesactivar
            // 
            this.btnDesactivar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnDesactivar.BackColor = System.Drawing.Color.Firebrick;
            this.btnDesactivar.FlatAppearance.BorderSize = 0;
            this.btnDesactivar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDesactivar.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.btnDesactivar.ForeColor = System.Drawing.Color.White;
            this.btnDesactivar.Location = new System.Drawing.Point(240, 940);
            this.btnDesactivar.Name = "btnDesactivar";
            this.btnDesactivar.Size = new System.Drawing.Size(190, 40);
            this.btnDesactivar.TabIndex = 0;
            this.btnDesactivar.Text = "Desactivar Promoción";
            this.btnDesactivar.UseVisualStyleBackColor = false;
            this.btnDesactivar.Click += new System.EventHandler(this.btnDesactivar_Click);
            // 
            // btnActualizar
            // 
            this.btnActualizar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnActualizar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.btnActualizar.FlatAppearance.BorderSize = 0;
            this.btnActualizar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnActualizar.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.btnActualizar.ForeColor = System.Drawing.Color.White;
            this.btnActualizar.Location = new System.Drawing.Point(35, 940);
            this.btnActualizar.Name = "btnActualizar";
            this.btnActualizar.Size = new System.Drawing.Size(190, 40);
            this.btnActualizar.TabIndex = 1;
            this.btnActualizar.Text = "Actualizar Promoción";
            this.btnActualizar.UseVisualStyleBackColor = false;
            this.btnActualizar.Click += new System.EventHandler(this.btnActualizar_Click);
            // 
            // dgvPromociones
            // 
            this.dgvPromociones.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvPromociones.ColumnHeadersHeight = 29;
            this.dgvPromociones.Location = new System.Drawing.Point(12, 75);
            this.dgvPromociones.Name = "dgvPromociones";
            this.dgvPromociones.RowHeadersWidth = 51;
            this.dgvPromociones.Size = new System.Drawing.Size(1039, 482);
            this.dgvPromociones.TabIndex = 2;
            // 
            // btnNueva
            // 
            this.btnNueva.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnNueva.BackColor = System.Drawing.Color.Teal;
            this.btnNueva.FlatAppearance.BorderSize = 0;
            this.btnNueva.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnNueva.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.btnNueva.ForeColor = System.Drawing.Color.White;
            this.btnNueva.Location = new System.Drawing.Point(1586, 22);
            this.btnNueva.Name = "btnNueva";
            this.btnNueva.Size = new System.Drawing.Size(170, 36);
            this.btnNueva.TabIndex = 3;
            this.btnNueva.Text = "+ Nueva Promoción";
            this.btnNueva.UseVisualStyleBackColor = false;
            this.btnNueva.Click += new System.EventHandler(this.btnNueva_Click);
            // 
            // cmbEstado
            // 
            this.cmbEstado.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbEstado.Font = new System.Drawing.Font("Segoe UI", 10F);
            this.cmbEstado.Location = new System.Drawing.Point(150, 24);
            this.cmbEstado.Name = "cmbEstado";
            this.cmbEstado.Size = new System.Drawing.Size(170, 31);
            this.cmbEstado.TabIndex = 4;
            this.cmbEstado.SelectedIndexChanged += new System.EventHandler(this.cmbEstado_SelectedIndexChanged);
            // 
            // lblEstado
            // 
            this.lblEstado.AutoSize = true;
            this.lblEstado.Font = new System.Drawing.Font("Segoe UI", 10F, System.Drawing.FontStyle.Bold);
            this.lblEstado.ForeColor = System.Drawing.Color.DimGray;
            this.lblEstado.Location = new System.Drawing.Point(35, 28);
            this.lblEstado.Name = "lblEstado";
            this.lblEstado.Size = new System.Drawing.Size(122, 23);
            this.lblEstado.TabIndex = 5;
            this.lblEstado.Text = "Filtrar Estado:";
            // 
            // GestionarPromociones
            // 
            this.ClientSize = new System.Drawing.Size(1071, 660);
            this.Controls.Add(this.pnlPrincipal);
            this.Controls.Add(this.pnlSuperior);
            this.Name = "GestionarPromociones";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "ElectroHogar - Gestión de Promociones";
            this.pnlSuperior.ResumeLayout(false);
            this.pnlSuperior.PerformLayout();
            this.pnlPrincipal.ResumeLayout(false);
            this.pnlPrincipal.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPromociones)).EndInit();
            this.ResumeLayout(false);

        }

        private System.Windows.Forms.Panel pnlSuperior;
        private System.Windows.Forms.Button btnRegresar;
        private System.Windows.Forms.Label lblTitulo;
        private System.Windows.Forms.Panel pnlPrincipal;
        private System.Windows.Forms.Label lblEstado;
        private System.Windows.Forms.ComboBox cmbEstado;
        private System.Windows.Forms.Button btnNueva;
        private System.Windows.Forms.DataGridView dgvPromociones;
        private System.Windows.Forms.Button btnActualizar;
        private System.Windows.Forms.Button btnDesactivar;
    }
}
