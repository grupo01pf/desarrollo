using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    class CanchaEntidad
    {
        public int? idCancha { get; set; }
        public int idDeporte { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public int idTipoCancha { get; set; }
    }
}
