using ElectroHogar.Modulo_Vendedor;
using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Windows.Forms;

namespace ElectroHogar
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            ConfigurarLogoRedondo();
        }

        private void ConfigurarLogoRedondo()
        {
            picLogo.Width = 160;
            picLogo.Height = 160;
            picLogo.Left = (this.ClientSize.Width - picLogo.Width) / 2;

            GraphicsPath path = new GraphicsPath();
            path.AddEllipse(0, 0, picLogo.Width, picLogo.Height);
            picLogo.Region = new Region(path);

            // CORRECCIÓN RUTA DINÁMICA: 
            // Intenta buscar el logo en la carpeta de ejecución para que no falle en las PC de tus compañeros.
            string imagePath = Path.Combine(Application.StartupPath, "logo.jpg");

            if (File.Exists(imagePath))
            {
                picLogo.Image = Image.FromFile(imagePath);
            }
            else
            {
                // Ruta local de respaldo en tu escritorio si aún no se ha copiado a la carpeta Debug/Release
                string folderPath = @"C:\Users\Saa Vasquez\Desktop\Proyecto-BAD215\ElectroHogar";
                string fallbackPath = Path.Combine(folderPath, "logo.jpg");

                if (File.Exists(fallbackPath))
                {
                    picLogo.Image = Image.FromFile(fallbackPath);
                }
            }
        }

        // --- ENTRADA DIRECTA A INICIO SUPERVISOR ---
        private void btnIngresar_Click(object sender, EventArgs e)
        {
            // 1. Validamos que el usuario no deje los campos vacíos
            if (string.IsNullOrWhiteSpace(txtUsuario.Text) || string.IsNullOrWhiteSpace(txtContrasena.Text))
            {
                MessageBox.Show("Por favor, escriba su usuario y contraseña.",
                                "Campos Vacíos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // 2. Instanciamos la pantalla de Inicio del Supervisor directamente
            InicioVendedor pantallaVendedor = new InicioVendedor();

            // 3. Mostramos la pantalla del supervisor
            pantallaVendedor.Show();

            // 4. Ocultamos el login de inmediato
            this.Hide();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}