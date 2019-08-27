using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;

namespace CapaDao
{
    public class TipoDocumentoDao
    {

        public static List<TipoDocumentoEntidad> obtenerTiposDocumento()
        {
            TipoDocumentoEntidad TipoDocumento = null;
            List<TipoDocumentoEntidad> ListaTipoDocumento = new List<TipoDocumentoEntidad>();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "SELECT * FROM TipoDocumento";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                TipoDocumento = new TipoDocumentoEntidad();
                TipoDocumento.idTipoDocumento = int.Parse(dr["id"].ToString());
                TipoDocumento.nombre = dr["nombre"].ToString();
                ListaTipoDocumento.Add(TipoDocumento);

            }
            dr.Close();
            cn.Close();
            return ListaTipoDocumento;
        }
    }
}
