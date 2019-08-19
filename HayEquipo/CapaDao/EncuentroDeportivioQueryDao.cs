using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;

namespace CapaDao
{
    public class EncuentroDeportivioQueryDao
    {

        public static List<EncuentroDeportivoQueryEntidad> obtenerEncuentrosDeportivosPublicos()
        {

            EncuentroDeportivoQueryEntidad eq = null;
            List<EncuentroDeportivoQueryEntidad> ListaEQ = new List<EncuentroDeportivoQueryEntidad>();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            /* cmd.CommandText = @"SELECT  ed.id, d.nombre as nombreDeporte,  ed.calle,ted.nombre as tipo,
                                  ed.fechaInicioEncuentro, a.nombre as accesiblidad,ed.horaInicio
                                 FROM EncuentroDeportivo ed, ComplejoDeportivo cd, TipoEncuentroDeportivo ted, Deporte d, Accesibilidad a
                                 WHERE  d.id = ed.idDeporte AND ted.id= ed.tipoEncuentro AND ed.accesibilidad = a.id";*/
            cmd.CommandText = @"SELECT DISTINCT  ed.id,u.nombre as Usuario, d.nombre as nombreDeporte,  ed.calle,ted.nombre as tipo,
                                ed.fechaInicioEncuentro, a.nombre as accesiblidad,ed.horaInicio, e.nombre as nombreEstado
                                FROM EncuentroDeportivo ed, ComplejoDeportivo cd, TipoEncuentroDeportivo ted, 
                                Deporte d, Accesibilidad a, Usuario u, Estado e
                                WHERE  d.id = ed.idDeporte AND ted.id= ed.tipoEncuentro AND a.id = ed.accesibilidad 
                                AND u.id = ed.idUsuario AND ed.idEstado = e.id";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                eq = new EncuentroDeportivoQueryEntidad();
                
                eq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                eq.nombreUsuario = dr["Usuario"].ToString();
                eq.nombreDeporte = dr["nombreDeporte"].ToString();
                eq.calle = dr["calle"].ToString();
                eq.nombreTipoEncuentroDeportivo = dr["tipo"].ToString();

                //  eq.fechaInicioEncuentro = Convert.ToDateTime( DateTime.Parse(dr["fechaInicioEncuentro"].ToString()));
                //eq.fechaInicioEncuentro = DateTime.Parse(dr["fechaInicioEncuentro"].ToString());
                // eq.fechaInicioEncuentro = (DateTime)dr["fechaInicioEncuentro"];

                //DateTime hf;
                //if (DateTime.TryParse(txt_HoraFin.Text, out hf)) { ed.horaFIn = hf; }

                //DateTime calendario = cld_Fecha.SelectedDate;
                //DateTime fi;
                //if (DateTime.TryParse(calendario.ToString("dd/MM/yyyy"), out fi))
                //    ed.fechaInicioEncuentro = fi;
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { eq.fechaInicioEncuentro =fi; }
              //  eq.fechaInicioEncuentro = dr["fechaInicioEncuentro"].ToString();

                //  eq.nombreAccesibilidad = dr["accesibilidad"].ToString();
                // eq.horaIncio = DateTime.Parse(dr["horaInicio"].ToString());
                eq.nombreEstado = dr["nombreEstado"].ToString();


                /* idEncuentroDeportivo = int.Parse(dr["id"].ToString()),
                 calle = dr["calle"].ToString(),
                // fechaInicioEncuentro = (DateTime)dr["fechaInicioEncuentro"],
                 nombreUsuario = dr["Usuario"].ToString(),
                 nombreDeporte = dr["nombreDeporte"].ToString(),
                 nombreTipoEncuentroDeportivo = dr["tipo"].ToString(),
             //  eq.fechaInicioEncuentro = DateTime.Parse(dr["fechaInicioEncuentro"].ToString());

             // eq.accesibilidad = int.Parse(dr["accesibilidad"].ToString());
             // eq.horaIncio = DateTime.Parse(dr["horaInicio"].ToString());*/

                ListaEQ.Add(eq);
            }
            dr.Close();
            cn.Close();
            return ListaEQ;
        }

        public static List<EncuentroDeportivoQueryEntidad> obtenerEncuentrosDeportivosPrivados()
        {

            EncuentroDeportivoQueryEntidad eq = null;
            List<EncuentroDeportivoQueryEntidad> ListaEQ = new List<EncuentroDeportivoQueryEntidad>();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT  ed.id, d.nombre as nombreDeporte, cd.nombre as nombreComplejo, cd.calle as calleComplejo,
                                cd.nroCalle as nroComplejo, ted.nombre as tipo
                                FROM EncuentroDeportivo ed, ComplejoDeportivo cd, TipoEncuentroDeportivo ted, Deporte d
                                WHERE  d.id = ed.idDeporte AND cd.id = ed.idComplejo AND ted.id= ed.tipoEncuentro ";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                eq = new EncuentroDeportivoQueryEntidad();
                eq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                eq.nombreDeporte = dr["nombreDeporte"].ToString();
                eq.nombreComplejo = dr["nombreComplejo"].ToString();
                eq.calleComplejo = dr["calleComplejo"].ToString();
                eq.numeroCalleComplejo = int.Parse(dr["nroComplejo"].ToString());
                eq.nombreTipoEncuentroDeportivo = dr["tipo"].ToString();
                ListaEQ.Add(eq);
            }
            dr.Close();
            cn.Close();
            return ListaEQ;
        }

    }
}
