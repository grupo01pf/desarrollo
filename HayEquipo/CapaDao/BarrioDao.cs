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
        public static List<Barrio> obtenerBarrios()
        {
            using(HayEquipoEntities db=new HayEquipoEntities())
            {
                return db.Barrio.ToList();
            }
        }

        public static Barrio ObtenerBarriosPorID(int id)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.Barrio.First(b => b.id == id);
            }
        }

        public static List<Barrio> obtenerBarriosOrdenados()
        {

            Barrio barrio = null;
            List<Barrio> ListaZona = new List<Barrio>();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "Select id, nombre FROM Barrio ORDER BY nombre";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                barrio = new Barrio();
                barrio.id = int.Parse(dr["id"].ToString());
                barrio.nombre = dr["nombre"].ToString();
                ListaZona.Add(barrio);

            }
            dr.Close();
            cn.Close();
            return ListaZona;
        }
    }
}
