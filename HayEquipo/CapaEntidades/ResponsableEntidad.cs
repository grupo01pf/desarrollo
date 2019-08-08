using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    class ResponsableEntidad:PersonaEntidad
    {
        public int? idResponsable { get; set; }
        public string email { get; set; }
    }
}
