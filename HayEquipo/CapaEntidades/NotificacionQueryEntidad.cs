﻿using System;
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
        public string notificacion { get; set; }
        public string estado { get; set; }

        // Usuario
        public int idUsuario { get; set; }
        public string nombreUsuario { get; set; }

    }
}
