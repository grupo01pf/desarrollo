
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class MensajeQueryEntidad
    {
        // MENSAJE
        public int idMensaje { get; set; }
        public int idEncuentroMensaje { get; set; }
        public string textoMensaje { get; set; }
        public Nullable<System.DateTime> fechaHoraMensaje { get; set; }
        public int idUsuarioMensaje { get; set; }

        // USUARIO

        public int idUsuario { get; set; }
        public string nombreUsuario { get; set; }
        // public string contraseña { get; set; }
        // public string email { get; set; }
        // public byte[] avatar { get; set; }
        // public Nullable<System.DateTime> fechaAlta { get; set; }
        // public Nullable<System.DateTime> fechaBaja { get; set; }
    }
}
