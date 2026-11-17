namespace ElectroHogar.Modulo_Cajero
{
    partial class FrmNuevaVenta
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.panel2 = new System.Windows.Forms.Panel();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.panel3 = new System.Windows.Forms.Panel();
            this.tableLayoutPanel2 = new System.Windows.Forms.TableLayoutPanel();
            this.tableLayoutPanel3 = new System.Windows.Forms.TableLayoutPanel();
            this.label6 = new System.Windows.Forms.Label();
            this.txtIDCliente = new System.Windows.Forms.TextBox();
            this.txtPrima = new System.Windows.Forms.TextBox();
            this.txtPago = new System.Windows.Forms.TextBox();
            this.txtInteres = new System.Windows.Forms.TextBox();
            this.txtCuotas = new System.Windows.Forms.TextBox();
            this.txtAñadirProducto = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.txtcantidad = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.btnView = new System.Windows.Forms.Button();
            this.btnMain = new System.Windows.Forms.Button();
            this.consultarCliente = new System.Windows.Forms.Button();
            this.btnAñadirProducto = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.dataProductos = new System.Windows.Forms.DataGridView();
            this.contextMenuStrip1 = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.panel2.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.panel3.SuspendLayout();
            this.tableLayoutPanel2.SuspendLayout();
            this.tableLayoutPanel3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataProductos)).BeginInit();
            this.SuspendLayout();
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.SteelBlue;
            this.panel2.Controls.Add(this.tableLayoutPanel1);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(1118, 100);
            this.panel2.TabIndex = 1;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tableLayoutPanel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.tableLayoutPanel1.ColumnCount = 2;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Controls.Add(this.label1, 1, 1);
            this.tableLayoutPanel1.Controls.Add(this.label2, 1, 0);
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 2;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 65F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(1122, 100);
            this.tableLayoutPanel1.TabIndex = 1;
            this.tableLayoutPanel1.Paint += new System.Windows.Forms.PaintEventHandler(this.tableLayoutPanel1_Paint);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Impact", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label1.Location = new System.Drawing.Point(23, 35);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(178, 28);
            this.label1.TabIndex = 0;
            this.label1.Text = "Crear la Factura";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label2
            // 
            this.label2.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Impact", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.label2.Location = new System.Drawing.Point(23, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(177, 35);
            this.label2.TabIndex = 0;
            this.label2.Text = "Nueva Venta";
            this.label2.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // panel3
            // 
            this.panel3.BackColor = System.Drawing.Color.Lavender;
            this.panel3.Controls.Add(this.tableLayoutPanel2);
            this.panel3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel3.Location = new System.Drawing.Point(0, 100);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(1118, 632);
            this.panel3.TabIndex = 0;
            // 
            // tableLayoutPanel2
            // 
            this.tableLayoutPanel2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tableLayoutPanel2.ColumnCount = 3;
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel2.Controls.Add(this.tableLayoutPanel3, 1, 1);
            this.tableLayoutPanel2.Controls.Add(this.dataProductos, 1, 2);
            this.tableLayoutPanel2.Location = new System.Drawing.Point(-2, 5);
            this.tableLayoutPanel2.Name = "tableLayoutPanel2";
            this.tableLayoutPanel2.RowCount = 4;
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 72.55575F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 27.44425F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 13F));
            this.tableLayoutPanel2.Size = new System.Drawing.Size(1122, 624);
            this.tableLayoutPanel2.TabIndex = 0;
            // 
            // tableLayoutPanel3
            // 
            this.tableLayoutPanel3.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tableLayoutPanel3.AutoScroll = true;
            this.tableLayoutPanel3.BackColor = System.Drawing.SystemColors.ControlLightLight;
            this.tableLayoutPanel3.ColumnCount = 5;
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 19.6875F));
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 80.3125F));
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 550F));
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 53F));
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 219F));
            this.tableLayoutPanel3.Controls.Add(this.label6, 1, 5);
            this.tableLayoutPanel3.Controls.Add(this.txtIDCliente, 2, 0);
            this.tableLayoutPanel3.Controls.Add(this.txtPrima, 2, 1);
            this.tableLayoutPanel3.Controls.Add(this.txtPago, 2, 2);
            this.tableLayoutPanel3.Controls.Add(this.txtInteres, 2, 3);
            this.tableLayoutPanel3.Controls.Add(this.txtCuotas, 2, 4);
            this.tableLayoutPanel3.Controls.Add(this.txtAñadirProducto, 2, 5);
            this.tableLayoutPanel3.Controls.Add(this.label3, 1, 0);
            this.tableLayoutPanel3.Controls.Add(this.label4, 1, 1);
            this.tableLayoutPanel3.Controls.Add(this.label5, 1, 2);
            this.tableLayoutPanel3.Controls.Add(this.label7, 1, 3);
            this.tableLayoutPanel3.Controls.Add(this.label8, 1, 4);
            this.tableLayoutPanel3.Controls.Add(this.label9, 1, 6);
            this.tableLayoutPanel3.Controls.Add(this.txtcantidad, 2, 6);
            this.tableLayoutPanel3.Controls.Add(this.button1, 4, 0);
            this.tableLayoutPanel3.Controls.Add(this.btnView, 4, 7);
            this.tableLayoutPanel3.Controls.Add(this.btnMain, 4, 6);
            this.tableLayoutPanel3.Controls.Add(this.consultarCliente, 4, 1);
            this.tableLayoutPanel3.Controls.Add(this.btnAñadirProducto, 1, 7);
            this.tableLayoutPanel3.Controls.Add(this.button2, 4, 2);
            this.tableLayoutPanel3.Location = new System.Drawing.Point(23, 23);
            this.tableLayoutPanel3.Name = "tableLayoutPanel3";
            this.tableLayoutPanel3.RowCount = 8;
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.71394F));
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 11.73594F));
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 12.5F));
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.75795F));
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 14.42543F));
            this.tableLayoutPanel3.Size = new System.Drawing.Size(1076, 422);
            this.tableLayoutPanel3.TabIndex = 1;
            // 
            // label6
            // 
            this.label6.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.label6.AutoSize = true;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(53, 274);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(189, 20);
            this.label6.TabIndex = 1;
            this.label6.Text = "ID de producto a añadir:";
            // 
            // txtIDCliente
            // 
            this.txtIDCliente.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.txtIDCliente.BackColor = System.Drawing.SystemColors.MenuBar;
            this.txtIDCliente.Location = new System.Drawing.Point(256, 15);
            this.txtIDCliente.Name = "txtIDCliente";
            this.txtIDCliente.Size = new System.Drawing.Size(544, 22);
            this.txtIDCliente.TabIndex = 0;
            this.txtIDCliente.TextChanged += new System.EventHandler(this.txtIDCliente_TextChanged);
            // 
            // txtPrima
            // 
            this.txtPrima.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.txtPrima.BackColor = System.Drawing.SystemColors.MenuBar;
            this.txtPrima.Location = new System.Drawing.Point(256, 66);
            this.txtPrima.Name = "txtPrima";
            this.txtPrima.Size = new System.Drawing.Size(544, 22);
            this.txtPrima.TabIndex = 3;
            this.txtPrima.TextChanged += new System.EventHandler(this.txtPrima_TextChanged);
            // 
            // txtPago
            // 
            this.txtPago.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.txtPago.BackColor = System.Drawing.SystemColors.MenuBar;
            this.txtPago.Location = new System.Drawing.Point(256, 117);
            this.txtPago.Name = "txtPago";
            this.txtPago.Size = new System.Drawing.Size(544, 22);
            this.txtPago.TabIndex = 2;
            this.txtPago.TextChanged += new System.EventHandler(this.txtPago_TextChanged);
            // 
            // txtInteres
            // 
            this.txtInteres.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.txtInteres.BackColor = System.Drawing.SystemColors.MenuBar;
            this.txtInteres.Location = new System.Drawing.Point(256, 169);
            this.txtInteres.Name = "txtInteres";
            this.txtInteres.Size = new System.Drawing.Size(544, 22);
            this.txtInteres.TabIndex = 4;
            this.txtInteres.TextChanged += new System.EventHandler(this.txtInteres_TextChanged);
            // 
            // txtCuotas
            // 
            this.txtCuotas.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.txtCuotas.BackColor = System.Drawing.SystemColors.MenuBar;
            this.txtCuotas.Location = new System.Drawing.Point(256, 221);
            this.txtCuotas.Name = "txtCuotas";
            this.txtCuotas.Size = new System.Drawing.Size(544, 22);
            this.txtCuotas.TabIndex = 11;
            this.txtCuotas.TextChanged += new System.EventHandler(this.txtCuotas_TextChanged);
            // 
            // txtAñadirProducto
            // 
            this.txtAñadirProducto.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.txtAñadirProducto.BackColor = System.Drawing.SystemColors.MenuBar;
            this.txtAñadirProducto.Location = new System.Drawing.Point(256, 273);
            this.txtAñadirProducto.Name = "txtAñadirProducto";
            this.txtAñadirProducto.Size = new System.Drawing.Size(544, 22);
            this.txtAñadirProducto.TabIndex = 0;
            this.txtAñadirProducto.TextChanged += new System.EventHandler(this.txtAñadirProducto_TextChanged);
            // 
            // label3
            // 
            this.label3.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(53, 16);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(192, 20);
            this.label3.TabIndex = 5;
            this.label3.Text = "Ingresar el ID de cliente:";
            // 
            // label4
            // 
            this.label4.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(53, 57);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(148, 40);
            this.label4.TabIndex = 6;
            this.label4.Text = "Ingrese la prima a cancelar";
            // 
            // label5
            // 
            this.label5.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(53, 118);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(130, 20);
            this.label5.TabIndex = 7;
            this.label5.Text = "Metodo de Pago";
            this.label5.Click += new System.EventHandler(this.label5_Click);
            // 
            // label7
            // 
            this.label7.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label7.Location = new System.Drawing.Point(53, 170);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(125, 20);
            this.label7.TabIndex = 9;
            this.label7.Text = "Tasa de Interes";
            // 
            // label8
            // 
            this.label8.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(53, 222);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(151, 20);
            this.label8.TabIndex = 10;
            this.label8.Text = "Nuemro de cuotas:";
            // 
            // label9
            // 
            this.label9.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.label9.AutoSize = true;
            this.label9.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label9.Location = new System.Drawing.Point(53, 322);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(80, 20);
            this.label9.TabIndex = 14;
            this.label9.Text = "Cantidad ";
            this.label9.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            // 
            // txtcantidad
            // 
            this.txtcantidad.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right)));
            this.txtcantidad.BackColor = System.Drawing.SystemColors.MenuBar;
            this.txtcantidad.Location = new System.Drawing.Point(256, 321);
            this.txtcantidad.Name = "txtcantidad";
            this.txtcantidad.Size = new System.Drawing.Size(544, 22);
            this.txtcantidad.TabIndex = 15;
            this.txtcantidad.TextChanged += new System.EventHandler(this.txtcantidad_TextChanged);
            // 
            // button1
            // 
            this.button1.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.button1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.button1.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.button1.Location = new System.Drawing.Point(860, 4);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(212, 45);
            this.button1.TabIndex = 2;
            this.button1.Text = "Consultar Productos";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // btnView
            // 
            this.btnView.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.btnView.BackColor = System.Drawing.Color.LimeGreen;
            this.btnView.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnView.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnView.Location = new System.Drawing.Point(953, 371);
            this.btnView.Name = "btnView";
            this.btnView.Size = new System.Drawing.Size(120, 35);
            this.btnView.TabIndex = 1;
            this.btnView.Text = "Guardar";
            this.btnView.UseVisualStyleBackColor = false;
            this.btnView.Click += new System.EventHandler(this.btnView_Click);
            // 
            // btnMain
            // 
            this.btnMain.Anchor = System.Windows.Forms.AnchorStyles.Right;
            this.btnMain.BackColor = System.Drawing.Color.IndianRed;
            this.btnMain.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnMain.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnMain.Location = new System.Drawing.Point(954, 313);
            this.btnMain.Name = "btnMain";
            this.btnMain.Size = new System.Drawing.Size(119, 39);
            this.btnMain.TabIndex = 0;
            this.btnMain.Text = "Volver";
            this.btnMain.UseVisualStyleBackColor = false;
            this.btnMain.Click += new System.EventHandler(this.btnMain_Click);
            // 
            // consultarCliente
            // 
            this.consultarCliente.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.consultarCliente.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.consultarCliente.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.2F, System.Drawing.FontStyle.Bold);
            this.consultarCliente.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.consultarCliente.Location = new System.Drawing.Point(860, 56);
            this.consultarCliente.Name = "consultarCliente";
            this.consultarCliente.Size = new System.Drawing.Size(212, 43);
            this.consultarCliente.TabIndex = 18;
            this.consultarCliente.Text = "Consultar Cliente Juridico";
            this.consultarCliente.UseVisualStyleBackColor = false;
            this.consultarCliente.Click += new System.EventHandler(this.consultarCliente_Click);
            // 
            // btnAñadirProducto
            // 
            this.btnAñadirProducto.Anchor = System.Windows.Forms.AnchorStyles.Left;
            this.btnAñadirProducto.BackColor = System.Drawing.Color.Teal;
            this.btnAñadirProducto.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAñadirProducto.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btnAñadirProducto.Location = new System.Drawing.Point(53, 363);
            this.btnAñadirProducto.Name = "btnAñadirProducto";
            this.btnAñadirProducto.Size = new System.Drawing.Size(147, 51);
            this.btnAñadirProducto.TabIndex = 12;
            this.btnAñadirProducto.Text = "Agregar";
            this.btnAñadirProducto.UseVisualStyleBackColor = false;
            this.btnAñadirProducto.Click += new System.EventHandler(this.btnAñadirProducto_Click);
            // 
            // button2
            // 
            this.button2.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.button2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(82)))), ((int)(((byte)(209)))));
            this.button2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.2F, System.Drawing.FontStyle.Bold);
            this.button2.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.button2.Location = new System.Drawing.Point(860, 106);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(212, 43);
            this.button2.TabIndex = 19;
            this.button2.Text = "Consultar Cliente Natural";
            this.button2.UseVisualStyleBackColor = false;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // dataProductos
            // 
            this.dataProductos.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dataProductos.BackgroundColor = System.Drawing.SystemColors.ControlLightLight;
            this.dataProductos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataProductos.Location = new System.Drawing.Point(23, 451);
            this.dataProductos.Name = "dataProductos";
            this.dataProductos.RowHeadersWidth = 51;
            this.dataProductos.RowTemplate.Height = 24;
            this.dataProductos.Size = new System.Drawing.Size(1076, 156);
            this.dataProductos.TabIndex = 0;
            this.dataProductos.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataProductos_CellContentClick);
            // 
            // contextMenuStrip1
            // 
            this.contextMenuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.contextMenuStrip1.Name = "contextMenuStrip1";
            this.contextMenuStrip1.Size = new System.Drawing.Size(61, 4);
            // 
            // FrmNuevaVenta
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1118, 732);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.panel2);
            this.Name = "FrmNuevaVenta";
            this.Text = "FrmNuevaVenta";
            this.Load += new System.EventHandler(this.FrmNuevaVenta_Load_1);
            this.panel2.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.PerformLayout();
            this.panel3.ResumeLayout(false);
            this.tableLayoutPanel2.ResumeLayout(false);
            this.tableLayoutPanel3.ResumeLayout(false);
            this.tableLayoutPanel3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataProductos)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.ContextMenuStrip contextMenuStrip1;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel2;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel3;
        private System.Windows.Forms.TextBox txtAñadirProducto;
        private System.Windows.Forms.Button btnAñadirProducto;
        private System.Windows.Forms.TextBox txtIDCliente;
        private System.Windows.Forms.TextBox txtPago;
        private System.Windows.Forms.TextBox txtPrima;
        private System.Windows.Forms.TextBox txtInteres;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txtCuotas;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.TextBox txtcantidad;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnView;
        private System.Windows.Forms.Button btnMain;
        private System.Windows.Forms.DataGridView dataProductos;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button consultarCliente;
        private System.Windows.Forms.Button button2;
    }
}