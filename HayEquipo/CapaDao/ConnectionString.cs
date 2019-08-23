using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDao
{
   public class ConnectionString
    {

        public static string Cadena() {

            //*****Nico_BD
            //string cadeana = "Data Source=DESKTOP-H7ESUE9;Initial Catalog=HayEquipo;Integrated Security=True";
            //Cadena de Conexión de Nacho.
            string cadeana = @"Data Source=DESKTOP-A9A7OVR\SQLEXPRESS;Initial Catalog=HayEquipo;Persist Security Info=True;User ID=SA;Password=taninga1643";
            return cadeana;

        }


    }
}
