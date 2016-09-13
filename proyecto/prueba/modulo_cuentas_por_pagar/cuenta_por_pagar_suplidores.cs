using puntoVenta;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace puntoVenta
{
    public partial class cuenta_por_pagar_suplidores : Form
    {
        public cuenta_por_pagar_suplidores()
        {
            InitializeComponent();
        }
        internal singleton s { get; set; }
        private void button7_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("Desea salir?", "Saliendo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dr == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult dr = MessageBox.Show("Desea limpiar?", "Limpiando", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dr == DialogResult.Yes)
                {

                    codigo_suplidor_txt.Clear();
                    nombre_suplidor_txt.Clear();
                    monto_factura_txt.Clear();
                    numero_factura_txt.Clear();
                    monto_factura_txt.Clear();
                    monto_pago_txt.Clear();
                    detalle_txt.Clear();
                    dataGridView1.Rows.Clear();

                }
            }
            catch (Exception)
            {
                MessageBox.Show("Error borrando los datos");
            }
        }
        public void cargar_nombre_suplidor()
        {
            try
            {
                string sql="select t.nombre from tercero t where t.codigo='"+codigo_suplidor_txt.Text.Trim()+"'";
                DataSet ds=Utilidades.ejecutarcomando(sql);
                nombre_suplidor_txt.Text=ds.Tables[0].Rows[0][0].ToString();
            }
            catch(Exception)
            {
                MessageBox.Show("Error buscando el nombre del suplidor");
            }
        }
        private void button4_Click(object sender, EventArgs e)
        {
            busqueda_suplidor bs = new busqueda_suplidor();
            bs.pasado += new busqueda_suplidor.pasar(ejecutar_codigo_suplidor);
            bs.ShowDialog();
            cargar_nombre_suplidor();
            cargar_compras_pendiente();
        }
        public void ejecutar_codigo_suplidor(string dato)
        {
            codigo_suplidor_txt.Text = dato.ToString();
        }

        private void codigo_suplidor_txt_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string sql = "select t.nombre from tercero t join persona p on t.codigo=p.codigo join suplidor s on p.codigo=s.codigo where s.codigo='"+codigo_suplidor_txt.Text.Trim()+"'";
                DataSet ds = Utilidades.ejecutarcomando(sql);
                nombre_suplidor_txt.Text = ds.Tables[0].Rows[0][0].ToString();
            }
            catch(Exception)
            {
                MessageBox.Show("Error buscando nombre suplidor");
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            busqueda_factura bf = new busqueda_factura();
            bf.ShowDialog();
        }
        public void ejecutar_codigo_factura(string dato)
        {
            try
            {
                numero_factura_txt.Text = dato.ToString();    
            }
            catch(Exception)
            {
                MessageBox.Show("Error pasando el codigo");
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView1.Rows.Count > 0)
                {
                    dataGridView1.Rows.RemoveAt(dataGridView1.CurrentRow.Index);
                }
                else
                {
                    DialogResult dr = MessageBox.Show("No hay elementos para eliminar", "Eliminando", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Error eliminando la fila seleccionada");
            }
        }

        private void button8_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("Desea guardar?", "Guardando", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dr == DialogResult.Yes)
            {
                try
                {
                    if (monto_pago_txt.Text.Trim() != "")
                    {
                        s = singleton.obtenerDatos();
                        pago_desglose p = new pago_desglose();
                        p.total_esperado = monto_pago_txt.Text.Trim();
                        p.pasado += new pago_desglose.pasar(guardar);
                        p.ShowDialog();
                    }
                    else
                    {
                        MessageBox.Show("Falta el monto a pagar para hacer el desglose");
                    }
                    
                }
                catch (Exception)
                {
                    MessageBox.Show("Error haciendo el pago");
                }
            }
        }
        private void cuenta_por_pagar_suplidores_Load(object sender, EventArgs e)
        {
            s = singleton.obtenerDatos();
            codigo_cajero_txt.Text = s.codigo_usuario.ToString();
            cargar_nombre_cajero();
            validar_caja_abierta();
        }
        public void cargar_compras_pendiente()
        {
            string sql = "";
            string sql2 = "";
            DataSet ds = new DataSet();
            DataSet ds2 = new DataSet();
            try
            {
                dataGridView1.Rows.Clear();
                sql = "select distinct c.codigo,c.num_factura,c.cod_tipo,c.fecha as hecha,c.ncf,c.rnc,c.fecha_limite as limite from compra c join compra_detalle cd on c.codigo=cd.cod_compra join suplidor s on s.codigo=c.cod_suplidor where s.codigo='" + codigo_suplidor_txt.Text.Trim() + "' and c.pagada!='1'";
                ds = Utilidades.ejecutarcomando(sql);
                foreach(DataRow row in ds.Tables[0].Rows)
                {
                    sql2 = "exec monto_pendiente_factura '" + row[1].ToString() + "'";
                    //el proc retorna monto_factura,pagado,pendiente
                    ds2 = Utilidades.ejecutarcomando(sql2);
                    dataGridView1.Rows.Add(row[0].ToString(), row[1].ToString(), row[2].ToString(), row[3].ToString(), row[4].ToString(), row[5].ToString(), row[6].ToString(), ds2.Tables[0].Rows[0][2].ToString());
                }
                foreach(DataGridViewRow row in dataGridView1.Rows)
                {
                    double monto=0;
                    monto=Convert.ToDouble(row.Cells[7].Value.ToString());
                    row.Cells[7].Value = monto.ToString("###,###,###,###,###.#0");
                }
            }
            catch(Exception)
            {
                MessageBox.Show("Error cargando las facturas pendiente");
            }
        }

        private void dataGridView1_Click(object sender, EventArgs e)
        {
           
        }

        private void monto_txt_KeyUp(object sender, KeyEventArgs e)
        {
            if(Utilidades.numero_decimal(monto_pago_txt.Text.Trim())==true)
            {

            }
            else
            {
                monto_pago_txt.Clear();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            
        }
        public double efectivo_global = 0;
        public double devuelta_global = 0;
        public double cheque_global = 0;
        public double deposito_global = 0;
        public double tarjeta_global = 0;
        public int cod_orden_compra_global = 0;
        public double monto_orden_compra_global = 0;
        public void guardar(string efectivo, string devuelta, string cheque, string deposito, string tarjeta, string cod_orden_compra, string monto_orden_compra)
        {
            if (codigo_cajero_txt.Text.Trim() != "")
            {
                if (codigo_suplidor_txt.Text.Trim() != "")
                {
                    if (numero_factura_txt.Text.Trim() != "")
                    {
                        if (monto_pago_txt.Text.Trim() != "")
                        {
                            if (detalle_txt.Text.Trim() != "")
                            {
                                if (Convert.ToDecimal(monto_pago_txt.Text.Trim()) <= Convert.ToDecimal(monto_factura_txt.Text.Trim()))
                                {
                                    /*
                                     create proc insert_compras_pagos
                                     @numero_factura int,@monto float,@devuelta float,@cheque float,@deposito float,@tarjeta float,@cod_empleado int,@detalle varchar(500)
                                     */
                                    efectivo_global = Convert.ToDouble(efectivo.ToString());
                                    devuelta_global = Convert.ToDouble(devuelta.ToString());
                                    cheque_global = Convert.ToDouble(cheque.ToString());
                                    deposito_global = Convert.ToDouble(deposito.ToString());
                                    tarjeta_global = Convert.ToDouble(tarjeta.ToString());
                                    cod_orden_compra_global = Convert.ToInt16(cod_orden_compra.ToString());
                                    monto_orden_compra_global = Convert.ToDouble(monto_orden_compra.ToString());
                                    string sql = "exec insert_compras_pagos '" + numero_factura_txt.Text.Trim() + "','" + efectivo_global.ToString().Trim() +"','"+devuelta_global.ToString().Trim()+"','"+cheque_global.ToString().Trim()+"','"+deposito_global.ToString().Trim()+ "','" +tarjeta_global.ToString().Trim()+"','"+ codigo_cajero_txt.Text.Trim() + "','" + detalle_txt.Text.Trim() + "','"+fecha.Value.ToString("yyyy-MM-dd")+"'";
                                    DataSet ds = Utilidades.ejecutarcomando(sql);
                                    if (ds.Tables[0].Rows.Count > 0)
                                    {
                                        cargar_compras_pendiente();
                                        monto_factura_txt.Clear();
                                        monto_pago_txt.Clear();
                                        numero_factura_txt.Clear();
                                        MessageBox.Show("Se guardo");
                                    }
                                    else
                                    {
                                        MessageBox.Show("No se guardo");
                                    }
                                }
                                else
                                {
                                    MessageBox.Show("El monto a pagar no puede ser mayor que el monto pendiente");
                                }
                            }
                            else
                            {
                                MessageBox.Show("Falta el detalle de pago");
                            }
                        }
                        else
                        {
                            MessageBox.Show("Falta el monto");
                        }
                    }
                    else
                    {
                        MessageBox.Show("Falta el numero de factura");
                    }
                }
                else
                {
                    MessageBox.Show("Falta el suplidor");
                }
            }
            else
            {
                MessageBox.Show("Falta el cajero");
            }
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            busqueda_cajero bc = new busqueda_cajero();
            bc.pasado += new busqueda_cajero.pasar(ejecutar_codigo_cajero);
            bc.codigo_sucursal_global = s.codigo_sucursal.ToString();
            bc.ShowDialog();
            cargar_nombre_cajero();
            validar_caja_abierta();
        }
        public bool validar_caja_abierta()
        {
            try
            {
                string sql = "select max(codigo) from cuadre_caja where cod_cajero='" + codigo_cajero_txt.Text.Trim() + "' and fecha<='" + fecha.Value.ToString("yyyy-MM-dd") + "' and abierta_cerrada='A' and estado='1'";
                DataSet ds = Utilidades.ejecutarcomando(sql);
                if (ds.Tables[0].Rows[0][0].ToString() != "")
                {

                    return true;
                }
                else
                {
                    MessageBox.Show("Su cajero no tiene caja abierta");
                    codigo_cajero_txt.Clear();
                    nombre_cajero_txt.Clear();
                    this.Close();
                    return false;

                }
            }
            catch (Exception)
            {
                MessageBox.Show("Error validando la caja abierta");
                return false;
            }
        }
        public void ejecutar_codigo_cajero(string dato)
        {
            codigo_cajero_txt.Text = dato.ToString();
        }
        public void cargar_nombre_cajero()
        {
            try
            {
                if (codigo_cajero_txt.Text.Trim() != "")
                {
                    string sql = "select (t.nombre+' '+p.apellido) from tercero t join persona p on p.codigo=t.codigo where t.codigo='" + codigo_cajero_txt.Text.Trim() + "'";
                    DataSet ds = Utilidades.ejecutarcomando(sql);
                    nombre_cajero_txt.Text = ds.Tables[0].Rows[0][0].ToString();
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Error buscando el nombre del cajero");
            }
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                int fila = dataGridView1.CurrentRow.Index;
                numero_factura_txt.Text = dataGridView1.Rows[fila].Cells[1].Value.ToString();
                monto_factura_txt.Text = dataGridView1.Rows[fila].Cells[7].Value.ToString();
            }
            catch (Exception)
            {
                MessageBox.Show("Error subiendo el monto pendiente");
            }
        }
    }
}
