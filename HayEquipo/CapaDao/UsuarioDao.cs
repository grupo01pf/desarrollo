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




        public static List<Usuario> obtenerUsuarios(int idUsuario) {
            List<Usuario> listaUsuarios = new List<Usuario>();
            Usuario u = null;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_UsuarioDao_ObtenerUsuarios", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                u = new Usuario();
                u.id = int.Parse(dr["id"].ToString());
                u.nombre = dr["nombre"].ToString();
                listaUsuarios.Add(u);
            }
            dr.Close();
            cn.Close();
            return listaUsuarios;
            //using (HayEquipoEntities db = new HayEquipoEntities()) {

            //    return db.Usuario.ToList();
            //}
        }

        public static List<UsuarioEntidad> obtenerTodosUsuarios()
        {
            List<UsuarioEntidad> listaUsuarios = new List<UsuarioEntidad>();
            UsuarioEntidad u = null;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT u.id,u.nombre,u.fechaAlta,r.nombre as Rol,u.bloqueadoAdmin
                                FROM Usuario u, RolesPorUsuarios ru, Rol r
		                        WHERE ru.idUsuario=u.id and r.id=ru.idRol and ru.idRol IN (2,3)
                                ORDER BY id desc";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                u = new UsuarioEntidad();
                u.idUsuario = int.Parse(dr["id"].ToString());
                u.nombreUsuario = dr["nombre"].ToString();
                DateTime fi; if (DateTime.TryParse(dr["fechaAlta"].ToString(), out fi)) { u.fechaAlta = fi; }
                u.rol= dr["Rol"].ToString();
                u.bloqueado =bool.Parse(dr["bloqueadoAdmin"].ToString());
                listaUsuarios.Add(u);
            }
            dr.Close();
            cn.Close();
            return listaUsuarios;
            
        }

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
            cmd.Parameters.AddWithValue("@clave", clave);
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
            cmd.Parameters.AddWithValue("@usuario", usuario);
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



        public static List<Usuario> UsuariosUnidosEncuentroEquipoA(int idEncuentro)
        {
            Usuario usuario = null;
            List<Usuario> listaUsuaurios = new List<Usuario>();

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_UsuarioDao_UsuariosUnidosEncuentroEquipoA", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idEncuentro", idEncuentro);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                usuario = new Usuario();
                usuario.nombre = dr["nombreUsuario"].ToString();
                usuario.id = int.Parse(dr["idUsuario"].ToString());
                listaUsuaurios.Add(usuario);
               
            }
            dr.Close();
            cn.Close();

            return listaUsuaurios;

        }
        public static List<Usuario> UsuariosUnidosEncuentroEquipoB(int idEncuentro)
        {
            Usuario usuario = null;
            List<Usuario> listaUsuaurios = new List<Usuario>();

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_UsuarioDao_UsuariosUnidosEncuentroEquipoB", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idEncuentro", idEncuentro);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                usuario = new Usuario();
                usuario.nombre = dr["nombreUsuario"].ToString();
                usuario.id = int.Parse(dr["idUsuario"].ToString());
                listaUsuaurios.Add(usuario);
              
            }
            dr.Close();
            cn.Close();

            return listaUsuaurios;

        }

        public static List<Usuario> UsuariosUnidosEncuentroPublico(int idEncuentro)
        {
            Usuario usuario = null;
            List<Usuario> listaUsuaurios = new List<Usuario>();

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_UsuarioDao_UsuariosUnidosEncuentroEquipoA", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idEncuentro", idEncuentro);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                usuario = new Usuario();
                usuario.nombre = dr["nombreUsuario"].ToString();
                usuario.id = int.Parse(dr["idUsuario"].ToString());

                listaUsuaurios.Add(usuario);
            }
            dr.Close();
            cn.Close();

            return listaUsuaurios;

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
        public static bool cambiarContraseña(string nombre, string nuevapass)
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

        public static bool AgregarImagen(string id, Byte[] imagen)
        {

            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE Usuario SET avatar= @imagen WHERE id = @id";
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@imagen", imagen);
            cmd.ExecuteNonQuery();
            cn.Close();
            return flag;

        }

        public static byte[] ObtenerImagen(string id)
        {

            byte[] imagen = null;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT u.avatar as avatar FROM Usuario u WHERE id = @id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                imagen = (byte[])dr["avatar"];
            }
            dr.Close();
            cn.Close();
            return imagen;

        }

        public static bool existeImagen(string id)
        {

            bool imagen = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT * FROM Usuario u WHERE avatar IS NOT NULL and @id=id";      
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                imagen = true;
            }
            dr.Close();
            cn.Close();
            return imagen;

        }


        public static List<Usuario> getAmigos(int idUsuario)
        {
            List<Usuario> listaAmigos = new List<Usuario>();
            Usuario u = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @" SELECT  u.id, u.nombre
                                 FROM Usuario u, AmigosPorDeportista apd
                                 WHERE apd.idAmigo = u.id ";
            
            if (idUsuario != 0)
            {
                cmd.CommandText += @" AND apd.idUsuario = @id";
                cmd.Parameters.AddWithValue("@id", idUsuario);
            }

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                u = new Usuario();

                u.id = int.Parse(dr["ID"].ToString());
                u.nombre = dr["Nombre"].ToString();

                listaAmigos.Add(u);
            }

            dr.Close();
            cn.Close();

            return listaAmigos;
        }


        //public static List<Usuario> getUsuariosPorFiltro(int zona, int barrio)
        
        //{
        //    List<Usuario> listaAmigos = new List<Usuario>();
        //    Usuario u = null;

        //    SqlConnection cn = new SqlConnection();
        //    cn.ConnectionString = ConnectionString.Cadena();
        //    cn.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = cn;
        //    cmd.CommandText = @" 
        //                        SELECT DISTINCT u.id, u.nombre
        //                        FROM Usuario u, Deportista d, Barrio b, Zona z
        //                        WHERE d.id = u.id AND b.id = d.idBarrio  ";

        //    if (zona != 0)
        //    {
        //        cmd.CommandText += @" AND z.id = b.idZona AND d.idBarrio = b.id AND z.id = @z";
        //        cmd.Parameters.AddWithValue("@z", zona);
        //    }
        //    if (barrio != 0)
        //    {
        //        cmd.CommandText += @" AND b.id = @barrio";
        //        cmd.Parameters.AddWithValue("@barrio", barrio);
        //    }

        //    SqlDataReader dr = cmd.ExecuteReader();

        //    while (dr.Read())
        //    {
        //        u = new Usuario();

        //        u.id = int.Parse(dr["ID"].ToString());
        //        u.nombre = dr["Nombre"].ToString();

        //        listaAmigos.Add(u);
        //    }

        //    dr.Close();
        //    cn.Close();

        //    return listaAmigos;
        //}

        // sobrecarga del metodo
        public static List<Usuario> getUsuariosPorFiltro(int sport, int zona, int barrio)
        {
            List<Usuario> listaAmigos = new List<Usuario>();
            Usuario u = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @" 
                                SELECT DISTINCT u.id, u.nombre
                                FROM Usuario u, Deportista d, Barrio b, Zona z, Deporte s
                                WHERE d.idUsuario = u.id AND b.id = d.idBarrio  ";

            if (sport != 0)
            {
                cmd.CommandText += @" AND s.id = d.idDeportePreferido AND s.id = @s";
                cmd.Parameters.AddWithValue("@s", sport);
            }
            if (zona != 0)
            {
                cmd.CommandText += @" AND z.id = b.idZona AND d.idBarrio = b.id AND z.id = @z";
                cmd.Parameters.AddWithValue("@z", zona);
            }
            if (barrio != 0)
            {
                cmd.CommandText += @" AND b.id = @barrio";
                cmd.Parameters.AddWithValue("@barrio", barrio);
            }

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                u = new Usuario();

                u.id = int.Parse(dr["ID"].ToString());
                u.nombre = dr["Nombre"].ToString();

                listaAmigos.Add(u);
            }

            dr.Close();
            cn.Close();

            return listaAmigos;
        }
        public static void aceptarSolicitud(int idUsuario, int idAmigo)
        {
            List<Usuario> listaAmigos = new List<Usuario>();
            Usuario u = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @" INSERT INTO  AmigosPorDeportista (idUsuario, idAmigo)
                                 VALUES (@idUsuario, @idAmigo) ";

            cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
            cmd.Parameters.AddWithValue("@idAmigo", idAmigo);

            cmd.ExecuteNonQuery();
            cn.Close();
        }

        public static void eliminarContacto(int idUsuario, int idAmigo)
        {
            List<Usuario> listaAmigos = new List<Usuario>();
            Usuario u = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @" DELETE FROM AmigosPorDeportista
                                 WHERE  idUsuario = @idUsuario AND idAmigo = @idAmigo ";

            cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
            cmd.Parameters.AddWithValue("@idAmigo", idAmigo);

            cmd.ExecuteNonQuery();
            cn.Close();
        }

        public static bool bloqueadoAdmin(string id)
        {

            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE Usuario SET bloqueadoAdmin = 1 WHERE id = @id";
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

        public static bool desbloqueadoAdmin(string id)
        {

            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE Usuario SET bloqueadoAdmin = 0 WHERE id = @id";
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

        public static bool obtenerbloqueadoAdmin(string usuario)
        {
            bool bloqueado = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT u.bloqueadoAdmin as bloqueadoAdmin
                                FROM Usuario u
                                WHERE  u.nombre = @usuario";
            cmd.Parameters.AddWithValue("@usuario", usuario);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                bloqueado = bool.Parse(dr["bloqueadoAdmin"].ToString());
            }
            dr.Close();
            cn.Close();

            return bloqueado;
        }

    }

    

}

