using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class NotificacionQueryEntidad
    {

        // Notificacion
        public int idNotificacion { get; set; }
        public int idEmisor { get; set; }
        public int idReceptor { get; set; }
        public string texto { get; set; }
        public int estado { get; set; }

        public int idEncuentro { get; set; }

        // Usuario
        public int idUsuario { get; set; }
        public string nombreUsuario { get; set; }

        //Estado
        
        public int idEstado { get; set; }
        public string nombreEstado { get; set; }
        public string descripcionEstado { get; set; }

    }
}
