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
    
    public partial class Deportista
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Deportista()
        {
            this.AmigosPorDeportistas = new HashSet<AmigosPorDeportistas>();
            this.AmigosPorDeportistas1 = new HashSet<AmigosPorDeportistas>();
            this.DeportesPorDeportistas = new HashSet<DeportesPorDeportistas>();
            this.DeportistasPorEquipos = new HashSet<DeportistasPorEquipos>();
            this.EncuentroDeportivo = new HashSet<EncuentroDeportivo>();
            this.FotosDeportista = new HashSet<FotosDeportista>();
            this.InvitacionEncuentro = new HashSet<InvitacionEncuentro>();
            this.PosicionesPorDeportistas = new HashSet<PosicionesPorDeportistas>();
            this.Valoracion = new HashSet<Valoracion>();
            this.ZonasPorDeportistas = new HashSet<ZonasPorDeportistas>();
        }
    
        public int id { get; set; }
        public string apellido { get; set; }
        public string nombres { get; set; }
        public Nullable<int> idTipoDoc { get; set; }
        public Nullable<int> nroDoc { get; set; }
        public string sexo { get; set; }
        public Nullable<System.DateTime> fechaNacimiento { get; set; }
        public Nullable<int> nroTelefono { get; set; }
        public Nullable<int> idUsuario { get; set; }
        public Nullable<double> promedioEstrellas { get; set; }
        public Nullable<int> idEstado { get; set; }
        public Nullable<int> idBarrio { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AmigosPorDeportistas> AmigosPorDeportistas { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AmigosPorDeportistas> AmigosPorDeportistas1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DeportesPorDeportistas> DeportesPorDeportistas { get; set; }
        public virtual Estado Estado { get; set; }
        public virtual TipoDocumento TipoDocumento { get; set; }
        public virtual Usuario Usuario { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DeportistasPorEquipos> DeportistasPorEquipos { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EncuentroDeportivo> EncuentroDeportivo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FotosDeportista> FotosDeportista { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<InvitacionEncuentro> InvitacionEncuentro { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PosicionesPorDeportistas> PosicionesPorDeportistas { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Valoracion> Valoracion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ZonasPorDeportistas> ZonasPorDeportistas { get; set; }
    }
}
