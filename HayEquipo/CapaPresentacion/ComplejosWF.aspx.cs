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
    public partial class ComplejosWF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarTiposComplejos();
            cargarBarrios();
        }
        private void cargarTiposComplejos()
        {
            List<TipoComplejoEntidad> tiposComplejos = TipoComplejoDao.ObtenerTodosTiposComplejo();
        
            ddlTipo.DataSource = null;

            ddlTipo.DataTextField = "nombre";

            ddlTipo.DataValueField = "idTipoComplejo";

            ddlTipo.DataSource = tiposComplejos;

            ddlTipo.DataBind();
        }

        private void cargarBarrios()
        {
            List<BarrioEntidad> barrios = BarrioDao.obtenerBarrios();

            ddlBarrio.DataSource = null;

            ddlBarrio.DataTextField = "nombre";

            ddlBarrio.DataValueField = "idBarrio";

            ddlBarrio.DataSource = barrios;

            ddlBarrio.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ComplejoDeportivoEntidad complejo = new ComplejoDeportivoEntidad();

            complejo.nombre = txtNomb.Text;
            complejo.descripcion = txtDesc.Text;

            int tipoComp;
            if (int.TryParse(ddlTipo.Text, out tipoComp))
                complejo.idTipoComplejo = tipoComp;

            complejo.calle = txtCalle.Text;
            int nroCalle;
            if (int.TryParse(txtNro.Text, out nroCalle))
                complejo.numeroCalle = nroCalle;

            int barrio;
            if (int.TryParse(ddlBarrio.Text, out barrio))
                complejo.idBarrio = barrio;

            int tel;
            if (int.TryParse(txtTel.Text, out tel))
                complejo.numeroTelefono = tel;


            //if (ID.HasValue)
            //{
            //    cliente.idCliente = ID.Value;
            //    ClienteDao.ActualizarCliente(cliente);
            //}
            //else
            //{

            //    ClienteDao.InsertarCliente(cliente);
            //}
            ComplejoDeportivoDao.InsertarComplejo(complejo);
        }
    }
}