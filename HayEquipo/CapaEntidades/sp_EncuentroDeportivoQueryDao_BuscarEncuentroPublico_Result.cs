//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CapaEntidades
{
    using System;
    
    public partial class sp_EncuentroDeportivoQueryDao_BuscarEncuentroPublico_Result
    {
        public int id { get; set; }
        public string Usuario { get; set; }
        public int idUsuario { get; set; }
        public Nullable<System.DateTime> fechaInicioEncuentro { get; set; }
        public string Deporte { get; set; }
        public string Estado { get; set; }
        public Nullable<System.TimeSpan> horaInicio { get; set; }
        public Nullable<System.TimeSpan> horaFin { get; set; }
        public string Lugar { get; set; }
        public string direccion { get; set; }
        public string tipoEncuentro { get; set; }
        public string accesibilidad { get; set; }
        public string clave { get; set; }
        public Nullable<int> capacidad { get; set; }
    }
}
