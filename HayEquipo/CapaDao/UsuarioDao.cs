using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;
using System.Data;
using System.Configuration;

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


        public static int ID(string usuario)
        {
            int id = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT u.id as id
                                FROM Usuario u
                                WHERE  u.nombre = @usuario";
            cmd.Parameters.AddWithValue("@usuario", usuario);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                id = int.Parse(dr["id"].ToString());
            }
            dr.Close();
            cn.Close();

            return id;
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

        public bool RegistrarUsuarioEstablecimiento(UsuarioEntidad objUsuario)
        {
            SqlConnection con = null;
            SqlCommand cmd = null;
            bool response = false;
            try
            {
                con = ConnectionString.getInstance().ConexionDB();
                cmd = new SqlCommand("spRegistrarUsuarioEstablecimiento", con);
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


        public static bool Existe(string nombre)
        {

            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT * FROM Usuario WHERE nombre=@nombre";
            cmd.Parameters.AddWithValue("@nombre", nombre);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                flag = true;
            }
            dr.Close();
            cn.Close();
            return flag;

        }

        public static bool ExisteEmail(string Email)
        {

            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT * FROM Usuario WHERE email=@email";
            cmd.Parameters.AddWithValue("@email", Email);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                flag = true;
            }
            dr.Close();
            cn.Close();
            return flag;

        }

        public static bool intentos(string id)
        {

            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE Usuario SET intentos=intentos-1 WHERE id = @id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                flag = true;
            }
            dr.Close();
            cn.Close();
            return flag;

        }
        public static int obtenerintentos(string usuario)
        {
            int intentos = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT u.intentos as intentos
                                FROM Usuario u
                                WHERE  u.nombre = @usuario";
            cmd.Parameters.AddWithValue("@usuario", usuario);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                intentos = int.Parse(dr["intentos"].ToString());
            }
            dr.Close();
            cn.Close();

            return intentos;
        }
        public static bool bloqueado(string id)
        {

            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE Usuario SET bloqueado = 1 WHERE id = @id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                flag = true;
            }
            dr.Close();
            cn.Close();
            return flag;

        }

        public static bool obtenerbloqueado(string usuario)
        {
            bool bloqueado = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT u.bloqueado as bloqueado
                                FROM Usuario u
                                WHERE  u.nombre = @usuario";
            cmd.Parameters.AddWithValue("@usuario", usuario);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                bloqueado = bool.Parse(dr["bloqueado"].ToString());
            }
            dr.Close();
            cn.Close();

            return bloqueado;
        }


        public static bool restaurarintentos(string id)
        {

            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE Usuario SET intentos=3 WHERE id = @id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                flag = true;
            }
            dr.Close();
            cn.Close();
            return flag;

        }

        public static string obtenerEmail(string usuario)
        {
            string email = "";
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT u.email as email
                                FROM Usuario u
                                WHERE  u.nombre = @usuario";
            cmd.Parameters.AddWithValue("@usuario", usuario);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                email = dr["email"].ToString();
            }
            dr.Close();
            cn.Close();

            return email;
        }

        public static string obtenerNombrebloqueado(string email)
        {
            string nombre = "";
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT u.nombre as nombre
                                FROM Usuario u
                                WHERE  u.bloqueado = 1 and u.email=@email";
            cmd.Parameters.AddWithValue("@email", email);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                nombre = dr["nombre"].ToString();
            }
            dr.Close();
            cn.Close();

            return nombre;
        }

        public static bool restaurarIntentosyDesbloquearXNombre(string nombre)
        {

            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE Usuario SET intentos=3,bloqueado=0 WHERE nombre = @nombre";
            cmd.Parameters.AddWithValue("@nombre", nombre);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                flag = true;
            }
            dr.Close();
            cn.Close();
            return flag;

        }
        public static bool cambiarContraseña(string nombre,string nuevapass)
        {

            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE Usuario SET contraseña= @nuevapass WHERE nombre = @nombre";
            cmd.Parameters.AddWithValue("@nombre", nombre);
            cmd.Parameters.AddWithValue("@nuevapass", nuevapass);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                flag = true;
            }
            dr.Close();
            cn.Close();
            return flag;

        }

      

        public static string CoincideEmail()
        {
            string email = "";
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT u.email as email FROM Usuario u WHERE bloqueado=1";


            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                email = dr["email"].ToString();
            }
            dr.Close();
            cn.Close();

            return email;
        }
    }
}
