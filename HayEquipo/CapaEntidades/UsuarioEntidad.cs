using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class UsuarioEntidad
    {
        public int idUsuario { get; set; }
        public string nombreUsuario { get; set; }
        public string contraseña { get; set; }
        public string email { get; set; }
        public byte[] avatar { get; set; }
        public DateTime fechaAlta{ get; set; }
        public DateTime fechaBaja { get; set; }
        public string rol { get; set; }

        public bool bloqueado { get; set; }


        public UsuarioEntidad() { }

        public UsuarioEntidad(int id,string nombre, string contraseña, string email)
        {
            this.idUsuario = id;
            this.nombreUsuario = nombre;
            this.contraseña = contraseña;
            this.email = email;
        }

        public UsuarioEntidad(byte[] avatar)
        {
            
            this.avatar = avatar;
        }
    }
}
