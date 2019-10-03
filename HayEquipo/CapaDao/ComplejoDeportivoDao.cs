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
            using(HayEquipoEntities db = new HayEquipoEntities())
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

        //public static void ActualizarDeportesComplejo2(ComplejoDeportivo complejo)
        //{
        //    using (HayEquipoEntities db = new HayEquipoEntities())
        //    {
        //        ComplejoDeportivo comp = db.ComplejoDeportivo.Find(complejo.id);

        //        comp.deportes = comp.deportes + " " + complejo.deportes;

        //        db.Entry(comp).State = System.Data.Entity.EntityState.Modified;
        //        db.SaveChanges();
        //    }
        //}

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

        public static List<spObtenerComplejosJoin_Result> ObtenerComplejosOrdenValor()
        {
            using (var db = new HayEquipoEntities())
            {
                return db.Database.SqlQuery<spObtenerComplejosJoin_Result>("spObtenerComplejosOrdenValor").ToList();
            }
        }

        public static List<spObtenerComplejosPorNomb_Result> ObtenerComplejosFiltros(string nomb, int? idUsuario, string d1, string d2, string d3)
        {
            List<spObtenerComplejosPorNomb_Result> listaQuery = new List<spObtenerComplejosPorNomb_Result>();
            spObtenerComplejosPorNomb_Result comp = null;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"
                            SELECT DISTINCT cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion, cd.deportes as Deportes,
                                cd.calle+' '+CONVERT(char, cd.nroCalle) as Direccion, b.nombre as Barrio, cd.nroTelefono as Telefono, r.apellido+', '+r.nombres as Responsable,
                                cd.promedioEstrellas as Valoracion, e.nombre as Estado
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

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                comp = new spObtenerComplejosPorNomb_Result();

                comp.ID = int.Parse(dr["ID"].ToString());
                comp.Nombre = dr["Nombre"].ToString();
                comp.Descripcion = dr["Descripcion"].ToString();
                comp.Deportes = dr["Deportes"].ToString();
                comp.Direccion = dr["Direccion"].ToString();
                comp.Barrio = dr["Barrio"].ToString();
                comp.Telefono = int.Parse(dr["Telefono"].ToString());
                comp.Responsable = dr["Responsable"].ToString();
                comp.Valoracion = double.Parse(dr["Valoracion"].ToString());
                comp.Estado = dr["Estado"].ToString();

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
    }
}
