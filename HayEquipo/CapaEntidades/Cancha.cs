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
    
    public partial class Cancha
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cancha()
        {
            this.CanchasPorHorarios = new HashSet<CanchasPorHorarios>();
        }
    
        public int id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public Nullable<int> idTipoCancha { get; set; }
        public Nullable<int> idComplejo { get; set; }
    
        public virtual ComplejoDeportivo ComplejoDeportivo { get; set; }
        public virtual TipoCancha TipoCancha { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CanchasPorHorarios> CanchasPorHorarios { get; set; }
    }
}