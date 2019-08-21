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
            List<EncuentroDeportivoQueryEntidad> ListaEQ = new List<EncuentroDeportivoQueryEntidad>();

            EncuentroDeportivoQueryEntidad eq = null;
           
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT DISTINCT ed.id , u.nombre as Usuario, ed.fechaInicioEncuentro,d.nombre as Deporte, 
                                e.nombre as Estado,ed.horaInicio,ed.horaFin,ed.nombreLP as Lugar ,ed.direccion,
                                ed.tipoEncuentro, ed.accesibilidad, ed.clave
                                FROM EncuentroDeportivo ed, Usuario u, Deporte d, ComplejoDeportivo cd,Estado e
                                WHERE ed.idUsuario = u.id AND ed.idDeporte = d.id AND ed.idEstado = e.id AND ed.tipoEncuentro = 'Publico'" ;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                eq = new EncuentroDeportivoQueryEntidad();
              
                eq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                eq.nombreUsuario = dr["Usuario"].ToString();
                eq.nombreDeporte = dr["Deporte"].ToString();
                eq.nombreEstado = dr["Estado"].ToString();
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { eq.fechaInicioEncuentro =fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { eq.horaInicio = hi; } // ok
                DateTime hf; if (DateTime.TryParse(dr["horaFin"].ToString(), out hf)) { eq.horaFIn = hf; } // ok
                eq.nombreLP = dr["Lugar"].ToString();
                eq.direccion = dr["direccion"].ToString();
                eq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                eq.accesibilidad = dr["accesibilidad"].ToString();
                eq.clave = dr["clave"].ToString();
                ListaEQ.Add(eq);

                // eq.calle = dr["calle"].ToString();
                //eq.fechaInicioEncuentro = Convert.ToDateTime( DateTime.Parse(dr["fechaInicioEncuentro"].ToString()));
                //eq.fechaInicioEncuentro = DateTime.Parse(dr["fechaInicioEncuentro"].ToString());
                //eq.fechaInicioEncuentro = (DateTime)dr["fechaInicioEncuentro"];
                // eq.nombreComplejo = dr["Complejo"].ToString();
                // eq.calleComplejo = dr["calle"].ToString();
                //eq.horaInicio = DateTime.Parse(dr["horaInicio"].ToString());
                // eq.nombreEstado = dr["nombreEstado"].ToString();


            }
            dr.Close();
            cn.Close();

            //**********************************************************

           // EncuentroDeportivoQueryEntidad eq = null;
           // SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
          //  SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT DISTINCT ed.id, u.nombre as Usuario, ed.fechaInicioEncuentro,d.nombre as Deporte, 
                                e.nombre as Estado,ed.horaInicio,ed.horaFin,cd.nombre as Complejo ,cd.calle,
                                ed.tipoEncuentro, ed.accesibilidad, ed.clave
                                FROM EncuentroDeportivo ed, Usuario u, Deporte d, ComplejoDeportivo cd,Estado e
                                WHERE ed.idUsuario = u.id AND ed.idDeporte = d.id AND ed.idEstado = e.id
                                AND ed.tipoEncuentro = 'Privado' AND ed.idComplejo = cd.id ";
            // SqlDataReader dr = cmd.ExecuteReader();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                eq = new EncuentroDeportivoQueryEntidad();

                eq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                eq.nombreUsuario = dr["Usuario"].ToString();
                eq.nombreDeporte = dr["Deporte"].ToString();
                eq.nombreEstado = dr["Estado"].ToString();    
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { eq.fechaInicioEncuentro = fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { eq.horaInicio = hi; } // ok
                DateTime hf; if (DateTime.TryParse(dr["horaFin"].ToString(), out hf)) { eq.horaFIn = hf; } // ok
                eq.nombreComplejo = dr["Complejo"].ToString();
                eq.calleComplejo = dr["calle"].ToString();
                eq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                eq.accesibilidad = dr["accesibilidad"].ToString();
                eq.clave = dr["clave"].ToString();
                ListaEQ.Add(eq);

                // eq.calle = dr["calle"].ToString();
                //eq.fechaInicioEncuentro = Convert.ToDateTime( DateTime.Parse(dr["fechaInicioEncuentro"].ToString()));
                //eq.fechaInicioEncuentro = DateTime.Parse(dr["fechaInicioEncuentro"].ToString());
                //eq.fechaInicioEncuentro = (DateTime)dr["fechaInicioEncuentro"];
                //eq.horaInicio = DateTime.Parse(dr["horaInicio"].ToString());
                // eq.nombreEstado = dr["nombreEstado"].ToString();
                // eq.nombreLP = dr["Lugar"].ToString();
                // eq.direccion = dr["direccion"].ToString();
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
                eq.tipoEncuentro = dr["tipo"].ToString();
                ListaEQ.Add(eq);
            }
            dr.Close();
            cn.Close();
            return ListaEQ;
        }

    }
}
