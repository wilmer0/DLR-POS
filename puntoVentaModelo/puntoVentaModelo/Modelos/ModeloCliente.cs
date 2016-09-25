using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
namespace puntoVentaModelo.Modelos
{
    public class ModeloCliente
    {
        puntoVentaEntities entity = new puntoVentaEntities();
    
        public List<producto> ListaCompleta()
        {
            coneccion coneccion = new coneccion();
            puntoVentaEntities entity = coneccion.conectar();
            List<producto> listaCliente = new List<producto>(); 
            try
            {
                listaCliente = (from c in entity.producto                               
                             select c).ToList();

                return listaCliente;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error buscando: " + ex.ToString());

                return null;
            }
            finally
            {
                entity = null;
            }
        }
    }
}
