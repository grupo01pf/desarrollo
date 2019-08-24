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

            //*****Nico_BD
            //string cadeana = "Data Source=DESKTOP-H7ESUE9;Initial Catalog=HayEquipo;Integrated Security=True";

            //FrancoR BD
            String cadeana = "Data Source=LAPTOP-N4V2H3NE;Initial Catalog=HayEquipo;User ID=alumnosa;Password=abcd123";

           // string cadeana = @"Data Source=DESKTOP-A9A7OVR\SQLEXPRESS;Initial Catalog=HayEquipo;User ID=SA;Password=taninga1643";

            return cadeana;

        }

        public SqlConnection ConexionDB()
        {
            SqlConnection conexion = new SqlConnection();
            conexion.ConnectionString = "Data Source=LAPTOP-N4V2H3NE; Initial Catalog=HayEquipo; User ID=alumnosa; Password=abcd123";
            return conexion;
        }



        }
    }
