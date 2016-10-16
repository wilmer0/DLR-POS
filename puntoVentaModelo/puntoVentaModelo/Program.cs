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
            mostrar();
        }
        public static void mostrar()
        {
            try
            {
                List<producto> clientes = new List<producto>();
                Modelos.ModeloCliente modeloCliente=new Modelos.ModeloCliente();
                clientes=modeloCliente.ListaCompleta();
                foreach (producto cli in clientes)
                {
                    Console.WriteLine(cli.codigo + "-" + cli.nombre+ "-" + cli.reorden + "-"+ cli.referencia);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error mostrando: " + ex.ToString());
                
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
