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

            // Recuperamos el usuario de la sesión activa y la hora exacta del sistema
            labelUser.Text = "👤 Cajero: " + SesionUsuario.NombreEmpleado;
            labelDate.Text = "🕒 " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
        }

        // Evento opcional si agregaste un Timer para actualizar la hora cada segundo
        private void timer1_Tick(object sender, EventArgs e)
        {
            labelDate.Text = "🕒 " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
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
            AbrirSubVentana(new FrmConsultarDatos());
        }

        private void button4_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new FrmEliminarFactura());
        }

        private void button6_Click(object sender, EventArgs e)
        {
            AbrirSubVentana(new FrmDatosCajero());
        }

        private void labelDate_Click(object sender, EventArgs e) { }
        private void labelUser_Click(object sender, EventArgs e) { }
        private void panel2_Paint(object sender, PaintEventArgs e) { }
        private void label1_Click(object sender, EventArgs e) { }
        private void label2_Click(object sender, EventArgs e) { }
    }
}