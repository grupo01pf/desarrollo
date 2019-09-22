using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using System.Data;
using System.Data.SqlClient;

namespace CapaDao
{
    public class ServicioExtraDao
    {
        public static List<ServicioExtra> ObtenerServicios()
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.ServicioExtra.ToList();
            }
        }

        public static ServicioExtra ObtenerServicioPorID(int id)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.ServicioExtra.First(s => s.id == id);
            }
        }

        public static List<ServicioExtra> ObtenerServiciosPorComp(int idComp)
        {
            List<ServicioExtra> servicios = new List<ServicioExtra>();
            ServicioExtra serv = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("spObtenerServiciosPorComplejos", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idComp", idComp);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                serv = new ServicioExtra();
                serv.id = int.Parse(dr["ID"].ToString());
                serv.nombre = dr["Servicio"].ToString();
              
                servicios.Add(serv);
            }
            dr.Close();
            cn.Close();
            return servicios;
        }
    }
}
