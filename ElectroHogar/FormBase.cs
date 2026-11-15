using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ElectroHogar
{
    public partial class FormBase : Form
    {
        public FormBase()
        {
            InitializeComponent();

            string fecha = DateTime.Now.ToShortDateString();

            if (LicenseManager.UsageMode != LicenseUsageMode.Designtime)
            {
                lblFecha.Text = DateTime.Now.ToShortDateString();
            }

            if (!string.IsNullOrEmpty(SesionUsuario.NombreUsuario))
            {
                lblFecha.Text = $"Usuario: {SesionUsuario.NombreUsuario}  |  {fecha}";
            }
            else
            {
                lblFecha.Text = fecha;
            }
        }
    }
}
