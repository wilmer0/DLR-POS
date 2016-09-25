using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
namespace puntoVentaModelo.Modelos
{
    public class ModeloAlmacen
    {
        puntoVentaEntities entity = new puntoVentaEntities();
        public Boolean agregar( almacen objeto)
        {
            try
            {
               coneccion coneccion = new coneccion();
               puntoVentaEntities entyti = coneccion.getConeccion();
               var lista = (from almacen a in entity.almacen
                             where a.nombre == objeto.nombre
                             select a);

                if(lista!=null)
                {
                    MessageBox.Show("Ya existe un almacen con ese nombre","",MessageBoxButtons.OK,MessageBoxIcon.Warning);
                }
                entity.AddToalmacen(objeto);
                entity.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                MessageBox.Show("Error agregando: "+ex.ToString());
                return false;
            }
        }

        public int getNextId()
        {
            int count = 0;

            coneccion coneccion = new coneccion();
            puntoVentaEntities entity = coneccion.getConeccion();
            try
            {
                count = entity.almacen.Count();
                if (count > 0)
                {
                    count = entity.almacen.Max(c => c.codigo);
                }
                return count + 1;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error getNextId: "+ex.ToString());
                return count;
            }
            finally
            {
                entity = null;
            }
        }
        public bool Modificar(almacen objeto)
        {

            coneccion coneccion = new coneccion();
            puntoVentaEntities entity = coneccion.getConeccion();
            try
            {

                var Lista = (from c in entity.almacen
                             where c.codigo == objeto.codigo
                             select c).FirstOrDefault();

                Lista.codigo = objeto.codigo;
                Lista.nombre = objeto.nombre;
                Lista.sucursal = objeto.sucursal;
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