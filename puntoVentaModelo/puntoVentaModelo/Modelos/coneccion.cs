using System;
using System.Collections.Generic;
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
            if (datosConeccionBd == null)
            {
                                
                datosConeccionBd.Servidor = ".";
                datosConeccionBd.BaseDatos = "punto_venta";
                datosConeccionBd.Usuario = "dextroyex";
                datosConeccionBd.Contrasena = "wilmerlomas1";
                return new puntoVentaEntities(datosConeccionBd.Servidor, datosConeccionBd.BaseDatos,datosConeccionBd.Usuario, datosConeccionBd.Contrasena);

            }

            else
            {
                return new puntoVentaEntities(datosConeccionBd.Servidor, datosConeccionBd.BaseDatos,datosConeccionBd.Usuario,datosConeccionBd.Contrasena);
            }

        }

        public void Dispose()
        {
            throw new NotImplementedException();
        }
    }
}
