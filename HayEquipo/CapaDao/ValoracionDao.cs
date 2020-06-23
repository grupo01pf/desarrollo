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
    public class ValoracionDao
    {

        public static bool RegistrarValoracionComplejo(int idComplejo,int idUsuarioValorador,
            int valoracion,int tipo)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = ConnectionString.getInstance().ConexionDB();
                cmd = new SqlCommand("spRegistrarValoracionComplejo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmidComplejo", idComplejo);
                cmd.Parameters.AddWithValue("@prmidUsuarioValorador", idUsuarioValorador);
                cmd.Parameters.AddWithValue("@prmValoracion", valoracion);
                cmd.Parameters.AddWithValue("@prmTipo", tipo);
                con.Open();
                int filas = cmd.ExecuteNonQuery();
                if (filas > 0) response = true;

            }
            catch (Exception e)
            {
                response = false;
                throw e;
            }
            finally
            {
                con.Close();

            }
            return response;

        }

        public bool RegistrarValoracionDeportista(int idDeportista, int idUsuarioValorador,
            int valoracion, int tipo)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = ConnectionString.getInstance().ConexionDB();
                cmd = new SqlCommand("spRegistrarValoracionDeportista", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmidDeportista", idDeportista);
                cmd.Parameters.AddWithValue("@prmidUsuarioValorador", idUsuarioValorador);
                cmd.Parameters.AddWithValue("@prmValoracion", valoracion);
                cmd.Parameters.AddWithValue("@prmTipo", tipo);
                con.Open();
                int filas = cmd.ExecuteNonQuery();
                if (filas > 0) response = true;

            }
            catch (Exception e)
            {
                response = false;
                throw e;
            }
            finally
            {
                con.Close();

            }
            return response;

        }

        public static int obtenerPromedioxid(string idDeportista,string tipo)
        {
            int promedio = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd = new SqlCommand("spValorarDeportistaxTipo", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@prmTipo", tipo);
            cmd.Parameters.AddWithValue("@prmidDeportista", idDeportista);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                promedio = int.Parse(dr["Promedio"].ToString());
            }
            dr.Close();
            cn.Close();

            return promedio;
        }

        public static bool existePromedioxid(string idDeportista, string tipo)
        {
            bool promedio = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @" SELECT * from Valoracion v join TipoValoracion tv 
	on (tv.id = v.idTipoValoracion) where v.idTipoValoracion = @prmTipo and v.idDeportistaValorado = @prmidDeportista;";
            cmd.Parameters.AddWithValue("@prmTipo", tipo);
            cmd.Parameters.AddWithValue("@prmidDeportista", idDeportista);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                promedio = true;
            }
            dr.Close();
            cn.Close();

            return promedio;
        }

        public static bool existePromedioGeneral(string idDeportista)
        {
            bool promedio = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @" SELECT * from Valoracion v join TipoValoracion tv 
	on (tv.id = v.idTipoValoracion) where v.idDeportistaValorado = @prmidDeportista;";
            cmd.Parameters.AddWithValue("@prmidDeportista", idDeportista);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                promedio = true;
            }
            dr.Close();
            cn.Close();

            return promedio;
        }

        public static int obtenerPromediogeneral(string idDeportista)
        {
            int promedio = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd = new SqlCommand("spValoracionGeneralDeportista", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@prmidDeportista", idDeportista);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                promedio = int.Parse(dr["PromedioGeneralDeportista"].ToString());
            }
            dr.Close();
            cn.Close();

            return promedio;
        }

        public static int obtenerPromedioComplejoxid(string idComplejo, string tipo)
        {
            int promedio = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd = new SqlCommand("spValorarComplejoxTipo", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@prmTipo", tipo);
            cmd.Parameters.AddWithValue("@prmidComplejo", idComplejo);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                promedio = int.Parse(dr["Promedio"].ToString());
            }
            dr.Close();
            cn.Close();

            return promedio;
        }

        public static bool existePromedioComplejoxid(string idComplejo, string tipo)
        {
            bool promedio = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @" SELECT * from Valoracion v join TipoValoracion tv 
	on (tv.id = v.idTipoValoracion) where v.idTipoValoracion = @prmTipo and v.idComplejoValorado = @prmidComplejo;";
            cmd.Parameters.AddWithValue("@prmTipo", tipo);
            cmd.Parameters.AddWithValue("@prmidComplejo", idComplejo);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                promedio = true;
            }
            dr.Close();
            cn.Close();

            return promedio;
        }

        public static bool existePromedioGeneralComplejo(string idComplejo)
        {
            bool promedio = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @" SELECT * from Valoracion v join TipoValoracion tv 
	on (tv.id = v.idTipoValoracion) where v.idComplejoValorado = @prmidComplejo;";
            cmd.Parameters.AddWithValue("@prmidComplejo", idComplejo);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                promedio = true;
            }
            dr.Close();
            cn.Close();

            return promedio;
        }

        public static int obtenerPromediogeneralComplejo(string idComplejo)
        {
            int promedio = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd = new SqlCommand("spValoracionGeneralComplejo", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@prmidComplejo", idComplejo);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                promedio = int.Parse(dr["PromedioGeneralComplejo"].ToString());
            }
            dr.Close();
            cn.Close();

            return promedio;
        }

        public static int obtenerValorParticularComplejoxid(string idComplejo, string tipo,string idUsuarioValorador)
        {
            int valoracion = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd = new SqlCommand("obtenerValoracionParticularComplejoxTipo", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@prmTipo", tipo);
            cmd.Parameters.AddWithValue("@prmidComplejo", idComplejo);
            cmd.Parameters.AddWithValue("@prmUsuarioValorador", idUsuarioValorador);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                valoracion = int.Parse(dr["valoracion"].ToString());
            }
            dr.Close();
            cn.Close();

            return valoracion;
        }
        public static bool existeValorParticularComplejoxid(string idComplejo, string tipo, string idUsuarioValorador)
        {
            bool valoracion = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd = new SqlCommand("obtenerValoracionParticularComplejoxTipo", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@prmTipo", tipo);
            cmd.Parameters.AddWithValue("@prmidComplejo", idComplejo);
            cmd.Parameters.AddWithValue("@prmUsuarioValorador", idUsuarioValorador);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                valoracion = true;
            }
            dr.Close();
            cn.Close();

            return valoracion;
        }

    }
}
