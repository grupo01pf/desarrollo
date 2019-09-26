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
        public static List<AgendaEntidad> ObtenerAgendaComplejo(int idComplejo,int idDeporte) {

            List<AgendaEntidad> agenda = new List<AgendaEntidad>();
            AgendaEntidad a = null;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_AgendaDao_ObtenerAgendaComplejo", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idComplejo", idComplejo);
            cmd.Parameters.AddWithValue("@idDeporte", idDeporte);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                a = new AgendaEntidad();

                a.idCancha = int.Parse(dr["idCancha"].ToString());
                a.nombreCancha = dr["nombreCancha"].ToString();
                a.nombreTipoCancha = dr["tipoCancha"].ToString();
               //  TimeSpan hi; if (TimeSpan.TryParse(dr["horaInicio"].ToString(), out hi)) { a.horaInicioHorario = hi; } // ok
                //a.horaInicioHorario = TimeSpan.Parse(dr["horaIncio"].ToString());
                a.precioCancha = float.Parse(dr["precio"].ToString());
                a.capacidadTipoCancha = int.Parse(dr["capacidad"].ToString());
                TimeSpan ha; if (TimeSpan.TryParse(dr["horaApertura"].ToString(), out ha)) { a.horaApertura = ha; } // ok
                TimeSpan hc; if (TimeSpan.TryParse(dr["horaCierre"].ToString(), out hc)) { a.horaCierre = hc; } // ok
                agenda.Add(a);
            }
            dr.Close();
            cn.Close();

            return agenda;
        }

        public static List<AgendaEntidad> ObtenerHorariosReservados(int idComplejo, DateTime fecha) {

            List<AgendaEntidad> agenda = new List<AgendaEntidad>();
            AgendaEntidad a = null;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_AgendaDao_ObtenerHorariosReservados", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idComplejo", idComplejo);
            cmd.Parameters.AddWithValue("@fecha", fecha);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                a = new AgendaEntidad();

                a.idCancha = int.Parse(dr["idCancha"].ToString());
                a.fechaHorario = DateTime.Parse(dr["fecha"].ToString());
                TimeSpan hi; if (TimeSpan.TryParse(dr["horaInicio"].ToString(), out hi)) { a.horaInicioHorario = hi; } // ok
                a.idEstadoHorario = int.Parse(dr["idEstado"].ToString());
                //  TimeSpan hi; if (TimeSpan.TryParse(dr["horaInicio"].ToString(), out hi)) { a.horaInicioHorario = hi; } // ok
                //a.horaInicioHorario = TimeSpan.Parse(dr["horaIncio"].ToString());
               // a.precioCancha = float.Parse(dr["precio"].ToString());
               // a.capacidadTipoCancha = int.Parse(dr["capacidad"].ToString());
               
               // TimeSpan hc; if (TimeSpan.TryParse(dr["horaCierre"].ToString(), out hc)) { a.horaCierre = hc; } // ok
                agenda.Add(a);
            }
            dr.Close();
            cn.Close();

            return agenda;

        }

        public static int InsertarHorario(Horario hr) {


            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                db.Horario.Add(hr);
                db.SaveChanges();
                return hr.id;
            }

            //SqlConnection cn = new SqlConnection();
            //cn.ConnectionString = ConnectionString.Cadena();
            //cn.Open();
            //SqlCommand cmd = new SqlCommand("sp_MensajeDao_InsertarMensaje", cn);
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.AddWithValue("@fechaHora", msg.fechaHora);
            //// cmd.Parameters.AddWithValue("@hora", r.horaReserva);
            //cmd.Parameters.AddWithValue("@idEncuentro", msg.idEncuentro);
            //cmd.Parameters.AddWithValue("@idUsuario", msg.idUsuario);
            //cmd.Parameters.AddWithValue("@texto", msg.texto);

            //cmd.ExecuteNonQuery();
            //cn.Close();



        }

        public static void InsertarCanchasPorHorarios(CanchasPorHorarios cph) {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                db.CanchasPorHorarios.Add(cph);
                db.SaveChanges();

            }


        }





    }
}
