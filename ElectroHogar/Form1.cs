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

            string folderPath = @"C:\Users\Saa Vasquez\Desktop\Proyecto-BAD215\ElectroHogar";
            string imagePath = Path.Combine(folderPath, "logo.jpg");

            if (File.Exists(imagePath))
            {
                picLogo.Image = Image.FromFile(imagePath);
            }
        }

        // --- AQUÍ SE REALIZA LA CONEXIÓN CON LA PANTALLA INICIO SUPERVISOR ---
        private void btnIngresar_Click(object sender, EventArgs e)
        {
            // 1. Validamos que el usuario no deje los campos vacíos
            if (string.IsNullOrWhiteSpace(txtUsuario.Text) || string.IsNullOrWhiteSpace(txtContrasena.Text))
            {
                MessageBox.Show("Por favor, escriba su usuario y contraseña.",
                                "Campos Vacíos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // 2. Instanciamos la nueva pantalla del Supervisor
            InicioSupervisor pantallaSupervisor = new InicioSupervisor();

            // 3. Mostramos la pantalla de inicio del supervisor
            pantallaSupervisor.Show();

            // 4. Ocultamos el login para que no interfiera visualmente
            this.Hide();
        }
    }
}

