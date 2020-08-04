using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class TipoCanchaEntidad
    {
        public int? idTipoCancha { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public int idDeporte { get; set; }
        public int capacidad { get; set; }

        public string nombreDeporte { get; set; }

    }
}
