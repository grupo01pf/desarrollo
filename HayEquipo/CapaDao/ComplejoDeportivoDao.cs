using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;
using System.Configuration;

namespace CapaDao
{
    public class ComplejoDeportivoDao
    {
        //public static void InsertarComplejo(ComplejoDeportivoEntidad complejo)
        //{
        //    SqlConnection cn = new SqlConnection();
        //    cn.ConnectionString = ConnectionString.Cadena();
        //    cn.Open();

        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = cn;
        //    cmd.CommandText = @"INSERT into ComplejoDeportivo(nombre, descripcion, idTipoComplejo, calle, nroCalle,
        //                                                      idBarrio, nroTelefono, idResponsable, promedioEstrellas, idEstado)   
        //                                        values(@nom, @descrip, @idTipoComp, @calle, @nroCalle,
        //                                               @idBarr, @nroTel, @idResp, @promEstr, @idEst);
        //                        select Scope_Identity() as ID";

        //    cmd.Parameters.AddWithValue("@nom", complejo.nombre);
        //    cmd.Parameters.AddWithValue("@descrip", complejo.descripcion);
        //    cmd.Parameters.AddWithValue("@idTipoComp", complejo.idTipoComplejo);
        //    cmd.Parameters.AddWithValue("@calle", complejo.calle);
        //    cmd.Parameters.AddWithValue("@nroCalle", complejo.numeroCalle);
        //    cmd.Parameters.AddWithValue("@idBarr", complejo.idBarrio);
        //    cmd.Parameters.AddWithValue("@nroTel", complejo.numeroTelefono);
        //    cmd.Parameters.AddWithValue("@idResp", complejo.idResponsable);
        //    cmd.Parameters.AddWithValue("@promEstr", complejo.promedioEstrellas);
        //    cmd.Parameters.AddWithValue("@idEst", complejo.idEstado);

        //    complejo.idComplejoDeportivo = Convert.ToInt32(cmd.ExecuteScalar());

        //    cn.Close();
        //}

        public static void InsertarComplejo(ComplejoDeportivo complejo)
        {
            using(HayEquipoEntities db = new HayEquipoEntities())
            {
                db.ComplejoDeportivo.Add(complejo);
                db.SaveChanges();
            }
        }

        //public static void ActualizarComplejo(ComplejoDeportivoEntidad complejo)
        //{
        //    SqlConnection cn = new SqlConnection();
        //    cn.ConnectionString = ConnectionString.Cadena();
        //    cn.Open();

        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = cn;
        //    cmd.CommandText = @"UPDATE ComplejoDeportivo SET nombre=@nomb, descripcion=@desc, idTipoComplejo=@idTipoComp,
        //                                                     calle=@calle, nroCalle=@nroCalle, idBarrio=@idBarr,                        
        //                                                     nroTelefono=@nroTel, idResponsable=@idResp, 
        //                                                     promedioEstrellas=@promEstr
        //                                               WHERE id=@idComplejo";

        //    cmd.Parameters.AddWithValue("@idComplejo", complejo.idComplejoDeportivo);
        //    cmd.Parameters.AddWithValue("@nomb", complejo.nombre);
        //    cmd.Parameters.AddWithValue("@desc", complejo.descripcion);
        //    cmd.Parameters.AddWithValue("@idTipoComp", complejo.idTipoComplejo);
        //    cmd.Parameters.AddWithValue("@calle", complejo.calle);
        //    cmd.Parameters.AddWithValue("@nroCalle", complejo.numeroCalle);
        //    cmd.Parameters.AddWithValue("@idBarr", complejo.idBarrio);
        //    cmd.Parameters.AddWithValue("@nroTel", complejo.numeroTelefono);
        //    cmd.Parameters.AddWithValue("@idResp", complejo.idResponsable);
        //    cmd.Parameters.AddWithValue("@promEstr", complejo.promedioEstrellas);
        //    //          cmd.Parameters.AddWithValue("@idEst", complejo.idEstado);
        //   // idEstado = @idEst

        //    cmd.ExecuteNonQuery();

        //    cn.Close();
        //}

        public static void ActualizarComplejo(ComplejoDeportivo complejo)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                ComplejoDeportivo comp = db.ComplejoDeportivo.Find(complejo.id);
                comp.id = complejo.id;
                comp.nombre = complejo.nombre;
                comp.descripcion = complejo.descripcion;
                comp.idTipoComplejo = complejo.idTipoComplejo;
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

        //public static void EliminarComplejo(int id)
        //{
        //    SqlConnection cn = new SqlConnection();
        //    cn.ConnectionString = ConnectionString.Cadena();
        //    cn.Open();

        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = cn;
        //    cmd.CommandText = @"DELETE from ComplejoDeportivo WHERE id=@idComplejo";

        //    cmd.Parameters.AddWithValue("@idComplejo", id);

        //    cmd.ExecuteNonQuery();

        //    cn.Close();
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

        //public static List<ComplejoDeportivoEntidad> ObtenerComplejos() {

        //    ComplejoDeportivoEntidad complejo = null;
        //    List<ComplejoDeportivoEntidad> ListaComplejos = new List<ComplejoDeportivoEntidad>();
        //    SqlConnection cn = new SqlConnection();
        //    cn.ConnectionString = ConnectionString.Cadena();
        //    cn.Open();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = cn;
        //    cmd.CommandText = @"SELECT TOP 1000 id, nombre, descripcion, idTipoComplejo, calle, nroCalle, idBarrio, 
        //                        nroTelefono, idResponsable, idUsuario, promedioEstrellas, idEstado 
        //                        FROM ComplejoDeportivo ";
        //    SqlDataReader dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        // no acepta numeros en null
        //        complejo = new ComplejoDeportivoEntidad();
        //        complejo.idComplejoDeportivo = int.Parse(dr["id"].ToString());
        //        complejo.nombre = dr["nombre"].ToString();
        //        complejo.descripcion = dr["descripcion"].ToString();
        //       // complejo.idTipoComplejo = int.Parse(dr["idTipoComplejo"].ToString());
        //        complejo.calle = dr["calle"].ToString();
        //        // complejo.idBarrio = int.Parse(dr["idBarrio"].ToString());
        //        //complejo.numeroCalle = int.Parse(dr["nroCalle"].ToString());
        //        //complejo.numeroTelefono = int.Parse(dr["nroTelefono"].ToString());
        //      //  complejo.idResponsable = int.Parse(dr["idResponsable"].ToString());
        //      //  complejo.idUsuario = int.Parse(dr["idUsuario"].ToString());
        //      //  complejo.promedioEstrellas = float.Parse(dr["promedioEstrellas"].ToString());
        //      //  complejo.idEstado = int.Parse(dr["idEstado"].ToString());
        //        ListaComplejos.Add(complejo);
        //    }
        //    dr.Close();
        //    cn.Close();
        //    return ListaComplejos;

        //}

        public static List<ComplejoDeportivo> ObtenerComplejos()
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.ComplejoDeportivo.ToList();
            }
        }

        //public static ComplejoDeportivoEntidad ObtenerComplejosPorID(int id)
        //{
        //    ComplejoDeportivoEntidad complejo = null;

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
        //        // no acepta numeros en null
        //        complejo = new ComplejoDeportivoEntidad();

        //        complejo.idComplejoDeportivo = int.Parse(dr["id"].ToString());
        //        complejo.nombre = dr["nombre"].ToString();
        //        complejo.descripcion = dr["descripcion"].ToString();
        //        // complejo.idTipoComplejo = int.Parse(dr["idTipoComplejo"].ToString());
        //        complejo.calle = dr["calle"].ToString();
        //        // complejo.idBarrio = int.Parse(dr["idBarrio"].ToString());
        //        //complejo.numeroCalle = int.Parse(dr["nroCalle"].ToString());
        //        //complejo.numeroTelefono = int.Parse(dr["nroTelefono"].ToString());
        //        //  complejo.idResponsable = int.Parse(dr["idResponsable"].ToString());
        //        //  complejo.idUsuario = int.Parse(dr["idUsuario"].ToString());
        //        //  complejo.promedioEstrellas = float.Parse(dr["promedioEstrellas"].ToString());
        //        //  complejo.idEstado = int.Parse(dr["idEstado"].ToString());
        //    }
        //    dr.Close();
        //    cn.Close();
        //    return complejo;

        //}

        public static ComplejoDeportivo ObtenerComplejosPorID(int id)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.ComplejoDeportivo.First(c => c.id == id);
            }
        }

    }
}
