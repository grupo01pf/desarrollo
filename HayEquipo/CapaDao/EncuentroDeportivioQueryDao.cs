using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;
using System.Data;

namespace CapaDao
{
    public class EncuentroDeportivioQueryDao
    {

        public static EncuentroDeportivoQueryEntidad datosEncuentroPrivado(int idEncuentro)
        {


            EncuentroDeportivoQueryEntidad edq = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_EncuentroDeportivoQueryDao_BuscarEncuentroPrivado", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            //  cmd.Parameters.AddWithValue("@usuario", idUsuario);
            cmd.Parameters.AddWithValue("@idEnc", idEncuentro);
            SqlDataReader dr = cmd.ExecuteReader();
            //dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                edq = new EncuentroDeportivoQueryEntidad();

                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                edq.nombreUsuario = dr["Usuario"].ToString();
                edq.idUsuario = int.Parse(dr["idUsuario"].ToString());
                edq.nombreDeporte = dr["Deporte"].ToString();
                edq.nombreEstado = dr["Estado"].ToString();
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { edq.fechaInicioEncuentro = fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { edq.horaInicio = hi; } // ok
                DateTime hf; if (DateTime.TryParse(dr["horaFin"].ToString(), out hf)) { edq.horaFin = hf; } // ok
                edq.nombreComplejo = dr["Complejo"].ToString();
                edq.calleComplejo = dr["calle"].ToString();
                //  eq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                //  eq.accesibilidad = dr["accesibilidad"].ToString();
                edq.clave = dr["clave"].ToString();
                //  eq.nombreDeporte = dr["nombreDeporte"].ToString();
                //  eq.nombreComplejo = dr["nombreComplejo"].ToString();
                //   eq.calleComplejo = dr["calleComplejo"].ToString();
                edq.numeroCalleComplejo = int.Parse(dr["nroCalle"].ToString());
                edq.numeroTelefono = long.Parse(dr["nroTelefono"].ToString());
                edq.capacidad = int.Parse(dr["capacidad"].ToString());
                edq.idComplejo = int.Parse(dr["idComplejo"].ToString());
                if (!string.IsNullOrEmpty(dr["idClave"].ToString()))
                {
                    edq.idClave = int.Parse(dr["idClave"].ToString());
                }


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
            return edq;
        }

        public static EncuentroDeportivoQueryEntidad datosEncuentroPublico(int idEncuentro)
        {


            //List<EncuentroDeportivoQueryEntidad> ListaEQ = new List<EncuentroDeportivoQueryEntidad>();
            EncuentroDeportivoQueryEntidad edq = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_EncuentroDeportivoQueryDao_BuscarEncuentroPublico", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            //  cmd.Parameters.AddWithValue("@usuario", idUsuario);
            cmd.Parameters.AddWithValue("@idEnc", idEncuentro);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                edq = new EncuentroDeportivoQueryEntidad();
                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                edq.nombreUsuario = dr["Usuario"].ToString();
                edq.idUsuario = int.Parse(dr["idUsuario"].ToString());
                edq.nombreDeporte = dr["Deporte"].ToString();
                edq.nombreEstado = dr["Estado"].ToString();
                // DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { eq.fechaInicioEncuentro = fi; }
                // eq.fechaInicioEncuentro = (DateTime)dr["fechaInicioEncuentro"];
                edq.fechaInicioEncuentro = DateTime.Parse(dr["fechaInicioEncuentro"].ToString());
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { edq.horaInicio = hi; } // ok
                DateTime hf; if (DateTime.TryParse(dr["horaFin"].ToString(), out hf)) { edq.horaFin = hf; } // ok
                edq.nombreLP = dr["Lugar"].ToString();
                edq.direccion = dr["direccion"].ToString();
                edq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                edq.accesibilidad = dr["accesibilidad"].ToString();
                edq.clave = dr["clave"].ToString();
                edq.capacidad = int.Parse(dr["capacidad"].ToString());
                edq.idMapa = int.Parse(dr["idMapa"].ToString());

            }
            dr.Close();
            cn.Close();


            return edq;

        }



        public static List<EncuentroDeportivoQueryEntidad> obtenerEncuentrosDeportivosPublicos()
        {
            List<EncuentroDeportivoQueryEntidad> ListaEDQ = new List<EncuentroDeportivoQueryEntidad>();

            EncuentroDeportivoQueryEntidad edq = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT DISTINCT ed.id , u.nombre as Usuario, ed.fechaInicioEncuentro,d.nombre as Deporte,
                                e.nombre as Estado,ed.horaInicio,ed.horaFin,ed.nombreLP as Lugar ,ed.direccion,
                                ed.tipoEncuentro, ed.accesibilidad, ed.clave
                                FROM EncuentroDeportivo ed, Usuario u, Deporte d, ComplejoDeportivo cd,Estado e
                                WHERE ed.idUsuario = u.id AND ed.idDeporte = d.id AND ed.idEstado = e.id AND ed.tipoEncuentro = 'Publico'";

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                edq = new EncuentroDeportivoQueryEntidad();

                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                edq.nombreUsuario = dr["Usuario"].ToString();
                edq.nombreDeporte = dr["Deporte"].ToString();
                edq.nombreEstado = dr["Estado"].ToString();
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { edq.fechaInicioEncuentro = fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { edq.horaInicio = hi; } // ok
                DateTime hf; if (DateTime.TryParse(dr["horaFin"].ToString(), out hf)) { edq.horaFin = hf; } // ok
                edq.nombreLP = dr["Lugar"].ToString();
                edq.direccion = dr["direccion"].ToString();
                edq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                edq.accesibilidad = dr["accesibilidad"].ToString();
                edq.clave = dr["clave"].ToString();

                ListaEDQ.Add(edq);

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
                                e.nombre as Estado,ed.horaInicio,ed.horaFin,cd.nombre as Complejo ,cd.calle,cd.nroCalle,
                                ed.tipoEncuentro, ed.accesibilidad, ed.clave
                                FROM EncuentroDeportivo ed, Usuario u, Deporte d, ComplejoDeportivo cd,Estado e
                                WHERE ed.idUsuario = u.id AND ed.idDeporte = d.id AND ed.idEstado = e.id
                                AND ed.tipoEncuentro = 'Privado' AND ed.idComplejo = cd.id";
            // SqlDataReader dr = cmd.ExecuteReader();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                edq = new EncuentroDeportivoQueryEntidad();

                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                edq.nombreUsuario = dr["Usuario"].ToString();
                edq.nombreDeporte = dr["Deporte"].ToString();
                edq.nombreEstado = dr["Estado"].ToString();
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { edq.fechaInicioEncuentro = fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { edq.horaInicio = hi; } // ok
                DateTime hf; if (DateTime.TryParse(dr["horaFin"].ToString(), out hf)) { edq.horaFin = hf; } // ok
                edq.nombreComplejo = dr["Complejo"].ToString();
                edq.calleComplejo = dr["calle"].ToString();
                edq.numeroCalleComplejo = int.Parse(dr["nroCalle"].ToString());
                edq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                edq.accesibilidad = dr["accesibilidad"].ToString();
                edq.clave = dr["clave"].ToString();

                ListaEDQ.Add(edq);

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


            return ListaEDQ;
        }

        public static EncuentroDeportivoQueryEntidad buscarEncuentroPublico(int usuario, int idEncuentro)
        {
            EncuentroDeportivoQueryEntidad edq = null;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_EncuentroDeportivoQueryDao_BuscarEncuentroPublico", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@usuario", usuario);
            cmd.Parameters.AddWithValue("@idEnc", idEncuentro);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
            }
            dr.Close();
            cn.Close();

            return edq;
        }




        public static List<EncuentroDeportivoQueryEntidad> obtenerEncuentrosDeportivosPrivados()
        {

            EncuentroDeportivoQueryEntidad edq = null;
            List<EncuentroDeportivoQueryEntidad> ListaEDQ = new List<EncuentroDeportivoQueryEntidad>();
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

                edq = new EncuentroDeportivoQueryEntidad();
                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                edq.nombreDeporte = dr["nombreDeporte"].ToString();
                edq.nombreComplejo = dr["nombreComplejo"].ToString();
                edq.calleComplejo = dr["calleComplejo"].ToString();
                edq.numeroCalleComplejo = int.Parse(dr["nroComplejo"].ToString());
                edq.numeroTelefono = int.Parse(dr["nroTelefono"].ToString());
                ListaEDQ.Add(edq);
            }
            dr.Close();
            cn.Close();
            return ListaEDQ;
        }


        public static List<EncuentroDeportivoQueryEntidad> obtenerEncuentrosDeportivosPorId(string id)
        {
            List<EncuentroDeportivoQueryEntidad> ListaEDQ = new List<EncuentroDeportivoQueryEntidad>();

            EncuentroDeportivoQueryEntidad edq = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT DISTINCT ed.id , u.nombre as Usuario, ed.fechaInicioEncuentro,d.nombre as Deporte,
                                e.nombre as Estado,ed.horaInicio,ed.horaFin,ed.nombreLP as Lugar ,ed.direccion,
                                ed.tipoEncuentro, ed.accesibilidad, ed.clave
                                FROM EncuentroDeportivo ed, Usuario u, Deporte d, ComplejoDeportivo cd,Estado e
                                WHERE ed.idUsuario = u.id AND ed.idDeporte = d.id AND ed.idEstado = e.id AND ed.tipoEncuentro = 'Publico' AND ed.idUsuario=@idUsuario";
            cmd.Parameters.AddWithValue("@idUsuario", id);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                edq = new EncuentroDeportivoQueryEntidad();

                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                edq.nombreUsuario = dr["Usuario"].ToString();
                edq.nombreDeporte = dr["Deporte"].ToString();
                edq.nombreEstado = dr["Estado"].ToString();
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { edq.fechaInicioEncuentro = fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { edq.horaInicio = hi; } // ok
                DateTime hf; if (DateTime.TryParse(dr["horaFin"].ToString(), out hf)) { edq.horaFin = hf; } // ok
                edq.nombreLP = dr["Lugar"].ToString();
                edq.direccion = dr["direccion"].ToString();
                edq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                edq.accesibilidad = dr["accesibilidad"].ToString();
                edq.clave = dr["clave"].ToString();
                ListaEDQ.Add(edq);



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
                                AND ed.tipoEncuentro = 'Privado' AND ed.idComplejo = cd.id AND ed.idUsuario=@idUsuario2";
            // SqlDataReader dr = cmd.ExecuteReader();
            cmd.Parameters.AddWithValue("@idUsuario2", id);
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                edq = new EncuentroDeportivoQueryEntidad();

                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                edq.nombreUsuario = dr["Usuario"].ToString();
                edq.nombreDeporte = dr["Deporte"].ToString();
                edq.nombreEstado = dr["Estado"].ToString();
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { edq.fechaInicioEncuentro = fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { edq.horaInicio = hi; } // ok
                DateTime hf; if (DateTime.TryParse(dr["horaFin"].ToString(), out hf)) { edq.horaFin = hf; } // ok
                edq.nombreComplejo = dr["Complejo"].ToString();
                edq.calleComplejo = dr["calle"].ToString();
                edq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                edq.accesibilidad = dr["accesibilidad"].ToString();
                edq.clave = dr["clave"].ToString();
                ListaEDQ.Add(edq);

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

            return ListaEDQ;
        }

        public static string obtenerTipoEncuentroPorId(string id)
        {
            string tipo = "";
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT ed.tipoEncuentro as tipoEncuentro
                                FROM EncuentroDeportivo ed
                                WHERE  ed.id = @id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                tipo = dr["tipoEncuentro"].ToString();
            }
            dr.Close();
            cn.Close();

            return tipo;
        }
        //Modifiqué consulta por elimiación de tabla 'Responsable'
        public static List<EncuentroDeportivoQueryEntidad> ObtenerEncuentrosPorUsResponsable(int idUs)
        {
            List<EncuentroDeportivoQueryEntidad> ListaEDQ = new List<EncuentroDeportivoQueryEntidad>();

            EncuentroDeportivoQueryEntidad edq = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT ed.id, ed.fechaInicioEncuentro,d.nombre as Deporte,
                                e.nombre as Estado,ed.horaInicio,ed.horaFin,cd.nombre as Complejo ,cd.calle,cd.nroCalle,
                                ed.tipoEncuentro, ed.accesibilidad, ed.clave
                                FROM EncuentroDeportivo ed
								LEFT JOIN Deporte d ON d.id=ed.idDeporte
								LEFT JOIN Estado e ON e.id=ed.idEstado
                                LEFT JOIN ComplejoDeportivo cd ON cd.id=ed.idComplejo
								LEFT JOIN Usuario u ON u.id=cd.idUsuario
								WHERE u.id=@idUs";
            cmd.Parameters.AddWithValue("@idUs", idUs);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                edq = new EncuentroDeportivoQueryEntidad();
                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                //edq.nombreUsuario = dr["Usuario"].ToString();
                edq.nombreDeporte = dr["Deporte"].ToString();
                edq.nombreEstado = dr["Estado"].ToString();
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { edq.fechaInicioEncuentro = fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { edq.horaInicio = hi; } // ok
                DateTime hf; if (DateTime.TryParse(dr["horaFin"].ToString(), out hf)) { edq.horaFin = hf; } // ok
                edq.nombreComplejo = dr["Complejo"].ToString();
                edq.calleComplejo = dr["calle"].ToString();
                edq.numeroCalleComplejo = int.Parse(dr["nroCalle"].ToString());
                edq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                edq.accesibilidad = dr["accesibilidad"].ToString();
                edq.clave = dr["clave"].ToString();
                ListaEDQ.Add(edq);
            }
            dr.Close();
            cn.Close();
            return ListaEDQ;
        }


        public static List<EncuentroDeportivoQueryEntidad> obtenerEncuentrosDeportivosConImagenes()
        {
            List<EncuentroDeportivoQueryEntidad> ListaEDQ = new List<EncuentroDeportivoQueryEntidad>();

            EncuentroDeportivoQueryEntidad edq = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;

            cmd.CommandText = @"SELECT ed.id , u.nombre as Usuario, ed.fechaInicioEncuentro,d.nombre as Deporte,
                                e.nombre as Estado,ed.horaInicio,ed.horaFin,ed.nombreLP as Lugar ,ed.direccion,
                                ed.tipoEncuentro, ed.accesibilidad, ed.clave ,d.avatar as avatar
                                FROM EncuentroDeportivo ed, Usuario u, Deporte d, Estado e
                                WHERE ed.idUsuario = u.id AND ed.idDeporte = d.id AND ed.idEstado = e.id AND ed.tipoEncuentro = 'Publico'
                                 and(ed.idEstado= 7 or ed.idEstado=8)";

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                edq = new EncuentroDeportivoQueryEntidad();

                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                //edq.nombreUsuario = dr["Usuario"].ToString();
                edq.nombreUsuario = dr["Usuario"].ToString();
                edq.nombreDeporte = dr["Deporte"].ToString();
                edq.nombreEstado = dr["Estado"].ToString();
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { edq.fechaInicioEncuentro = fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { edq.horaInicio = hi; } // ok
                DateTime hf; if (DateTime.TryParse(dr["horaFin"].ToString(), out hf)) { edq.horaFin = hf; } // ok
                edq.nombreLP = dr["Lugar"].ToString();
                edq.direccion = dr["direccion"].ToString();
                edq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                edq.accesibilidad = dr["accesibilidad"].ToString();
                edq.clave = dr["clave"].ToString();
                edq.avatar = (byte[])dr["avatar"];
                ListaEDQ.Add(edq);




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
            cmd.CommandText = @"SELECT ed.id, u.nombre as Usuario, ed.fechaInicioEncuentro,d.nombre as Deporte,
                                e.nombre as Estado,ed.horaInicio,ed.horaFin,cd.nombre as Complejo ,cd.calle,cd.nroCalle,
                                ed.tipoEncuentro, ed.accesibilidad, ed.clave,d.avatar as avatar
                                FROM EncuentroDeportivo ed, Usuario u, Deporte d, ComplejoDeportivo cd,Estado e
                                WHERE ed.idUsuario = u.id AND ed.idDeporte = d.id AND ed.idEstado = e.id
                                AND ed.tipoEncuentro = 'Privado' AND ed.idComplejo = cd.id and(ed.idEstado= 7 or ed.idEstado=8)";
            // SqlDataReader dr = cmd.ExecuteReader();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                edq = new EncuentroDeportivoQueryEntidad();

                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                edq.nombreUsuario = dr["Usuario"].ToString();
                edq.nombreDeporte = dr["Deporte"].ToString();
                edq.nombreEstado = dr["Estado"].ToString();
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { edq.fechaInicioEncuentro = fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { edq.horaInicio = hi; } // ok
                DateTime hf; if (DateTime.TryParse(dr["horaFin"].ToString(), out hf)) { edq.horaFin = hf; } // ok
                edq.nombreComplejo = dr["Complejo"].ToString();
                edq.calleComplejo = dr["calle"].ToString();
                edq.numeroCalleComplejo = int.Parse(dr["nroCalle"].ToString());
                edq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                edq.accesibilidad = dr["accesibilidad"].ToString();
                edq.clave = dr["clave"].ToString();
                edq.avatar = (byte[])dr["avatar"];

                ListaEDQ.Add(edq);


            }
            dr.Close();
            cn.Close();

            return ListaEDQ;
        }

        public static List<EncuentroDeportivoQueryEntidad> obtenerEncuentrosDeportivosPorDeporte(int idDepor)
        {
            List<EncuentroDeportivoQueryEntidad> ListaEDQ = new List<EncuentroDeportivoQueryEntidad>();

            EncuentroDeportivoQueryEntidad edq = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;

            cmd.CommandText = @"SELECT ed.id , u.nombre as Usuario, ed.fechaInicioEncuentro,d.nombre as Deporte,
                                e.nombre as Estado,ed.horaInicio,ed.horaFin,ed.nombreLP as Lugar ,ed.direccion,
                                ed.tipoEncuentro, ed.accesibilidad, ed.clave ,d.avatar as avatar
                                FROM EncuentroDeportivo ed, Usuario u, Deporte d, Estado e
                                WHERE ed.idUsuario = u.id AND ed.idDeporte = d.id AND ed.idEstado = e.id AND ed.tipoEncuentro = 'Publico'";

            if (idDepor != 0)
            {
                cmd.CommandText += " AND ed.idDeporte=@idDepor";
                cmd.Parameters.AddWithValue("@idDepor", idDepor);
            }

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                edq = new EncuentroDeportivoQueryEntidad();

                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                //edq.nombreUsuario = dr["Usuario"].ToString();
                edq.nombreUsuario = dr["Usuario"].ToString();
                edq.nombreDeporte = dr["Deporte"].ToString();
                edq.nombreEstado = dr["Estado"].ToString();
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { edq.fechaInicioEncuentro = fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { edq.horaInicio = hi; } // ok
                DateTime hf; if (DateTime.TryParse(dr["horaFin"].ToString(), out hf)) { edq.horaFin = hf; } // ok
                edq.nombreLP = dr["Lugar"].ToString();
                edq.direccion = dr["direccion"].ToString();
                edq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                edq.accesibilidad = dr["accesibilidad"].ToString();
                edq.clave = dr["clave"].ToString();
                edq.avatar = (byte[])dr["avatar"];
                ListaEDQ.Add(edq);




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
            cmd.CommandText = @"SELECT ed.id, u.nombre as Usuario, ed.fechaInicioEncuentro,d.nombre as Deporte,
                                e.nombre as Estado,ed.horaInicio,ed.horaFin,cd.nombre as Complejo ,cd.calle,cd.nroCalle,
                                ed.tipoEncuentro, ed.accesibilidad, ed.clave,d.avatar as avatar
                                FROM EncuentroDeportivo ed, Usuario u, Deporte d, ComplejoDeportivo cd,Estado e
                                WHERE ed.idUsuario = u.id AND ed.idDeporte = d.id AND ed.idEstado = e.id
                                AND ed.tipoEncuentro = 'Privado' AND ed.idComplejo = cd.id";

            if (idDepor != 0)
            {
                cmd.CommandText += " AND ed.idDeporte=@idDepor";
                //cmd.Parameters.AddWithValue("@idDepor", idDepor);
            }

            // SqlDataReader dr = cmd.ExecuteReader();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                edq = new EncuentroDeportivoQueryEntidad();

                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                edq.nombreUsuario = dr["Usuario"].ToString();
                edq.nombreDeporte = dr["Deporte"].ToString();
                edq.nombreEstado = dr["Estado"].ToString();
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { edq.fechaInicioEncuentro = fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { edq.horaInicio = hi; } // ok
                DateTime hf; if (DateTime.TryParse(dr["horaFin"].ToString(), out hf)) { edq.horaFin = hf; } // ok
                edq.nombreComplejo = dr["Complejo"].ToString();
                edq.calleComplejo = dr["calle"].ToString();
                edq.numeroCalleComplejo = int.Parse(dr["nroCalle"].ToString());
                edq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                edq.accesibilidad = dr["accesibilidad"].ToString();
                edq.clave = dr["clave"].ToString();
                edq.avatar = (byte[])dr["avatar"];

                ListaEDQ.Add(edq);


            }
            dr.Close();
            cn.Close();

            return ListaEDQ;
        }

        public static List<EncuentroDeportivoQueryEntidad> obtenerEncuentrosDeportivosPorZona(int idZona)
        {
            List<EncuentroDeportivoQueryEntidad> ListaEDQ = new List<EncuentroDeportivoQueryEntidad>();

            EncuentroDeportivoQueryEntidad edq = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;

            cmd.CommandText = @"SELECT ed.id , u.nombre as Usuario, ed.fechaInicioEncuentro,d.nombre as Deporte,
                                e.nombre as Estado,ed.horaInicio,ed.horaFin,ed.nombreLP as Lugar ,ed.direccion,
                                ed.tipoEncuentro, ed.accesibilidad, ed.clave ,d.avatar as avatar
                                FROM EncuentroDeportivo ed, Usuario u, Deporte d, Estado e
                                WHERE ed.idUsuario = u.id AND ed.idDeporte = d.id AND ed.idEstado = e.id AND ed.tipoEncuentro = 'Publico'";

            if (idZona != 0)
            {
                cmd.CommandText += " AND ed.zonaLP=@idZona";
                cmd.Parameters.AddWithValue("@idZona", idZona);
            }

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                edq = new EncuentroDeportivoQueryEntidad();

                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                edq.nombreUsuario = dr["Usuario"].ToString();
                edq.nombreDeporte = dr["Deporte"].ToString();
                edq.nombreEstado = dr["Estado"].ToString();
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { edq.fechaInicioEncuentro = fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { edq.horaInicio = hi; } // ok
                DateTime hf; if (DateTime.TryParse(dr["horaFin"].ToString(), out hf)) { edq.horaFin = hf; } // ok
                edq.nombreLP = dr["Lugar"].ToString();
                edq.direccion = dr["direccion"].ToString();
                edq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                edq.accesibilidad = dr["accesibilidad"].ToString();
                edq.clave = dr["clave"].ToString();
                edq.avatar = (byte[])dr["avatar"];
                ListaEDQ.Add(edq);




            }
            dr.Close();
            cn.Close();

            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT ed.id, u.nombre as Usuario, ed.fechaInicioEncuentro,d.nombre as Deporte,
                                e.nombre as Estado,ed.horaInicio,ed.horaFin,cd.nombre as Complejo ,cd.calle,cd.nroCalle,
                                ed.tipoEncuentro, ed.accesibilidad, ed.clave,d.avatar as avatar
                                FROM EncuentroDeportivo ed, Usuario u, Deporte d, ComplejoDeportivo cd,Estado e, Barrio b
                                WHERE ed.idUsuario = u.id AND ed.idDeporte = d.id AND ed.idEstado = e.id AND cd.idBarrio = b.id
                                AND ed.tipoEncuentro = 'Privado' AND ed.idComplejo = cd.id";

            if (idZona != 0)
            {
                cmd.CommandText += " AND b.idZona=@idZona";
            }

            dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                edq = new EncuentroDeportivoQueryEntidad();

                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                edq.nombreUsuario = dr["Usuario"].ToString();
                edq.nombreDeporte = dr["Deporte"].ToString();
                edq.nombreEstado = dr["Estado"].ToString();
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { edq.fechaInicioEncuentro = fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { edq.horaInicio = hi; } // ok
                DateTime hf; if (DateTime.TryParse(dr["horaFin"].ToString(), out hf)) { edq.horaFin = hf; } // ok
                edq.nombreComplejo = dr["Complejo"].ToString();
                edq.calleComplejo = dr["calle"].ToString();
                edq.numeroCalleComplejo = int.Parse(dr["nroCalle"].ToString());
                edq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                edq.accesibilidad = dr["accesibilidad"].ToString();
                edq.clave = dr["clave"].ToString();
                edq.avatar = (byte[])dr["avatar"];

                ListaEDQ.Add(edq);


            }
            dr.Close();
            cn.Close();

            return ListaEDQ;
        }


        public static List<EncuentroDeportivoQueryEntidad> obtenerTodosEncuentrosDeportivos()
        {
            List<EncuentroDeportivoQueryEntidad> ListaEDQ = new List<EncuentroDeportivoQueryEntidad>();

            EncuentroDeportivoQueryEntidad edq = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT DISTINCT ed.id , u.nombre as Usuario, ed.fechaInicioEncuentro,d.nombre as Deporte,
                                e.nombre as Estado,ed.horaInicio,ed.nombreLP as Lugar,cd.nombre as Complejo,
                                ed.tipoEncuentro, ed.accesibilidad, ed.clave
                                FROM EncuentroDeportivo ed, Usuario u, Deporte d, ComplejoDeportivo cd,Estado e
                                WHERE ed.idUsuario = u.id AND ed.idDeporte = d.id AND ed.idEstado = e.id and
		                      	cd.id=ed.idComplejo	and (ed.idEstado = 7 or ed.idEstado = 8 or ed.idEstado = 6)
		                       	order by ed.id desc";

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                edq = new EncuentroDeportivoQueryEntidad();

                edq.idEncuentroDeportivo = int.Parse(dr["id"].ToString());
                edq.nombreUsuario = dr["Usuario"].ToString();
                edq.nombreDeporte = dr["Deporte"].ToString();
                edq.nombreEstado = dr["Estado"].ToString();
                DateTime fi; if (DateTime.TryParse(dr["fechaInicioEncuentro"].ToString(), out fi)) { edq.fechaInicioEncuentro = fi; }
                DateTime hi; if (DateTime.TryParse(dr["horaInicio"].ToString(), out hi)) { edq.horaInicio = hi; } // ok
                edq.nombreLP = dr["Lugar"].ToString();
                edq.nombreComplejo = dr["Complejo"].ToString();      
                edq.tipoEncuentro = dr["tipoEncuentro"].ToString();
                edq.accesibilidad = dr["accesibilidad"].ToString();
                edq.clave = dr["clave"].ToString();

                ListaEDQ.Add(edq);




            }
            dr.Close();
            cn.Close();
            return ListaEDQ;
        }
    }
}
