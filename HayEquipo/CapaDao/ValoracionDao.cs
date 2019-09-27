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

    }
}
