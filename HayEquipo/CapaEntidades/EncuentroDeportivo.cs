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
    using System.Collections.Generic;
    
    public partial class EncuentroDeportivo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EncuentroDeportivo()
        {
            this.InvitacionEncuentro = new HashSet<InvitacionEncuentro>();
            this.Mensaje = new HashSet<Mensaje>();
        }
    
        public int id { get; set; }
        public Nullable<int> idAdmin { get; set; }
        public Nullable<System.DateTime> fechaCreacionEncuentro { get; set; }
        public Nullable<System.DateTime> fechaDestruccionEncuentro { get; set; }
        public Nullable<int> idDeporte { get; set; }
        public Nullable<int> idComplejo { get; set; }
        public string nombreLP { get; set; }
        public string direccion { get; set; }
        public Nullable<int> idEquipo { get; set; }
        public Nullable<System.DateTime> fechaInicioEncuentro { get; set; }
        public Nullable<System.DateTime> fechaFinEncuentro { get; set; }
        public Nullable<int> idEstado { get; set; }
        public Nullable<int> idUsuario { get; set; }
        public Nullable<System.TimeSpan> horaInicio { get; set; }
        public Nullable<System.TimeSpan> horaFin { get; set; }
        public string tipoEncuentro { get; set; }
        public string accesibilidad { get; set; }
        public string clave { get; set; }
        public Nullable<int> capacidad { get; set; }
        public Nullable<int> idMapa { get; set; }
        public Nullable<int> idClave { get; set; }
    
        public virtual ComplejoDeportivo ComplejoDeportivo { get; set; }
        public virtual Deporte Deporte { get; set; }
        public virtual Deportista Deportista { get; set; }
        public virtual Equipo Equipo { get; set; }
        public virtual Estado Estado { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<InvitacionEncuentro> InvitacionEncuentro { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Mensaje> Mensaje { get; set; }
    }
}
