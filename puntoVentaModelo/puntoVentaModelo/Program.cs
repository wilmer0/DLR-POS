using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using puntoVentaModelo;
using System.Data.EntityClient;
using System.Data;

namespace puntoVentaModelo
{
    public class Program
    {
        static void Main(string[] args)
        {
            //conectar();
            agregar();
        }
        public static void agregar()
        {
            try
            {
                almacen alma = new almacen();
                Modelos.ModeloAlmacen modelo = new Modelos.ModeloAlmacen();
                alma.codigo = modelo.getNextId();
                alma.nombre = "ejemplo";
                alma.estado = true;
                modelo.agregar(alma);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error agregando: " + ex.ToString());
                
            }
        }

        public static EntityConnection conectar()
        {
            try
            {
                EntityConnection coneccion = new EntityConnection("Name = puntoVentaEntities");
                coneccion.Open();
                Console.WriteLine("Se coneto bien");
                return coneccion;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error conectando: " + ex.ToString());
                return null;
            }
        }
    }
}
