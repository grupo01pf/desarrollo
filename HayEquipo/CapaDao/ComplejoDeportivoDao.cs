using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;

namespace CapaDao
{
    public class ComplejoDeportivoDao
    {

        public static List<ComplejoDeportivoEntidad> obtenerComplejos() {

            ComplejoDeportivoEntidad complejo = null;
            List<ComplejoDeportivoEntidad> ListaComplejos = new List<ComplejoDeportivoEntidad>();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "SELECT TOP 1000 id, nombre, descripcion, idTipoComplejo, calle, nroCalle, idBarrio, nroTelefono, idResponsable, idUsuario, promedioEstrellas, idEstado FROM ComplejoDeportivo ";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                // no acepta numeros en null
                complejo = new ComplejoDeportivoEntidad();
                complejo.idComplejoDeportivo = int.Parse(dr["id"].ToString());
                complejo.nombre = dr["nombre"].ToString();
                complejo.descripcion = dr["descripcion"].ToString();
               // complejo.idTipoComplejo = int.Parse(dr["idTipoComplejo"].ToString());
                complejo.calle = dr["calle"].ToString();
               // complejo.idBarrio = int.Parse(dr["idBarrio"].ToString());
                complejo.numeroCalle = int.Parse(dr["nroCalle"].ToString());
                complejo.numeroTelefono = int.Parse(dr["nroTelefono"].ToString());
              //  complejo.idResponsable = int.Parse(dr["idResponsable"].ToString());
              //  complejo.idUsuario = int.Parse(dr["idUsuario"].ToString());
              //  complejo.promedioEstrellas = float.Parse(dr["promedioEstrellas"].ToString());
              //  complejo.idEstado = int.Parse(dr["idEstado"].ToString());
                ListaComplejos.Add(complejo);
            }
            dr.Close();
            cn.Close();
            return ListaComplejos;

        }
    }
}
