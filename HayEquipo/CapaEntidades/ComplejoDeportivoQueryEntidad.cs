﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class ComplejoDeportivoQueryEntidad
    {
        public int? ID { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Tipo { get; set; }
        public string Direccion { get; set; }
        public string Barrio { get; set; }
        public int? Telefono { get; set; }
        public string Responsable { get; set; }
        public double? Valoracion { get; set; }
        public string Estado { get; set; }
    }
}
