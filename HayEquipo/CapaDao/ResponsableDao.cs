using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;
using System.Configuration;
using System.Data;

namespace CapaDao
{
    public class ResponsableDao
    {

        public static Responsable ObtenerResponsablePorIdUsuario(int idUs)
        {
            using (HayEquipoEntities db = new HayEquipoEntities())
            {
                return db.Responsable.First(r => r.idUsuario == idUs);
            }
        }

    }
}
