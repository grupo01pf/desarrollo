using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class EncuentroDeportivoEntidad
    {
        public int? idEncuentroDeportivo { get; set; }
        public int idAdministrador { get; set; }
        public DateTime fechaCreacionEncuentro { get; set; }
        public DateTime fechaDestruccionEncuentro { get; set; }
        public int idDeporte { get; set; }
        public int idComplejo { get; set; }
        public string calle { get; set; }
        public int numeroCalle { get; set; }
        public int idEquipo { get; set; }
        public DateTime fechaInicioEncuentro { get; set; }
        public DateTime fechaFinEncuentro { get; set; }
        public int idEstado { get; set; }
    }
}
