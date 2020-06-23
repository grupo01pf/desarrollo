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
    public class CriptografiaDao
    {

        public static int encriptar(string pass) {

            int id = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_CriptografiaDao_Encriptar", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@pwd", pass);           

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                id = int.Parse(dr["id"].ToString());
            }
            dr.Close();
            cn.Close();

            return id;
        }

        public static string desencriptar(int id) {
            string pass = string.Empty;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_CriptografiaDao_Desencriptar", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idPass", id);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string clave = dr["pwdEncuentro"].ToString();
                pass = clave;
            }
            dr.Close();
            cn.Close();

            return pass;
        }
    }
}
