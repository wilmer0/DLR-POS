using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace puntoVenta.modulo_opciones
{
    public partial class backup : Form
    {
        Utilidades utilidades=new Utilidades();
        public backup()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

            if (ckSistema.Checked)
            {
                Utilidades.backupSql(@"C:\Users\wilmer\Documents\GitHub\DLR-POS\proyecto\otros\backups\","punto_venta");
                
            }

            if (ckBaseDatos.Checked)
            {
                //Utilidades.backupSql(@"C:\Users\wilmer\Documents\GitHub\DLR-POS\proyecto\otros\backups\", "punto_venta");
                
            }
        }
    }
}
