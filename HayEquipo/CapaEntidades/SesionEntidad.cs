using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    class SesionEntidad
    {
        public int? idSesion { get; set; }
        public int idUsuario { get; set; }
        public DateTime horaInicio { get; set; }
        public DateTime horaFin { get; set; }
        public int idEstado { get; set; }
    }
}
