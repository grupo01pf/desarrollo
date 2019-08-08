using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    class EquipoEntidad
    {
        public int? idEquipo { get; set; }
        public string nombre { get; set; }
        public int capacidad { get; set; }
        public int numeroDeportistasActual { get; set; }
        public float promedioEstrellas { get; set; }
        public int idEstado { get; set; }
    }
}
