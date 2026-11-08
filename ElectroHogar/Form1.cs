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


            string imagePath = Path.Combine(Application.StartupPath, "logo.jpg");

            if (File.Exists(imagePath))
            {
                picLogo.Image = Image.FromFile(imagePath);
            }
            else
            {
         
                string folderPath = @"C:\Users\Saa Vasquez\Desktop\Proyecto-BAD215\ElectroHogar";
                string fallbackPath = Path.Combine(folderPath, "logo.jpg");

                if (File.Exists(fallbackPath))
                {
                    picLogo.Image = Image.FromFile(fallbackPath);
                }
            }
        }

        private void btnIngresar_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(txtUsuario.Text) || string.IsNullOrWhiteSpace(txtContrasena.Text))
            {
                MessageBox.Show("Por favor, escriba su usuario y contraseña.",
                                "Campos Vacíos", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            InicioSupervisor pantallaVendedor = new InicioSupervisor();

            pantallaVendedor.Show();


            this.Hide();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}