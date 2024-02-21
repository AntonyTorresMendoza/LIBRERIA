using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (var bd = new DB_LIBRERIAEntities())
            {
                var lectores = new Clientes();
                lectores.ID = 5;
                lectores.Nombre = "antonio";
                lectores.Genero = "masculino";
                bd.Clientes.Add(lectores);
                bd.SaveChanges();
            }
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
