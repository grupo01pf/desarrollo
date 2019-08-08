using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    class DeportistaEntidad:PersonaEntidad
    {
        public int? idDeportista { get; set; }
        public float promedioEstrellas { get; set; }
        public int idEstado { get; set; }        
    }
}
