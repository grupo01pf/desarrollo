using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class ComplejoDeportivoEntidad
    {
        public int? idComplejoDeportivo { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public int idTipoComplejo { get; set; }
        public string calle { get; set; }
        public int numeroCalle { get; set; }
        public int idBarrio { get; set; }
        public int numeroTelefono { get; set; }
        public int idResponsable { get; set; }
        public int idUsuario { get; set; }
        public float promedioEstrellas { get; set; }
        public int idEstado { get; set; }
    }
}
