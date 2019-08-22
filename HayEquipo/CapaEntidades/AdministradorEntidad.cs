using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class AdministradorEntidad:PersonaEntidad
    {
        public int? idAdministrador { get; set; }
        public int numeroLegajo { get; set; }
        public DateTime fechaIngreso { get; set; }
    }
}
