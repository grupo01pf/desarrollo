using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDao;
using CapaEntidades;
using System.Data;
using System.Data.SqlClient;

namespace CapaDao
{
    public class AgendaDao
    {
        public static List<AgendaEntidad> ObtenerAgendaComplejo(int idComplejo) {

            List<AgendaEntidad> agenda = new List<AgendaEntidad>();
            AgendaEntidad a = null;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_AgendaDao_ObtenerAgendaComplejo", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idComplejo", idComplejo);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                a = new AgendaEntidad();

                a.nombreCancha = dr["nombreCancha"].ToString();
                a.nombreTipoCancha = dr["tipoCancha"].ToString();
                 TimeSpan hi; if (TimeSpan.TryParse(dr["horaInicio"].ToString(), out hi)) { a.horaInicioHorario = hi; } // ok
                //a.horaInicioHorario = TimeSpan.Parse(dr["horaIncio"].ToString());
                a.precioCancha = float.Parse(dr["precio"].ToString());
                agenda.Add(a);
            }
            dr.Close();
            cn.Close();

            return agenda;
        }

    }
}
