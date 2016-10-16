using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace puntoVentaModelo.Modelos
{
    public class ModeloCaja
    {
        puntoVentaEntities entity = new puntoVentaEntities();
        public Boolean agregar(caja objeto)
        {
            try
            {
                coneccion coneccion = new coneccion();
                puntoVentaEntities entyti = coneccion.conectar();
                var lista = (from caja a in entity.caja
                             where a.nombre == objeto.nombre
                             select a);

                if (lista != null)
                {
                    MessageBox.Show("Ya existe un almacen con ese nombre", "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }

                entity.AddTocaja(objeto);
                entity.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error agregando: " + ex.ToString());
                return false;
            }
        }

        public int getNextId()
        {
            int count = 0;

            coneccion coneccion = new coneccion();
            puntoVentaEntities entity = coneccion.conectar();
            try
            {
                count = entity.caja.Count();
                if (count > 0)
                {
                    count = entity.caja.Max(c => c.codigo);
                }
                return count + 1;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error getNextId: " + ex.ToString());
                return count;
            }
            finally
            {
                entity = null;
            }
        }
        public bool Modificar(caja objeto)
        {

            coneccion coneccion = new coneccion();
            puntoVentaEntities entity = coneccion.conectar();
            try
            {
                var Lista = (from c in entity.caja
                             where c.codigo == objeto.codigo
                             select c).FirstOrDefault();

                Lista.codigo = objeto.codigo;
                Lista.nombre = objeto.nombre;
                Lista.secuencia = objeto.secuencia;
                Lista.cod_sucursal = objeto.cod_sucursal;
                Lista.estado = objeto.estado;

                entity.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error modificando: " + ex.ToString());

                return false;
            }
            finally
            {
                entity = null;
            }
        }
    }
}
