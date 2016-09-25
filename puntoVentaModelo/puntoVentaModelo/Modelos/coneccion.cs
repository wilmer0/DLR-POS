using System;
using System.Collections.Generic;
using System.Data.EntityClient;
using System.Linq;
using System.Text;

namespace puntoVentaModelo.Modelos
{
    public class coneccion
    {
        private static coneccion instance;



        public static coneccion Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new coneccion();
                }
                return instance;
            }
        }

        public static DatosConeccionBD datosConeccionBd;

        public coneccion(DatosConeccionBD datosConeccion)
        {
            datosConeccionBd = datosConeccion;
        }


        public coneccion()
        {

        }


        public puntoVentaEntities getConeccion()
        {

            puntoVentaEntities pv = new puntoVentaEntities();
            pv.Connection.Open();
            if (datosConeccionBd == null)
            {
                datosConeccionBd.Servidor = ".";
                datosConeccionBd.BaseDatos = "punto_venta";
                datosConeccionBd.Usuario = "dextroyex";
                datosConeccionBd.Contrasena = "wilmerlomas1";
                return pv;
            }
            else
            {
                return pv;
            }
            
        }


        public puntoVentaEntities conectar()
        {
            try
            {
                puntoVentaEntities pv = new puntoVentaEntities();
                EntityConnection coneccion = new EntityConnection("Name = puntoVentaEntities");
                pv.Connection.Open();
                return pv;
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error conectando: " + ex.ToString());
                return null;
            }
        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}
