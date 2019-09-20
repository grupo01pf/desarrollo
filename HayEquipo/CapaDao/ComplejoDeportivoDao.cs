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
                comp.idDeporte1 = complejo.idDeporte1;
                comp.idDeporte2 = complejo.idDeporte2;
                comp.idDeporte3 = complejo.idDeporte3;
                comp.calle = complejo.calle;
                comp.nroCalle = complejo.nroCalle;
                comp.idBarrio = complejo.idBarrio;
                comp.nroTelefono = complejo.nroTelefono;
                comp.idResponsable = complejo.idResponsable;
                comp.promedioEstrellas = complejo.promedioEstrellas;
                comp.idEstado = complejo.idEstado;

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
                            SELECT DISTINCT cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion,CONCAT(d1.nombre, ', '+d2.nombre, ', '+d3.nombre) as Deportes,
                                cd.calle+' '+CONVERT(char, cd.nroCalle) as Direccion, b.nombre as Barrio, cd.nroTelefono as Telefono, r.apellido+', '+r.nombres as Responsable,
                                cd.promedioEstrellas as Valoracion, e.nombre as Estado
                                 FROM ComplejoDeportivo cd
                            LEFT JOIN Deporte d1 ON d1.id=cd.idDeporte1
                            LEFT JOIN Deporte d2 ON d2.id=cd.idDeporte2
                            LEFT JOIN Deporte d3 ON d3.id=cd.idDeporte3
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
                cmd.CommandText += @" AND d1.nombre LIKE @d1
                                       OR d2.nombre LIKE @d1
                                       OR d3.nombre LIKE @d1";
                cmd.Parameters.AddWithValue("@d1", "%" + d1 + "%");
            }
            if (!string.IsNullOrEmpty(d2))
            {
                cmd.CommandText += @"AND d1.nombre LIKE @d2
                                      OR d2.nombre LIKE @d2
                                      OR d3.nombre LIKE @d2";
                cmd.Parameters.AddWithValue("@d2", "%" + d2 + "%");
            }
            if (!string.IsNullOrEmpty(d3))
            {
                cmd.CommandText += @" AND d1.nombre LIKE @d3
                                       OR d2.nombre LIKE @d3
                                       OR d3.nombre LIKE @d3";
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


        //public static ComplejoDeportivo ObtenerComplejosPorID(int id)
        //{
        //    ComplejoDeportivo complejo = null;

        //    SqlConnection cn = new SqlConnection();
        //    cn.ConnectionString = ConnectionString.Cadena();
        //    cn.Open();

        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = cn;
        //    cmd.CommandText = @"SELECT *
        //                        FROM ComplejoDeportivo where id=@idComp";
        //    cmd.Parameters.AddWithValue("@idComp", id);
        //    SqlDataReader dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        complejo = new ComplejoDeportivo();
        //        complejo.id = int.Parse(dr["id"].ToString());
        //        complejo.nombre = dr["nombre"].ToString();
        //        complejo.descripcion = dr["descripcion"].ToString();
        //        complejo.calle = dr["calle"].ToString();
        //        complejo.mapa = dr["mapa"].ToString();
        //    }
        //    dr.Close();
        //    cn.Close();
        //    return complejo;

        //}


    }
}
