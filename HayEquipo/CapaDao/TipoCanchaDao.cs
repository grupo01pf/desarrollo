using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;

namespace CapaDao
{
    public class TipoCanchaDao
    {
        public static List<TipoCancha> ObtenerTipoPorIdDeporte(int idDeporte)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                List<TipoCancha> tipos = new List<TipoCancha>();
                var tipo = db.TipoCancha.Where(c => c.idDeporte == idDeporte);
                foreach (var item in tipo)
                {
                    tipos.Add(item);
                }
                return tipos;
            }
        }

        public static TipoCancha ObtenerTipoPorID(int id)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.TipoCancha.First(c => c.id == id);
            }
        }

    }
}
