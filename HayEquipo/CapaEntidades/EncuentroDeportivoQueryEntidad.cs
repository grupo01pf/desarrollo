using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class EncuentroDeportivoQueryEntidad
    {
        // cantidad de partidos para reporte
        public int cantidadPartidosxDeporte { get; set; }

        // Encuentro Deportivo

        public int? idEncuentroDeportivo { get; set; }
        public int idUsuario { get; set; }
        public DateTime fechaCreacionEncuentro { get; set; }
        public DateTime fechaDestruccionEncuentro { get; set; }
        public int idDeporte { get; set; }
        public int idComplejo { get; set; }
        public int idEquipo { get; set; }
        public DateTime fechaInicioEncuentro { get; set; }
        public DateTime fechaFinEncuentro { get; set; }
        public int idEstado { get; set; }
        public string tipoEncuentro { get; set; }
        public string accesibilidad { get; set; }
        public DateTime horaInicio { get; set; }
        public DateTime horaFin { get; set; }
        public string nombreLP { get; set; }

        public string direccion { get; set; }
        // public int numeroCalle { get; set; }
        public string clave { get; set; }
        public int capacidad { get; set; }


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
        public int idUsuarioComplejo { get; set; }
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
        public string nombreTipoCancha { get; set; }
        public string descripcionTipoCancha { get; set; }

        // Usuario
        public int? idUsuarioUsuario { get; set; }
        public string nombreUsuario { get; set; }
        public string contraseña { get; set; }
        public string email { get; set; }
        public byte[] avatar { get; set; }
        public DateTime fechaAlta { get; set; }
        public DateTime fechaBaja { get; set; }

        //// TipoEncuentroDeportivo
        //public int? idTipoEncuentroDeportivo { get; set; }
        //public string nombreTipoEncuentroDeportivo { get; set; }
        //public string descripcionTipoEncuentroDeportivo { get; set; }

        //// Accesibilidad
        //public int? idAccesibilidadAccesibilidad { get; set; }
        //public string nombreAccesibilidad { get; set; }
        //public string descripcionAccesibilidad { get; set; }

        //// LugarPublico
        //public int? idLugarPublico { get; set; }
        //public string nombreLugarPublico { get; set; }
        //public string descripcionLugarPublico { get; set; }
        //public string calleLugarPublico { get; set; }
        //public int nroCalleLugarPublico { get; set; }
        //public int idBarrioLugarPublico { get; set; }


        public EncuentroDeportivoQueryEntidad() { }

        public EncuentroDeportivoQueryEntidad(int? idEncuentroDeportivo, int idAdministrador, DateTime fechaCreacionEncuentro, DateTime fechaDestruccionEncuentro,
        int idDeporte, int idComplejo, string calle, int numeroCalle, int idEquipo, DateTime fechaInicioEncuentro, DateTime fechaFinEncuentro,
        int idEstado, DateTime horaInicio, DateTime horaFIn, int tipoEncuentro, int accesibilidad, string clave,
        int? idComplejoDeportivo, string nombreComplejo, string descripcion, int idTipoComplejo, string calleComplejo, int numeroCalleComplejo,
        int idBarrio, int numeroTelefono, int idResponsable, int idUsuario, float promedioEstrellas, int idEstadoComplejo,
        int? idDeporteDeporte, string nombreDeporte,
        int? idEstadoEstado, string nombreEstado, string descripcionEstado,
        int? idHorario, DateTime fecha, DateTime horaInicioHorario, DateTime horaFinHorario, int idEstadoHorario,
        int? idTipoCancha, string nombreTipoCancha, string descripcionTipoCancha,
        int? idUsuarioUsuario, string nombreUsuario, string contraseña, string email, byte[] avatar, DateTime fechaAlta, DateTime fechaBaja,
        int? idTipoEncuentroDeportivo, string nombreTipoEncuentroDeportivo, string descripcionTipoEncuentroDeportivo,
        int? idAccesibilidad, string nombreAccesibilidad, string descripcionAccesibilidad)
        {
            // Encuentro Deportivo
            this.idEncuentroDeportivo = idEncuentroDeportivo;
            //  this.idAdministrador = idAdministrador;
            this.fechaCreacionEncuentro = fechaCreacionEncuentro;
            this.fechaDestruccionEncuentro = fechaDestruccionEncuentro;
            this.idDeporte = idDeporte;
            this.idComplejo = idComplejo;
            // this.calle = calle;
            //  this.numeroCalle = numeroCalle;
            this.idEquipo = idEquipo;
            this.fechaInicioEncuentro = fechaInicioEncuentro;
            this.fechaFinEncuentro = fechaFinEncuentro;
            this.idEstado = idEstado;
            this.horaInicio = horaInicio;
            this.horaFin = horaFIn;
            //   this.tipoEncuentro = tipoEncuentro;
            //   this.accesibilidad = accesibilidad;
            //   this.clave = clave;

            // Complejo Deportivo
            this.idComplejoDeportivo = idComplejoDeportivo;
            this.nombreComplejo = nombreComplejo;
            this.descripcion = descripcion;
            this.idTipoComplejo = idTipoComplejo;
            this.calleComplejo = calleComplejo;
            this.numeroCalleComplejo = numeroCalleComplejo;
            this.idBarrio = idBarrio;
            this.numeroTelefono = numeroTelefono;
            this.idResponsable = idResponsable;
            this.idUsuario = idUsuario;
            this.promedioEstrellas = promedioEstrellas;
            this.idEstadoComplejo = idEstadoComplejo;

            // Deporte
            this.idDeporteDeporte = idDeporteDeporte;
            this.nombreDeporte = nombreDeporte;

            // Estado
            this.idEstadoEstado = idEstadoEstado;
            this.nombreEstado = nombreEstado;
            this.descripcionEstado = descripcionEstado;

            // Horario
            this.idHorario = idHorario;
            this.nombreHorario = nombreHorario;
            this.fecha = fecha;
            this.horaInicioHorario = horaInicioHorario;
            this.horaFinHorario = horaFinHorario;
            this.idEstadoHorario = idEstadoHorario;

            // Tipo Cancha
            this.idTipoCancha = idTipoCancha;
            this.nombreTipoCancha = nombreTipoCancha;
            this.descripcionTipoCancha = descripcionTipoCancha;

            // Usuario
            this.idUsuarioUsuario = idUsuarioUsuario;
            this.nombreUsuario = nombreUsuario;
            this.contraseña = contraseña;
            this.email = email;
            this.avatar = avatar;
            this.fechaAlta = fechaAlta;
            this.fechaBaja = fechaBaja;

            // TipoEncuentroDeportivo
            //this.idTipoEncuentroDeportivo = idTipoEncuentroDeportivo;
            //this.nombreTipoEncuentroDeportivo = nombreTipoEncuentroDeportivo;
            //this.descripcionTipoEncuentroDeportivo = descripcionTipoEncuentroDeportivo;

            //Accesibilidad
            //  this.idAccesibilidad = idAccesibilidad;
            //this.nombreAccesibilidad = nombreAccesibilidad;
            //this.descripcionAccesibilidad = descripcionAccesibilidad;

        }

        public EncuentroDeportivoQueryEntidad(int? idEncuentroDeportivo, string calle, string nombreUsuario,
            string nombreDeporte, string nombreTipoEncuentroDeportivo)
        {
            //DateTime fechaInicioEncuentro,
            // Encuentro Deportivo
            this.idEncuentroDeportivo = idEncuentroDeportivo;
            //  this.calle = calle;
            // this.fechaInicioEncuentro = fechaInicioEncuentro;

            // Usuario
            this.nombreUsuario = nombreUsuario;

            // Deporte
            this.nombreDeporte = nombreDeporte;

            // TipoEncuentroDeportivo
            // this.nombreTipoEncuentroDeportivo = nombreTipoEncuentroDeportivo;


        }


    }
}
