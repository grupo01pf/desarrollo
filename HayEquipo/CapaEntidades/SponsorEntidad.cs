using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    class SponsorEntidad
    {
        public int? idSponsor { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public int idRubro { get; set; }
        public int idResponsable { get; set; }
        public DateTime fechaInicioContrato { get; set; }
        public DateTime fechaFinContrato { get; set; }
        public int idEstado { get; set; }
    }
}
