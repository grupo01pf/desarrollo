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
    
    public partial class ReseñaComplejo
    {
        public int id { get; set; }
        public string reseña { get; set; }
        public Nullable<int> idComplejoValorado { get; set; }
        public Nullable<int> idUsuarioValorador { get; set; }
    
        public virtual Usuario Usuario { get; set; }
    }
}
