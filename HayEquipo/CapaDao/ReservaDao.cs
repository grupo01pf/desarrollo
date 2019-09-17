using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;
using System.Data;

namespace CapaDao
{
    public class ReservaDao
    {

        //public static void InsertarReserva(Reserva reserva)
        //{

        //    using (HayEquipoEntities db = new HayEquipoEntities())
        //    {

        //        db.Reserva.Add(reserva);
        //        db.SaveChanges();
        //    }
        //}


        public static void InsertarReserva(Reserva r)
        {

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_ReservaDao_InsertarRerserva", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fecha", r.fechaReserva);
            // cmd.Parameters.AddWithValue("@hora", r.horaReserva);
            cmd.Parameters.AddWithValue("@idEncuentro", r.idEncuentroDeportivo);
            cmd.Parameters.AddWithValue("@idEstado", r.idEstado);
            cmd.ExecuteNonQuery();
            cn.Close();
        }

    }
}
