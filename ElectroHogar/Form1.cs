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
            // 1. Forzar a que el PictureBox sea perfectamente cuadrado para que el recorte sea un círculo exacto
            picLogo.Width = 160;
            picLogo.Height = 160;
            picLogo.Left = (this.ClientSize.Width - picLogo.Width) / 2; // Centrado automático en la pantalla

            // 2. Crear una máscara circular sobre el PictureBox
            GraphicsPath path = new GraphicsPath();
            path.AddEllipse(0, 0, picLogo.Width, picLogo.Height);
            picLogo.Region = new Region(path);

            // 3. Carga de tu imagen JPG
            string folderPath = @"C:\Users\Saa Vasquez\Desktop\Proyecto-BAD215\ElectroHogar";
            string imagePath = Path.Combine(folderPath, "logo.jpg");

            if (File.Exists(imagePath))
            {
                picLogo.Image = Image.FromFile(imagePath);
            }
            else
            {
                MessageBox.Show("No se encontró la imagen logo.jpg en la ruta especificada.",
                                "Imagen faltante", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnIngresar_Click(object sender, EventArgs e)
        {
            MessageBox.Show("¡Intentando iniciar sesión con el nuevo diseño!");
        }

        private void lblUsuario_Click(object sender, EventArgs e)
        {

        }

        private void txtContrasena_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
