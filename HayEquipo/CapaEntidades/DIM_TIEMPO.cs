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
    
    public partial class DIM_TIEMPO
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DIM_TIEMPO()
        {
            this.EncuentroDeportivo = new HashSet<EncuentroDeportivo>();
        }
    
        public int FechaSK { get; set; }
        public System.DateTime Fecha { get; set; }
        public short Año { get; set; }
        public short Trimestre { get; set; }
        public short Mes { get; set; }
        public short Semana { get; set; }
        public short Dia { get; set; }
        public short DiaSemana { get; set; }
        public string NTrimestre { get; set; }
        public string NMes { get; set; }
        public string NMes3L { get; set; }
        public string NSemana { get; set; }
        public string NDia { get; set; }
        public string NDiaSemana { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EncuentroDeportivo> EncuentroDeportivo { get; set; }
    }
}
