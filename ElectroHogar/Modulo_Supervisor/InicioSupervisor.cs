using System;
using System.Drawing;
using System.Windows.Forms;
using ElectroHogar.Modulo_Supervisor.submodulo_productos;
using ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios;

namespace ElectroHogar
{
    public partial class InicioSupervisor : Form
    {
        private const string PlaceholderText = "Buscar herramientas...";
        private ListBox listaResultadosBusqueda;
        private Panel pnlVentanaPerfil;
        private ContextMenuStrip menuSucursales;

        public InicioSupervisor()
        {
            InitializeComponent();
            ConfigurarPlaceholder();
            InicializarOpcionesVentanillas();
            ConfigurarListaBusquedaDinamica();
            ConfigurarVentanaPerfilDinamica();
        }

        private void InicializarOpcionesVentanillas()
        {
            // --- 1. OPCIONES PARA VER REPORTES (EN UNA SOLA LISTA DIRECTA) ---
            menuReportes.Items.Add(" Reporte de Ventas General", null, (s, e) => AccionOpcion("Reporte de Ventas General"));
            menuReportes.Items.Add(" Reporte de Ventas por Vendedor", null, (s, e) => AccionOpcion("Reporte de Ventas por Vendedor"));
            menuReportes.Items.Add(" Reporte de Ventas por Categoría", null, (s, e) => AccionOpcion("Reporte de Ventas por Categoría"));
            menuReportes.Items.Add(" Reporte de Ventas por Proveedor", null, (s, e) => AccionOpcion("Reporte de Ventas por Proveedor"));
            menuReportes.Items.Add(" Bitácora de Facturas Fallidas", null, (s, e) => AccionOpcion("Bitácora de Facturas Fallidas"));
            menuReportes.Items.Add(" Créditos Otorgados", null, (s, e) => AccionOpcion("Créditos Otorgados"));

            // --- 2. OPCIONES PARA GESTIONAR USUARIOS ---
            menuUsuarios.Items.Add(" Consultar Cajeros", null, (s, e) => AccionOpcion("Consultar Cajeros"));
            menuUsuarios.Items.Add(" Consultar Vendedores", null, (s, e) => AccionOpcion("Consultar Vendedores"));
            menuUsuarios.Items.Add(" Consultar Supervisores", null, (s, e) => AccionOpcion("Consultar Supervisores"));

            // --- 3. OPCIONES PARA OTRAS SUCURSALES ---
            menuSucursales = new ContextMenuStrip();
            menuSucursales.ImageScalingSize = new Size(20, 20);
            menuSucursales.Items.Add(" Reportes de Ventas", null, (s, e) => AccionOpcion("Reportes de Ventas (Otras Sucursales)"));
            menuSucursales.Items.Add(" Consultar Empleados", null, (s, e) => AccionOpcion("Consultar Empleados (Otras Sucursales)"));
            menuSucursales.Items.Add(" Consultar Productos", null, (s, e) => AccionOpcion("Consultar Productos (Otras Sucursales)"));
        }

        private void AccionOpcion(string nombreOpcion)
        {
            if (nombreOpcion == "Gestionar Inventario" || nombreOpcion == "Gestionar Productos")
            {
                GestionProductosSupervisor ventanaProductos = new GestionProductosSupervisor();
                ventanaProductos.FormClosed += (s, args) => this.Show();
                ventanaProductos.Show();
                this.Hide();
            }
            else if (nombreOpcion == "Consultar Cajeros")
            {
                GestionCajerosSupervisor ventanaCajeros = new GestionCajerosSupervisor();
                ventanaCajeros.FormClosed += (s, args) => this.Show();
                ventanaCajeros.Show();
                this.Hide();
            }
            else if (nombreOpcion == "Consultar Vendedores")
            {
                gestiona_vendedor ventanaVendedores = new gestiona_vendedor();
                ventanaVendedores.FormClosed += (s, args) => this.Show();
                ventanaVendedores.Show();
                this.Hide();
            }
            else if (nombreOpcion == "Consultar Supervisores")
            {
                gestiona_supervisor ventanaSupervisores = new gestiona_supervisor();
                ventanaSupervisores.FormClosed += (s, args) => this.Show();
                ventanaSupervisores.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show($"Abriendo el módulo de: {nombreOpcion}", "ElectroHogar - BAD215", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        private void ConfigurarVentanaPerfilDinamica()
        {
            pnlVentanaPerfil = new Panel();
            pnlVentanaPerfil.Size = new Size(240, 160);
            pnlVentanaPerfil.BackColor = Color.FromArgb(245, 247, 250);
            pnlVentanaPerfil.BorderStyle = BorderStyle.FixedSingle;
            pnlVentanaPerfil.Visible = false;

            int coordenadaX = pnlLateral.Width + 10;
            int coordenadaY = btnPerfil.Location.Y + (btnPerfil.Height / 2) - (pnlVentanaPerfil.Height / 2);
            pnlVentanaPerfil.Location = new Point(coordenadaX, coordenadaY);

            Label lblNombreUsuario = new Label();
            lblNombreUsuario.Text = "Supervisor";
            lblNombreUsuario.Font = new Font("Segoe UI", 11F, FontStyle.Bold);
            lblNombreUsuario.ForeColor = Color.Black;
            lblNombreUsuario.Location = new Point(10, 15);
            lblNombreUsuario.Size = new Size(220, 25);
            lblNombreUsuario.TextAlign = ContentAlignment.MiddleCenter;

            Button btnCambiarContra = new Button();
            btnCambiarContra.Text = "Cambiar Contraseña";
            btnCambiarContra.Font = new Font("Segoe UI", 9.5F);
            btnCambiarContra.Size = new Size(200, 35);
            btnCambiarContra.Location = new Point(20, 55);
            btnCambiarContra.BackColor = Color.White;
            btnCambiarContra.FlatStyle = FlatStyle.Flat;
            btnCambiarContra.FlatAppearance.BorderColor = Color.LightGray;
            btnCambiarContra.Click += (s, e) => {
                AccionOpcion("Cambiar Contraseña");
                pnlVentanaPerfil.Visible = false;
            };

            Button btnDesactivarPerfil = new Button();
            btnDesactivarPerfil.Text = "Desactivar Cuenta";
            btnDesactivarPerfil.Font = new Font("Segoe UI", 9.5F);
            btnDesactivarPerfil.Size = new Size(200, 35);
            btnDesactivarPerfil.Location = new Point(20, 100);
            btnDesactivarPerfil.BackColor = Color.FromArgb(231, 76, 60);
            btnDesactivarPerfil.ForeColor = Color.White;
            btnDesactivarPerfil.FlatStyle = FlatStyle.Flat;
            btnDesactivarPerfil.FlatAppearance.BorderSize = 0;
            btnDesactivarPerfil.Click += (s, e) => {
                AccionOpcion("Desactivar Cuenta");
                pnlVentanaPerfil.Visible = false;
            };

            pnlVentanaPerfil.Controls.Add(lblNombreUsuario);
            pnlVentanaPerfil.Controls.Add(btnCambiarContra);
            pnlVentanaPerfil.Controls.Add(btnDesactivarPerfil);

            this.Controls.Add(pnlVentanaPerfil);
            pnlVentanaPerfil.BringToFront();

            btnPerfil.Click += (s, e) => pnlVentanaPerfil.Visible = !pnlVentanaPerfil.Visible;
        }

        private void ConfigurarListaBusquedaDinamica()
        {
            listaResultadosBusqueda = new ListBox();
            listaResultadosBusqueda.Font = new Font("Segoe UI", 11F);
            listaResultadosBusqueda.Visible = false;
            listaResultadosBusqueda.Location = new Point(txtBuscar.Location.X, txtBuscar.Location.Y + txtBuscar.Height);
            listaResultadosBusqueda.Size = new Size(txtBuscar.Width, 120);
            listaResultadosBusqueda.BorderStyle = BorderStyle.FixedSingle;
            listaResultadosBusqueda.BackColor = Color.White;

            listaResultadosBusqueda.Click += ListaResultadosBusqueda_Click;
            pnlContenido.Controls.Add(listaResultadosBusqueda);
            listaResultadosBusqueda.BringToFront();
        }

        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            if (listaResultadosBusqueda == null) return;

            string textoBusqueda = txtBuscar.Text.Trim();

            if (string.IsNullOrEmpty(textoBusqueda) || textoBusqueda == PlaceholderText)
            {
                listaResultadosBusqueda.Visible = false;
                return;
            }

            listaResultadosBusqueda.Items.Clear();

            string[] todasLasFunciones = new string[]
            {
                "Gestionar Inventario",
                "Reporte de Ventas General",
                "Reporte de Ventas por Vendedor",
                "Reporte de Ventas por Categoría",
                "Reporte de Ventas por Proveedor",
                "Bitácora de Facturas Fallidas",
                "Créditos Otorgados",
                "Consultar Cajeros",
                "Consultar Vendedores",
                "Consultar Supervisores",
                "Reportes de Ventas (Otras Sucursales)",
                "Consultar Empleados (Otras Sucursales)",
                "Consultar Productos (Otras Sucursales)"
            };

            foreach (string funcion in todasLasFunciones)
            {
                if (funcion.ToLower().Contains(textoBusqueda.ToLower()))
                {
                    listaResultadosBusqueda.Items.Add(funcion);
                }
            }

            listaResultadosBusqueda.Visible = (listaResultadosBusqueda.Items.Count > 0);
        }

        private void ListaResultadosBusqueda_Click(object sender, EventArgs e)
        {
            if (listaResultadosBusqueda.SelectedItem != null)
            {
                string funcionSeleccionada = listaResultadosBusqueda.SelectedItem.ToString();
                AccionOpcion(funcionSeleccionada);

                listaResultadosBusqueda.Visible = false;
                txtBuscar.Text = PlaceholderText;
                txtBuscar.ForeColor = Color.Gray;
                this.ActiveControl = null;
            }
        }

        private void btnGestionarInventario_Click(object sender, EventArgs e)
        {
            AccionOpcion("Gestionar Inventario");
        }


        private void btnVerReportes_Click(object sender, EventArgs e)
        {
            menuReportes.Show(btnVerReportes, new Point(0, btnVerReportes.Height));
        }
        private void btnGestionarUsuarios_Click(object sender, EventArgs e)
        {
            menuUsuarios.Show(btnGestionarUsuarios, new Point(0, btnGestionarUsuarios.Height));
        }
        private void btnOtrasSucursales_Click(object sender, EventArgs e)
        {
            menuSucursales.Show(btnOtrasSucursales, new Point(0, btnOtrasSucursales.Height));
        }
        private void ConfigurarPlaceholder()
        {
            txtBuscar.Text = PlaceholderText;
            txtBuscar.ForeColor = Color.Gray;
            txtBuscar.Enter += (s, e) => {
                if (txtBuscar.Text == PlaceholderText)
                {
                    txtBuscar.Text = "";
                    txtBuscar.ForeColor = Color.Black;
                }
            };
            txtBuscar.Leave += (s, e) => {
                if (string.IsNullOrWhiteSpace(txtBuscar.Text))
                {
                    txtBuscar.Text = PlaceholderText;
                    txtBuscar.ForeColor = Color.Gray;
                }
            };
        }
        private void btnRegresar_Click(object sender, EventArgs e)
        {
            Form1 loginForm = new Form1();
            loginForm.Show();
            this.Close();
        }
    }
}