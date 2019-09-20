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

        public static void acutalizarEncuentroDeportivo(int idEncuntro, int estado) {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                EncuentroDeportivo ed = db.EncuentroDeportivo.First(e => e.id == idEncuntro);
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

        public static void CancelarEncuentro()
        {
            // ToDo
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




    }
}
