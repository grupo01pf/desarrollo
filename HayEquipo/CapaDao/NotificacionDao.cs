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
                notificacion.nombreUsuario = dr["emisor"].ToString();
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
            cmd.ExecuteNonQuery();
            cn.Close();
        }

    }
}
