using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using puntoVenta;
namespace puntoVenta
{
    public partial class imprimir_cobros : Form
    {
        public imprimir_cobros()
        {
            InitializeComponent();
        }
        public string codigo_cobro = "0";
        internal singleton s { get; set; }
        private void imprimir_cobros_Load(object sender, EventArgs e)
        {
            //MessageBox.Show("cobro recivido #"+codigo_cobro.ToString());
            printDocument1.Print();
            this.Close();
        }
        
        private void printDocument1_PrintPage(object sender, System.Drawing.Printing.PrintPageEventArgs e)
        {
            s = singleton.obtenerDatos();
            string sql = "select t.nombre from venta_vs_pagos vp join factura f on vp.cod_factura=f.codigo join sucursal s on f.cod_sucursal=s.codigo join tercero t on t.codigo=s.codigo where vp.codigo='" + codigo_cobro.ToString() + "'";
            DataSet ds = Utilidades.ejecutarcomando(sql);
            string nombre_sucursal = ds.Tables[0].Rows[0][0].ToString();


            sql = "select vp.codigo,vp.cod_factura,f.codigo_tipo_factura,vp.fecha,vp.detalle,vp.monto,vp.devuelta,(t.nombre+' '+p.apellido)as nombre,vp.tarjeta,vp.cheque,vp.transferencia from factura f join venta_vs_pagos vp on f.codigo=vp.cod_factura join cliente c on c.codigo=f.codigo_cliente join tercero t on t.codigo=c.codigo join persona p on p.codigo=t.codigo where vp.codigo='" + codigo_cobro.ToString() + "'";
            ds = Utilidades.ejecutarcomando(sql);
            string codigo_factura = ds.Tables[0].Rows[0][1].ToString();
            string tipo_factura = ds.Tables[0].Rows[0][2].ToString();
            string detalle = ds.Tables[0].Rows[0][4].ToString();
            double monto = Convert.ToDouble(ds.Tables[0].Rows[0][5].ToString());
            double devuelta =Convert.ToDouble(ds.Tables[0].Rows[0][6].ToString());
            string nombre_cliente = ds.Tables[0].Rows[0][7].ToString();
            double tarjeta = Convert.ToDouble(ds.Tables[0].Rows[0][8].ToString());
            double cheque = Convert.ToDouble(ds.Tables[0].Rows[0][9].ToString());
            double deposito = Convert.ToDouble(ds.Tables[0].Rows[0][10].ToString());
            sql = "select t.nombre from venta_vs_pagos vp join factura f on vp.cod_factura=f.codigo join sucursal s on f.cod_sucursal=s.codigo join empresa e on e.codigo=s.codigo_empresa join tercero t on t.codigo=s.codigo_empresa where vp.codigo='" + codigo_cobro.ToString() + "'";
            ds = Utilidades.ejecutarcomando(sql);
            string nombre_empresa = ds.Tables[0].Rows[0][0].ToString();

            sql = "select (t.nombre+' '+p.apellido) from tercero t join persona p on t.codigo=p.codigo join empleado e on e.codigo=t.codigo join venta_vs_pagos vp on vp.cod_empleado=e.codigo where vp.codigo='" + codigo_cobro.ToString() + "'";
            ds = Utilidades.ejecutarcomando(sql);
            string nombre_empleado = ds.Tables[0].Rows[0][0].ToString();
            DateTime fecha = new DateTime();
            string numero_factura = "";
            int letra_encabezado = 10;


            printPreviewDialog1.Document = printDocument1;
            //printDocument1.DefaultPageSettings.Landscape = true;
            printDocument1.DefaultPageSettings.PaperSize = printDocument1.PrinterSettings.PaperSizes[7];
            printDocument1.PrintPage += new System.Drawing.Printing.PrintPageEventHandler(printDocument1_PrintPage);
            float y = 0;
            string fecha_hoy = DateTime.Today.ToLongDateString();
            string linea = "----------------------------------------";

            

            float x = 0;
            x = 50;
            y = 50;
            e.Graphics.DrawString(nombre_empresa.ToString(), new Font("Georgie", 16, FontStyle.Regular), Brushes.Black, 100, 10);
            e.Graphics.DrawString(nombre_sucursal, new Font("Georgie", letra_encabezado, FontStyle.Regular), Brushes.Black, 90, 30);
            e.Graphics.DrawString("RECIBO DE COBRO", new Font("Georgie", letra_encabezado, FontStyle.Regular), Brushes.Black, x, y);
            y += 20;
            e.Graphics.DrawString("COBRO", new Font("Georgie", letra_encabezado, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(".:"+codigo_cobro.ToString(), new Font("Georgie", letra_encabezado, FontStyle.Regular), Brushes.Black, (x+60), y);
            y += 20;
            e.Graphics.DrawString("Empl", new Font("Georgie", letra_encabezado, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(".:" + nombre_empleado.ToString(), new Font("Georgie", letra_encabezado, FontStyle.Regular), Brushes.Black, (x + 60), y);
            y += 20;
            e.Graphics.DrawString("Fecha", new Font("Georgie", letra_encabezado, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(".:" + fecha_hoy, new Font("Georgie", letra_encabezado, FontStyle.Regular), Brushes.Black, (x + 60), y);
            y += 20;
            e.Graphics.DrawString("Cliente", new Font("Georgie", letra_encabezado, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(".:" + nombre_cliente.ToString(), new Font("Georgie", letra_encabezado, FontStyle.Regular), Brushes.Black, (x + 60), y);
            y += 20;
            e.Graphics.DrawString(linea.ToString(), new Font("Georgie", 12, FontStyle.Regular), Brushes.Black, x, y);
            //e.Graphics.DrawString(detalle.ToString(), new Font("Georgie", 9, FontStyle.Regular), Brushes.Black, (x), y);
            
            y += 20;
            e.Graphics.DrawString("Factura->"+codigo_factura.ToString(), new Font("Georgie", 9, FontStyle.Regular), Brushes.Black, x,y);
            y +=30;
            //efectivo
            e.Graphics.DrawString("Efectivo", new Font("Georgie", 12, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(monto.ToString("###,###,###,###.#0"), new Font("Georgie", 12, FontStyle.Regular), Brushes.Black, (x+100), y);
            y += 20;
            //devuelta
            e.Graphics.DrawString("Devuelta", new Font("Georgie", 12, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(devuelta.ToString("###,###,###,###.#0"), new Font("Georgie", 12, FontStyle.Regular), Brushes.Black, (x + 100),y);
            y += 20;
            //tarjeta
            e.Graphics.DrawString("Tarjeta", new Font("Georgie", 12, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(tarjeta.ToString("###,###,###,###.#0"), new Font("Georgie", 12, FontStyle.Regular), Brushes.Black, (x + 100), y);
            y += 20;
            //cheque
            e.Graphics.DrawString("Cheque", new Font("Georgie", 12, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(cheque.ToString("###,###,###,###.#0"), new Font("Georgie", 12, FontStyle.Regular), Brushes.Black, (x + 100), y);
            y += 20;
            //deposito/transferencia
            e.Graphics.DrawString("Deposito", new Font("Georgie", 12, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(deposito.ToString("###,###,###,###.#0"), new Font("Georgie", 12, FontStyle.Regular), Brushes.Black, (x + 100), y);
            y += 20;
            string autorizado_line = "----------------------------------------";
            y += 30;
            // Rectangle rec=new Rectangle(izquierda margen,altura margen,largo,ancho);
            //imprimir la descripcion del cobro
            e.Graphics.DrawString("Detalles", new Font("Georgie", 12, FontStyle.Regular), Brushes.Black, x, y);
            y += 15;
            //imprimir el rectangulo con el detalle del cobro
            Rectangle rec = new Rectangle(50, Convert.ToInt16(y), 300,500);
            e.Graphics.DrawString(detalle.ToString(), new Font("Georgie", 10), Brushes.Black, rec);
            y +=325;
            //ultima linea para poner cobro revivido y firmado
            e.Graphics.DrawString(linea, new Font("Georgie", 12, FontStyle.Regular), Brushes.Black, 40, y);
            y += 15;
            e.Graphics.DrawString("Autorizado por", new Font("Georgie", 12, FontStyle.Regular), Brushes.Black, 80,y);
        }

    }
}
