using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;
using System.Configuration;
using System.Data;

namespace CapaDao
{
    public class NotificacionDao
    {

        public static void insertarNotificacion(Notificacion notificacion) {


            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_NotificacionDao_insertarNotificacion", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idEmisor", notificacion.idEmisor);
            cmd.Parameters.AddWithValue("@nombreEmisor", notificacion.nombreEmisor);
            cmd.Parameters.AddWithValue("@idReceptor", notificacion.idReceptor);
            cmd.Parameters.AddWithValue("@nombreReceptor", notificacion.nombreReceptor);
            cmd.Parameters.AddWithValue("@idEncuentro", notificacion.idEncuentro);
            cmd.Parameters.AddWithValue("@texto", notificacion.texto);
            cmd.Parameters.AddWithValue("@idEstado", notificacion.idEstado);

            cmd.ExecuteNonQuery();
            cn.Close();
        }

      

        // public static List<Notificacion> mostrarNotificaciones() {
        public static List<NotificacionQueryEntidad> mostrarNotificaciones(int idUsuario) {

         List<NotificacionQueryEntidad> listaNotificacion = new List<NotificacionQueryEntidad>();
            NotificacionQueryEntidad notificacion = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_NotificacionDao_mostrarNotificaciones", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            //  cmd.Parameters.AddWithValue("@usuario", idUsuario);
            cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                notificacion = new NotificacionQueryEntidad();

                notificacion.idNotificacion = int.Parse(dr["id"].ToString());
                notificacion.nombreEmisor = dr["emisor"].ToString();
                notificacion.nombreReceptor = dr["receptor"].ToString();
                notificacion.texto = dr["texto"].ToString();
                notificacion.idEncuentro = int.Parse(dr["idEncuentro"].ToString());
                notificacion.nombreEstado = dr["estado"].ToString();
                listaNotificacion.Add(notificacion);
            }

            dr.Close();
            cn.Close();


            return listaNotificacion;
      }

        public static int contadorNotificaciones(int idUsuario) {
            int contador = 0;
            
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_NotificacionDao_contadorNotificaciones", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            //  cmd.Parameters.AddWithValue("@usuario", idUsuario);
            cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read()) {
                contador = int.Parse(dr["Cantidad"].ToString());
            }
            

            dr.Close();
            cn.Close();

            
            return contador;

        }


        public static void actualizarEstadoNotificacion(int idEstado, int idNotificacion)
        {


            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_NotificacionDao_actualizarEstadoNotificacion", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idEstado", idEstado);
            cmd.Parameters.AddWithValue("@idNotificacion", idNotificacion);
            //if (!string.IsNullOrEmpty(texto))
            //{
            //    cmd.Parameters.AddWithValue("@texto", texto);
            //}
            //else
            //{

            //}
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        public static List<NotificacionQueryEntidad> mostrarNotificacionesSolicitudes(int idUsuario)
        {

            List<NotificacionQueryEntidad> listaNotificacion = new List<NotificacionQueryEntidad>();
            NotificacionQueryEntidad notificacion = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @" 
                                SELECT DISTINCT n.id, n.nombreEmisor as emisor, n.texto, n.idEncuentro, 
				                                e.nombre as estado, n.nombreReceptor as receptor,
                                                n.idEmisor, n.idReceptor
                                FROM Notificacion n, Estado e
                                WHERE e.id = n.idEstado AND n.idEstado != 11 
                                      AND n.idEstado != 13 AND n.idEncuentro = 0";


            if (idUsuario != 0)
            {
                cmd.CommandText += @" AND n.idReceptor = @id";
                cmd.Parameters.AddWithValue("@id", idUsuario);
            }


            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                notificacion = new NotificacionQueryEntidad();

                notificacion.idNotificacion = int.Parse(dr["id"].ToString());
                notificacion.nombreEmisor = dr["emisor"].ToString();
                notificacion.texto = dr["texto"].ToString();
                notificacion.idEncuentro = int.Parse(dr["idEncuentro"].ToString());
                notificacion.nombreEstado = dr["estado"].ToString();
                notificacion.idReceptor = int.Parse(dr["idReceptor"].ToString());
                notificacion.idEmisor = int.Parse(dr["idEmisor"].ToString());
                notificacion.nombreReceptor = dr["receptor"].ToString();
                listaNotificacion.Add(notificacion);
            }

            dr.Close();
            cn.Close();


            return listaNotificacion;
        }

        public static int contadorNotificacionesSolicitudes(int idUsuario)
        {
            int contador = 0;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @" 
                                SELECT COUNT (texto) as Cantidad
                                FROM Notificacion n, Usuario u
                                WHERE  n.idEncuentro = 0 AND n.idReceptor = u.id AND n.idEstado = 10";


            if (idUsuario != 0)
            {
                cmd.CommandText += @" AND n.idReceptor = @id";
                cmd.Parameters.AddWithValue("@id", idUsuario);
            }
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                contador = int.Parse(dr["Cantidad"].ToString());
            }


            dr.Close();
            cn.Close();


            return contador;

        }

        

        public static bool ExistePartidoFinalizado(int idReceptor, int idEncuentro)
        {

            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT n.id, n.nombreEmisor as emisor, n.texto, n.idEncuentro, 
				                                n.nombreReceptor as receptor,
                                                n.idEmisor, n.idReceptor
                                FROM Notificacion n
                                WHERE (n.idEstado = 10 or n.idEstado = 9) AND n.idReceptor = @id and n.idEncuentro = @ide ";
            cmd.Parameters.AddWithValue("@id", idReceptor);
            cmd.Parameters.AddWithValue("@ide", idEncuentro);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                flag = true;
            }
            dr.Close();
            cn.Close();
            return flag;

        }



    }

}
