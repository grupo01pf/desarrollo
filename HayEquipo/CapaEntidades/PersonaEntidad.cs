using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
     public class PersonaEntidad
    {
        public int? idPersona { get; set; }
        public int idTipoDocumento { get; set; }
        public int numeroDocumento { get; set; }
        public string apellido { get; set; }
        public string nombres { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public string sexo { get; set; }
        public string calle { get; set; }
        public int idBarrio { get; set; }
        public int numeroCalle { get; set; }
        public int numeroTelefono { get; set; }
        public int idUsuario { get; set; }
    }
}
