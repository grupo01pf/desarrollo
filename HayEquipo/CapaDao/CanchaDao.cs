using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;

namespace CapaDao
{
    public class CanchaDao
    {

        public static void InsertarCancha(Cancha cancha)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                db.Cancha.Add(cancha);
                db.SaveChanges();
            }
        }

        public static void ActualizarCancha(Cancha cancha)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                Cancha can = db.Cancha.Find(cancha.id);
                can.id = cancha.id;
                can.nombre = cancha.nombre;
                can.descripcion = cancha.descripcion;
                can.idTipoCancha = cancha.idTipoCancha;
                can.idComplejo = cancha.idComplejo;

                db.Entry(can).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
        }

        public static void EliminarCancha(int id)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                Cancha cancha = db.Cancha.Find(id);
                db.Cancha.Remove(cancha);
                db.SaveChanges();
            }
        }

        public static void EliminarCanchasPorComplejo(int idComp)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                db.Cancha.RemoveRange(db.Cancha.Where(c => c.idComplejo == idComp));
                db.SaveChanges();
            }
        }

        public static List<spObtenerCanchasPorComplejos_Result> ObtenerCanchasPorComplejos(int idComp)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                List<spObtenerCanchasPorComplejos_Result> canchas = new List<spObtenerCanchasPorComplejos_Result>();
                var cancha = db.spObtenerCanchasPorComplejos(idComp);
                foreach (var item in cancha)
                {
                    canchas.Add(item);
                }
                return canchas;
            }
        }

        public static Cancha ObtenerCanchasPorID(int id)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.Cancha.First(c => c.id == id);
            }
        }
    }
}
