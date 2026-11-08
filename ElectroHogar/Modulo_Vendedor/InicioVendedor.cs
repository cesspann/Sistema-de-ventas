using System;
using System.Drawing;
using System.Windows.Forms;
using ElectroHogar.Modulo_Vendedor.Modulo_consultasVendedor;
using ElectroHogar.Modulo_Vendedor.Gestion_clientes;

namespace ElectroHogar.Modulo_Vendedor
{
    public partial class InicioVendedor : Form
    {
        private const string PlaceholderText = "Buscar herramientas...";
        private ListBox listaResultadosBusqueda;
        private Panel pnlVentanaPerfil;
        private ContextMenuStrip menuClientes;

        public InicioVendedor()
        {
            InitializeComponent();
            ConfigurarPlaceholder();
            InicializarOpcionesVentanillas();
            ConfigurarListaBusquedaDinamica();
            
        }

        private void InicializarOpcionesVentanillas()
        {
            // --- OPCIONES PARA GESTIONAR CLIENTE ---
            menuClientes = new ContextMenuStrip();
            menuClientes.ImageScalingSize = new Size(20, 20);
            menuClientes.Items.Add(" Cliente Jurídico", null, (s, e) => AccionOpcion("Cliente Jurídico"));
            menuClientes.Items.Add(" Cliente Natural", null, (s, e) => AccionOpcion("Cliente Natural"));
        }

        // Método centralizado para abrir los módulos del vendedor
        private void AccionOpcion(string nombreOpcion)
        {
            if (nombreOpcion == "Cliente Jurídico")
            {
                GestionarClientesJuridico ventanaJuridico = new GestionarClientesJuridico();
                ventanaJuridico.FormClosed += (s, args) => this.Show();
                ventanaJuridico.Show();
                this.Hide();
            }
            else if (nombreOpcion == "Cliente Natural")
            {
                GestionarClientesNatural ventanaNatural = new GestionarClientesNatural();
                ventanaNatural.FormClosed += (s, args) => this.Show();
                ventanaNatural.Show();
                this.Hide();
            }
            else if (nombreOpcion == "Consultar Productos")
            {
                ConsultarProductosPromocion ventanaProductos = new ConsultarProductosPromocion();
                ventanaProductos.FormClosed += (s, args) => this.Show();
                ventanaProductos.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show($"Abriendo el módulo de: {nombreOpcion}", "ElectroHogar - Vendedor", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }

        // --- BOTONES PRINCIPALES ---
        private void btnConsultarCliente_Click(object sender, EventArgs e)
        {
            menuClientes.Show(btnConsultarCliente, new Point(0, btnConsultarCliente.Height));
        }

        private void btnConsultarProductos_Click(object sender, EventArgs e)
        {
            AccionOpcion("Consultar Productos");
        }

        // --- VENTANA DE PERFIL ---
        private void btnPerfil_Click(object sender, EventArgs e)
        {
            GestionPerfil ventanaPerfil = new GestionPerfil();
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
            listaResultadosBusqueda.Size = new Size(txtBuscar.Width, 100);
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

            string[] funcionesVendedor = new string[]
            {
                "Cliente Jurídico",
                "Cliente Natural",
                "Consultar Productos"
            };

            foreach (string funcion in funcionesVendedor)
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
