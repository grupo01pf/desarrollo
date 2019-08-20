using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;

namespace CapaDao
{
    public class EncuentroDeportivoDao
    {
        public static List<EncuentroDeportivoEntidad> obtenerEncuentrosDeportivos() {

            EncuentroDeportivoEntidad encuentro = null;
            List<EncuentroDeportivoEntidad> ListaDeportes = new List<EncuentroDeportivoEntidad>();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                encuentro = new EncuentroDeportivoEntidad();
                encuentro.idDeporte = int.Parse(dr["id"].ToString());
               // encuentro. = dr["nombre"].ToString();
                ListaDeportes.Add(encuentro);
            }
            dr.Close();
            cn.Close();
            return ListaDeportes;
        }



        public static int InsertarEncuentroPublico(EncuentroDeportivoEntidad ed)
        {
            int nroID = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            // SqlTransaction tr = cn.BeginTransaction();
            // try {

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            /*  cmd.CommandText = @"INSERT INTO EncuentroDeportivo (idUsuario,fechaCreacionEncuentro,
                                   fechaDestruccionEncuentro,idDeporte,idComplejo,calle,nroCalle,idEquipo,
                                   fechaInicioEncuentro,FechaFinEncuentro,idEstado,tipoEncuentro,accesibilidad,
                                   clave,horaInicio,horaFin) 
                                   VALUES (@idUsuario,@fechaCreacionEncuentrol,@fechaDestruccionEncuentro,@idDeporte,
                                   @idComplejo,@calle,@nroCalle,@idEquipo,@fechaInicioEncuentro,@FechaFinEncuentro,
                                   @idEstado,@tipoEncuentro,@accesibilidad,@clave,@horaInicio,@horaFin);
                                   select Scope_Identity() as ID";*/
            /* cmd.CommandText = @"INSERT INTO EncuentroDeportivo (idUsuario,fechaCreacionEncuentro,
                                   idDeporte,calle,fechaInicioEncuentro,idEstado,tipoEncuentro,accesibilidad,
                                   clave,horaInicio,horaFin) 
                                   VALUES (@idUsuario,@fechaCreacionEncuentro,@idDeporte,@calle,@fechaInicioEncuentro,
                                   @idEstado,@tipoEncuentro,@accesibilidad,@clave,@horaInicio,@horaFin)";*/

            /*  cmd.CommandText = @"INSERT INTO EncuentroDeportivo (idUsuario,fechaCreacionEncuentro,
                                idDeporte,fechaInicioEncuentro,idEstado,idTipoEncuentro,idAccesibilidad,
                                horaInicio,horaFin,idLugarPublico)
                                VALUES (@idUsuario,@fechaCreacionEncuentro,@idDeporte,@fechaInicioEncuentro,
                                @idEstado,@idTipoEncuentro,@idAccesibilidad,@horaInicio,@horaFin,@idLugarPublico)";*/
            cmd.CommandText = @"INSERT INTO EncuentroDeportivo (idUsuario,fechaCreacionEncuentro,
                                idDeporte,fechaInicioEncuentro,idEstado,idTipoEncuentro,idAccesibilidad,
                                horaInicio,horaFin)
                                VALUES (@idUsuario,@fechaCreacionEncuentro,@idDeporte,@fechaInicioEncuentro,
                                @idEstado,@idTipoEncuentro,@idAccesibilidad,@horaInicio,@horaFin); select Scope_Identity() as ID";

            cmd.Parameters.AddWithValue("@idUsuario", ed.idAUsuario);
            cmd.Parameters.AddWithValue("@fechaCreacionEncuentro", ed.fechaCreacionEncuentro);
            // cmd.Parameters.AddWithValue("@fechaDestruccionEncuentro",ed.fechaDestruccionEncuentro);
            cmd.Parameters.AddWithValue("@idDeporte", ed.idDeporte);
           // cmd.Parameters.AddWithValue("@idComplejo",ed.idComplejo);
            // cmd.Parameters.AddWithValue("@calle",ed.calle);
            // cmd.Parameters.AddWithValue("@nroCalle",ed.numeroCalle);
            // cmd.Parameters.AddWithValue("@idEquipo",ed.idEquipo);
            cmd.Parameters.AddWithValue("@fechaInicioEncuentro", ed.fechaInicioEncuentro);
            //  cmd.Parameters.AddWithValue("@FechaFinEncuentro",ed.fechaFinEncuentro);
            cmd.Parameters.AddWithValue("@idEstado", ed.idEstado);
            cmd.Parameters.AddWithValue("@idTipoEncuentro",ed.idTipoEncuentro);
            cmd.Parameters.AddWithValue("@idAccesibilidad",ed.idAccesibilidad);
            //  cmd.Parameters.AddWithValue("@clave",ed.clave);
            cmd.Parameters.AddWithValue("@horaInicio", ed.horaInicio);
            cmd.Parameters.AddWithValue("@horaFin", ed.horaFIn);
            // cmd.Parameters.AddWithValue("@idLugarPublico", ed.idLugarPublico);

            // cmd.Parameters.AddWithValue("@ ",);
            //  cmd.Transaction = tr;
            // ed.idEncuentroDeportivo = Convert.ToInt32(cmd.ExecuteScalar());
            //    tr.Commit();
            // }
            //  catch (SqlException) { tr.Rollback(); }
            //  finally { cn.Close(); }
            nroID = (int)Convert.ToInt32(cmd.ExecuteScalar());
            cmd.ExecuteNonQuery();
            cn.Close();
            
            actualizarLugarPublico(ed.idLugarPublico,nroID);
            return nroID;
        }

        private static void actualizarLugarPublico(int idLP, int idED)
        {
            
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            // SqlTransaction tr = cn.BeginTransaction();
            // try {

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE EncuentroDeportivo SET idLugarPublico = @idLP WHERE id = @idED";
            cmd.Parameters.AddWithValue("@idLP", idLP);
            cmd.Parameters.AddWithValue("@idED", idED);

            cmd.ExecuteNonQuery();


            cn.Close();
        }



        public static int InsertarEncuentroPrivado(EncuentroDeportivoEntidad ed)
        {
            int nroID = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            // SqlTransaction tr = cn.BeginTransaction();
            // try {

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"INSERT INTO EncuentroDeportivo (idUsuario,fechaCreacionEncuentro,
                                idDeporte,idComplejo,fechaInicioEncuentro,idEstado,idTipoEncuentro,idAccesibilidad)
                                VALUES (@idUsuario,@fechaCreacionEncuentro,@idDeporte,@idComplejo,@fechaInicioEncuentro,
                                @idEstado,@idTipoEncuentro,@idAccesibilidad)";

            cmd.Parameters.AddWithValue("@idUsuario", ed.idAUsuario);
            cmd.Parameters.AddWithValue("@fechaCreacionEncuentro", ed.fechaCreacionEncuentro);
            // cmd.Parameters.AddWithValue("@fechaDestruccionEncuentro",ed.fechaDestruccionEncuentro);
            cmd.Parameters.AddWithValue("@idDeporte", ed.idDeporte);
            cmd.Parameters.AddWithValue("@idComplejo",ed.idComplejo);
            // cmd.Parameters.AddWithValue("@calle",ed.calle);
            // cmd.Parameters.AddWithValue("@nroCalle",ed.numeroCalle);
            // cmd.Parameters.AddWithValue("@idEquipo",ed.idEquipo);
            cmd.Parameters.AddWithValue("@fechaInicioEncuentro", ed.fechaInicioEncuentro);
            //  cmd.Parameters.AddWithValue("@FechaFinEncuentro",ed.fechaFinEncuentro);
            cmd.Parameters.AddWithValue("@idEstado", ed.idEstado);
            cmd.Parameters.AddWithValue("@idTipoEncuentro", ed.idTipoEncuentro);
            cmd.Parameters.AddWithValue("@idAccesibilidad", ed.idAccesibilidad);
            //  cmd.Parameters.AddWithValue("@clave",ed.clave);
            //  cmd.Parameters.AddWithValue("@horaInicio", ed.horaInicio); //( uSAR DESPUES )
            //  cmd.Parameters.AddWithValue("@horaFin", ed.horaFIn); //( uSAR DESPUES )
            // cmd.Parameters.AddWithValue("@idLugarPublico", ed.idLugarPublico);
            // nroID = (int)Convert.ToInt32(cmd.ExecuteScalar());
            cmd.ExecuteNonQuery();
            cn.Close();

           // actualizarLugarPublico(ed.idLugarPublico, nroID);
            return nroID;
        }
    

    }
}
