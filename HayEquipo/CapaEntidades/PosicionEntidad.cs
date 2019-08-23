using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class PosicionEntidad
    {
        public int? idPosicion { get; set; }
        public string nombre { get; set; }
        public string descripcion{ get; set; }
        public int idDeporte{ get; set; }
    }
}
