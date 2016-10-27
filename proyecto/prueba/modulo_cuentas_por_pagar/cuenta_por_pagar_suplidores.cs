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

        //variables
        public Boolean ExistePagos = false;





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
                //numero_factura_txt.Text = dato.ToString();    
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
            procesar();
        }
        public Boolean validarCampos()
        {

            try
            {
                foreach (DataGridViewRow row in dataGridView1.Rows)
                {
                    if (double.Parse(row.Cells[9].Value.ToString()) < 0)
                    {
                        MessageBox.Show("El monto de abono debe ser igual o mayor que cero", "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        dataGridView1.CurrentCell = dataGridView1.Rows[row.Index].Cells[0];
                        return false;
                    }

                }
                if (tipoPagoText.Text.Trim() == "")
                {
                    MessageBox.Show("Debe establecer el metodo de pago", "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    tipoPagoText.Focus();
                    return false;
                }
                if (s.puede_hacer_pagos_suplidores != true)
                {
                    MessageBox.Show("Usted no tiene permiso para hacer pagos", "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return false;
                }

                if (dataGridView1.Rows.Count == 0)
                {
                    MessageBox.Show("No hay facturas", "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return false;
                }
                ExistePagos = false;
                foreach (DataGridViewRow row in dataGridView1.Rows)
                {
                   
                    if (row.Cells[9].Value.ToString() == "")
                    {
                        MessageBox.Show("El abono no tiene valor, debe especificar un monto", "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        //dataGridView1.Rows[row.Index].Selected = true;   
                        return false;
                    }
                    else
                    {
                        ExistePagos = true;
                    }

                }
                return true;

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error validando: " + ex.ToString(), "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }

        }
        public Boolean procesar()
        {
            try
            {
                bool validar = validarCampos();

                if (!validar)
                    return false;

                s = singleton.obtenerDatos();
                DialogResult dr = MessageBox.Show("Desea guardar?", "Guardando", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dr == DialogResult.Yes)
                {
                    /*
                       create proc insert_pago
                     @fecha date,@detalle varchar(max),@cod_empleado int,@cod_empleado_anular int,@motivo_anular varchar(max),@estado bit,@codigo_pago int 
                     * */


                    string sql = "exec insert_pago '" + fecha.Value.ToString("yyyy-MM-dd") + "','" + detalle_txt.Text.Trim() + "','" + s.codigo_usuario + "','','','1','0'";
                    DataSet ds = Utilidades.ejecutarcomando(sql);
                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        MessageBox.Show("Error.: No se completo el pago", "", MessageBoxButtons.OK,MessageBoxIcon.Error);
                        return false;
                    }

                    string codigopago = ds.Tables[0].Rows[0][0].ToString();
                    string codigoMetodoPago = Utilidades.GetIdMetodoPagoByNombre(tipoPagoText.Text);
                    foreach (DataGridViewRow row in dataGridView1.Rows)
                    {
                        /*
                           create proc insert_pago_detalle
                           @cod_pago int,@cod_metodo_pago int,@monto float,@monto_descuento float,@estado bit,@codigo int
                        exec insert_pago_detalle '1','14','1','10','0','1','0'

                         */
                        if (double.Parse(row.Cells[9].Value.ToString()) > 0)
                        {
                            sql = "exec insert_pago_detalle '" + codigopago.ToString() + "','" + row.Cells[0].Value.ToString() + "','" + codigoMetodoPago.ToString() + "','" + row.Cells[9].Value.ToString() + "','" + row.Cells[10].Value.ToString() + "','1','0'";
                            Utilidades.ejecutarcomando(sql);
                            //MessageBox.Show(sql);
                        }
                    }

                    cargar_facturas();
                    MessageBox.Show("Se agrego el pago", "", MessageBoxButtons.OK, MessageBoxIcon.Information);

                }

                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.ToString());
                return false;
            }
        }

        public void cargar_facturas()
        {
            try
            {
                dataGridView1.Rows.Clear();
                if (codigo_suplidor_txt.Text.Trim() != "")
                {
                    string sql = "select f.codigo,(t.nombre+' '+p.apellido) as nombre_cliente,f.ncf,f.rnc,f.codigo_tipo_factura,f.fecha,f.fecha_limite,f.codigo_empleado from factura f  join cliente c on c.codigo=f.codigo_cliente join tercero t on t.codigo=c.codigo join persona p on p.codigo=c.codigo where f.estado='1' and f.pagada='0' and f.codigo>'0' ";
                    if (codigo_suplidor_txt.Text.Trim() != "")
                    {
                        sql += " and f.codigo_cliente='" + codigo_suplidor_txt.Text.Trim() + "'";
                    }
                    if (codigo_cajero_txt.Text.Trim() != "")
                    {
                        sql += " and f.codigo_empleado='" + codigo_cajero_txt.Text.Trim() + "'";
                    }
                    if (ck_registro_desde.Checked == true)
                    {
                        sql += " and f.fecha>='" + fecha_desde_txt.Value.ToString("yyyy-MM-dd") + "'";
                    }
                    if (ck_registro_hasta.Checked == true)
                    {
                        sql += " and f.fecha<='" + fecha_hasta_txt.Value.ToString("yyyy-MM-dd") + "'";
                    }
                    sql += " order by f.codigo desc";
                    DataSet ds = Utilidades.ejecutarcomando(sql);
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {
                        string nombre_empleado = "";
                        //sacando el nombre del empleado de la factura
                        sql = "select (t.nombre+' '+p.apellido) as nombre from tercero t join empleado e on e.codigo=t.codigo join persona p on p.codigo=e.codigo where e.codigo='" + row[7].ToString() + "'";
                        ds = Utilidades.ejecutarcomando(sql);
                        if (ds.Tables[0].Rows[0][0].ToString() != "")
                        {
                            nombre_empleado = ds.Tables[0].Rows[0][0].ToString();
                        }
                        //pendiente
                        //total,pendiente,pagado
                        sql = "exec pendiente_factura_venta '" + row[0].ToString() + "'";
                        ds = Utilidades.ejecutarcomando(sql);
                        double faltante = double.Parse(ds.Tables[0].Rows[0][1].ToString());
                        dataGridView1.Rows.Add(row[0].ToString(), row[1].ToString(), row[2].ToString(), row[3].ToString(), row[4].ToString(), DateTime.Parse(row[5].ToString()).ToString("d"), DateTime.Parse(row[6].ToString()).ToString("d"), nombre_empleado.ToString(), faltante.ToString("N"), "0", "0");
                    }

                    calcular_total();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error cargando las facturas: " + ex.ToString(), "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }
        double sumatoria = 0;
        public void calcular_total()
        {
            try
            {
                sumatoria = 0;
                if (dataGridView1.Rows.Count > 0)
                {
                    foreach (DataGridViewRow row in dataGridView1.Rows)
                    {
                        if (row.Cells[8].Value != "")
                        {
                            sumatoria += Convert.ToDouble(row.Cells[8].Value);
                        }
                    }
                    MontoTotalPendienteText.Text = sumatoria.ToString("N");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error calculando el total de la factura: " + ex.ToString());
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
            catch(Exception ex)
            {
                MessageBox.Show("Error cargando las facturas pendiente.: "+ex.ToString());
            }
        }

        private void dataGridView1_Click(object sender, EventArgs e)
        {
           
        }

        private void monto_txt_KeyUp(object sender, KeyEventArgs e)
        {
            if (Utilidades.numero_decimal(MontoAbonoText.Text.Trim()) == true)
            {

            }
            else
            {
                MontoAbonoText.Clear();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            
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
            catch (Exception ex)
            {
                MessageBox.Show("Error validando la caja abierta.: "+ex.ToString());
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
            catch (Exception ex)
            {
                MessageBox.Show("Error buscando el nombre del cajero.: "+ex.ToString());
            }
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                int fila = dataGridView1.CurrentRow.Index;
                
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error subiendo el monto pendiente.: "+ex.ToString());
            }
        }
    }
}
