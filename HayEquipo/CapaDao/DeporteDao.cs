using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;

namespace CapaDao
{
    public class DeporteDao
    {

        public static List<Deporte> ObtenerDeportes()
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.Deporte.ToList();
            }
        }

        public static List<DeporteEntidad> obtenerDeportes2()
        {
            DeporteEntidad Deporte = null;
            List<DeporteEntidad> ListaDeportes = new List<DeporteEntidad>();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "SELECT * FROM Deporte";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                Deporte = new DeporteEntidad();
                Deporte.idDeporte = int.Parse(dr["id"].ToString());
                Deporte.nombre = dr["nombre"].ToString();
                ListaDeportes.Add(Deporte);

            }
            dr.Close();
            cn.Close();
            return ListaDeportes;
        }


        public static Deporte ObtenerDeportesPorID(int id)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.Deporte.First(d => d.id == id);
            }
        }
        public static void EliminarDeporte(int idDep)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                db.Deporte.RemoveRange(db.Deporte.Where(spc => spc.id == idDep));
                db.SaveChanges();
            }
        }
    }
}
