using System;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar
{
    public partial class InicioSupervisor : Form
    {
        private const string PlaceholderText = "Buscar herramientas...";

        // Controles dinámicos para la búsqueda, el perfil y las sucursales
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
            // --- 1. OPCIONES PARA AGREGAR REGISTRO ---
            menuAgregar.Items.Add(" Agregar Empleado", null, (s, e) => AccionOpcion("Agregar Empleado"));
            menuAgregar.Items.Add(" Agregar Producto", null, (s, e) => AccionOpcion("Agregar Producto"));
            menuAgregar.Items.Add(" Agregar Promoción", null, (s, e) => AccionOpcion("Agregar Promoción"));
            menuAgregar.Items.Add(" Crear Categoría", null, (s, e) => AccionOpcion("Crear Categoría"));

            // --- 2. OPCIONES PARA VER REPORTES ---
            menuReportes.Items.Add(" Ver Reporte de Ventas", null, (s, e) => AccionOpcion("Reporte de Ventas"));
            menuReportes.Items.Add(" Ver Registro de Empleados", null, (s, e) => AccionOpcion("Registro de Empleados"));
            menuReportes.Items.Add(" Ver Reporte de Facturas Fallidas", null, (s, e) => AccionOpcion("Facturas Fallidas"));

            // --- 3. OPCIONES PARA GESTIONAR USUARIOS ---
            menuUsuarios.Items.Add(" Desactivar Usuarios", null, (s, e) => AccionOpcion("Desactivar Usuarios"));
            menuUsuarios.Items.Add(" Reactivar Usuarios", null, (s, e) => AccionOpcion("Reactivar Usuarios"));
            menuUsuarios.Items.Add(" Desbloquear Usuarios", null, (s, e) => AccionOpcion("Desbloquear Usuarios"));

            // --- 4. OPCIONES PARA OTRAS SUCURSALES ---
            menuSucursales = new ContextMenuStrip();
            menuSucursales.ImageScalingSize = new Size(20, 20);
            menuSucursales.Items.Add(" Reportes de Ventas", null, (s, e) => AccionOpcion("Reportes de Ventas (Otras Sucursales)"));
            menuSucursales.Items.Add(" Consultar Empleados", null, (s, e) => AccionOpcion("Consultar Empleados (Otras Sucursales)"));
            menuSucursales.Items.Add(" Consultar Productos", null, (s, e) => AccionOpcion("Consultar Productos (Otras Sucursales)"));
        }

        private void AccionOpcion(string nombreOpcion)
        {
            MessageBox.Show($"Abriendo el módulo de: {nombreOpcion}", "ElectroHogar - BAD215", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        // --- 👤 CONFIGURACIÓN DE LA VENTANA DE PERFIL ---
        // --- 👤 CONFIGURACIÓN DE LA VENTANA DE PERFIL CORREGIDA ---
        private void ConfigurarVentanaPerfilDinamica()
        {
            // 1. Crear el contenedor principal (El recuadro del dibujo)
            pnlVentanaPerfil = new Panel();
            pnlVentanaPerfil.Size = new Size(240, 160);
            pnlVentanaPerfil.BackColor = Color.FromArgb(245, 247, 250);
            pnlVentanaPerfil.BorderStyle = BorderStyle.FixedSingle;
            pnlVentanaPerfil.Visible = false;

            // POSICIONAMIENTO GLOBAL: Calculamos la posición real respecto a todo el formulario
            // Se coloca justo a la derecha del panel lateral, alineado con la altura del botón perfil
            int coordenadaX = pnlLateral.Width + 10;
            int coordenadaY = btnPerfil.Location.Y + (btnPerfil.Height / 2) - (pnlVentanaPerfil.Height / 2);
            pnlVentanaPerfil.Location = new Point(coordenadaX, coordenadaY);

            // 2. Crear la etiqueta del Nombre de Usuario
            Label lblNombreUsuario = new Label();
            lblNombreUsuario.Text = "Nombre de Usuario";
            lblNombreUsuario.Font = new Font("Segoe UI", 11F, FontStyle.Bold);
            lblNombreUsuario.ForeColor = Color.Black;
            lblNombreUsuario.Location = new Point(10, 15);
            lblNombreUsuario.Size = new Size(220, 25);
            lblNombreUsuario.TextAlign = ContentAlignment.MiddleCenter;

            // 3. Crear el botón de "Cambiar Contraseña"
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

            // 4. Crear el botón de "Desactivar"
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

            // Agregar los controles internos al panel flotante
            pnlVentanaPerfil.Controls.Add(lblNombreUsuario);
            pnlVentanaPerfil.Controls.Add(btnCambiarContra);
            pnlVentanaPerfil.Controls.Add(btnDesactivarPerfil);

            // MODIFICACIÓN CLAVE: Lo agregamos directamente a la ventana principal (Form) 
            // para que no sufra el recorte de las barras divisorias
            this.Controls.Add(pnlVentanaPerfil);

            // Forzamos a que se dibuje en la capa de más arriba de toda la interfaz
            pnlVentanaPerfil.BringToFront();

            // Enlazamos el clic de tu botón perfil
            btnPerfil.Click += BtnPerfil_Click;
        }


        private void BtnPerfil_Click(object sender, EventArgs e)
        {
            pnlVentanaPerfil.Visible = !pnlVentanaPerfil.Visible;
        }

        // --- 🔍 CONFIGURACIÓN DEL CONTENEDOR DE BÚSQUEDA PASIVO ---
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

            // Lista maestra actualizada con las nuevas opciones de Sucursales
            string[] todasLasFunciones = new string[]
{
    "Agregar Empleado", "Agregar Producto", "Agregar Promoción", "Crear Categoría",
    "Ver Reporte de Ventas", "Ver Registro de Empleados", "Ver Reporte de Facturas Fallidas",
    "Desactivar Usuarios", "Reactivar Usuarios", "Desbloquear Usuarios",
    "Reportes de Ventas (Sucursales)", "Consultar Empleados (Sucursales)", "Consultar Productos (Sucursales)"
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

        private void btnAgregarRegistro_Click(object sender, EventArgs e)
        {
            menuAgregar.Show(btnAgregarRegistro, new Point(0, btnAgregarRegistro.Height));
        }

        private void btnVerReportes_Click(object sender, EventArgs e)
        {
            menuReportes.Show(btnVerReportes, new Point(0, btnVerReportes.Height));
        }

        private void btnGestionarUsuarios_Click(object sender, EventArgs e)
        {
            menuUsuarios.Show(btnGestionarUsuarios, new Point(0, btnGestionarUsuarios.Height));
        }

        // Clic en la tarjeta Otras Sucursales
        private void btnOtrasSucursales_Click(object sender, EventArgs e)
        {
            menuSucursales.Show(btnOtrasSucursales, new Point(0, btnOtrasSucursales.Height));
        }

        private void ConfigurarPlaceholder()
        {
            txtBuscar.Text = PlaceholderText;
            txtBuscar.ForeColor = Color.Gray;
            txtBuscar.Enter += txtBuscar_Enter;
            txtBuscar.Leave += txtBuscar_Leave;
        }

        private void txtBuscar_Enter(object sender, EventArgs e)
        {
            if (txtBuscar.Text == PlaceholderText)
            {
                txtBuscar.Text = "";
                txtBuscar.ForeColor = Color.Black;
            }
        }

        private void txtBuscar_Leave(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtBuscar.Text))
            {

                txtBuscar.Text = PlaceholderText;
                txtBuscar.ForeColor = Color.Gray;
            }
        }
        private void btnRegresar_Click(object sender, EventArgs e)
        {
            Form1 loginForm = new Form1();
            loginForm.Show();
            this.Close();
        }
        private void menuReportes_Opening(object sender, System.ComponentModel.CancelEventArgs e)
        {
        }
    }
}