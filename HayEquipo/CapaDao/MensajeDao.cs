using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDao;
using CapaEntidades;
using System.Data.SqlClient;
using System.Data;


namespace CapaDao
{
    public class MensajeDao
    {
        


        /*
        public static void InsertarMensaje(Mensaje msg) {

            using(HayEquipoEntities db = new HayEquipoEntities()){
                db.Mensaje.Add(msg);
                db.SaveChanges();
            }

        }
        */

        public static void InsertarMensaje(Mensaje msg)
        {

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_MensajeDao_InsertarMensaje", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fechaHora", msg.fechaHora);
            // cmd.Parameters.AddWithValue("@hora", r.horaReserva);
            cmd.Parameters.AddWithValue("@idEncuentro", msg.idEncuentro);
            cmd.Parameters.AddWithValue("@idUsuario", msg.idUsuario);
            cmd.Parameters.AddWithValue("@texto", msg.texto);

            cmd.ExecuteNonQuery();
            cn.Close();
        }

    }
}
