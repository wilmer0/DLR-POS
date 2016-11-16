using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace puntoVenta.ventanas_comunes
{
    public partial class ventana_busqueda_comun : Form
    {

        //variables
        public delegate void pasar(string dato);
        public event pasar pasado;


        public ventana_busqueda_comun()
        {
            InitializeComponent();
        }

        private void button16_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                string codigo = "";
                //MessageBox.Show(codigo_emp = dataGridView1.CurrentRow.Cells[0].Value.ToString());
                codigo = dataGridView1.CurrentRow.Cells[0].Value.ToString();
                pasado(codigo.ToString());
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error pasando variable hacia atras.: "+ex.ToString());
            }
        }

        private void ventana_busqueda_comun_Load(object sender, EventArgs e)
        {

        }


        public void buscarByTextbox()
        {
            if (textBox1.Text == "")
                return;


            string sql = "";
            DataSet ds = Utilidades.ejecutarcomando(sql);
            dataGridView1.DataSource = ds.Tables[0];
        }

    }
}
