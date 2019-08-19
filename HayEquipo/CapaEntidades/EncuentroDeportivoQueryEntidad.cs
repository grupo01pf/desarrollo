using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class EncuentroDeportivoQueryEntidad
    {

        // Encuentro Deportivo
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
        public DateTime horaIncio { get; set; }
        public DateTime horaFIn { get; set; }
        public int tipoEncuentro { get; set; }
        public int accesibilidad { get; set; }
        public string clave { get; set; }

        // Complejo Deportivo
        public int? idComplejoDeportivo { get; set; }
        public string nombreComplejo { get; set; }
        public string descripcion { get; set; }
        public int idTipoComplejo { get; set; }
        public string calleComplejo { get; set; }
        public int numeroCalleComplejo { get; set; }
        public int idBarrio { get; set; }
        public int numeroTelefono { get; set; }
        public int idResponsable { get; set; }
        public int idUsuario { get; set; }
        public float promedioEstrellas { get; set; }
        public int idEstadoComplejo { get; set; }

        // Deporte
        public int? idDeporteDeporte { get; set; }
        public string nombreDeporte { get; set; }

        // Estado
        public int? idEstadoEstado { get; set; }
        public string nombreEstado { get; set; }
        public string descripcionEstado { get; set; }

        // Horario
        public int? idHorario { get; set; }
        public string nombreHorario { get; set; }
        public DateTime fecha { get; set; }
        public DateTime horaInicioHorario { get; set; }
        public DateTime horaFinHorario { get; set; }
        public int idEstadoHorario { get; set; }

        // Tipo Cancha
        public int? idTipoCancha { get; set; }
        public string nombreTIpoCancha { get; set; }
        public string descripcionTipoCancha { get; set; }

        // Usuario
        public int? idUsuarioUsuario { get; set; }
        public string nombreUsuario { get; set; }
        public string contraseña { get; set; }
        public string email { get; set; }
        public byte[] avatar { get; set; }
        public DateTime fechaAlta { get; set; }
        public DateTime fechaBaja { get; set; }

        // TipoEncuentroDeportivo
        public int? id { get; set; }
        public string nombreTipoEncuentroDeportivo { get; set; }
        public string descripcionTipoEncuentroDeportivo { get; set; }




    }
}
