using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace CapaEntidades
{
    public class AgendaEntidad
    {
        // Cancha
        public int idCancha { get; set; }
        public string nombreCancha { get; set; }
        public string descripcionCancha { get; set; }
        public Nullable<int> idTipoCancha { get; set; }
        public Nullable<int> idComplejoCancha { get; set; }
        public Nullable<double> precioCancha { get; set; }

        // Horario

        public int idHorario { get; set; }
        public string nombreHorario { get; set; }
        public Nullable<System.DateTime> fechaHorario { get; set; }
        public Nullable<System.TimeSpan> horaInicioHorario { get; set; }
        public Nullable<System.TimeSpan> horaFinHorario { get; set; }
        public Nullable<int> idEstadoHorario { get; set; }

        // CanchasPorHorarios

        public int idCanchasPorHorarios { get; set; }
        public Nullable<int> idHorarioCanchasPorHorarios { get; set; }
        public Nullable<int> idCanchaCanchasPorHorarios { get; set; }
        public virtual Cancha CanchaCanchasPorHorarios { get; set; }
        public virtual Horario HorarioCanchasPorHorarios { get; set; }

        // TipoCancha
        public int idTipoCanchaTipoCancha { get; set; }
        public string nombreTipoCancha { get; set; }
        public Nullable<int> idDeporteTipoCancha { get; set; }
        public Nullable<int> capacidadTipoCancha { get; set; }

        

        // CanchasPorComplejos
    
        //public int idCanchasPorComplejos { get; set; }
        //public Nullable<int> idComplejoCanchasPorComplejos { get; set; }
        //public Nullable<int> idCanchaCanchasPorComplejos{ get; set; }

        

        // Deporte
        public int idDeporte { get; set; }
        public string nombreDeporte { get; set; }
        public byte[] avatarDeporte { get; set; }

        // ComplejoDeportivo

        public int idComplejoDeportivo { get; set; }
        public string nombreComplejoDeportivo { get; set; }
        public string descripcionComplejoDeportivo { get; set; }
        public string calle { get; set; }
        public Nullable<int> nroCalle { get; set; }
        public Nullable<int> idBarrio { get; set; }
        public Nullable<int> nroTelefono { get; set; }
        public Nullable<int> idResponsable { get; set; }
        public Nullable<double> promedioEstrellas { get; set; }
        public Nullable<int> idEstado { get; set; }
        public Nullable<int> idDeporte1 { get; set; }
        public Nullable<int> idDeporte2 { get; set; }
        public Nullable<int> idDeporte3 { get; set; }
        public string mapa { get; set; }
        public byte[] avatar { get; set; }
        public Nullable<System.TimeSpan> horaApertura { get; set; }
        public Nullable<System.TimeSpan> horaCierre { get; set; }



        //EncuentroDeportivo

        public int idEncuentroDeportivo { get; set; }
        public Nullable<int> idAdmin { get; set; }
        public Nullable<System.DateTime> fechaCreacionEncuentro { get; set; }
        public Nullable<System.DateTime> fechaDestruccionEncuentro { get; set; }
        public Nullable<int> idDeporteEncuentroDeportivo { get; set; }
        public Nullable<int> idComplejoEncuentroDeportivo { get; set; }
        public string nombreLP { get; set; }
        public string direccion { get; set; }
        public Nullable<int> idEquipo { get; set; }
        public Nullable<System.DateTime> fechaInicioEncuentro { get; set; }
        public Nullable<System.DateTime> fechaFinEncuentro { get; set; }
        public Nullable<int> idEstadoEncuentroDeportivo { get; set; }
        public Nullable<int> idUsuarioEncuentroDeportivo { get; set; }
        public Nullable<System.TimeSpan> horaInicioEncuentroDeportivo { get; set; }
        public Nullable<System.TimeSpan> horaFinEncuentroDeportivo { get; set; }
        public string tipoEncuentro { get; set; }
        public string accesibilidad { get; set; }
        public string clave { get; set; }
        public Nullable<int> capacidad { get; set; }

    }
}
