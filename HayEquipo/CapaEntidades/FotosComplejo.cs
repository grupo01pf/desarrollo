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
    
    public partial class FotosComplejo
    {
        public int id { get; set; }
        public byte[] imagen { get; set; }
        public Nullable<int> idComplejo { get; set; }
    
        public virtual ComplejoDeportivo ComplejoDeportivo { get; set; }
    }
}
