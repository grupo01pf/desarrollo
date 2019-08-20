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
   public class UsuarioDao
    {

        #region "Patron Singleton"
        private static UsuarioDao objUsuario = null;
        private UsuarioDao() { }
        public static UsuarioDao getInstance()
        {
            if (objUsuario == null)
            {
                objUsuario = new UsuarioDao();
            }
            return objUsuario;
        }
        #endregion


        public static bool Usuario(string usuario, string clave) {

            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT * 
                                FROM Usuario u
                                WHERE u.nombre = @usuario AND u.contraseña = @clave";
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
                                FROM Usuario u, Rol r, RolesPorUsuarios rpu
                                WHERE u.id = rpu.idUsuario AND r.id = rpu.idRol
                                        AND u.nombre = @usuario";
            cmd.Parameters.AddWithValue("@usuario",usuario);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                permiso = dr["nombrePermiso"].ToString();
            }
            dr.Close();
            cn.Close();

            return permiso;
        }

        public bool RegistrarUsuario(UsuarioEntidad objUsuario)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = ConnectionString.getInstance().ConexionDB();
                cmd = new SqlCommand("spRegistrarUsuario", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@prmNombre", objUsuario.nombreUsuario);
                cmd.Parameters.AddWithValue("@prmEmail", objUsuario.email);
                cmd.Parameters.AddWithValue("@prmContraseña", objUsuario.contraseña);
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


    }
}
