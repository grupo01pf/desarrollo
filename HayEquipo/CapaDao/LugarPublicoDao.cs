using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;

namespace CapaDao
{
    public class LugarPublicoDao
    {
        public static int insertarLugarPublico(LugarPublicoEntidad lp)
        {
            int nroID = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            // SqlTransaction tr = cn.BeginTransaction();
            // try {

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;

            cmd.CommandText = @"INSERT INTO LugarPublico (nombre,descripcion,calle, nroCalle,idBarrio) 
                                VALUES (@nombre,@descripcion,@calle, @nroCalle,@idBarrio); select Scope_Identity() as ID";

            cmd.Parameters.AddWithValue("@nombre", lp.nombre);
            cmd.Parameters.AddWithValue("@descripcion", lp.descripcion);
            cmd.Parameters.AddWithValue("@calle", lp.calle);
            cmd.Parameters.AddWithValue("@nroCalle", lp.nroCalle);
            cmd.Parameters.AddWithValue("@idBarrio", lp.idBarrio);
            // lp.id = Convert.ToInt32(cmd.ExecuteScalar());
            // nroID = lp.id;
            nroID = (int) Convert.ToInt32(cmd.ExecuteScalar());
            cmd.ExecuteNonQuery();
            cn.Close();
            return nroID;
        }

        /*
        private static int obtenerIdLuagrPublico()
        {

            LugarPublicoEntidad lp = new LugarPublicoEntidad();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "SELECT  id FROM LugarPublico ";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                barrio = new BarrioEntidad();
                barrio.idBarrio = int.Parse(dr["id"].ToString());
                barrio.nombre = dr["nombre"].ToString();
                ListaBarrio.Add(barrio);

            }
            dr.Close();
            cn.Close();
            return ListaBarrio;
        }
        */
    }
}
