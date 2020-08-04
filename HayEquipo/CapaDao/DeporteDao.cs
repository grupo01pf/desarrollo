using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;
using System.Data;
using System.Configuration;

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

        public static byte[] ObtenerImagen(string id)
        {

            byte[] imagen = null;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT d.avatar as avatar FROM Deporte d WHERE id = @id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                imagen = (byte[])dr["avatar"];
            }
            dr.Close();
            cn.Close();
            return imagen;

        }

        public static bool RegistrarDeporte(DeporteEntidad objDeporte)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = ConnectionString.getInstance().ConexionDB();
                cmd = new SqlCommand("spRegistrarDeporte", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmNombre", objDeporte.nombre);
                cmd.Parameters.AddWithValue("@imagen", objDeporte.avatar);
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

        public static bool ActualizarDeporte(string id,string nom,byte[] avatar)
        {
            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE Deporte SET nombre=@nombre, avatar=@avatar                                             
                                                WHERE id=@idDeporte;";
            cmd.Parameters.AddWithValue("@idDeporte", id);
            cmd.Parameters.AddWithValue("@nombre", nom);
            cmd.Parameters.AddWithValue("@avatar", avatar);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                flag = true;
            }
            dr.Close();
            cn.Close();
            return flag;
        }


        public static bool existeImagen(string id)
        {

            bool imagen = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT d.avatar FROM Deporte d WHERE avatar IS NOT NULL and @id=id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                imagen = true;
            }
            dr.Close();
            cn.Close();
            return imagen;

        }
    }
}
