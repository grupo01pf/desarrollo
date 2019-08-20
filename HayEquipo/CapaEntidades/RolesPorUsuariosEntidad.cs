using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
   public  class RolesPorUsuariosEntidad : UsuarioEntidad
    {
        public int? idRolesPorUsuarios { get; set; }
        public RolEntidad idRol { get; set; }



       
    }
}
