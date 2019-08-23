using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class ValoracionEntidad
    {
        public int? idValoracion { get; set; }
        public int idComplejo { get; set; }
        public int numeroDocumento { get; set; }
        public string reseña { get; set; }
        public float promedioEstrellas { get; set; }
        public DateTime fechaHora { get; set; }
    }
}
