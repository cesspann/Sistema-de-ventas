using System;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar
{
    public partial class InicioSupervisor : Form
    {
        // Texto constante que servirá como nuestra marca de agua
        private const string PlaceholderText = "Buscar herramientas o registros...";

        // --- AQUÍ ESTÁ CORREGIDO EL NOMBRE DEL CONSTRUCTOR ---
        public InicioSupervisor()
        {
            InitializeComponent();
            ConfigurarPlaceholder();
        }

        private void ConfigurarPlaceholder()
        {
            // Configuramos el estado inicial de la caja de texto
            txtBuscar.Text = PlaceholderText;
            txtBuscar.ForeColor = Color.Gray;

            // Vinculamos los eventos dinámicamente para evitar tocar el Diseñador
            txtBuscar.Enter += txtBuscar_Enter;
            txtBuscar.Leave += txtBuscar_Leave;
        }

        // Se ejecuta cuando el usuario hace clic o se posiciona dentro del buscador
        private void txtBuscar_Enter(object sender, EventArgs e)
        {
            if (txtBuscar.Text == PlaceholderText)
            {
                txtBuscar.Text = ""; // Borramos el texto de fondo
                txtBuscar.ForeColor = Color.Black; // Cambiamos la letra a negro para cuando escriba
            }
        }

        // Se ejecuta cuando el usuario hace clic en otro lado y sale del buscador
        private void txtBuscar_Leave(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtBuscar.Text))
            {
                txtBuscar.Text = PlaceholderText; // Reestablecemos la marca de agua
                txtBuscar.ForeColor = Color.Gray; // Volvemos a poner la letra gris
            }
        }

        private void btnRegresar_Click(object sender, EventArgs e)
        {
            Form1 loginForm = new Form1();
            loginForm.Show();
            this.Close();
        }

        private void btnAgregarRegistro_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Abriendo el módulo de Gestión de Inventario para Supervisor.",
                            "ElectroHogar", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }
    }
}
