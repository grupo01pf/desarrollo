using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class LugarPublicoEntidad
    {
        public int? id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public string calle { get; set; }
        public int nroCalle { get; set; }
        public int idBarrio { get; set; }
    }
}
