using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;
using System.Data;

namespace CapaDao
{
    public class EncuentroDeportivoDao
    {





        public static int InsertarEncuentroPublico(EncuentroDeportivo ed)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                db.EncuentroDeportivo.Add(ed);
                db.SaveChanges();
                return ed.id;
            }
        }

        
        public static int InsertarEncuentroPrivado(EncuentroDeportivo ed)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                db.EncuentroDeportivo.Add(ed);
                db.SaveChanges();
                return ed.id;
            }
        }

        public static void actualizarEncuentroDeportivo(int idEncuentro, int estado) {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                EncuentroDeportivo ed = db.EncuentroDeportivo.First(e => e.id == idEncuentro);
                ed.idEstado = estado;
                db.Entry(ed).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        public static void insertarUsuarioPorEncuentro(int idUsuario, int idEncuentro)
        {

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentro", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
            cmd.Parameters.AddWithValue("@idEncuentro", idEncuentro);
            cmd.ExecuteNonQuery();
            cn.Close();
        }



        public static void insertarUsuarioPorEncuentroEquipoA(int idUsuario, int idEncuentro)
        {
            //using (HayEquipoEntities db = new HayEquipoEntities())
            //{
            //    db.sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentroEquipoA(idUsuario,idEncuentro);
            //    db.SaveChanges();
            //}


            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentroEquipoA", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
            cmd.Parameters.AddWithValue("@idEncuentro", idEncuentro);
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        public static void insertarUsuarioPorEncuentroEquipoB(int idUsuario, int idEncuentro)
        {

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_EncuentroDeportivoDao_insertarUsuarioPorEncuentroEquipoB", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
            cmd.Parameters.AddWithValue("@idEncuentro", idEncuentro);
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        public static void SalirDelEncuentroEquipoA(int idUsuario, int idEncuentro)
        {

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_EncuentroDeportivoDao_SalirDelEncuentroEquipoA", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
            cmd.Parameters.AddWithValue("@idEncuentro", idEncuentro);
            cmd.ExecuteNonQuery();
            cn.Close();
        }
        public static void SalirDelEncuentroEquipoB(int idUsuario, int idEncuentro)
        {

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_EncuentroDeportivoDao_SalirDelEncuentroEquipoB", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
            cmd.Parameters.AddWithValue("@idEncuentro", idEncuentro);
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        


        private static int idEncuentroCreado(int idUsuario)
        {
            int id = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_EncuentroDeportivoDao_idEncuentroCreado", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@usuario", idUsuario);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                id = int.Parse(dr["id"].ToString());
            }
            dr.Close();
            cn.Close();

            return id;
        }


        public static void ActualizarMapaEncuentro(EncuentroDeportivo ed)
        {

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_EncuentroDeportivoDao_ActualizarEDP", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idMapa", ed.idMapa);
            cmd.Parameters.AddWithValue("@idEDP", ed.id);
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        public static string ObtenerEstadoXNombre(string nombre)
        {
            string d = "";

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"select nombre from Estado where nombre= @nombre";
            cmd.Parameters.AddWithValue("@nombre", nombre);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {


                d = dr["nombre"].ToString();


            }
            dr.Close();
            cn.Close();
            return d;
        }

        public static List<EncuentroDeportivoQueryEntidad> obtenerEstadosEncuentrosDeportivosPrivados()
        {

            EncuentroDeportivoQueryEntidad edq = null;
            List<EncuentroDeportivoQueryEntidad> ListaEDQ = new List<EncuentroDeportivoQueryEntidad>();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT  ed.id,ed.idEstado,ed.fechaInicioEncuentro,ed.horaInicio
                                 FROM EncuentroDeportivo ed
                                 WHERE ed.idEstado = 14";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                edq = new EncuentroDeportivoQueryEntidad();
                edq.idEncuentroDeportivo2 = int.Parse(dr["id"].ToString());
                edq.idEstado = int.Parse(dr["idEstado"].ToString());
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { edq.fechaInicioEncuentro = fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { edq.horaInicio = hi; } // ok
                ListaEDQ.Add(edq);
            }
            dr.Close();
            cn.Close();
            return ListaEDQ;
        }

    }
}
