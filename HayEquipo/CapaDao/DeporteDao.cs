using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;

namespace CapaDao
{
    public class DeporteDao
    {
        public static List<DeporteEntidad> obtenerDeportes() {

            DeporteEntidad deporte = null;
            List<DeporteEntidad> ListaDeportes = new List<DeporteEntidad>();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "SELECT TOP 100 id, nombre FROM Deporte d";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read()) {

                deporte = new DeporteEntidad();
                deporte.idDeporte = int.Parse(dr["id"].ToString());
                deporte.nombre = dr["nombre"].ToString();
                ListaDeportes.Add(deporte);
            }
            dr.Close();
            cn.Close();
            return ListaDeportes;

        }
    }
}
