using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;

namespace CapaDao
{
    public class EncuentroDeportivoDao
    {
        public static List<EncuentroDeportivoEntidad> obtenerEncuentrosDeportivos() {

            EncuentroDeportivoEntidad encuentro = null;
            List<EncuentroDeportivoEntidad> ListaDeportes = new List<EncuentroDeportivoEntidad>();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                encuentro = new EncuentroDeportivoEntidad();
                encuentro.idDeporte = int.Parse(dr["id"].ToString());
               // encuentro. = dr["nombre"].ToString();
                ListaDeportes.Add(encuentro);
            }
            dr.Close();
            cn.Close();
            return ListaDeportes;
        }
    }
}
