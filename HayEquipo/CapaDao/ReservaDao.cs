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

        public static void acutalizarReserva(int idEncuentro, int estado)
        {
            //using (HayEquipoEntities db = new HayEquipoEntities())
            //{
            //    Reserva reserva = db.Reserva.First(r => r.id == idEncuentro);
            //    reserva.idEstado = estado;
            //    db.Entry(reserva).State = System.Data.Entity.EntityState.Modified;
            //    db.SaveChanges();
            //  }


            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_ReservaDao_ActualizarReserva", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idEncuentro", idEncuentro);
            cmd.Parameters.AddWithValue("@estado", estado);
            cmd.ExecuteNonQuery();
            cn.Close();


        }

        }
}
