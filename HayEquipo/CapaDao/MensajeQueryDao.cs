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
    public class MensajeQueryDao
    {


        // public static List<MensajeQueryEntidad> MostrarMensajes(int idEncuentro, int idUsuario)
        public static List<MensajeQueryEntidad> MostrarMensajes(int idEncuentro)
        {


            List<MensajeQueryEntidad> listaMSGQ = new List<MensajeQueryEntidad>();
            MensajeQueryEntidad msgq = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_MensajeQueryDao_MostrarMensajes", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idEncuentro", idEncuentro);
            // cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                msgq = new MensajeQueryEntidad();
                msgq.idMensaje = int.Parse(dr["idMensaje"].ToString());
                msgq.nombreUsuario = dr["nombreUsuario"].ToString();
                msgq.textoMensaje = dr["texto"].ToString();
                DateTime fh; if (DateTime.TryParse(dr["fechaHora"].ToString(), out fh)) { msgq.fechaHoraMensaje = fh; }
                listaMSGQ.Add(msgq);
            }
            dr.Close();
            cn.Close();

            return listaMSGQ;
        }

    }
}
