using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class LocalidadEntidad
    {
        public int? idLocalidad { get; set; }
        public string nombre { get; set; }
        public int idProvincia { get; set; }
    }
}
