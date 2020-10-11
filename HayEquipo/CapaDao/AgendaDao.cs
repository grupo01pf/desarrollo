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
                if (!string.IsNullOrEmpty(dr["precio"].ToString())) {
                    a.precioCancha = float.Parse(dr["precio"].ToString());
                }
                    
                a.capacidadTipoCancha = int.Parse(dr["capacidad"].ToString());
                TimeSpan ha; if (TimeSpan.TryParse(dr["horaApertura"].ToString(), out ha)) { a.horaApertura = ha; } // ok
                TimeSpan hc; if (TimeSpan.TryParse(dr["horaCierre"].ToString(), out hc)) { a.horaCierre = hc; } // ok

                agenda.Add(a);
            }
            dr.Close();
            cn.Close();

            return agenda;
        }

        public static AgendaEntidad ObtenerAgendaComplejoPorHorario(int idComplejo, int idDeporte, int idTipCancha)
        {

            AgendaEntidad a = a = new AgendaEntidad();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"
                            SELECT DISTINCT c.id as idCancha, c.nombre as nombreCancha, tc.nombre as tipoCancha, 
                                            c.precio, tc.capacidad, cd.horaApertura, cd.horaCierre,
                                            cd.nombre as nombreComplejo, cd.id as idComplejo
                            FROM ComplejoDeportivo cd, Cancha c,TipoCancha tc, Deporte d
                            WHERE  c.idComplejo = @idComplejo AND c.idTipoCancha = tc.id
                                    AND tc.idDeporte = d.id";


            if ( idComplejo > 0)
            {
                cmd.CommandText += @" AND cd.id = @idComplejo";
                cmd.Parameters.AddWithValue("@idComplejo",idComplejo);
            }
            if (idDeporte > 0)
            {
                cmd.CommandText += @" AND d.id = @idDeporte";
                cmd.Parameters.AddWithValue("@idDeporte", idDeporte);
            }
            if (idDeporte > 0)
            {
                cmd.CommandText += @" AND tc.id = @idTipCancha";
                cmd.Parameters.AddWithValue("@idTipCancha", idTipCancha);
            }

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                a.idComplejoDeportivo = int.Parse(dr["idComplejo"].ToString());
                a.idCancha = int.Parse(dr["idCancha"].ToString());
                a.nombreCancha = dr["nombreCancha"].ToString();
                a.nombreTipoCancha = dr["tipoCancha"].ToString();
                a.nombreComplejoDeportivo = dr["nombreComplejo"].ToString();
                //  TimeSpan hi; if (TimeSpan.TryParse(dr["horaInicio"].ToString(), out hi)) { a.horaInicioHorario = hi; } // ok
                //a.horaInicioHorario = TimeSpan.Parse(dr["horaIncio"].ToString());

                if (!string.IsNullOrEmpty(dr["precio"].ToString()))
                {
                    a.precioCancha = float.Parse(dr["precio"].ToString());
                }
                    
                a.capacidadTipoCancha = int.Parse(dr["capacidad"].ToString());
                TimeSpan ha; if (TimeSpan.TryParse(dr["horaApertura"].ToString(), out ha)) { a.horaApertura = ha; } // ok
                TimeSpan hc; if (TimeSpan.TryParse(dr["horaCierre"].ToString(), out hc)) { a.horaCierre = hc; } // ok
              }
            dr.Close();
            cn.Close();

            return a;
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

        public static List<AgendaEntidad> ObtenerHorariosReservados2(int idComplejo, DateTime fecha)
        {

            List<AgendaEntidad> agenda = new List<AgendaEntidad>();
            AgendaEntidad a = null;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_AgendaDao_ObtenerHorariosReservados2", cn);
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

        //public static void InsertarCanchasPorHorarios(CanchasPorHorarios cph)
        //{
        //    using (HayEquipoEntities db = new HayEquipoEntities())
        //    {
        //        db.CanchasPorHorarios.Add(cph);
        //        db.SaveChanges();

        //    }


        //}

        public static void InsertarCanchasPorHorarios(CanchasPorHorarios cph)
        {
            SqlConnection cn = new SqlConnection(ConnectionString.Cadena());
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = @"INSERT INTO CanchasPorHorarios (idHorario, idCancha, idEstado) VALUES (@idHor, @idCan, @idEst)";
            cmd.Parameters.AddWithValue("@idHor", cph.idHorario);
            cmd.Parameters.AddWithValue("@idCan", cph.idCancha);
            cmd.Parameters.AddWithValue("@idEst", cph.idEstado);

            cmd.CommandType = CommandType.Text;
            cmd.Connection = cn;
            cn.Open();
            cmd.ExecuteNonQuery();
        }

        public static void InsertarImagenComplejo(int idComp, Byte[] imagen)
        {
            SqlConnection cn = new SqlConnection(ConnectionString.Cadena());
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = @"INSERT INTO FotosComplejo (imagen, idComplejo) VALUES (@imagen, @idComp)";
            cmd.Parameters.AddWithValue("@idComp", idComp);
            cmd.Parameters.AddWithValue("@imagen", imagen);

            cmd.CommandType = CommandType.Text;
            cmd.Connection = cn;
            cn.Open();
            cmd.ExecuteNonQuery();
        }

        public static void CambiarEstadoCanchasPorHorarios(int idCancha, int idHorario, int idEstado)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE cph 
                                SET cph.idEstado = @idEst
                                FROM CanchasPorHorarios cph
                                WHERE cph.idCancha = @idCan AND cph.idHorario = @idHor";

            cmd.Parameters.AddWithValue("@idEst", idEstado);
            cmd.Parameters.AddWithValue("@idCan", idCancha);
            cmd.Parameters.AddWithValue("@idHor", idHorario);

            cmd.ExecuteNonQuery();

            cn.Close();
        }

        public static int existeHorario(DateTime fecha, TimeSpan hora)
        {
            int idHorario = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT id FROM Horario h WHERE h.fecha = @fecha AND h.horaInicio = @hora";
            cmd.Parameters.AddWithValue("@fecha", fecha);
            cmd.Parameters.AddWithValue("@hora", hora);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                idHorario = int.Parse(dr["id"].ToString());
            }
            dr.Close();
            cn.Close();
            return idHorario;
        }

        public static bool existeCanchasPorHorarios(int idCancha, int idHorario)
        {
            bool existeCPH = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT id FROM CanchasPorHorarios cph WHERE cph.idHorario = @idHor AND cph.idCancha = @idCan";
            cmd.Parameters.AddWithValue("@idCan", idCancha);
            cmd.Parameters.AddWithValue("@idHor", idHorario);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                existeCPH = true;
            }
            dr.Close();
            cn.Close();
            return existeCPH;
        }


        public static void InsertarCrearCanchasPorHorarios(CanchasPorHorarios cph)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                db.CanchasPorHorarios.Add(cph);
                db.SaveChanges();

            }


        }

    }
}
