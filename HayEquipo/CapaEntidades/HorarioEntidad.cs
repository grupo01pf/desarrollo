using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class HorarioEntidad
    {
        public int? idHorario { get; set; }
        public string nombre { get; set; }
        public DateTime fecha { get; set; }
        public DateTime horaInicio { get; set; }
        public DateTime horaFin { get; set; }
        public int idEstado { get; set; }
    }
}
