using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDao
{
   public class ConnectionString
    {




        #region "Patron Singleton"
        private static ConnectionString conexion = null;
        private ConnectionString() { }
        public static ConnectionString getInstance()
        {
            if (conexion == null)
            {
                conexion = new ConnectionString();
            }
            return conexion;
        }
        #endregion


        public static string Cadena() {


            // ***** Nico_BD *****
          //  string cadena = "Data Source=DESKTOP-H7ESUE9;Initial Catalog=HayEquipo;Integrated Security=True";

            //Cadena de Conexión de Nacho.
            string cadena = @"Data Source=NOTEBOOK-10;Initial Catalog=HayEquipo;User ID=SA;Password=taninga1643";


            //FrancoR BD
            //String cadena = "Data Source=LAPTOP-N4V2H3NE;Initial Catalog=HayEquipo;User ID=alumnosa;Password=abcd123";

            //string cadena = @"Data Source=DESKTOP-A9A7OVR\SQLEXPRESS;Initial Catalog=HayEquipo;User ID=SA;Password=taninga1643";


            //return cadena;

            //string cadena = "Data Source=DESKTOP-H7ESUE9;Initial Catalog=HayEquipo;Integrated Security=True";

            //return cadena;


            //*****Agu_BD

            //string cadena = @"Data Source=DESKTOP-23N56UG\SQLEXPRESS;Initial Catalog=HayEquipo;Persist Security Info=True;User ID=ajretamozo;Password=mestalla;MultipleActiveResultSets=True;Application Name=EntityFramework";


            return cadena;
        }

        public SqlConnection ConexionDB()
        {
            SqlConnection conexion = new SqlConnection();
            //Cadena de Conexion de Franco R
            //conexion.ConnectionString = "Data Source=LAPTOP-N4V2H3NE; Initial Catalog=HayEquipo; User ID=alumnosa; Password=abcd123";

            //Cadena de conescion de nico
           //  conexion.ConnectionString = "Data Source=DESKTOP-H7ESUE9;Initial Catalog=HayEquipo;Integrated Security=True";

            //Cadena de Conexión de Nacho.
            conexion.ConnectionString = @"Data Source=NOTEBOOK-10;Initial Catalog=HayEquipo;User ID=SA;Password=taninga1643";


            //Cadena de conexion de Agus
            //conexion.ConnectionString = @"Data Source=DESKTOP-23N56UG\SQLEXPRESS;Initial Catalog=HayEquipo;Persist Security Info=True;User ID=ajretamozo;Password=mestalla;MultipleActiveResultSets=True;Application Name=EntityFramework";
            return conexion;
        }
        }
    }
