using System;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar
{
    public partial class InicioSupervisor : Form
    {
        private const string PlaceholderText = "Buscar herramientas o registros...";

        public InicioSupervisor()
        {
            InitializeComponent();
            ConfigurarPlaceholder();
            InicializarOpcionesVentanillas();
        }

        private void InicializarOpcionesVentanillas()
        {
            // --- 1. OPCIONES PARA AGREGAR REGISTRO ---
            menuAgregar.Items.Add("➕ Agregar Empleado", null, (s, e) => AccionOpcion("Agregar Empleado"));
            menuAgregar.Items.Add("📦 Agregar Producto", null, (s, e) => AccionOpcion("Agregar Producto"));
            menuAgregar.Items.Add("🔥 Agregar Promoción", null, (s, e) => AccionOpcion("Agregar Promoción"));
            menuAgregar.Items.Add("🗂️ Crear Categoría", null, (s, e) => AccionOpcion("Crear Categoría"));

            // --- 2. OPCIONES PARA VER REPORTES ---
            menuReportes.Items.Add("📈 Ver Reporte de Ventas", null, (s, e) => AccionOpcion("Reporte de Ventas"));
            menuReportes.Items.Add("👥 Ver Registro de Empleados", null, (s, e) => AccionOpcion("Registro de Empleados"));
            menuReportes.Items.Add("❌ Ver Reporte de Facturas Fallidas", null, (s, e) => AccionOpcion("Facturas Fallidas"));

            // --- 3. OPCIONES PARA GESTIONAR USUARIOS ---
            menuUsuarios.Items.Add("🔒 Desactivar Usuarios", null, (s, e) => AccionOpcion("Desactivar Usuarios"));
            menuUsuarios.Items.Add("🔓 Reactivar Usuarios", null, (s, e) => AccionOpcion("Reactivar Usuarios"));
            menuUsuarios.Items.Add("🔑 Desbloquear Usuarios", null, (s, e) => AccionOpcion("Desbloquear Usuarios"));
        }

        // Método centralizado para procesar los clics de las opciones
        private void AccionOpcion(string nombreOpcion)
        {
            MessageBox.Show($"Abriendo el módulo de: {nombreOpcion}", "ElectroHogar - BAD215", MessageBoxButtons.OK, MessageBoxIcon.Information);

            // NOTA: Cuando crees tus siguientes formularios (ej. FormEmpleado), aquí harás las llamadas:
            // if(nombreOpcion == "Agregar Empleado") { new FormEmpleado().Show(); }
        }

        // Clic en tarjeta Agregar Registro
        private void btnAgregarRegistro_Click(object sender, EventArgs e)
        {
            menuAgregar.Show(btnAgregarRegistro, new Point(0, btnAgregarRegistro.Height));
        }

        // Clic en tarjeta Ver Reportes
        private void btnVerReportes_Click(object sender, EventArgs e)
        {
            menuReportes.Show(btnVerReportes, new Point(0, btnVerReportes.Height));
        }

        // Clic en tarjeta Gestionar Usuarios
        private void btnGestionarUsuarios_Click(object sender, EventArgs e)
        {
            menuUsuarios.Show(btnGestionarUsuarios, new Point(0, btnGestionarUsuarios.Height));
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
    }
}