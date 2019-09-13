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
    
    public partial class ComplejoDeportivo
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ComplejoDeportivo()
        {
            this.Cancha = new HashSet<Cancha>();
            this.EncuentroDeportivo = new HashSet<EncuentroDeportivo>();
            this.ServiciosPorComplejos = new HashSet<ServiciosPorComplejos>();
            this.ValoracionComplejo = new HashSet<ValoracionComplejo>();
        }
    
        public int id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
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
    
        public virtual Barrio Barrio { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cancha> Cancha { get; set; }
        public virtual Deporte Deporte { get; set; }
        public virtual Deporte Deporte1 { get; set; }
        public virtual Deporte Deporte2 { get; set; }
        public virtual Estado Estado { get; set; }
        public virtual Responsable Responsable { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EncuentroDeportivo> EncuentroDeportivo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServiciosPorComplejos> ServiciosPorComplejos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ValoracionComplejo> ValoracionComplejo { get; set; }
    }
}
