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
    public class TipoCanchaDao
    {
        public static List<TipoCancha> ObtenerTipoPorIdDeporte(int idDeporte)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                List<TipoCancha> tipos = new List<TipoCancha>();
                var tipo = db.TipoCancha.Where(c => c.idDeporte == idDeporte);
                foreach (var item in tipo)
                {
                    tipos.Add(item);
                }
                return tipos;
            }
        }

        public static TipoCancha ObtenerTipoPorID(int id)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.TipoCancha.First(c => c.id == id);
            }
        }

        public static List<TipoCancha> ObtenerTiposCancha()
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.TipoCancha.ToList();
            }
        }

        public static void EliminarTipoCancha(int idTipoCancha)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                db.TipoCancha.RemoveRange(db.TipoCancha.Where(spc => spc.id == idTipoCancha));
                db.SaveChanges();
            }
        }

        public static bool RegistrarTipoCancha(TipoCanchaEntidad objTipoCancha)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = ConnectionString.getInstance().ConexionDB();
                cmd = new SqlCommand("spRegistrarTipoCancha", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmNombre", objTipoCancha.nombre);
                cmd.Parameters.AddWithValue("@prmidDeporte", objTipoCancha.idDeporte);
                cmd.Parameters.AddWithValue("@prmCapacidad", objTipoCancha.capacidad);
                con.Open();
                int filas = cmd.ExecuteNonQuery();
                if (filas > 0) response = true;

            }
            catch (Exception e)
            {
                response = false;
                throw e;
            }
            finally
            {
                con.Close();

            }
            return response;

        }

        public static bool ActualizarTipoCancha(string id, string nom,string idDeporte,string capacidad)
        {
            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE TipoCancha 
                                SET nombre=@nombre,idDeporte=@prmidDeporte,capacidad=@prmCapacidad                                            
                                WHERE id=@idTipoCancha";
            cmd.Parameters.AddWithValue("@idTipoCancha", id);
            cmd.Parameters.AddWithValue("@nombre", nom);
            cmd.Parameters.AddWithValue("@prmidDeporte", idDeporte);
            cmd.Parameters.AddWithValue("@prmCapacidad", capacidad);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                flag = true;
            }
            dr.Close();
            cn.Close();
            return flag;
        }

        public static List<TipoCanchaEntidad> obtenerTipoCancha2()
        {
            TipoCanchaEntidad TipoCancha = null;
            List<TipoCanchaEntidad> ListaTipoCancha = new List<TipoCanchaEntidad>();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT tc.id,tc.nombre,tc.idDeporte,d.nombre as Deporte,tc.capacidad 
                                FROM TipoCancha tc , Deporte d
                                WHERE tc.idDeporte = d.id";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                TipoCancha = new TipoCanchaEntidad();
                TipoCancha.idTipoCancha = int.Parse(dr["id"].ToString());
                TipoCancha.nombre = dr["nombre"].ToString();
                TipoCancha.idDeporte = int.Parse(dr["idDeporte"].ToString());
                TipoCancha.nombreDeporte = dr["Deporte"].ToString();
                TipoCancha.capacidad = int.Parse(dr["capacidad"].ToString());
                ListaTipoCancha.Add(TipoCancha);

            }
            dr.Close();
            cn.Close();
            return ListaTipoCancha;
        }

    }
}
