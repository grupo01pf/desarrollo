using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using System.Data.SqlClient;
using System.Configuration;

namespace CapaDao
{
    public class TipoComplejoDao
    {
        public static string stringConexion()
        {
            return ConfigurationManager.ConnectionStrings["cadenaHayEquipo"].ConnectionString;
        }

        public static List<TipoComplejoEntidad> ObtenerTodosTiposComplejo()
        {
            List<TipoComplejoEntidad> tiposComplejo = new List<TipoComplejoEntidad>();

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = stringConexion();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT * FROM TipoComplejo";
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                TipoComplejoEntidad t = new TipoComplejoEntidad();

                t.idTipoComplejo = int.Parse(dr["id"].ToString());
                t.nombre = dr["nombre"].ToString();
                t.descripcion = dr["descripcion"].ToString();

                tiposComplejo.Add(t);
            }
            dr.Close();
            cn.Close();
            return tiposComplejo;
        }
    }
}
