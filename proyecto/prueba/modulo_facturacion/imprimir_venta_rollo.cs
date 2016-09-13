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
using System.Drawing.Printing;
namespace puntoVenta
{
    public partial class imprimir_venta_rollo : Form
    {
        public imprimir_venta_rollo()
        {
            InitializeComponent();
        }

        private void imprimir_venta_rollo_Load(object sender, EventArgs e)
        {
            int alto = 400;
            PaperSize tamano = new PaperSize("Factura", 200, alto);
            string sql="select count (*) from factura_detalle where cod_factura='"+codigo_factura.ToString()+"'";
            DataSet ds = Utilidades.ejecutarcomando(sql);
            if(ds.Tables[0].Rows[0][0].ToString()!="")
            {
                int articulos=Convert.ToInt16(ds.Tables[0].Rows[0][0].ToString());
                tamano = new PaperSize("Factura",200,((articulos*30)+alto));
            }
            printDocument1.DefaultPageSettings.PaperSize = tamano;//printDocument1.PrinterSettings.PaperSizes[3];//printDocument1.PrinterSettings.PaperSizes[taman3];
            printDocument1.DefaultPageSettings.Landscape = false;
            printPreviewDialog1.Document = printDocument1;
           
           
            printPreviewDialog1.ShowDialog();
            this.Close();
        }
        public string codigo_factura="";
        public double numero_de_hojas = 0;
        singleton s{get;set;}
        int cantidad_de_articulos = 0;
        private void printDocument1_PrintPage(object sender, PrintPageEventArgs e)
        {
            try
            {
                string sql = "";
                DataSet ds = new DataSet();
                sql = "select ncf,num_factura,cod_sucursal,codigo_tipo_factura,convert(date,fecha,112),efectivo,devuelta,itebis,tarjeta,deposito,cheque,monto_orden_compra,descuento,detalles from factura where codigo='" + codigo_factura.ToString() + "'";
            ds = Utilidades.ejecutarcomando(sql);
            string numero_comprobante = "";
            if (ds.Tables[0].Rows[0][0].ToString() != "")
            {
                numero_comprobante = ds.Tables[0].Rows[0][0].ToString();
            }
            else
            {
                numero_comprobante = ".";
            }
            string codigo_sucursal = ds.Tables[0].Rows[0][2].ToString();
            string tipo_venta = ds.Tables[0].Rows[0][3].ToString();
            DateTime fecha =Convert.ToDateTime(ds.Tables[0].Rows[0][4].ToString());
            double efectivo = Convert.ToDouble(ds.Tables[0].Rows[0][5].ToString());
            double devuelta = Convert.ToDouble(ds.Tables[0].Rows[0][6].ToString());
            double itebis = Convert.ToDouble(ds.Tables[0].Rows[0][7].ToString());
            double tarjeta = Convert.ToDouble(ds.Tables[0].Rows[0][8].ToString());
            double deposito = Convert.ToDouble(ds.Tables[0].Rows[0][9].ToString());
            double cheque = Convert.ToDouble(ds.Tables[0].Rows[0][10].ToString());
            double monto_orden_compra = Convert.ToDouble(ds.Tables[0].Rows[0][11].ToString());
            double monto_descuento = Convert.ToDouble(ds.Tables[0].Rows[0][12].ToString());
            string detalles_factura = ds.Tables[0].Rows[0][13].ToString();
            double sumatoria_descuento = 0;
            sql = "select t.identificacion,t.nombre from tercero t join sucursal s on t.codigo=s.codigo_empresa where s.codigo='" + codigo_sucursal.ToString() + "'";
            ds = Utilidades.ejecutarcomando(sql);
            string rnc_empresa = ds.Tables[0].Rows[0][0].ToString();
            string nombre_empresa = ds.Tables[0].Rows[0][1].ToString();
            sql = "select top(1) d.detalle from direccion d join tercero_vs_direccion td on td.cod_direccion=d.codigo and td.cod_tercero='" + codigo_sucursal.ToString() + "' where d.estado='1' and td.estado='1'";
            ds = Utilidades.ejecutarcomando(sql);
            string direccion = ds.Tables[0].Rows[0][0].ToString();
            sql = "select top(1) td.telefono from tercero_vs_telefono td where td.cod_tercero='" + codigo_sucursal.ToString() + "' and td.tipo_entidad='SUC' and td.tipo_telefono='TEL'";
            ds = Utilidades.ejecutarcomando(sql);
            string telefono = ds.Tables[0].Rows[0][0].ToString();
            //para sacar la imagen del logo de la empresa
            sql = "select top(1) ruta_imagen_productos,ruta_logo_empresa from sistema";
            ds = Utilidades.ejecutarcomando(sql);
            string logo_empresa = ds.Tables[0].Rows[0][0].ToString();
            logo_empresa += @"\" + ds.Tables[0].Rows[0][1].ToString();


            string linea = "---------------------------------------------";
            string separador = "---------------------------------------------";
            //nombre de la empresa
            int letras_size = 7;
            int x = 20;
            int y = 0;

            e.Graphics.DrawString(nombre_empresa, new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            y+=10;
            e.Graphics.DrawString("RNC", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(rnc_empresa, new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black,(x+50), y);
            y += 10;
            e.Graphics.DrawString("Fact:", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(tipo_venta.ToString() + "-" + codigo_factura, new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, (x+50), y);
            //para saber si buscara el comprobante en la factura porq si busca y no encuentra da error la impresion 
            sql = "select  *from sistema where codigo='1' and usar_comprobantes='1'";
            ds = Utilidades.ejecutarcomando(sql);
            string nombre_comprobante = "";

            if (numero_comprobante.ToString() != ".")
            {
                sql = "select tc.nombre from tipo_comprobante_fiscal tc join factura f on (select SUBSTRING(f.ncf,10,2) from factura f where f.codigo='" + codigo_factura.ToString() + "')=tc.secuencia where f.codigo='" + codigo_factura.ToString() + "'";
                ds = Utilidades.ejecutarcomando(sql);
                if (ds.Tables[0].Rows[0][0].ToString() != "")
                {
                    nombre_comprobante = ds.Tables[0].Rows[0][0].ToString();
                }
                else
                {
                    nombre_comprobante = ".";
                }
            }
            //numero de hojas
            //e.Graphics.DrawString(numero_de_hojas.ToString(), new Font("Georgie", 10, FontStyle.Regular), Brushes.Black, 650, 0);
            //imprimiendo el logo de la empresa
            //Image logo = Image.FromFile(logo_empresa.ToString());
            //e.Graphics.DrawImage(logo, 500, 0, 220, 150);
            y += 10;
            e.Graphics.DrawString("NCF", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(numero_comprobante, new Font("Georgie", letras_size-2, FontStyle.Regular), Brushes.Black, (x+50), y);
            y += 10;
            e.Graphics.DrawString("comprobante valido para", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            y += 10;
            e.Graphics.DrawString(nombre_comprobante, new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            y += 10;
            sql = "select (t.nombre +' '+p.apellido) from tercero t join persona p on p.codigo=t.codigo join factura f on f.codigo_cliente=t.codigo where f.codigo='" + codigo_factura.ToString() + "'";
            ds = Utilidades.ejecutarcomando(sql);
            string nombre_cliente = ds.Tables[0].Rows[0][0].ToString();
            e.Graphics.DrawString("Cliente", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(".:"+nombre_cliente, new Font("Georgie", 7, FontStyle.Regular), Brushes.Black, (x+50), y);
            y += 10;
            e.Graphics.DrawString(fecha.ToString(), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            y += 10;
            e.Graphics.DrawString("Telefono", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(".:"+telefono.ToString(), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, (x+50), y);
            //imprimir el rectangulo con la direccion
            y += 10;
            e.Graphics.DrawString("Direccion", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            y += 10;
            //Rectangle rec=new Rectangle(izquierda margen,altura margen,largo,ancho);
            Rectangle rec = new Rectangle(x, Convert.ToInt16(y), 150, 150); e.Graphics.DrawString(direccion.ToString(), new Font("Georgie", 5), Brushes.Black, rec);
            y = 130;
            x = 20;
            y += 10;
            e.Graphics.DrawString(linea, new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            y += 10;
            e.Graphics.DrawString("Descripcion", new Font("Georgie", 5, FontStyle.Regular), Brushes.Black, x, y);
            x += 60;
            e.Graphics.DrawString("Precio", new Font("Georgie", 5, FontStyle.Regular), Brushes.Black, x, y);
            x += 50;
            e.Graphics.DrawString("Importe", new Font("Georgie", 5, FontStyle.Regular), Brushes.Black, x, y);
            x += 40;
            x = 20;
            y += 7;
            e.Graphics.DrawString(linea, new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x,y);
            sql = "select p.codigo,p.nombre,u.unidad_abreviada,fd.cantidad,fd.itebis,fd.precio,fd.monto,fd.descuento from factura_detalle fd  join factura f on f.codigo=fd.cod_factura join producto p on p.codigo=fd.cod_producto join unidad u on u.codigo=fd.cod_unidad where f.codigo='" + codigo_factura.ToString() + "'";
            ds = Utilidades.ejecutarcomando(sql);
            double total_factura = 0;
            y += 10;
            int fila=100;
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                
                letras_size = 5;
                string codigo_producto = row[0].ToString();
                string producto = row[1].ToString();
                string unidad = row[2].ToString();
                double cantidad = Convert.ToDouble(row[3].ToString());
                double itebis_ = Convert.ToDouble(row[4].ToString());
                double costo = Convert.ToDouble(row[5].ToString());
                double monto = Convert.ToDouble(row[6].ToString());
                double descuento = Convert.ToDouble(row[7].ToString());
                x = 20;
                e.Graphics.DrawString(cantidad.ToString("###,###,###,###,###.#0"), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
                y += 10;
                e.Graphics.DrawString(producto.ToString(), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
                y += 10;
                e.Graphics.DrawString(unidad.ToString(), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
                x += 60;
                e.Graphics.DrawString(costo.ToString("###,###,###,###.#0"), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
                x += 50;
                e.Graphics.DrawString((costo*cantidad).ToString("###,###,###,###.#0"), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
                
                sumatoria_descuento += descuento;
                total_factura += monto;
                x = 20;
                letras_size = 7;
                y += 5;
                e.Graphics.DrawString(linea.ToString(), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
                y += 10;
                
            }
            y += 10;
            
            //linea que separa los produtos del desglose pago
            e.Graphics.DrawString(linea.ToString(), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black,x,y);
            double total = Convert.ToDouble(total_factura.ToString("###,###,###,###.#0"));
            //para imprimir el detalle de la factura si lo tiene
            y += 10;
            if (detalles_factura.ToString() != "")
            {
                e.Graphics.DrawString("Detalles:", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
                y += 10;
                x = 20;
                //Rectangle rec=new Rectangle(izquierda margen,altura,anchura,largo);
                rec = new Rectangle(x, Convert.ToInt16(y), 150, 150); e.Graphics.DrawString(detalles_factura.ToString(), new Font("Georgie", 5), Brushes.Black, rec);
                y += 50;
                e.Graphics.DrawString(linea.ToString(), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            }
            x = 20;
            y += 10;
            letras_size = 5;
            e.Graphics.DrawString("Subtotal:", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString((total - itebis).ToString("###,###,###.#0"), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, (x + 50), y);
            y += 10;
            e.Graphics.DrawString("Itbis:", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(itebis.ToString("###,###,###,###.#0"), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, (x + 50), y);
            y += 10;
            e.Graphics.DrawString("Efectivo:", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(efectivo.ToString("###,###,###,###.#0"), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, (x + 50), y);
            y += 10;
            e.Graphics.DrawString("Devuelta:", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(devuelta.ToString("###,###,###,###.#0"), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, (x + 50), y);
            y += 10;
            e.Graphics.DrawString("Tarjeta:", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(tarjeta.ToString("###,###,###,###.#0"), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, (x + 50), y);
            y += 10;
            e.Graphics.DrawString("Deposito:", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(deposito.ToString("###,###,###,###.#0"), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, (x + 50), y);
            y += 10;
            e.Graphics.DrawString("Cheque:", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(cheque.ToString("###,###,###,###.#0"), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, (x + 50), y);
            y += 10;
            e.Graphics.DrawString("Ord. comp.:", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString(monto_orden_compra.ToString("###,###,###,###.#0"), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, (x + 50), y);
            y += 10;
            e.Graphics.DrawString("Desc:", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString((sumatoria_descuento).ToString("###,###,###,###.#0"), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, (x + 50), y);
            y += 10;
            e.Graphics.DrawString("Total:", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, x, y);
            e.Graphics.DrawString((total - sumatoria_descuento).ToString("###,###,###,###.#0"), new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, (x + 50), y);
            string autorizado_line = "-------------------------------------------------";
            y += 20;
            e.Graphics.DrawString(autorizado_line, new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, (x + 15), y);
            y += 10;
            e.Graphics.DrawString("Autorizado por", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, (x + 50), y);
            y += 10;
            e.Graphics.DrawString("GRACIAS POR PREFERIRNOS", new Font("Georgie", letras_size, FontStyle.Regular), Brushes.Black, (x + 20), y);

            e.PageSettings.PaperSize.Width += 200;
            }
            catch(Exception)
            {
                MessageBox.Show("Error imprimiendo la factura");
                this.Close();
            }
        }
       

        
    }
}
