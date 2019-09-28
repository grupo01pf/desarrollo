using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;
using System.Configuration;

namespace CapaDao
{
    public class BarrioDao
    {
        public static List<Barrio> obtenerBarrios()
        {
            using(HayEquipoEntities db=new HayEquipoEntities())
            {
                return db.Barrio.ToList();
            }
        }

        public static Barrio ObtenerBarriosPorID(int id)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.Barrio.First(b => b.id == id);
            }
        }
    }
}
