using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidades
{
    public class ComplejoDeportivoEntidad
    {
        public int? idComplejoDeportivo { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public int idTipoComplejo { get; set; }
        public string calle { get; set; }
        public int numeroCalle { get; set; }
        public int idBarrio { get; set; }
        public int numeroTelefono { get; set; }
        public int idResponsable { get; set; }
        public int idUsuario { get; set; }
        public float promedioEstrellas { get; set; }
        public int idEstado { get; set; }

        public static int int_NullValue = 1;
        public static float float_NullValue;
        public static string string_NullValue = string.Empty;
        public bool IsNew { get; set; }

        public ComplejoDeportivoEntidad()
        {
            idComplejoDeportivo = int_NullValue;      
            nombre = string_NullValue;
            descripcion = string_NullValue;
            idTipoComplejo = int_NullValue;
            calle = string_NullValue;
            numeroCalle = int_NullValue;
            idBarrio = int_NullValue;
            numeroTelefono = int_NullValue;
            idResponsable = int_NullValue;
            idUsuario = int_NullValue;
            promedioEstrellas = float_NullValue;
            idEstado = int_NullValue;

            IsNew = true;
        }
    }
}
