using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class MensajeEntidad
    {
        public int? idMensaje { get; set; }
        public int idEncuentro { get; set; }
        public string texto { get; set; }
        public DateTime fechaHora { get; set; }
        public int idUsuario { get; set; }
    }
}

