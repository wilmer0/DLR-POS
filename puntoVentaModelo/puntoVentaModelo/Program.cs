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
           
        }

        public Boolean coneccion()
        {
            try
            {
                // Establish a connection to the underlying data provider by 
                // using the connection string specified in the config file.
                using (EntityConnection connection = new EntityConnection("Name = puntoVentaEntities"))
                {
                    connection.Open();
                    return true;
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}
