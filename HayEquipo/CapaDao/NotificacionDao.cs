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
            //cmd.Parameters.AddWithValue("@idReceptor", notificacion.idReceptor);                        
            cmd.Parameters.AddWithValue("@nombreReceptor", notificacion.nombreReceptor);
            cmd.Parameters.AddWithValue("@idEncuentro", notificacion.idEncuentro);
            cmd.Parameters.AddWithValue("@texto", notificacion.texto);

            cmd.ExecuteNonQuery();
            cn.Close();
        }

        public static List<Notificacion> mostrarNotificaciones() {
            List<Notificacion> listaNotificacion = new List<Notificacion>();





            return listaNotificacion;
        }

    }
}
