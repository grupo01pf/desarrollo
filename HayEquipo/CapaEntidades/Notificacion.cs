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
    
    public partial class Notificacion
    {
        public int id { get; set; }
        public Nullable<int> idEmisor { get; set; }
        public Nullable<int> idReceptor { get; set; }
        public byte[] notificacion1 { get; set; }
        public string estado { get; set; }
    }
}
