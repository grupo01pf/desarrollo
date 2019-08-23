using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDao
{
   public class ConnectionString
    {

        public static string Cadena()
        {

            //*****Nico_BD
            //string cadena = "Data Source=DESKTOP-H7ESUE9;Initial Catalog=HayEquipo;Integrated Security=True";

            //return cadena;

            //*****Agu_BD
            string cadena = @"Data Source=DESKTOP-23N56UG\SQLEXPRESS;Initial Catalog=HayEquipo;Integrated Security=True";

            return cadena;
        }


    }
}
