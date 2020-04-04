using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;
using System.Configuration;
using System.Data;

namespace CapaDao
{
    public class ComplejoDeportivoDao
    {

        public static void InsertarComplejo(ComplejoDeportivo complejo)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                db.ComplejoDeportivo.Add(complejo);
                db.SaveChanges();
            }
        }

        public static void ActualizarComplejo(ComplejoDeportivo complejo)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                ComplejoDeportivo comp = db.ComplejoDeportivo.Find(complejo.id);
                comp.id = complejo.id;
                comp.nombre = complejo.nombre;
                comp.descripcion = complejo.descripcion;
                comp.deportes = complejo.deportes;
                comp.calle = complejo.calle;
                comp.nroCalle = complejo.nroCalle;
                comp.idBarrio = complejo.idBarrio;
                comp.nroTelefono = complejo.nroTelefono;
                comp.horaApertura = complejo.horaApertura;
                comp.horaCierre = complejo.horaCierre;
                comp.idResponsable = complejo.idResponsable;
                comp.promedioEstrellas = complejo.promedioEstrellas;
                comp.idEstado = complejo.idEstado;
                comp.avatar = complejo.avatar;

                db.Entry(comp).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        public static void ActualizarDeportesComplejo(ComplejoDeportivo complejo)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                ComplejoDeportivo comp = db.ComplejoDeportivo.Find(complejo.id);

                comp.deportes = complejo.deportes + " " + comp.deportes;

                db.Entry(comp).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        public static void ActualizarMapaComplejo(ComplejoDeportivo complejo)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                ComplejoDeportivo comp = db.ComplejoDeportivo.Find(complejo.id);

                comp.mapa = complejo.mapa;

                db.Entry(comp).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        public static void EliminarComplejo(int id)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                ComplejoDeportivo complejo = db.ComplejoDeportivo.Find(id);
                db.ComplejoDeportivo.Remove(complejo);
                db.SaveChanges();
            }
        }

        public static List<ComplejoDeportivo> ObtenerComplejos()
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.ComplejoDeportivo.ToList();
            }
        }

        public static List<spObtenerComplejosJoin_Result> ObtenerComplejosJoin()
        {
            using (var db = new HayEquipoEntities())
            {
                return db.Database.SqlQuery<spObtenerComplejosJoin_Result>("spObtenerComplejosJoin").ToList();
            }
        }

        //    public static DataTable ObtenerComplejosJoin()
        //    {
        //        SqlConnection cn = new SqlConnection(ConnectionString.Cadena());
        //        SqlCommand cmd = new SqlCommand();

        //        cmd.CommandText = @"SELECT cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion, cd.deportes as Deportes,
        //cd.calle+' '+CONVERT(char, cd.nroCalle) as Direccion, b.nombre as Barrio, z.nombre as Zona, cd.nroTelefono as Telefono, r.apellido+', '+r.nombres as Responsable,
        //cd.promedioEstrellas as Valoracion, cd.fechaRegistro as FechaRegistro, e.nombre as Estado, cd.mapa as Mapa, cd.avatar as Avatar
        // FROM ComplejoDeportivo cd
        // LEFT JOIN Barrio b ON b.id=cd.idBarrio
        // LEFT JOIN Responsable r ON r.id=cd.idResponsable
        // LEFT JOIN Estado e ON e.id=cd.idEstado
        // LEFT JOIN Zona z ON z.id=b.idZona
        // LEFT JOIN ZonasPorDeportistas zpd ON zpd.idZona=z.id
        // LEFT JOIN Deportista de ON de.id=zpd.idDeportista";

        //        cmd.CommandType = CommandType.Text;
        //        cmd.Connection = cn;
        //        cn.Open();

        //        DataTable ComplejosBD = new DataTable();
        //        ComplejosBD.Load(cmd.ExecuteReader());

        //        cn.Close();
        //        return ComplejosBD;
        //    }

        public static List<spObtenerComplejosJoin_Result> ObtenerComplejosFiltros(string nomb, int? idUsuario, string d1, string d2, string d3, string d4)
        {
            List<spObtenerComplejosJoin_Result> listaQuery = new List<spObtenerComplejosJoin_Result>();
            spObtenerComplejosJoin_Result comp = null;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"
                            SELECT cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion, cd.deportes as Deportes,
                                cd.calle+' '+CONVERT(char, cd.nroCalle) as Direccion, b.nombre as Barrio, cd.nroTelefono as Telefono, r.apellido+', '+r.nombres as Responsable,
                                cd.promedioEstrellas as Valoracion, cd.fechaRegistro as FechaRegistro, e.nombre as Estado, cd.mapa as Mapa, cd.avatar as Avatar
                                 FROM ComplejoDeportivo cd
                            LEFT JOIN Barrio b ON b.id=cd.idBarrio
                            LEFT JOIN Responsable r ON r.id=cd.idResponsable
                            LEFT JOIN Estado e ON e.id=cd.idEstado
                            LEFT JOIN Zona z ON z.id=b.idZona
		                    LEFT JOIN ZonasPorDeportistas zpd ON zpd.idZona=z.id
		                    LEFT JOIN Deportista de ON de.id=zpd.idDeportista
                                WHERE 1 = 1";

            if (!string.IsNullOrEmpty(nomb))
            {
                cmd.CommandText += " AND cd.nombre LIKE @nom";
                cmd.Parameters.AddWithValue("@nom", "%" + nomb + "%");
            }

            if (idUsuario.HasValue)
            {
                cmd.CommandText += " AND de.idUsuario = @idUs";
                cmd.Parameters.AddWithValue("@idUs", idUsuario);
            }

            if (!string.IsNullOrEmpty(d1))
            {
                cmd.CommandText += @" AND cd.deportes LIKE @d1";
                cmd.Parameters.AddWithValue("@d1", "%" + d1 + "%");
            }
            if (!string.IsNullOrEmpty(d2))
            {
                cmd.CommandText += @" AND cd.deportes LIKE @d2";
                cmd.Parameters.AddWithValue("@d2", "%" + d2 + "%");
            }
            if (!string.IsNullOrEmpty(d3))
            {
                cmd.CommandText += @" AND cd.deportes LIKE @d3";
                cmd.Parameters.AddWithValue("@d3", "%" + d3 + "%");
            }
            if (!string.IsNullOrEmpty(d4))
            {
                cmd.CommandText += @" AND cd.deportes LIKE @d4";
                cmd.Parameters.AddWithValue("@d4", "%" + d4 + "%");
            }

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                comp = new spObtenerComplejosJoin_Result();

                comp.ID = int.Parse(dr["ID"].ToString());
                comp.Nombre = dr["Nombre"].ToString();
                comp.Descripcion = dr["Descripcion"].ToString();
                comp.Deportes = dr["Deportes"].ToString();
                comp.Direccion = dr["Direccion"].ToString();
                comp.Barrio = dr["Barrio"].ToString();
                comp.Telefono = int.Parse(dr["Telefono"].ToString());
                comp.Responsable = dr["Responsable"].ToString();
                comp.Valoracion = double.Parse(dr["Valoracion"].ToString());
                //  comp.FechaRegistro = DateTime.Parse(dr["FechaRegistro"].ToString());
                comp.Estado = dr["Estado"].ToString();
              //  comp.Mapa = int.Parse(dr["Mapa"].ToString());
                comp.Avatar = (byte[])dr["Avatar"];

                listaQuery.Add(comp);

            }

            dr.Close();
            cn.Close();
            return listaQuery;

        }

        public static ComplejoDeportivo ObtenerComplejosPorID(int id)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.ComplejoDeportivo.First(c => c.id == id);
            }
        }
        public static bool ExisteDeporte(int id, string nomb)
        {

            bool deporte = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT * FROM ComplejoDeportivo cd WHERE @id=id AND cd.deportes LIKE @nom";
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@nom", "%" + nomb + "%");
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                deporte = true;
            }
            dr.Close();
            cn.Close();
            return deporte;
        }

        public static List<spObtenerComplejosJoin_Result> ObtenerComplejosPorResponsable(int idRes)
        {
            List<spObtenerComplejosJoin_Result> complejos = new List<spObtenerComplejosJoin_Result>();
            spObtenerComplejosJoin_Result comp = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"
                            SELECT cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion, cd.deportes as Deportes,
				cd.calle+' '+CONVERT(char, cd.nroCalle) as Direccion, b.nombre as Barrio, z.nombre as Zona, cd.nroTelefono as Telefono, r.apellido+', '+r.nombres as Responsable,
				cd.promedioEstrellas as Valoracion, cd.fechaRegistro as FechaRegistro, e.nombre as Estado, cd.mapa as Mapa, cd.avatar as Avatar
		   FROM ComplejoDeportivo cd
		   LEFT JOIN Barrio b ON b.id=cd.idBarrio
		   LEFT JOIN Responsable r ON r.id=cd.idResponsable
		   LEFT JOIN Estado e ON e.id=cd.idEstado
		   LEFT JOIN Zona z ON z.id=b.idZona
		   LEFT JOIN ZonasPorDeportistas zpd ON zpd.idZona=z.id
		   LEFT JOIN Deportista de ON de.id=zpd.idDeportista         
                 WHERE cd.idResponsable = @idRes";

            cmd.Parameters.AddWithValue("@idRes", idRes);

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                comp = new spObtenerComplejosJoin_Result();

                comp.ID = int.Parse(dr["ID"].ToString());
                comp.Nombre = dr["Nombre"].ToString();
                comp.Descripcion = dr["Descripcion"].ToString();
                comp.Deportes = dr["Deportes"].ToString();
                comp.Direccion = dr["Direccion"].ToString();
                comp.Barrio = dr["Barrio"].ToString();
                comp.Telefono = int.Parse(dr["Telefono"].ToString());
                comp.Responsable = dr["Responsable"].ToString();
                comp.Valoracion = double.Parse(dr["Valoracion"].ToString());
                //   comp.FechaRegistro = DateTime.Parse(dr["FechaRegistro"].ToString());
                comp.Estado = dr["Estado"].ToString();
                comp.Mapa = int.Parse(dr["Mapa"].ToString());
                comp.Avatar = (byte[])dr["Avatar"];

                complejos.Add(comp);
            }
            dr.Close();
            cn.Close();
            return complejos;
        }

        public static List<spObtenerComplejosJoin_Result> ObtenerComplejosPorUsuario(int idUs)
        {
            List<spObtenerComplejosJoin_Result> complejos = new List<spObtenerComplejosJoin_Result>();
            spObtenerComplejosJoin_Result comp = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"
                            SELECT cd.id as ID, cd.nombre as Nombre
		   FROM ComplejoDeportivo cd
		   LEFT JOIN Responsable r ON r.id=cd.idResponsable
           LEFT JOIN Usuario u ON u.id=r.idUsuario
                 WHERE u.id = @idUs";

            cmd.Parameters.AddWithValue("@idUs", idUs);

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                comp = new spObtenerComplejosJoin_Result();

                comp.ID = int.Parse(dr["ID"].ToString());
                comp.Nombre = dr["Nombre"].ToString();

                complejos.Add(comp);
            }
            dr.Close();
            cn.Close();
            return complejos;
        }

        public static int CuantasCanchasPorDeporte(int idComp, int idDep)
        {

            int cantidad = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT count(*) as Cantidad
                                  FROM Cancha c
                             LEFT JOIN TipoCancha tc on tc.id=c.idTipoCancha
                             LEFT JOIN ComplejoDeportivo cd on cd.id=c.idComplejo
                                 WHERE cd.id=@idCom and tc.idDeporte=@idDe";
            cmd.Parameters.AddWithValue("@idCom", idComp);
            cmd.Parameters.AddWithValue("@idDe", idDep);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                cantidad = int.Parse(dr["Cantidad"].ToString());
            }
            dr.Close();
            cn.Close();
            return cantidad;
        }

        public static void EliminarDeporteComplejo(int idComp, string dep)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE ComplejoDeportivo
                                   SET deportes = REPLACE(deportes, @dep, '')
                                 WHERE id=@id";

            cmd.Parameters.AddWithValue("@id", idComp);
            cmd.Parameters.AddWithValue("@dep", dep);

            cmd.ExecuteNonQuery();

            cn.Close();
        }

        public static bool ExistenCanchasPorComplejo(int idComp)
        {
            bool canchas = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT count(*) as Cantidad
                                  FROM Cancha c
                             LEFT JOIN ComplejoDeportivo cd on cd.id=c.idComplejo
                                 WHERE cd.id=@idCom";
            cmd.Parameters.AddWithValue("@idCom", idComp);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                canchas = true;
            }
            dr.Close();
            cn.Close();
            return canchas;
        }

        public static bool AgregarAvatar(string id, Byte[] imagen)
        {
            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE ComplejoDeportivo SET avatar= @imagen WHERE id = @id";
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@imagen", imagen);
            cmd.ExecuteNonQuery();
            cn.Close();
            return flag;
        }

        public static byte[] ObtenerAvatar(string id)
        {
            byte[] imagen = null;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT cd.avatar as avatar FROM ComplejoDeportivo cd WHERE id = @id";
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

        public static bool existeAvatar(string id)
        {
            bool imagen = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT * FROM ComplejoDeportivo cd WHERE avatar IS NOT NULL and @id=id";
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

        public static byte[] ObtenerImagen(string id, int num)
        {
            byte[] imagen = null;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT *
                                  FROM
                               (SELECT *, ROW_NUMBER() OVER(ORDER BY idComplejo) ROWNUM
                                  FROM FotosComplejo 
                                 WHERE idComplejo=@id) C
                                 WHERE C. ROWNUM = @num";
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@num", num);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                imagen = (byte[])dr["imagen"];
            }
            dr.Close();
            cn.Close();
            return imagen;
        }

        public static bool existeImagen(string id, int num)
        {
            bool imagen = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;

            cmd.CommandText = @"SELECT *
                                  FROM
                               (SELECT *, ROW_NUMBER() OVER(ORDER BY idComplejo) ROWNUM
                                  FROM FotosComplejo 
                                 WHERE idComplejo=@id) C
                                 WHERE C. ROWNUM = @num";
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@num", num);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                imagen = true;
            }
            dr.Close();
            cn.Close();
            return imagen;
        }

        public static void InsertarImagenComplejo(int idComp, Byte[] imagen)
        {
            SqlConnection cn = new SqlConnection(ConnectionString.Cadena());
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = @"INSERT INTO FotosComplejo (imagen, idComplejo) VALUES (@imagen, @idComp)";
            cmd.Parameters.AddWithValue("@idComp", idComp);
            cmd.Parameters.AddWithValue("@imagen", imagen);

            cmd.CommandType = CommandType.Text;
            cmd.Connection = cn;
            cn.Open();
            cmd.ExecuteNonQuery();
        }

        public static DataTable ObtenerImagenesComp(int idComp)
        {
            SqlConnection cn = new SqlConnection(ConnectionString.Cadena());
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = @"SELECT * FROM FotosComplejo WHERE idComplejo = @idComp";
            cmd.Parameters.AddWithValue("@idComp", idComp);

            cmd.CommandType = CommandType.Text;
            cmd.Connection = cn;
            cn.Open();

            DataTable ImagenesBD = new DataTable();
            ImagenesBD.Load(cmd.ExecuteReader());

            cn.Close();
            return ImagenesBD;
        }

        public static void EliminarImagenComp(int id)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"DELETE from FotosComplejo WHERE id=@idImg";

            cmd.Parameters.AddWithValue("@idImg", id);

            cmd.ExecuteNonQuery();

            cn.Close();
        }

        public static List<ComplejoDeportivo> obtenerComplejoPorDeporte(string sport) {

            List<ComplejoDeportivo> listaComplejo = new List<ComplejoDeportivo>();
            ComplejoDeportivo cd = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"
                            SELECT cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion, cd.deportes as Deportes,
                                cd.calle+' '+CONVERT(char, cd.nroCalle) as Direccion, b.nombre as Barrio, cd.nroTelefono as Telefono, r.apellido+', '+r.nombres as Responsable,
                                cd.promedioEstrellas as Valoracion, cd.fechaRegistro as FechaRegistro, e.nombre as Estado, cd.mapa as Mapa, cd.avatar as Avatar
                                 FROM ComplejoDeportivo cd
                            LEFT JOIN Barrio b ON b.id=cd.idBarrio
                            LEFT JOIN Responsable r ON r.id=cd.idResponsable
                            LEFT JOIN Estado e ON e.id=cd.idEstado
                            LEFT JOIN Zona z ON z.id=b.idZona
		                    LEFT JOIN ZonasPorDeportistas zpd ON zpd.idZona=z.id
		                    LEFT JOIN Deportista de ON de.id=zpd.idDeportista
                                WHERE 1 = 1";

            if (!string.IsNullOrEmpty(sport))
            {
                cmd.CommandText += @" AND cd.deportes LIKE @d1";
                cmd.Parameters.AddWithValue("@d1", "%" + sport + "%");
            }

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
               cd   = new ComplejoDeportivo();

                cd.id = int.Parse(dr["ID"].ToString());
                cd.nombre = dr["Nombre"].ToString();
                cd.descripcion = dr["Descripcion"].ToString();
                cd.deportes = dr["Deportes"].ToString(); 

                listaComplejo.Add(cd);
            }

            dr.Close();
            cn.Close();

            return listaComplejo;

        }

    }
       
}
