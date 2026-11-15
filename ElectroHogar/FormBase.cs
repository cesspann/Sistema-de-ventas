using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace ElectroHogar
{
    public partial class FormBase : Form
    {
        public FormBase()
        {
            InitializeComponent();
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (LicenseManager.UsageMode == LicenseUsageMode.Designtime)
                return;

            string fecha = DateTime.Now.ToShortDateString();

            if (!string.IsNullOrEmpty(SesionUsuario.NombreUsuario))
            {
                lblFecha.Text = $"Usuario: {SesionUsuario.NombreUsuario}  |  {fecha}";
            }
            else
            {
                lblFecha.Text = fecha;
            }

            // 1. Asegurar que crezca según el largo del nombre de usuario
            lblFecha.AutoSize = true;

            // 2. Anclar a la esquina superior derecha
            lblFecha.Anchor = AnchorStyles.Top | AnchorStyles.Right;

            // 3. Posicionar con un margen de 15px a la derecha y 10px arriba
            PosicionarFecha();

            // 4. Traerlo al frente para que ningún panel lo tape
            lblFecha.BringToFront();
        }

        protected override void OnResize(EventArgs e)
        {
            base.OnResize(e);
            if (lblFecha != null && LicenseManager.UsageMode != LicenseUsageMode.Designtime)
            {
                PosicionarFecha();
            }
        }

        private void PosicionarFecha()
        {
            int margenDerecho = 15;
            int margenSuperior = 10;

            lblFecha.Location = new Point(
                this.ClientSize.Width - lblFecha.Width - margenDerecho,
                margenSuperior
            );
        }

        private void FormBase_Load(object sender, EventArgs e)
        {

        }
    }
}








