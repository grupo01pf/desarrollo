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
    public class DeportistaDao
    {

        public static void InsertarDeportista(DeportistaEntidad deportista)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"INSERT into Deportista(apellido, nombres, idTipoDoc, nroDoc, sexo, fechaNacimiento,
                                                       nroTelefono, idUsuario, promedioEstrellas, idEstado,idBarrio,idDeportePreferido)
                                values(@ape, @nombres, @idTipoDoc, @nroDoc, @sex,
                                       @fechaNac, @nroTel, @idUs, @promEstr, @idEst,@idBarr,@idDeportePreferido);
                                select Scope_Identity() as ID";

            cmd.Parameters.AddWithValue("@ape", deportista.apellido);
            cmd.Parameters.AddWithValue("@nombres", deportista.nombres);
            cmd.Parameters.AddWithValue("@idTipoDoc", deportista.idTipoDocumento);
            cmd.Parameters.AddWithValue("@nroDoc", deportista.numeroDocumento);
            cmd.Parameters.AddWithValue("@sex", deportista.sexo);
            cmd.Parameters.AddWithValue("@fechaNac", deportista.fechaNacimiento);
            cmd.Parameters.AddWithValue("@nroTel", deportista.numeroTelefono);
            cmd.Parameters.AddWithValue("@idUs", deportista.idUsuario);
            cmd.Parameters.AddWithValue("@promEstr", deportista.promedioEstrellas);
            cmd.Parameters.AddWithValue("@idEst", deportista.idEstado);
            cmd.Parameters.AddWithValue("@idBarr", deportista.idBarrio);
            cmd.Parameters.AddWithValue("@idDeportePreferido", deportista.idDeportePreferido);

            deportista.idDeportista = Convert.ToInt32(cmd.ExecuteScalar());

            cn.Close();
        }

        public static bool ActualizarDeportista(string id,string ape,string nom,string tdoc,string doc,int sexo,string fc,string tel,int barrio,int idDeportePreferido)
        {
            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE Deportista SET apellido=@ape, nombres=@nombres, idTipoDoc=@idTipoDoc,
                                                      nroDoc=@nroDoc, sexo=@sex, fechaNacimiento=@fechaNac,
                                                      nroTelefono=@nroTel, idBarrio=@barrio, idDeportePreferido=@idDeportePreferido
                                                WHERE idUsuario=@idUs;";
            cmd.Parameters.AddWithValue("@idUs",id);
            cmd.Parameters.AddWithValue("@ape",ape);
            cmd.Parameters.AddWithValue("@nombres",nom);
            cmd.Parameters.AddWithValue("@idTipoDoc",tdoc);
            cmd.Parameters.AddWithValue("@nroDoc",doc);
            cmd.Parameters.AddWithValue("@sex",sexo);
            cmd.Parameters.AddWithValue("@fechaNac",Convert.ToDateTime(fc));
            cmd.Parameters.AddWithValue("@nroTel",tel);
            cmd.Parameters.AddWithValue("@barrio", barrio);
            cmd.Parameters.AddWithValue("@idDeportePreferido", idDeportePreferido);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                flag = true;
            }
            dr.Close();
            cn.Close();
            return flag;
        }

        public static void EliminarDeportista(int id)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"DELETE from Deportista WHERE id=@idDeportista";

            cmd.Parameters.AddWithValue("@idDeportista", id);

            cmd.ExecuteNonQuery();

            cn.Close();
        }

        public static List<DeportistaEntidad> ObtenerTodosDeportistas()
        {
            List<DeportistaEntidad> deportistas = new List<DeportistaEntidad>();

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT * FROM Deportista";
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                DeportistaEntidad d = new DeportistaEntidad();

                d.idDeportista = int.Parse(dr["id"].ToString());
                d.apellido = dr["apellido"].ToString();
                d.nombres = dr["nombres"].ToString();
                d.idTipoDocumento = int.Parse(dr["idTipoDoc"].ToString());
                d.numeroDocumento = int.Parse(dr["nroDoc"].ToString());
                d.sexo = int.Parse(dr["sexo"].ToString());
                d.fechaNacimiento = DateTime.Parse(dr["fechaNacimiento"].ToString());
                d.numeroTelefono = long.Parse(dr["nroTelefono"].ToString());
                d.idUsuario = int.Parse(dr["idUsuario"].ToString());
                d.promedioEstrellas = float.Parse(dr["promedioEstrellas"].ToString());
                d.idEstado = int.Parse(dr["idEstado"].ToString());

                deportistas.Add(d);
            }
            dr.Close();
            cn.Close();
            return deportistas;
        }

        public static bool ExisteDeportista(string id)
        {

            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT *
                                FROM Deportista where idUsuario=@id";
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
        public static Deportista ObtenerDeportistaPorID(string id)
        {
            Deportista d = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT *
                                FROM Deportista where idUsuario=@id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                d = new Deportista();

                d.id = int.Parse(dr["id"].ToString());
                d.apellido = dr["apellido"].ToString();
                d.nombres = dr["nombres"].ToString();
                d.idTipoDoc = int.Parse(dr["idTipoDoc"].ToString());
                d.nroDoc = int.Parse(dr["nroDoc"].ToString());
                d.sexo = int.Parse(dr["sexo"].ToString());
                d.fechaNacimiento = DateTime.Parse(dr["fechaNacimiento"].ToString());
                d.nroTelefono = long.Parse(dr["nroTelefono"].ToString());
                d.idUsuario = int.Parse(dr["idUsuario"].ToString());
                d.promedioEstrellas = float.Parse(dr["promedioEstrellas"].ToString());
                d.idEstado = int.Parse(dr["idEstado"].ToString());
                d.idBarrio = int.Parse(dr["idBarrio"].ToString());
                d.idDeportePreferido = int.Parse(dr["idDeportePreferido"].ToString());
            }
            dr.Close();
            cn.Close();
            return d;
        }


        public static Deportista ObtenerDeportistaPorID2(string id)
        {
            Deportista d = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT *
                                FROM Deportista where id=@id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                d = new Deportista();

                d.id = int.Parse(dr["id"].ToString());
                d.apellido = dr["apellido"].ToString();
                d.nombres = dr["nombres"].ToString();
                d.idTipoDoc = int.Parse(dr["idTipoDoc"].ToString());
                d.nroDoc = int.Parse(dr["nroDoc"].ToString());
                d.sexo = int.Parse(dr["sexo"].ToString());
                d.fechaNacimiento = DateTime.Parse(dr["fechaNacimiento"].ToString());
                d.nroTelefono = long.Parse(dr["nroTelefono"].ToString());
                d.idUsuario = int.Parse(dr["idUsuario"].ToString());
                d.promedioEstrellas = float.Parse(dr["promedioEstrellas"].ToString());
                d.idEstado = int.Parse(dr["idEstado"].ToString());
                d.idDeportePreferido = int.Parse(dr["idDeportePreferido"].ToString());

            }
            dr.Close();
            cn.Close();
            return d;
        }

        public static DeportistaEntidad ObtenerBarrioDeportistaPorID(string id)
        {
            DeportistaEntidad d = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT b.nombre as NombreBarrio
                FROM Deportista de , Barrio b where b.id=de.idBarrio and de.id=@id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                d = new DeportistaEntidad();

                d.NombreBarrioDeportista = dr["NombreBarrio"].ToString();

            }
            dr.Close();
            cn.Close();
            return d;
        }

        public static string ObtenerIdDeportista(string id)
        {
            string d ="";

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT id
                                FROM Deportista where idUsuario=@id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {


                d= dr["id"].ToString();


            }
            dr.Close();
            cn.Close();
            return d;
        }

        public static string ObtenerIdUsuario(string id)
        {
            string d = "";

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT idUsuario
                                FROM Deportista where id=@id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {


                d = dr["idUsuario"].ToString();


            }
            dr.Close();
            cn.Close();
            return d;
        }

        public static List<Sexo> obtenerSexo()
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.Sexo.ToList();
            }
        }
        public static List<SexoEntidad> obtenerSexo2()
        {
            SexoEntidad Sexo = null;
            List<SexoEntidad> ListaSexo = new List<SexoEntidad>();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "SELECT * FROM Sexo";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                Sexo = new SexoEntidad();
                Sexo.idSexo = int.Parse(dr["id"].ToString());
                Sexo.nombre = dr["nombre"].ToString();
                ListaSexo.Add(Sexo);

            }
            dr.Close();
            cn.Close();
            return ListaSexo;
        }

        public static string ObtenerIdDeportistaXNombre(string nombre)
        {
            string d = "";

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT id FROM usuario WHERE nombre=@id";
            cmd.Parameters.AddWithValue("@id", nombre);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {


                d = dr["id"].ToString();


            }
            dr.Close();
            cn.Close();
            return d;
        }

        public static string ObtenerTelefono(string nombre)
        {
            string d = "";

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT id FROM usuario WHERE nombre=@id";
            cmd.Parameters.AddWithValue("@id", nombre);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {


                d = dr["id"].ToString();


            }
            dr.Close();
            cn.Close();
            return d;
        }
    }
}
