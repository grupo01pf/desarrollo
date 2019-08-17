using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;

namespace CapaDao
{
    public class ZonaDao
    {
        public static List<ZonaEntidad> obtenerZonas() {

            ZonaEntidad zona = null;
            List<ZonaEntidad> ListaZona = new List<ZonaEntidad>();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "SELECT TOP 100 id, nombre FROM Zona";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read()) {

                zona = new ZonaEntidad();
                zona.idZona = int.Parse(dr["id"].ToString());
                zona.nombre = dr["nombre"].ToString();
                ListaZona.Add(zona);

            }
            dr.Close();
            cn.Close();
            return ListaZona;
        }
    }
}
