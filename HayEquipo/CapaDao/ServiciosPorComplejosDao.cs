using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;

namespace CapaDao
{
    public class ServiciosPorComplejosDao
    {
        public static void InsertarServicioPorComplejo(ServiciosPorComplejos serv)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                db.ServiciosPorComplejos.Add(serv);
                db.SaveChanges();
            }
        }

        public static void EliminarServicioPorComplejo(int id)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                ServiciosPorComplejos serv = db.ServiciosPorComplejos.Find(id);
                db.ServiciosPorComplejos.Remove(serv);
                db.SaveChanges();
            }
        }
    }
}
