using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace CapaDao
{
   public class UsuarioDao
    {

        public static bool Usuario(string usuario, string clave) {

            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT * FROM Usuario
                                WHERE nombre = @usuario ADN contraseña = @clave";
            cmd.Parameters.AddWithValue("@usuario", usuario);
            cmd.Parameters.AddWithValue("@clave",clave);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                flag = true;
            }
            dr.Close();
            cn.Close();
            return flag;
            
        }

        public static string Permiso(string usuario)
        {
            string permiso = string.Empty;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT r.nombre as nombrePermiso
                                FROM Usuario u, Rol r
                                WHERE u.id";


            return permiso;
        }


    }
}
