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
    public partial class cuenta_por_cobrar : Form
    {
        public cuenta_por_cobrar()
        {
            InitializeComponent();
        }

        private void cuenta_por_cobrar_Load(object sender, EventArgs e)
        {
            try
            {
                s = singleton.obtenerDatos();
                codigo_cajero_txt.Text = s.codigo_usuario;
                cargar_nombre_cajero();
                validar_caja_abierta();
                cargar_facturas();
            }
            catch(Exception ex)
            {
                MessageBox.Show("Error :"+ex.ToString());
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("Desea salir?", "Saliendo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (dr == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (codigo_cliente_txt.Text.Trim() != "")
                {
                    busqueda_factura_cliente bc = new busqueda_factura_cliente();
                    bc.pasado += new busqueda_factura_cliente.pasar(ejecutarfactura);
                    bc.codigo_cliente = codigo_cliente_txt.Text.Trim();
                    bc.ShowDialog();
                    calcular_total();
                }
                else
                {
                    MessageBox.Show("Debe seleccionar un cliente para cargar sus facturas");
                }
            }
            catch(Exception)
            {
                MessageBox.Show("Error abriendo el form de buscar facturas del cliente");
            }
        }
        public void ejecutarfactura(string dato)
        {
            numero_factura_txt.Text = dato.ToString();
        }

        private void button4_Click(object sender, EventArgs e)
        {
                busqueda_cliente bc = new busqueda_cliente();
                bc.pasado += new busqueda_cliente.pasar(ejecutarcliente);
                bc.ShowDialog();
                cargar_nombre_cliente();
                cargar_facturas();
                calcular_total();
        }
        public void cargar_facturas()
        {
            dataGridView1.Rows.Clear();
            if (codigo_cliente_txt.Text.Trim() != "")
            {
                string sql = "select f.codigo,f.num_factura,(t.nombre+' '+p.apellido) as nombre_cliente,f.ncf,f.rnc,f.codigo_tipo_factura,f.fecha,f.fecha_limite,f.codigo_empleado from factura f  join cliente c on c.codigo=f.codigo_cliente join tercero t on t.codigo=c.codigo join persona p on p.codigo=c.codigo where f.estado='1' and f.pagada='0' and f.codigo>'0' ";
                if (codigo_cliente_txt.Text.Trim() != "")
                {
                    sql += " and f.codigo_cliente='" + codigo_cliente_txt.Text.Trim() + "'";
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
                    sql = "select (t.nombre+' '+p.apellido) as nombre from tercero t join empleado e on e.codigo=t.codigo join persona p on p.codigo=e.codigo where e.codigo='" + row[8].ToString() + "'";
                    ds = Utilidades.ejecutarcomando(sql);
                    if (ds.Tables[0].Rows[0][0].ToString() != "")
                    {
                        nombre_empleado = ds.Tables[0].Rows[0][0].ToString();
                    }
                    //pendiente
                    //total,pendiente,pagado
                    sql = "exec pendiente_factura_venta '" + row[0].ToString() + "'";
                    ds = Utilidades.ejecutarcomando(sql);
                    string faltante = ds.Tables[0].Rows[0][1].ToString();
                    dataGridView1.Rows.Add(row[0].ToString(), row[1].ToString(), row[2].ToString(),row[3].ToString(), row[4].ToString(), row[5].ToString(), row[6].ToString(), row[7].ToString(), row[8].ToString(), nombre_empleado.ToString(), faltante.ToString());
                }
                foreach (DataGridViewRow row in dataGridView1.Rows)
                {
                    double monto = 0;
                    monto = Convert.ToDouble(row.Cells[10].Value.ToString());
                    row.Cells[10].Value = monto.ToString("###,###,###,###,###.#0");
                }
            }
        }
        public void ejecutarcliente(string dato)
        {
            codigo_cliente_txt.Text = dato.ToString();
        }
        public void cargar_nombre_cliente()
        {
            try
            {
                if (codigo_cliente_txt.Text.Trim() != "")
                {
                    string sql = "select (t.nombre+' '+p.apellido) as nombre from tercero t join persona p on p.codigo=t.codigo where t.codigo='" + codigo_cliente_txt.Text.Trim() + "'";
                    DataSet ds = Utilidades.ejecutarcomando(sql);
                    nombre_cliente_txt.Text = ds.Tables[0].Rows[0][0].ToString();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error cargando el nombre del cliente: "+ex.ToString());
            }
        }
        private void button6_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult dr = MessageBox.Show("Desea limpiar?", "Limpiando", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dr == DialogResult.Yes)
                {

                    codigo_cliente_txt.Clear();
                    nombre_cliente_txt.Clear();
                    numero_factura_txt.Clear();
                    pendiente_txt.Clear();
                    monto_txt.Clear();
                    detalle_txt.Clear();
                    dataGridView1.Rows.Clear();
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Error borrando los datos");
            }
        }

        private void monto_txt_KeyUp(object sender, KeyEventArgs e)
        {
            if(Utilidades.numero_decimal(monto_txt.Text.Trim())==false)
            {
                monto_txt.Clear();
            }
           
        }
        private void button5_Click(object sender, EventArgs e)
        {
        }
        private void dataGridView1_Click(object sender, EventArgs e)
        {
            int fila=dataGridView1.CurrentRow.Index;
            numero_factura_txt.Text = dataGridView1.Rows[fila].Cells[0].Value.ToString();
            pendiente_txt.Text = dataGridView1.Rows[fila].Cells[10].Value.ToString();
        }
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        internal singleton s { get; set; }
        double pago_antiguedad = 0;
        string codigo_cobro = "";
        double efectivo = 0;
        double devuelta=0;
        double transferencia = 0;
        double cheque = 0;
        double tarjeta = 0;
        private void button8_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult dr = MessageBox.Show("Desea guardar?", "Guardando", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (dr == DialogResult.Yes)
                {
                    s = singleton.obtenerDatos();
                    if (Convert.ToDouble(monto_txt.Text.Trim()) <= Convert.ToDouble(cantidad_total_factura_txt.Text.Trim()))
                    {
                        if (s.cobros_cxc == true)
                        {
                            if (numero_factura_txt.Text.Trim() != "")
                            {
                                if (monto_txt.Text.Trim() != "")
                                {
                                    if (Convert.ToDouble(monto_txt.Text.Trim()) <= Convert.ToDouble(pendiente_txt.Text.Trim()))
                                    {
                                        pago_desglose p = new pago_desglose();
                                        p.total_esperado = monto_txt.Text.Trim();
                                        p.pasado += new pago_desglose.pasar(guardar);
                                        p.ShowDialog();
                                    }
                                    else
                                    {
                                        MessageBox.Show("El monto a pagar debe ser menor o igual que el pendiente");
                                    }
                                }
                                else
                                {
                                    MessageBox.Show("Debe establecer a pagar para proceder con el desglose");
                                }
                            }
                            else
                            {
                                if (ck_aplicar_todo.Checked == true)
                                {
                                    if (detalle_txt.Text.Trim() != "")
                                    {
                                        double monto_temporal = Convert.ToDouble(monto_txt.Text.Trim());
                                        double pendiente = 0;
                                        if (codigo_cajero_txt.Text.Trim() != "")
                                        {
                                            while (Convert.ToDouble(monto_txt.Text.Trim()) > 0)
                                            {
                                                pendiente = 0;
                                                int fila = 0;
                                                pago_antiguedad = Convert.ToDouble(monto_txt.Text.Trim());
                                                if (monto_txt.Text.Trim() != "0" && pago_antiguedad > 0)
                                                {
                                                    pendiente = Convert.ToDouble(dataGridView1.Rows[fila].Cells[10].Value.ToString());
                                                    pago_antiguedad = Convert.ToDouble(monto_txt.Text.Trim());
                                                    if (pago_antiguedad > pendiente)
                                                    {
                                                        //aplicar lo que quedo pendiente
                                                        //MessageBox.Show("'" + dataGridView1.Rows[fila].Cells[0].Value.ToString() + "','" + pago_antiguedad.ToString() + "','" + detalle_txt.Text.Trim() + "','" + s.codigo_usuario.ToString() + "'");
                                                        string sql = "exec cobrar_factura '" + dataGridView1.Rows[fila].Cells[0].Value.ToString() + "','" + pendiente.ToString() + "','" + detalle_txt.Text.Trim() + "','" + fecha.Value.ToString("yyyy-MM-dd") + "','" + codigo_cajero_txt.Text.Trim() + "'";
                                                        DataSet ds = Utilidades.ejecutarcomando(sql);
                                                        pago_antiguedad -= pendiente;
                                                        cargar_facturas();

                                                        // MessageBox.Show("devuelta-->" + pago_antiguedad.ToString());
                                                        monto_txt.Text = pago_antiguedad.ToString();
                                                        if (pago_antiguedad < 0)
                                                        {
                                                            monto_txt.Text = "0";
                                                            break;
                                                        }
                                                    }
                                                    else
                                                    {
                                                        //aplicar el unico pago
                                                        //MessageBox.Show("'" + dataGridView1.Rows[fila].Cells[0].Value.ToString() + "','" + pago_antiguedad.ToString() + "','" + detalle_txt.Text.Trim() + "','" + s.codigo_usuario.ToString() + "'");
                                                        string sql = "exec cobrar_factura '" + dataGridView1.Rows[fila].Cells[0].Value.ToString() + "','" + pago_antiguedad.ToString() + "','" + detalle_txt.Text.Trim() + "','" + codigo_cajero_txt.Text.Trim() + "'";
                                                        DataSet ds = Utilidades.ejecutarcomando(sql);
                                                        pago_antiguedad -= pendiente;
                                                        dr = MessageBox.Show("Desea imprimir?", "Imprimiendo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                                                        if (dr == DialogResult.Yes)
                                                        {
                                                            codigo_cobro = ds.Tables[0].Rows[0][0].ToString();
                                                            imprimir_cobros ic = new imprimir_cobros();
                                                            ic.codigo_cobro = codigo_cobro.ToString();
                                                            ic.ShowDialog();
                                                        }
                                                        cargar_facturas();
                                                        //MessageBox.Show("devuelta-->" + pago_antiguedad.ToString());
                                                        monto_txt.Text = pago_antiguedad.ToString();

                                                        if (pago_antiguedad < 0)
                                                        {
                                                            monto_txt.Text = "0";
                                                            break;
                                                        }
                                                    }
                                                }
                                                fila++;
                                                cargar_facturas();
                                            }
                                            MessageBox.Show("Se aplicaron los cobros");
                                            cargar_facturas();
                                        }
                                        else
                                        {
                                            MessageBox.Show("Falta el cajero");
                                        }
                                    }
                                    else
                                    {
                                        MessageBox.Show("Falta el detalle de cobro");
                                    }
                                }
                                else
                                {
                                    MessageBox.Show("Falta seleccionar la factura");
                                }
                            }
                        }
                        else
                        {
                            MessageBox.Show("Usted no tiene permiso para hacer cobros");
                        }
                    }
                    else
                    {
                        MessageBox.Show("El monto que esta aplicando es mayor que toda la deuda del cliente");
                    }
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show("Error: "+ex.ToString());
            }
        }
        public double efectivo_global = 0;
        public double devuelta_global = 0;
        public double cheque_global = 0;
        public double deposito_global = 0;
        public double tarjeta_global = 0;
        public Int16 cod_orden_compra_global = 0;
        public double monto_orden_compra_global = 0;
        public void guardar(string efectivo, string devuelta, string cheque, string deposito, string tarjeta, string cod_orden_compra, string monto_orden_compra)
        {
            try
            {
                /*
                  create proc cobrar_factura
                  @codigo_factura int,@efectivo float,@devuelta float,@tarjeta float,@cheque float,@transferencia float,@detalle varchar(300),@fecha,@cod_empleado int
                */
                efectivo_global = Convert.ToDouble(efectivo.ToString());
                devuelta_global = Convert.ToDouble(devuelta.ToString());
                cheque_global = Convert.ToDouble(cheque.ToString());
                deposito_global = Convert.ToDouble(deposito.ToString());
                tarjeta_global = Convert.ToDouble(tarjeta.ToString());
                cod_orden_compra_global = Convert.ToInt16(cod_orden_compra.ToString());
                monto_orden_compra_global = Convert.ToDouble(monto_orden_compra.ToString());
                DialogResult dr = MessageBox.Show("Desea guardar?", "Guardando", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                string sql = "exec cobrar_factura '" + numero_factura_txt.Text.Trim() + "','" + efectivo_global.ToString() + "','" + devuelta_global.ToString() + "','" + tarjeta_global.ToString() + "','" + cheque_global.ToString() + "','" + deposito_global.ToString() + "','" + detalle_txt.Text.Trim() + "','"+fecha.Value.ToString("yyyy-MM-dd")+"','" + s.codigo_usuario.ToString() + "'";
                DataSet ds = Utilidades.ejecutarcomando(sql);
                codigo_cobro = ds.Tables[0].Rows[0][0].ToString();
                if (ds.Tables[0].Rows.Count > 0)
                {

                    cargar_facturas();
                    MessageBox.Show("Se aplico el cobro");
                    dr = MessageBox.Show("Desea imprimir?", "Imprimiendo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (dr == DialogResult.Yes)
                    {
                        imprimir_cobros ic = new imprimir_cobros();
                        ic.codigo_cobro = codigo_cobro.ToString();
                        ic.ShowDialog();
                    }
                    cargar_facturas();
                    monto_txt.Clear();
                    pendiente_txt.Clear();
                    calcular_total();
                }
                else
                {
                    MessageBox.Show("No se aplico el cobro");
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Error guardando, por favor intentelo nuevamente, si el problema persiste contacte a soporte tecnico");
            }
          
        }
        private void button2_Click(object sender, EventArgs e)
        {

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
                        if (row.Cells[10].Value != "")
                        {
                            sumatoria += Convert.ToDouble(row.Cells[10].Value);
                        }
                    }
                    cantidad_total_factura_txt.Text = sumatoria.ToString("###,###,###,###.#0");
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Error calculando el total de la factura");
            }
        }

        private void monto_txt_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.F2)
            {
                button8.PerformClick();
            }
        }

        private void printDocument1_PrintPage(object sender, System.Drawing.Printing.PrintPageEventArgs e)
        {
            
        }

        private void ck_aplicar_todo_Click(object sender, EventArgs e)
        {
            if(ck_aplicar_todo.Checked==true)
            {
                //monto_txt.ReadOnly = false;
            }
            else
            {
                //monto_txt.ReadOnly = true;
            }
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            busqueda_cajero bc = new busqueda_cajero();
            bc.pasado += new busqueda_cajero.pasar(ejecutar_codigo_cajero);
            bc.ShowDialog();
            cargar_nombre_cajero();
            validar_caja_abierta();
        }
        public bool validar_caja_abierta()
        {
            string sql = "select max(codigo) from cuadre_caja where cod_cajero='" + codigo_cajero_txt.Text.Trim() + "' and fecha<='" + fecha.Value.ToString("yyyy-MM-dd") + "' and abierta_cerrada='A' and estado='1'";
            DataSet ds = Utilidades.ejecutarcomando(sql);
            if (ds.Tables[0].Rows[0][0].ToString() != "")
            {
                sql = "select max(codigo)from cuadre_caja where cod_cajero='" + codigo_cajero_txt.Text.Trim() + "' and fecha<='" + fecha.Value.ToString("yyyy-MM-dd") + "' and abierta_cerrada='A' and estado='1'";
                ds = Utilidades.ejecutarcomando(sql);
                return true;
            }
            else
            {
                MessageBox.Show("Su cajero no tiene caja abierta");
                codigo_cajero_txt.Clear();
                nombre_cajero_txt.Clear();
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

        private void label3_Click(object sender, EventArgs e)
        {
            codigo_cliente_txt.Clear();
            nombre_cliente_txt.Clear();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            cargar_facturas();
        }

        private void ck_registro_desde_Click(object sender, EventArgs e)
        {
            if (ck_registro_desde.Checked == true)
            {
                fecha_desde_txt.Enabled = true;
            }
            else
            {
                fecha_desde_txt.Enabled = false;
            }
        }

        private void ck_registro_hasta_Click(object sender, EventArgs e)
        {
            if (ck_registro_hasta.Checked == true)
            {
                fecha_hasta_txt.Enabled = true;
            }
            else
            {
                fecha_hasta_txt.Enabled = false;
            }
        }
    }
}
