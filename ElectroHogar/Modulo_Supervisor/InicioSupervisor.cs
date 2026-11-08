using ElectroHogar.Modulo_Supervisor;
using ElectroHogar.Modulo_Supervisor.ConsultasLocales;
using ElectroHogar.Modulo_Supervisor.Gestionar_Usuarios;
using ElectroHogar.Modulo_Supervisor.OtrasSucursales;
using ElectroHogar.Modulo_Supervisor.ReportesLocales;
using ElectroHogar.Modulo_Supervisor.submodulo_productos;
using System;
using System.Drawing;
using System.Windows.Forms;
using System.Windows.Forms;

namespace ElectroHogar
{
    public partial class InicioSupervisor : Form
    {
        private const string PlaceholderText = "Buscar herramientas...";
        private ListBox listaResultadosBusqueda;
        private ContextMenuStrip menuSucursales;
        private ContextMenuStrip menuConsultasLocales;

        public InicioSupervisor()
        {
            InitializeComponent();
            ConfigurarPlaceholder();
            InicializarOpcionesVentanillas();
            ConfigurarListaBusquedaDinamica();

            btnPerfil.Click += btnPerfil_Click;
        }

        private void InicializarOpcionesVentanillas()
        {

            // --- 2. OPCIONES PARA GESTIONAR USUARIOS ---
            menuUsuarios.Items.Add(" Consultar Cajeros", null, (s, e) => AccionOpcion("Consultar Cajeros"));
            menuUsuarios.Items.Add(" Consultar Vendedores", null, (s, e) => AccionOpcion("Consultar Vendedores"));
            menuUsuarios.Items.Add(" Consultar Supervisores", null, (s, e) => AccionOpcion("Consultar Supervisores"));

            // --- 3. OPCIONES PARA CONSULTAS LOCALES ---
            menuConsultasLocales = new ContextMenuStrip();
            menuConsultasLocales.ImageScalingSize = new Size(20, 20);
            menuConsultasLocales.Items.Add(" Consultar Cliente Natural", null, (s, e) => AccionOpcion("Consultar Cliente Natural"));
            menuConsultasLocales.Items.Add(" Consultar Cliente Jurídico", null, (s, e) => AccionOpcion("Consultar Cliente Jurídico"));
            menuConsultasLocales.Items.Add(" Bitácora de Facturas Fallidas", null, (s, e) => AccionOpcion("Bitácora de Facturas Fallidas"));
            menuConsultasLocales.Items.Add(" Créditos Otorgados", null, (s, e) => AccionOpcion("Créditos Otorgados"));


            // --- 4. OPCIONES PARA OTRAS SUCURSALES ---
            menuSucursales = new ContextMenuStrip();
            menuSucursales.ImageScalingSize = new Size(20, 20);
            menuSucursales.Items.Add(" Reportes de Ventas", null, (s, e) => AccionOpcion("Reportes de Ventas (Otras Sucursales)"));
            menuSucursales.Items.Add(" Consultar Productos", null, (s, e) => AccionOpcion("Consultar Productos (Otras Sucursales)"));


            // --- 1. OPCIONES PARA VER REPORTES ---
            menuReportes.Items.Add(" Reporte de Ventas General", null, (s, e) => AccionOpcion("Reporte de Ventas General"));
            menuReportes.Items.Add(" Reporte de Ventas por Vendedor", null, (s, e) => AccionOpcion("Reporte de Ventas por Vendedor"));
            menuReportes.Items.Add(" Reporte de Ventas por Categoría", null, (s, e) => AccionOpcion("Reporte de Ventas por Categoría"));
            menuReportes.Items.Add(" Reporte de Ventas por Proveedor", null, (s, e) => AccionOpcion("Reporte de Ventas por Proveedor"));
            menuReportes.Items.Add(" Reporte de Inventario", null, (s, e) => AccionOpcion("Reporte de Inventario"));

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
            else if (nombreOpcion == "Reporte de Ventas por Vendedor")
            {
                ventas_vendedor ventanaReporteVendedor = new ventas_vendedor();
                ventanaReporteVendedor.FormClosed += (s, args) => this.Show();
                ventanaReporteVendedor.Show();
                this.Hide();
            }
            else if (nombreOpcion == "Reporte de Ventas por Categoría")
            {
                ventas_categoria ventanaReporteCategoria = new ventas_categoria();
                ventanaReporteCategoria.FormClosed += (s, args) => this.Show();
                ventanaReporteCategoria.Show();
                this.Hide();
            }
            else if (nombreOpcion == "Reporte de Ventas General")
            {
                ventas_general ventanaReporteGeneral = new ventas_general();
                ventanaReporteGeneral.FormClosed += (s, args) => this.Show();
                ventanaReporteGeneral.Show();
                this.Hide();
            }
            else if (nombreOpcion == "Reporte de Ventas por Proveedor")
            {
                ventas_proveedor ventanaReporteProveedor = new ventas_proveedor();
                ventanaReporteProveedor.FormClosed += (s, args) => this.Show();
                ventanaReporteProveedor.Show();
                this.Hide();
            }
            else if (nombreOpcion == "Reporte de Inventario")
            {
                Reporte_Inventario ventanaReporteInventario = new Reporte_Inventario();
                ventanaReporteInventario.FormClosed += (s, args) => this.Show();
                ventanaReporteInventario.Show();
                this.Hide();
            }
            else if (nombreOpcion == "Consultar Cliente Natural")
            {
                ClienteNatural ventanaClienteNatural = new ClienteNatural();
                ventanaClienteNatural.FormClosed += (s, args) => this.Show();
                ventanaClienteNatural.Show();
                this.Hide();
            }
            else if (nombreOpcion == "Consultar Cliente Jurídico")
            {
                ClienteJuridico ventanaClienteJuridico = new ClienteJuridico();
                ventanaClienteJuridico.FormClosed += (s, args) => this.Show();
                ventanaClienteJuridico.Show();
                this.Hide();
            }
            else if (nombreOpcion == "Bitácora de Facturas Fallidas")
            {
                BitacoraFacturasFallidas ventanaBitacora = new BitacoraFacturasFallidas();
                ventanaBitacora.FormClosed += (s, args) => this.Show();
                ventanaBitacora.Show();
                this.Hide();
            }
            else if (nombreOpcion == "Créditos Otorgados")
            {
                CreditosOtorgados ventanaCreditos = new CreditosOtorgados();
                ventanaCreditos.FormClosed += (s, args) => this.Show();
                ventanaCreditos.Show();
                this.Hide();
            }
            else if (nombreOpcion == "Consultar Productos (Otras Sucursales)")
            {
                productos ventanaProductosSucursal = new productos();
                ventanaProductosSucursal.FormClosed += (s, args) => this.Show();
                ventanaProductosSucursal.Show();
                this.Hide();
            }
            else if (nombreOpcion == "Reportes de Ventas (Otras Sucursales)")
            {
                ventas ventanaVentasSucursal = new ventas();
                ventanaVentasSucursal.FormClosed += (s, args) => this.Show();
                ventanaVentasSucursal.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show($"Abriendo el módulo de: {nombreOpcion}", "ElectroHogar - BAD215", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        // --- PERFIL DEL SUPERVISOR ---
        private void btnPerfil_Click(object sender, EventArgs e)
        {
            GestionarPerfilSupervisor ventanaPerfil = new GestionarPerfilSupervisor();
            if (ventanaPerfil.ShowDialog() == DialogResult.Abort)
            {
                Form1 loginForm = new Form1();
                loginForm.Show();
                this.Close();
            }
        }

        // --- BÚSQUEDA DINÁMICA ---
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
                "Reporte de Inventario",
                "Consultar Cliente Natural",
                "Consultar Cliente Jurídico",
                "Bitácora de Facturas Fallidas",
                "Créditos Otorgados",
                "Consultar Cajeros",
                "Consultar Vendedores",
                "Consultar Supervisores",
                "Reportes de Ventas (Otras Sucursales)",
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

        // --- BOTONES PRINCIPALES ---
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

        private void btnConsultasLocales_Click(object sender, EventArgs e)
        {
            menuConsultasLocales.Show(btnConsultasLocales, new Point(0, btnConsultasLocales.Height));
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
