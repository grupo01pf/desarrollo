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
            /* cmd.CommandText =  @"SELECT DISTINCT  ed.id,u.nombre as Usuario, d.nombre as nombreDeporte,  ed.calle,ted.nombre as tipo,
                                    ed.fechaInicioEncuentro, a.nombre as accesiblidad,ed.horaInicio, e.nombre as nombreEstado
                                    FROM EncuentroDeportivo ed, ComplejoDeportivo cd, TipoEncuentroDeportivo ted, 
                                    Deporte d, Accesibilidad a, Usuario u, Estado e
                                    WHERE  d.id = ed.idDeporte  AND a.id = ed.accesibilidad 
                                    AND u.id = ed.idUsuario AND ed.idEstado = e.id";*/
            /*  cmd.CommandText = @"SELECT DISTINCT  ed.id,u.nombre as Usuario, d.nombre as nombreDeporte,ted.nombre as tipo,
                                  ed.fechaInicioEncuentro, a.nombre as accesiblidad,ed.horaInicio, e.nombre as nombreEstado,
                                  lp.nombre
                                  FROM EncuentroDeportivo ed, ComplejoDeportivo cd, TipoEncuentroDeportivo ted, 
                                  Deporte d, Accesibilidad a, Usuario u, Estado e, LugarPublico lp
                                  WHERE  d.id = ed.idDeporte AND ted.id= ed.tipoEncuentro AND a.id = ed.accesibilidad 
                                  AND u.id = ed.idUsuario AND ed.idEstado = e.id AND ed.idLugarPublico = lp.id";

               */
            cmd.CommandText = @"SELECT DISTINCT  ed.id,u.nombre as Usuario, d.nombre as nombreDeporte,ted.nombre as tipo,
                                ed.fechaInicioEncuentro, a.nombre as accesibilidad,ed.horaInicio, e.nombre as nombreEstado,
                                lp.nombre as nombreLP, cd.nombre as complejo
                                FROM EncuentroDeportivo ed, ComplejoDeportivo cd, TipoEncuentroDeportivo ted, 
                                Deporte d, Accesibilidad a, Usuario u, Estado e, LugarPublico lp
                                WHERE  d.id = ed.idDeporte AND  a.id = ed.idAccesibilidad 
                                AND u.id = ed.idUsuario AND ed.idEstado = e.id
                                AND ed.idLugarPublico = lp.id ";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                eq = new EncuentroDeportivoQueryEntidad();


                eq.tipoEncuentro = bool.Parse(dr["tipo"].ToString());
                eq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                eq.nombreUsuario = dr["Usuario"].ToString();
                eq.nombreDeporte = dr["nombreDeporte"].ToString();
               // eq.calle = dr["calle"].ToString();

                //eq.fechaInicioEncuentro = Convert.ToDateTime( DateTime.Parse(dr["fechaInicioEncuentro"].ToString()));
                //eq.fechaInicioEncuentro = DateTime.Parse(dr["fechaInicioEncuentro"].ToString());
                //eq.fechaInicioEncuentro = (DateTime)dr["fechaInicioEncuentro"];
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { eq.fechaInicioEncuentro =fi; }
 
                eq.accesibilidad = bool.Parse(dr["accesibilidad"].ToString());
                // eq.horaIncio = DateTime.Parse(dr["horaInicio"].ToString());
                eq.nombreEstado = dr["nombreEstado"].ToString();
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { eq.horaInicio = hi; } // ok
                eq.nombreLP = dr["nombreLP"].ToString();
                eq.nombreComplejo = dr["complejo"].ToString();
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
                eq.tipoEncuentro = bool.Parse( dr["tipo"].ToString());
                ListaEQ.Add(eq);
            }
            dr.Close();
            cn.Close();
            return ListaEQ;
        }

    }
}
