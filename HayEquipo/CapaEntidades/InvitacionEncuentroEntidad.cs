using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class InvitacionEncuentroEntidad
    {
        public int? idInvitacionEncuentro { get; set; }
        public DateTime fechaHora { get; set; }
        public int idEncuentro { get; set; }
        public int idInvitado { get; set; }
    }
}
