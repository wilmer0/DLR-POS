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
            try
            {
                // Establish a connection to the underlying data provider by 
                // using the connection string specified in the config file.
                using (EntityConnection connection = new EntityConnection("Name = puntoVentaEntities"))
                {
                    // Open the connection.
                    connection.Open();

                    // A simple query that demonstrates 
                    // how to use Entity SQL for entities.
                    //Console.WriteLine("\nEntity SQL Query:");
                    //ESQL_Query(connection);

                    // A simple query that demonstrates 
                    // how to use LINQ to Entities.
                    // A new connection is established by using the connection 
                    // string in the App.Config file.
                    //Console.WriteLine("\nLINQ To Entity Query:");
                    //LINQ_To_Entity_Query();
                    

                    // A simple query that demonstrates how to use ObjectContext
                    // on data objects with an existing connection.
                    //Console.WriteLine("\nObject Query:");
                    //ObjectQuery(connection);

                    // Close the connection.
                    Console.WriteLine("Se coneto bien");
                    connection.Close();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("No conecto bd: "+ex.ToString());
                Console.ReadLine();
            }
        }
    }
}
