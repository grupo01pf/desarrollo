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
    
    public partial class Administrador
    {
        public int id { get; set; }
        public Nullable<int> nroLegajo { get; set; }
        public string apellido { get; set; }
        public string nombres { get; set; }
        public Nullable<int> idTipoDoc { get; set; }
        public Nullable<int> nroDoc { get; set; }
        public string sexo { get; set; }
        public Nullable<System.DateTime> fechaNacimiento { get; set; }
        public string calle { get; set; }
        public Nullable<int> nroCalle { get; set; }
        public Nullable<int> idBarrio { get; set; }
        public Nullable<int> nroTelefono { get; set; }
        public Nullable<System.DateTime> fechaIngreso { get; set; }
        public Nullable<int> idUsuario { get; set; }
    
        public virtual Barrio Barrio { get; set; }
        public virtual TipoDocumento TipoDocumento { get; set; }
        public virtual Usuario Usuario { get; set; }
    }
}