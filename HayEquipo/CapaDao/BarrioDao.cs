using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;
using System.Configuration;

namespace CapaDao
{
    public class BarrioDao
    {
        //public static List<BarrioEntidad> obtenerBarrios()
        //{
        //    BarrioEntidad barrio = null;
        //    List<BarrioEntidad> ListaBarrio = new List<BarrioEntidad>();
        //    SqlConnection cn = new SqlConnection();
        //    cn.ConnectionString = ConnectionString.Cadena();
        //    cn.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = cn;
        //    cmd.CommandText = "SELECT * FROM Barrio";
        //    SqlDataReader dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {

        //        barrio = new BarrioEntidad();
        //        barrio.idBarrio = int.Parse(dr["id"].ToString());
        //        barrio.nombre = dr["nombre"].ToString();
        //        ListaBarrio.Add(barrio);

        //    }
        //    dr.Close();
        //    cn.Close();
        //    return ListaBarrio;
        //}

        public static List<Barrio> obtenerBarrios()
        {
            using(HayEquipoEntities db=new HayEquipoEntities())
            {
                return db.Barrio.ToList();
            }
        }

    }
}
