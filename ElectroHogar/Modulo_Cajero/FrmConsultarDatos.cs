using ElectroHogar.Modulo_Cajero.Consultas;
using ElectroHogar.Modulo_Vendedor.Modulo_consultasVendedor;
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
    public partial class FrmConsultarDatos : FormBase
    {
        private void AbrirSubVentana(Form ventanaHija)
        {
            ventanaHija.FormClosed += (s, args) => this.Show();
            ventanaHija.Show();
            this.Hide();
        }
        public FrmConsultarDatos()
        {
            InitializeComponent();
        }

        private void button13_Click(object sender, EventArgs e)
        {

            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new Consultas.FrmCClienteNatural());
            

        }

        private void button2_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new Consultas.FrmCClienteJuridico());
            
        }

        private void button3_Click(object sender, EventArgs e)
        {
            FrmCFactura facturaV = new FrmCFactura();
            facturaV.FormClosed += (s, args) => this.Show();
            facturaV.Show();
            
        }

        private void button4_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new Consultas.FrmCDetalleFactura());
            
        }

        private void button5_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new Consultas.FrmCBitacoraFactura());
            
        }

        private void button7_Click(object sender, EventArgs e)
        {
            FrmCLimiteCredito limiteCreditoV = new FrmCLimiteCredito();
            limiteCreditoV.FormClosed += (s, args) => this.Show();
            limiteCreditoV.Show();

        }

        private void button8_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new Consultas.FrmCPromocion());
            
        }

        private void button6_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new Consultas.FrmCCredito());
            
        }

        private void button10_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new Consultas.FrmCCuota());
            
        }

        private void button11_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new Consultas.FrmCInventario());
            
        }

        private void tableLayoutPanel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
