﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class EncuentroDeportivoEntidad
    {
        public int? idEncuentroDeportivo { get; set; }
        public int idAUsuario{ get; set; }
        public DateTime fechaCreacionEncuentro { get; set; }
        public DateTime fechaDestruccionEncuentro { get; set; }
        public int idDeporte { get; set; }
        public int idComplejo { get; set; }
        public int idEquipo { get; set; }
        public DateTime fechaInicioEncuentro { get; set; }
        public DateTime fechaFinEncuentro { get; set; }
        public int idEstado { get; set; }
        public string tipoEncuentro { get; set; }
        public string accesibilidad { get; set; }
        public DateTime horaInicio { get; set; }
        public DateTime horaFIn { get; set; }
        public string nombreLP { get; set; }

         public string direccion { get; set; }
        // public int numeroCalle { get; set; }
          public string clave { get; set; }

    }
}
