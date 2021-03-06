﻿using System;
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

        //public static void InsertarComplejo(ComplejoDeportivo complejo)
        //{
        //    using (HayEquipoEntities db = new HayEquipoEntities())
        //    {
        //        db.ComplejoDeportivo.Add(complejo);
        //        db.SaveChanges();
        //    }
        //}

        public static void InsertarComplejo(ComplejoDeportivo complejo)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"INSERT INTO ComplejoDeportivo (nombre, descripcion, deportes, calle, nroCalle,
                                                                idBarrio, nroTelefono, horaApertura, horaCierre, responsable,
                                                                idUsuario, promedioEstrellas, idEstado, avatar, fechaRegistro)
                                     VALUES(@nom, @des, @dep, @cal, @nro, @idb, @tel, @ape, @cie, @res, @idu, @pes, @ide, @ava, @fre)";

            cmd.Parameters.AddWithValue("@nom", complejo.nombre);
            cmd.Parameters.AddWithValue("@des", complejo.descripcion);
            cmd.Parameters.AddWithValue("@dep", complejo.deportes);
            cmd.Parameters.AddWithValue("@cal", complejo.calle);
            cmd.Parameters.AddWithValue("@nro", complejo.nroCalle);
            cmd.Parameters.AddWithValue("@idb", complejo.idBarrio);
            cmd.Parameters.AddWithValue("@tel", complejo.nroTelefono);
            cmd.Parameters.AddWithValue("@ape", complejo.horaApertura);
            cmd.Parameters.AddWithValue("@cie", complejo.horaCierre);
            cmd.Parameters.AddWithValue("@res", complejo.responsable);
            cmd.Parameters.AddWithValue("@idu", complejo.idUsuario);
            cmd.Parameters.AddWithValue("@pes", complejo.promedioEstrellas);
            cmd.Parameters.AddWithValue("@ide", complejo.idEstado);
            cmd.Parameters.AddWithValue("@ava", complejo.avatar);
            cmd.Parameters.AddWithValue("@fre", complejo.fechaRegistro);
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        //Modificado por eliminación de tabla Responsable
        //public static void ActualizarComplejo(ComplejoDeportivo complejo)
        //{
        //    using (HayEquipoEntities db = new HayEquipoEntities())
        //    {
        //        ComplejoDeportivo comp = db.ComplejoDeportivo.Find(complejo.id);
        //        comp.id = complejo.id;
        //        comp.nombre = complejo.nombre;
        //        comp.descripcion = complejo.descripcion;
        //        comp.deportes = complejo.deportes;
        //        comp.calle = complejo.calle;
        //        comp.nroCalle = complejo.nroCalle;
        //        comp.idBarrio = complejo.idBarrio;
        //        comp.nroTelefono = complejo.nroTelefono;
        //        comp.horaApertura = complejo.horaApertura;
        //        comp.horaCierre = complejo.horaCierre;
        //        comp.responsable = complejo.responsable;
        //        comp.idUsuario = complejo.idUsuario;
        //        comp.promedioEstrellas = complejo.promedioEstrellas;
        //        comp.idEstado = complejo.idEstado;
        //        comp.avatar = complejo.avatar;

        //        db.Entry(comp).State = System.Data.Entity.EntityState.Modified;
        //        db.SaveChanges();
        //    }
        //}

        public static void ActualizarComplejo(ComplejoDeportivo complejo)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE ComplejoDeportivo SET nombre=@nom, descripcion=@des, deportes=@dep, calle=@cal, nroCalle=@nro,
                                                                idBarrio=@idb, nroTelefono=@tel, horaApertura=@ape, horaCierre=@cie, responsable=@res,
                                                                idUsuario=@idu, promedioEstrellas=@pes, idEstado=@ide, avatar=@ava
							    WHERE id = @id";

            cmd.Parameters.AddWithValue("@id", complejo.id);
            cmd.Parameters.AddWithValue("@nom", complejo.nombre);
            cmd.Parameters.AddWithValue("@des", complejo.descripcion);
            cmd.Parameters.AddWithValue("@dep", complejo.deportes);
            cmd.Parameters.AddWithValue("@cal", complejo.calle);
            cmd.Parameters.AddWithValue("@nro", complejo.nroCalle);
            cmd.Parameters.AddWithValue("@idb", complejo.idBarrio);
            cmd.Parameters.AddWithValue("@tel", complejo.nroTelefono);
            cmd.Parameters.AddWithValue("@ape", complejo.horaApertura);
            cmd.Parameters.AddWithValue("@cie", complejo.horaCierre);
            cmd.Parameters.AddWithValue("@res", complejo.responsable);
            cmd.Parameters.AddWithValue("@idu", complejo.idUsuario);
            cmd.Parameters.AddWithValue("@pes", complejo.promedioEstrellas);
            cmd.Parameters.AddWithValue("@ide", complejo.idEstado);
            cmd.Parameters.AddWithValue("@ava", complejo.avatar);
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        //public static void ActualizarDeportesComplejo(ComplejoDeportivo complejo)
        //{
        //    using (HayEquipoEntities db = new HayEquipoEntities())
        //    {
        //        ComplejoDeportivo comp = db.ComplejoDeportivo.Find(complejo.id);

        //        comp.deportes = complejo.deportes + " " + comp.deportes;

        //        db.Entry(comp).State = System.Data.Entity.EntityState.Modified;
        //        db.SaveChanges();
        //    }
        //}

        public static void ActualizarDeportesComplejo(ComplejoDeportivo complejo)
        {
            SqlConnection cn2 = new SqlConnection();
            cn2.ConnectionString = ConnectionString.Cadena();
            cn2.Open();
            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = cn2;

            cmd2.CommandText = @"SELECT deportes
                                FROM ComplejoDeportivo
                                WHERE id =  @id";

            cmd2.Parameters.AddWithValue("@id", complejo.id);

            SqlDataReader dr = cmd2.ExecuteReader();

            ComplejoDeportivo cd = new ComplejoDeportivo();
            while (dr.Read())
            {
                cd.deportes = dr["deportes"].ToString();
            }
            dr.Close();
            cmd2.ExecuteNonQuery();
            cn2.Close();

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;

            cmd.CommandText = @"UPDATE ComplejoDeportivo SET deportes=@dep 
							    WHERE id = @id";

            cmd.Parameters.AddWithValue("@id", complejo.id);
            cmd.Parameters.AddWithValue("@dep", complejo.deportes + " " + cd.deportes);

            cmd.ExecuteNonQuery();
            cn.Close();
        }

        //public static void ActualizarMapaComplejo(ComplejoDeportivo complejo)
        //{
        //    using (HayEquipoEntities db = new HayEquipoEntities())
        //    {
        //        ComplejoDeportivo comp = db.ComplejoDeportivo.Find(complejo.id);

        //        comp.mapa = complejo.mapa;

        //        db.Entry(comp).State = System.Data.Entity.EntityState.Modified;
        //        db.SaveChanges();
        //    }
        //}

        public static void ActualizarMapaComplejo(ComplejoDeportivo complejo)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE ComplejoDeportivo SET mapa=@map 
							    WHERE id = @id";

            cmd.Parameters.AddWithValue("@id", complejo.id);
            cmd.Parameters.AddWithValue("@map", complejo.mapa);
 
            cmd.ExecuteNonQuery();
            cn.Close();
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

        //public static List<spObtenerComplejosJoin_Result> ObtenerComplejosJoin()
        //{
        //    using (var db = new HayEquipoEntities())
        //    {
        //        return db.Database.SqlQuery<spObtenerComplejosJoin_Result>("spObtenerComplejosJoin").ToList();
        //    }
        //}

        public static List<spObtenerComplejosJoin_Result> ObtenerComplejosJoin()
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
				cd.calle as Calle, cd.nroCalle as NroCalle, b.id as IDBarrio, b.nombre as Barrio, z.id as IDZona, z.nombre as Zona,
				cd.nroTelefono as Telefono, cd.horaApertura as Apertura, cd.horaCierre as Cierre, cd.responsable as Responsable,
				cd.promedioEstrellas as Valoracion, cd.fechaRegistro as FechaRegistro, e.id as IDEstado, e.nombre as Estado, cd.mapa as Mapa,
				cd.avatar as Avatar, cd.idUsuario as IDUsuario, u.nombre as Usuario
		   FROM ComplejoDeportivo cd
		   LEFT JOIN Barrio b ON b.id=cd.idBarrio
		   LEFT JOIN Estado e ON e.id=cd.idEstado
		   LEFT JOIN Zona z ON z.id=b.idZona
		   LEFT JOIN Usuario u ON u.id=cd.idUsuario";

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                comp = new spObtenerComplejosJoin_Result();

                comp.ID = int.Parse(dr["ID"].ToString());
                comp.Nombre = dr["Nombre"].ToString();
                comp.Descripcion = dr["Descripcion"].ToString();
                comp.Deportes = dr["Deportes"].ToString();
                comp.Calle = dr["Calle"].ToString();
                comp.NroCalle = int.Parse(dr["NroCalle"].ToString());
                if (dr["IDBarrio"].ToString() != "")
                {
                    comp.IDBarrio = int.Parse(dr["IDBarrio"].ToString());
                    comp.IDZona = int.Parse(dr["IDZona"].ToString());
                }
                else
                {
                    comp.IDBarrio = 0;
                }
                comp.Barrio = dr["Barrio"].ToString();
                comp.Zona = dr["Zona"].ToString();
                comp.Telefono = long.Parse(dr["Telefono"].ToString());
                TimeSpan ha; if (TimeSpan.TryParse(dr["Apertura"].ToString(), out ha)) { comp.Apertura = ha; }
                TimeSpan hc; if (TimeSpan.TryParse(dr["Cierre"].ToString(), out hc)) { comp.Cierre = hc; }
                comp.Responsable = dr["Responsable"].ToString();
                comp.Valoracion = double.Parse(dr["Valoracion"].ToString());
                comp.FechaRegistro = DateTime.Parse(dr["FechaRegistro"].ToString());
                comp.IDEstado = int.Parse(dr["IDEstado"].ToString());
                comp.Estado = dr["Estado"].ToString();
               // comp.Mapa = int.Parse(dr["Mapa"].ToString());
                comp.Avatar = (byte[])dr["Avatar"];
                comp.IDUsuario = int.Parse(dr["IDUsuario"].ToString());
                comp.Usuario = dr["Usuario"].ToString();

                listaQuery.Add(comp);

            }

            dr.Close();
            cn.Close();
            return listaQuery;

        }

        //Modificado por eliminación tabla Responsable

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
                       SELECT * from
                          (SELECT cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion, cd.deportes as Deportes,
                                cd.calle as Calle, cd.nroCalle as NroCalle,b.id as IDBarrio, b.nombre as Barrio, z.id as IDZona,
                                z.nombre as Zona, cd.nroTelefono as Telefono, cd.horaApertura as Apertura, cd.horaCierre as Cierre, cd.responsable as Responsable,
                                cd.promedioEstrellas as Valoracion, cd.fechaRegistro as FechaRegistro,  e.id as IDEstado, e.nombre as Estado,
                                cd.mapa as Mapa, cd.idUsuario as IDUsuario, u.nombre as Usuario,
                                 avg((ISNULL(v.valoracion,0))) as ValoracionPromedio
                                 FROM ComplejoDeportivo cd
                            LEFT JOIN Barrio b ON b.id=cd.idBarrio
                            LEFT JOIN Estado e ON e.id=cd.idEstado
                            LEFT JOIN Zona z ON z.id=b.idZona
                            LEFT JOIN Usuario u ON u.id=cd.idUsuario
		                    LEFT JOIN ZonasPorDeportistas zpd ON zpd.idZona=z.id
		                    LEFT JOIN Deportista de ON de.id=zpd.idDeportista
                            LEFT JOIN Valoracion v ON cd.id=v.idComplejoValorado
                                WHERE 1 = 1
                               ";

            if (!string.IsNullOrEmpty(nomb))
            {
                cmd.CommandText += " AND cd.nombre LIKE @nom";

            }

            if (idUsuario.HasValue)
            {
                cmd.CommandText += " AND cd.idUsuario = @idUs";

            }

            if (!string.IsNullOrEmpty(d1))
            {
                cmd.CommandText += @" AND cd.deportes LIKE @d1";

            }
            if (!string.IsNullOrEmpty(d2))
            {
                cmd.CommandText += @" AND cd.deportes LIKE @d2";

            }
            if (!string.IsNullOrEmpty(d3))
            {
                cmd.CommandText += @" AND cd.deportes LIKE @d3";

            }
            if (!string.IsNullOrEmpty(d4))
            {
                cmd.CommandText += @" AND cd.deportes LIKE @d4";

            }


            cmd.CommandText += @"
              group by cd.id,cd.nombre,cd.descripcion, cd.deportes, cd.calle, cd.nroCalle,b.id, b.nombre, z.id, z.nombre,
              cd.nroTelefono, cd.horaApertura, cd.horaCierre, cd.responsable, cd.promedioEstrellas,
							cd.fechaRegistro, e.id, e.nombre, cd.mapa, cd.idUsuario, u.nombre ) T1
                            FULL OUTER JOIN

                            (SELECT cd.id, cd.avatar as Avatar
                                 FROM ComplejoDeportivo cd
                                WHERE 1 = 1 ";

            if (!string.IsNullOrEmpty(nomb))
            {
                cmd.CommandText += " AND cd.nombre LIKE @nom";
                cmd.Parameters.AddWithValue("@nom", "%" + nomb + "%");
            }

            if (idUsuario.HasValue)
            {
                cmd.CommandText += " AND cd.idUsuario = @idUs";
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
            cmd.CommandText += @") T2 ON t1.ID = t2.id";

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                comp = new spObtenerComplejosJoin_Result();

                comp.ID = int.Parse(dr["ID"].ToString());
                comp.Nombre = dr["Nombre"].ToString();
                comp.Descripcion = dr["Descripcion"].ToString();
                comp.Deportes = dr["Deportes"].ToString();
                comp.Calle = dr["Calle"].ToString();
                comp.NroCalle = int.Parse(dr["NroCalle"].ToString());
                if (dr["IDBarrio"].ToString() != "")
                {
                    comp.IDBarrio = int.Parse(dr["IDBarrio"].ToString());
                    comp.IDZona = int.Parse(dr["IDZona"].ToString());
                }
                else
                {
                    comp.IDBarrio = 0;
                }
                comp.Barrio = dr["Barrio"].ToString();
                comp.Zona = dr["Zona"].ToString();
                comp.Telefono = long.Parse(dr["Telefono"].ToString());
                TimeSpan ha; if (TimeSpan.TryParse(dr["Apertura"].ToString(), out ha)) { comp.Apertura = ha; }
                TimeSpan hc; if (TimeSpan.TryParse(dr["Cierre"].ToString(), out hc)) { comp.Cierre = hc; }
                comp.Responsable = dr["Responsable"].ToString();
                comp.Valoracion = double.Parse(dr["Valoracion"].ToString());
                comp.FechaRegistro = DateTime.Parse(dr["FechaRegistro"].ToString());

                comp.IDEstado = int.Parse(dr["IDEstado"].ToString());

                comp.Valoracion = int.Parse(dr["ValoracionPromedio"].ToString());

                comp.Estado = dr["Estado"].ToString();
                //comp.Mapa = int.Parse(dr["Mapa"].ToString());
                comp.Avatar = (byte[])dr["Avatar"];
                comp.IDUsuario = int.Parse(dr["IDUsuario"].ToString());
                comp.Usuario = dr["Usuario"].ToString();

                listaQuery.Add(comp);

            }

            dr.Close();
            cn.Close();
            return listaQuery;

        }





        //public static ComplejoDeportivo ObtenerComplejosPorID(int id)
        //{
        //    using (HayEquipoEntities db = new HayEquipoEntities())
        //    {
        //        return db.ComplejoDeportivo.First(c => c.id == id);
        //    }
        //}

        //AGREGADO POR AGU:
        public static spObtenerComplejosJoin_Result ObtenerComplejoPorID(int id)
        {
            spObtenerComplejosJoin_Result comp = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"
                            SELECT cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion, cd.deportes as Deportes,
				cd.calle as Calle, cd.nroCalle as NroCalle, b.id as IDBarrio, b.nombre as Barrio, z.id as IDZona, z.nombre as Zona,
				cd.nroTelefono as Telefono, cd.horaApertura as Apertura, cd.horaCierre as Cierre, cd.responsable as Responsable,
				cd.promedioEstrellas as Valoracion, cd.fechaRegistro as FechaRegistro, e.id as IDEstado, e.nombre as Estado, cd.mapa as Mapa,
				cd.avatar as Avatar, cd.idUsuario as IDUsuario, u.nombre as Usuario
		   FROM ComplejoDeportivo cd
		   LEFT JOIN Barrio b ON b.id=cd.idBarrio
		   LEFT JOIN Estado e ON e.id=cd.idEstado
		   LEFT JOIN Zona z ON z.id=b.idZona
		   LEFT JOIN Usuario u ON u.id=cd.idUsuario
                 WHERE cd.id = @id";

            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                comp = new spObtenerComplejosJoin_Result();

                comp.ID = int.Parse(dr["ID"].ToString());
                comp.Nombre = dr["Nombre"].ToString();
                comp.Descripcion = dr["Descripcion"].ToString();
                comp.Deportes = dr["Deportes"].ToString();
                comp.Calle = dr["Calle"].ToString();
                comp.NroCalle = int.Parse(dr["NroCalle"].ToString());
                if (dr["IDBarrio"].ToString() != "")
                {
                    comp.IDBarrio = int.Parse(dr["IDBarrio"].ToString());
                    comp.IDZona = int.Parse(dr["IDZona"].ToString());
                }
                else
                {
                    comp.IDBarrio = 0;
                }
                comp.Barrio = dr["Barrio"].ToString();
                comp.Zona = dr["Zona"].ToString();
                comp.Telefono = long.Parse(dr["Telefono"].ToString());
                TimeSpan ha; if (TimeSpan.TryParse(dr["Apertura"].ToString(), out ha)) { comp.Apertura = ha; }
                TimeSpan hc; if (TimeSpan.TryParse(dr["Cierre"].ToString(), out hc)) { comp.Cierre = hc; }
                comp.Responsable = dr["Responsable"].ToString();
                comp.Valoracion = double.Parse(dr["Valoracion"].ToString());
                comp.FechaRegistro = DateTime.Parse(dr["FechaRegistro"].ToString());
                comp.IDEstado = int.Parse(dr["IDEstado"].ToString());
                comp.Estado = dr["Estado"].ToString();
                if (!string.IsNullOrEmpty(dr["Mapa"].ToString())) {
                    comp.Mapa = int.Parse(dr["Mapa"].ToString());
                }
                comp.Avatar = (byte[])dr["Avatar"];
                comp.IDUsuario = int.Parse(dr["IDUsuario"].ToString());
                comp.Usuario = dr["Usuario"].ToString();
            }
            dr.Close();
            cn.Close();
            return comp;
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

        //Comentado por eliminación de tabla Responsable

    //    public static List<spObtenerComplejosJoin_Result> ObtenerComplejosPorResponsable(int idRes)
    //    {
    //        List<spObtenerComplejosJoin_Result> complejos = new List<spObtenerComplejosJoin_Result>();
    //        spObtenerComplejosJoin_Result comp = null;

    //        SqlConnection cn = new SqlConnection();
    //        cn.ConnectionString = ConnectionString.Cadena();
    //        cn.Open();

    //        SqlCommand cmd = new SqlCommand();
    //        cmd.Connection = cn;
    //        cmd.CommandText = @"
    //                        SELECT cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion, cd.deportes as Deportes,
				//cd.calle+' '+CONVERT(char, cd.nroCalle) as Direccion, b.nombre as Barrio, z.nombre as Zona, cd.nroTelefono as Telefono, r.apellido+', '+r.nombres as Responsable,
				//cd.promedioEstrellas as Valoracion, cd.fechaRegistro as FechaRegistro, e.nombre as Estado, cd.mapa as Mapa, cd.avatar as Avatar
		  // FROM ComplejoDeportivo cd
		  // LEFT JOIN Barrio b ON b.id=cd.idBarrio
		  // LEFT JOIN Responsable r ON r.id=cd.idResponsable
		  // LEFT JOIN Estado e ON e.id=cd.idEstado
		  // LEFT JOIN Zona z ON z.id=b.idZona
		  // LEFT JOIN ZonasPorDeportistas zpd ON zpd.idZona=z.id
		  // LEFT JOIN Deportista de ON de.id=zpd.idDeportista
    //             WHERE cd.idResponsable = @idRes";

    //        cmd.Parameters.AddWithValue("@idRes", idRes);

    //        SqlDataReader dr = cmd.ExecuteReader();

    //        while (dr.Read())
    //        {
    //            comp = new spObtenerComplejosJoin_Result();

    //            comp.ID = int.Parse(dr["ID"].ToString());
    //            comp.Nombre = dr["Nombre"].ToString();
    //            comp.Descripcion = dr["Descripcion"].ToString();
    //            comp.Deportes = dr["Deportes"].ToString();
    //            comp.Direccion = dr["Direccion"].ToString();
    //            comp.Barrio = dr["Barrio"].ToString();
    //            comp.Telefono = int.Parse(dr["Telefono"].ToString());
    //            comp.Responsable = dr["Responsable"].ToString();
    //            comp.Valoracion = double.Parse(dr["Valoracion"].ToString());
    //            //   comp.FechaRegistro = DateTime.Parse(dr["FechaRegistro"].ToString());
    //            comp.Estado = dr["Estado"].ToString();
    //            //comp.Mapa = int.Parse(dr["Mapa"].ToString());
    //            comp.Avatar = (byte[])dr["Avatar"];

    //            complejos.Add(comp);
    //        }
    //        dr.Close();
    //        cn.Close();
    //        return complejos;
    //    }
        //Modifiqué consulta por elimiación de tabla 'Responsable'
        public static spObtenerComplejosJoin_Result ObtenerComplejoPorUsuario(int idUs)
        {
            spObtenerComplejosJoin_Result comp = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"
                            SELECT cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion, cd.deportes as Deportes,
				cd.calle as Calle, cd.nroCalle as NroCalle, b.id as IDBarrio, b.nombre as Barrio, z.id as IDZona, z.nombre as Zona,
				cd.nroTelefono as Telefono, cd.horaApertura as Apertura, cd.horaCierre as Cierre, cd.responsable as Responsable,
				cd.promedioEstrellas as Valoracion, cd.fechaRegistro as FechaRegistro, e.id as IDEstado, e.nombre as Estado, cd.mapa as Mapa,
				cd.avatar as Avatar, cd.idUsuario as IDUsuario, u.nombre as Usuario
		   FROM ComplejoDeportivo cd
		   LEFT JOIN Barrio b ON b.id=cd.idBarrio
		   LEFT JOIN Estado e ON e.id=cd.idEstado
		   LEFT JOIN Zona z ON z.id=b.idZona
		   LEFT JOIN Usuario u ON u.id=cd.idUsuario
                 WHERE cd.idUsuario = @idUs";

            cmd.Parameters.AddWithValue("@idUs", idUs);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                comp = new spObtenerComplejosJoin_Result();

                comp.ID = int.Parse(dr["ID"].ToString());
                comp.Nombre = dr["Nombre"].ToString();
                comp.Descripcion = dr["Descripcion"].ToString();
                comp.Deportes = dr["Deportes"].ToString();
                comp.Calle = dr["Calle"].ToString();
                comp.NroCalle = int.Parse(dr["NroCalle"].ToString());
                if (dr["IDBarrio"].ToString() != "")
                {
                    comp.IDBarrio = int.Parse(dr["IDBarrio"].ToString());
                    comp.IDZona = int.Parse(dr["IDZona"].ToString());
                }
                else
                {
                    comp.IDBarrio = 0;
                }
                comp.Barrio = dr["Barrio"].ToString();
                comp.Zona = dr["Zona"].ToString();
                comp.Telefono = long.Parse(dr["Telefono"].ToString());
                TimeSpan ha; if (TimeSpan.TryParse(dr["Apertura"].ToString(), out ha)) { comp.Apertura = ha; }
                TimeSpan hc; if (TimeSpan.TryParse(dr["Cierre"].ToString(), out hc)) { comp.Cierre = hc; }
                comp.Responsable = dr["Responsable"].ToString();
                comp.Valoracion = double.Parse(dr["Valoracion"].ToString());
                comp.FechaRegistro = DateTime.Parse(dr["FechaRegistro"].ToString());
                comp.IDEstado = int.Parse(dr["IDEstado"].ToString());
                comp.Estado = dr["Estado"].ToString();
                if (!string.IsNullOrEmpty(dr["Mapa"].ToString()))
                {
                    comp.Mapa = int.Parse(dr["Mapa"].ToString());
                }
                comp.Avatar = (byte[])dr["Avatar"];
                comp.IDUsuario = int.Parse(dr["IDUsuario"].ToString());
                comp.Usuario = dr["Usuario"].ToString();
            }
            dr.Close();
            cn.Close();
            return comp;
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
                                cd.calle+' '+CONVERT(char, cd.nroCalle) as Direccion, b.nombre as Barrio, z.nombre as Zona, cd.nroTelefono as Telefono,
                                cd.promedioEstrellas as Valoracion, cd.fechaRegistro as FechaRegistro, e.nombre as Estado, cd.mapa as Mapa, cd.avatar as Avatar
                                 FROM ComplejoDeportivo cd
                            LEFT JOIN Barrio b ON b.id=cd.idBarrio
                            LEFT JOIN Zona z ON z.id=b.idZona

                            LEFT JOIN Estado e ON e.id=cd.idEstado
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


        public static List<ComplejoDeportivo> getComplejoPorDeporteBarrio(string sport, int barrio)
        {

            List<ComplejoDeportivo> listaComplejo = new List<ComplejoDeportivo>();
            ComplejoDeportivo cd = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"
                            SELECT distinct cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion,
                                            cd.deportes as Deportes, b.nombre as Barrio, mapa as Mapa
                            FROM ComplejoDeportivo cd, Barrio b, Deporte d
                            WHERE 1 = 1";


            if (!string.IsNullOrEmpty(sport))
            {
                cmd.CommandText += @" AND cd.deportes LIKE @d1";
                cmd.Parameters.AddWithValue("@d1", "%" + sport + "%");
            }
            if (barrio != 0)
            {
                cmd.CommandText += @" AND cd.idBarrio = b.id AND cd.idBarrio = @b";
                cmd.Parameters.AddWithValue("@b", barrio);
            }

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                cd = new ComplejoDeportivo();

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

        public static List<ComplejoDeportivo> getComplejoPorDeporteZona(string sport, int zona)
        {

            List<ComplejoDeportivo> listaComplejo = new List<ComplejoDeportivo>();
            ComplejoDeportivo cd = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"
                            SELECT distinct cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion,
                                            cd.deportes as Deportes, b.nombre as Barrio, mapa as Mapa
                            FROM ComplejoDeportivo cd, Deporte d, Barrio b, Zona z
                            WHERE 1 = 1";


            if (!string.IsNullOrEmpty(sport))
            {
                cmd.CommandText += @" AND cd.deportes LIKE @d1";
                cmd.Parameters.AddWithValue("@d1", "%" + sport + "%");
            }
            if (zona != 0)
            {
                cmd.CommandText += @" AND z.id = b.idZona AND b.id = cd.idBarrio AND z.id = @z";
                cmd.Parameters.AddWithValue("@z", zona);
            }


            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                cd = new ComplejoDeportivo();

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

        public static List<ComplejoDeportivo> getComplejoPorHorarioDeporte(int tipoCancha, string sport, TimeSpan? hi) {


            List<ComplejoDeportivo> listaComplejo = new List<ComplejoDeportivo>();
            ComplejoDeportivo cd = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"
                            SELECT distinct cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion,
                                            cd.deportes as Deportes,c.nombre, c.precio, tc.nombre, tc.capacidad,
                                            mapa as Mapa, cd.idBarrio
                            FROM ComplejoDeportivo cd, Deporte d, Cancha c, TipoCancha tc
                            WHERE c.idComplejo = cd.id ";


            if (!string.IsNullOrEmpty(sport))
            {
                cmd.CommandText += @" AND cd.deportes LIKE @d1";
                cmd.Parameters.AddWithValue("@d1", "%" + sport + "%");
            }
            if (tipoCancha != 0)
            {
                cmd.CommandText += @" AND c.idTipoCancha = tc.id and tc.id = @tc";
                cmd.Parameters.AddWithValue("@tc",tipoCancha);
            }
            if (hi != null) {
                cmd.CommandText += @" AND @hi between cd.horaApertura AND cd.horaCierre";
                cmd.Parameters.AddWithValue("@hi", hi);
            }



            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                cd = new ComplejoDeportivo();

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

        public static List<ComplejoDeportivo> getComplejoPorHorarioDeporteReservados(int tipoCancha, string sport, TimeSpan? hi, DateTime fecha)
        {


            List<ComplejoDeportivo> listaComplejo = new List<ComplejoDeportivo>();
            ComplejoDeportivo cd = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"
                            SELECT distinct cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion,
                                            cd.deportes as Deportes,c.nombre, c.precio, tc.nombre, tc.capacidad,
                                            mapa as Mapa, cd.idBarrio, h.horaInicio, h.fecha, e.nombre
                            FROM ComplejoDeportivo cd, Deporte d, Cancha c, TipoCancha tc,
	                             Horario h,CanchasPorHorarios cph , Estado e, EncuentroDeportivo ed
                            WHERE c.idComplejo = cd.id AND e.id = h.idEstado
                                   and ed.idComplejo = cd.id and ed.fechaInicioEncuentro = h.fecha";


            if (!string.IsNullOrEmpty(sport))
            {
                cmd.CommandText += @" AND cd.deportes LIKE @d1";
                cmd.Parameters.AddWithValue("@d1", "%" + sport + "%");
            }
            if (tipoCancha != 0)
            {
                cmd.CommandText += @" AND c.idTipoCancha = tc.id and tc.id = @tc";
                cmd.Parameters.AddWithValue("@tc", tipoCancha);
            }

            if (hi != null)
            {
                cmd.CommandText += @" AND h.horaInicio = @hi";
                cmd.Parameters.AddWithValue("@hi", hi);
            }
            if (fecha != null)
            {
                cmd.CommandText += @" AND h.fecha = @fecha";
                cmd.Parameters.AddWithValue("@fecha", fecha);
            }


            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                cd = new ComplejoDeportivo();

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

        public static List<ComplejoDeportivo> getComplejoPorHorarioDeporteBarrio(string sport, int tipoCancha, int barrio, TimeSpan? hi)
        {


            List<ComplejoDeportivo> listaComplejo = new List<ComplejoDeportivo>();
            ComplejoDeportivo cd = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"
                            SELECT distinct cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion,
                                            cd.deportes as Deportes,c.nombre, c.precio, tc.nombre, tc.capacidad,
                                            mapa as Mapa, cd.idBarrio
                            FROM ComplejoDeportivo cd, Deporte d, Cancha c,
                                 TipoCancha tc, Barrio b
                            WHERE c.idComplejo = cd.id ";


            if (!string.IsNullOrEmpty(sport))
            {
                cmd.CommandText += @" AND cd.deportes LIKE @d1";
                cmd.Parameters.AddWithValue("@d1", "%" + sport + "%");
            }
            if (tipoCancha != 0)
            {
                cmd.CommandText += @" AND c.idTipoCancha = tc.id and tc.id = @tc";
                cmd.Parameters.AddWithValue("@tc", tipoCancha);
            }
            if (barrio != 0)
            {
                cmd.CommandText += @" AND cd.idBarrio = b.id AND cd.idBarrio = @b";
                cmd.Parameters.AddWithValue("@b", barrio);
            }
            if (hi != null)
            {
                cmd.CommandText += @" AND @hi between cd.horaApertura AND cd.horaCierre";
                cmd.Parameters.AddWithValue("@hi", hi);
            }


            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                cd = new ComplejoDeportivo();

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


        public static List<ComplejoDeportivo> getComplejoPorHorarioDeporteZona(string sport, int zona,int tipoCancha, TimeSpan? hi)
        {


            List<ComplejoDeportivo> listaComplejo = new List<ComplejoDeportivo>();
            ComplejoDeportivo cd = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"
                            SELECT distinct cd.id as ID, cd.nombre as Nombre, cd.descripcion as Descripcion,
                                            cd.deportes as Deportes,c.nombre, c.precio, tc.nombre, tc.capacidad,
                                            mapa as Mapa, cd.idBarrio
                            FROM ComplejoDeportivo cd, Deporte d, Cancha c,
                                 TipoCancha tc, Barrio b, Zona z
                            WHERE c.idComplejo = cd.id ";


            if (!string.IsNullOrEmpty(sport))
            {
                cmd.CommandText += @" AND cd.deportes LIKE @d1";
                cmd.Parameters.AddWithValue("@d1", "%" + sport + "%");
            }
            if (tipoCancha != 0)
            {
                cmd.CommandText += @" AND c.idTipoCancha = tc.id and tc.id = @tc";
                cmd.Parameters.AddWithValue("@tc", tipoCancha);
            }
            if (zona != 0)
            {
                cmd.CommandText += @" AND z.id = b.idZona AND b.id = cd.idBarrio AND z.id = @z";
                cmd.Parameters.AddWithValue("@z", zona);
            }
            if (hi != null)
            {
                cmd.CommandText += @" AND @hi between cd.horaApertura AND cd.horaCierre";
                cmd.Parameters.AddWithValue("@hi", hi);
            }



            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                cd = new ComplejoDeportivo();

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


        public static bool ExisteComplejo(string id)
        {

            bool flag = false;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT *
                                FROM ComplejoDeportivo where idUsuario=@id";
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

        public static ComplejoDeportivo ObtenerComplejoPorID(string id)
        {
            ComplejoDeportivo d = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT *
                                FROM ComplejoDeportivo where idUsuario=@id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                d = new ComplejoDeportivo();

                d.id = int.Parse(dr["id"].ToString());
                d.nombre = dr["nombre"].ToString();
                d.descripcion = dr["descripcion"].ToString();
                d.calle = dr["calle"].ToString();
                d.nroCalle = int.Parse(dr["nroCalle"].ToString());
                d.nroTelefono = long.Parse(dr["nroTelefono"].ToString());
                d.idUsuario = int.Parse(dr["idUsuario"].ToString());
                d.responsable = dr["responsable"].ToString();

            }
            dr.Close();
            cn.Close();
            return d;
        }

        public static string ObtenerIdComplejo(string id)
        {
            string d = "";

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT id
                                FROM ComplejoDeportivo where idUsuario=@id";
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {


                d = dr["id"].ToString();


            }
            dr.Close();
            cn.Close();
            return d;
        }



        public static ComplejoDeportivo ObtenerComplejosPorID(int id)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.ComplejoDeportivo.First(c => c.id == id);
            }
        }

        public static string ObtenerIdXnombreComplejo(string nombre)
        {
            string d = "";

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"select id
                                 from ComplejoDeportivo
                                 where nombre = @nombre";
            cmd.Parameters.AddWithValue("@nombre", nombre);
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
