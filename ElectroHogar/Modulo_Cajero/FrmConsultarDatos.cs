using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Cajero
{
    public partial class FrmConsultarDatos : Form
    {
        public FrmConsultarDatos()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button9_Click(object sender, EventArgs e)
        {
            InicioCajero inicioCajero = new InicioCajero();
            this.Close();
        }
    }
}
