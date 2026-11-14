using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ElectroHogar.Modulo_Cajero.Consultas
{
    public partial class FrmCCuota : Form
    {
        public FrmCCuota()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            InicioCajero inicioCajero = new InicioCajero();
            this.Close();
        }
    }
}
