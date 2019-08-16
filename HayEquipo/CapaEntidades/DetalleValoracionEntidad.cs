using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class DetalleValoracionEntidad
    {
        public int? idDetalleValoracionComplejo { get; set; }
        public int numeroEstrellas { get; set; }
        public int idTipoValoracion { get; set; }
        public int idValoracion { get; set; }  
    }
}
