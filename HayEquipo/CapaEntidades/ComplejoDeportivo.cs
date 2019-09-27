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
            this.FotosComplejo = new HashSet<FotosComplejo>();
            this.ServiciosPorComplejos = new HashSet<ServiciosPorComplejos>();
            this.ValoracionComplejo = new HashSet<ValoracionComplejo>();
        }
    
        public int id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public string deportes { get; set; }
        public string calle { get; set; }
        public Nullable<int> nroCalle { get; set; }
        public Nullable<int> idBarrio { get; set; }
        public Nullable<int> nroTelefono { get; set; }
        public Nullable<int> idResponsable { get; set; }
        public Nullable<double> promedioEstrellas { get; set; }
        public Nullable<int> idEstado { get; set; }
        public string mapa { get; set; }
        public byte[] avatar { get; set; }
        public Nullable<System.TimeSpan> horaApertura { get; set; }
        public Nullable<System.TimeSpan> horaCierre { get; set; }
    
        public virtual Barrio Barrio { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cancha> Cancha { get; set; }
        public virtual Estado Estado { get; set; }
        public virtual Responsable Responsable { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EncuentroDeportivo> EncuentroDeportivo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FotosComplejo> FotosComplejo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServiciosPorComplejos> ServiciosPorComplejos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ValoracionComplejo> ValoracionComplejo { get; set; }
    }
}
