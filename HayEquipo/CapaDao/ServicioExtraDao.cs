using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;

namespace CapaDao
{
    public class ServicioExtraDao
    {
        public static List<ServicioExtra> ObtenerServicios()
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.ServicioExtra.ToList();
            }
        }

        public static ServicioExtra ObtenerServicioPorID(int id)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.ServicioExtra.First(s => s.id == id);
            }
        }

    }
}
