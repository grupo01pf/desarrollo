using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaDao;

namespace CapaPresentacion
{
    public partial class PerfilDeportistas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarTipoDocumento();
        }

        private void cargarTipoDocumento()
        {
            List<TipoDocumentoEntidad> tiposComplejos = TipoDocumentoDao.obtenerTiposDocumento();

            ddl_TipoDocumento.DataSource = null;

            ddl_TipoDocumento.DataTextField = "nombre";

            ddl_TipoDocumento.DataValueField = "idTipoDocumento";

            ddl_TipoDocumento.DataSource = tiposComplejos;

            ddl_TipoDocumento.DataBind();
        }

        protected int? ID
        {
            get
            {
                if (ViewState["ID"] != null)
                    return (int)ViewState["ID"];
                else
                {
                    return null;
                }
            }
            set { ViewState["ID"] = value; }
        }


        private DeportistaEntidad GetEntity()
        {
            DeportistaEntidad objDeportista = new DeportistaEntidad();
            objDeportista.apellido = txt_Apellidos.Text;
            objDeportista.nombres = txt_Nombres.Text;
            objDeportista.idTipoDocumento = ddl_TipoDocumento.SelectedIndex;
            int tipoDoc;
            if (int.TryParse(ddl_TipoDocumento.Text, out tipoDoc))
                objDeportista.idTipoDocumento = tipoDoc;
            objDeportista.numeroDocumento = Convert.ToInt32(txt_NumeroDocumento.Text);
            objDeportista.sexo = txt_Sexo.Text;
            objDeportista.fechaNacimiento = Convert.ToDateTime(txt_FechaNacimiento.Text);
            objDeportista.numeroTelefono = Convert.ToInt32(txt_Telefono.Text);
            objDeportista.idUsuario = Convert.ToInt32(Session["id"]) ;
            objDeportista.promedioEstrellas = 0;
            objDeportista.idEstado = 1;
            return objDeportista;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            DeportistaEntidad deportista = GetEntity();


            if (ID.HasValue)
            {
                deportista.idPersona = ID.Value;
                DeportistaDao.ActualizarDeportista(deportista);
            }
            else
            {

                DeportistaDao.InsertarDeportista(deportista);
            }


        }
    }
}