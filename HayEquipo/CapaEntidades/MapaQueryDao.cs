using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class MapaQueryDao
    {

        // MAPA
        public int idMapa { get; set; }
        //public Nullable<double> latitud { get; set; }
        //public Nullable<double> longitud { get; set; }
        public string latitud { get; set; }
        public string longitud { get; set; }

        // COMPLEJO DEPORTIVO
        public int id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public string deportes { get; set; }
        public string calle { get; set; }
        public Nullable<int> nroCalle { get; set; }
        public Nullable<int> idBarrio { get; set; }
        public Nullable<int> nroTelefono { get; set; }
        public Nullable<System.TimeSpan> horaApertura { get; set; }
        public Nullable<System.TimeSpan> horaCierre { get; set; }
        public Nullable<int> idResponsable { get; set; }
        public Nullable<double> promedioEstrellas { get; set; }
        public Nullable<System.DateTime> fechaRegistro { get; set; }
        public byte[] avatar { get; set; }
        public Nullable<int> idEstado { get; set; }
        public Nullable<int> mapa { get; set; }
    }
}
