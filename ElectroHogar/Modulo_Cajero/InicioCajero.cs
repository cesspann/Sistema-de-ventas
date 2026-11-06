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
    public partial class InicioCajero : Form
    {
        private void AbrirSubVentana(Form ventanaHija)
        {
            ventanaHija.FormClosed += (s, args) => this.Show();      
            ventanaHija.Show();
            this.Hide();
        }
        public InicioCajero()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new FrmNuevaVenta());
        }

        private void button2_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new FrmPagoCredito());
        }

        private void button3_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new FrmConsultarDatos()) ;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new FrmEliminarFactura());
        }

        private void button5_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new FrmModificarDatos());
        }

        private void button6_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new FrmDatosCajero());
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
