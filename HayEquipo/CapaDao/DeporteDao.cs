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

        public static List<Deporte> ObtenerDeportes()
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.Deporte.ToList();
            }
        }

        public static Deporte ObtenerDeportesPorID(int id)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.Deporte.First(d => d.id == id);
            }
        }
    }
}
