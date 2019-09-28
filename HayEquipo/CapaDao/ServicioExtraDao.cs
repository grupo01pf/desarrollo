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

        public static void EliminarServiciosPorComplejo(int idComp)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                db.ServiciosPorComplejos.RemoveRange(db.ServiciosPorComplejos.Where(spc => spc.idComplejo == idComp));
                db.SaveChanges();
            }
        }

        public static bool ExistenServiciosPorComplejo(int idComp)
        {
            bool servicios = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT count(*) as Cantidad
                                  FROM ServiciosPorComplejos spc
                             LEFT JOIN ComplejoDeportivo cd on cd.id=spc.idComplejo
                                 WHERE cd.id=@idCom";
            cmd.Parameters.AddWithValue("@idCom", idComp);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                servicios = true;
            }
            dr.Close();
            cn.Close();
            return servicios;
        }
    }
}
