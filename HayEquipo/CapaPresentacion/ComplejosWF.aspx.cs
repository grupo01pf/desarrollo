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
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
            cargarTiposComplejos();
            cargarBarrios();
            CargarGrillaComplejos();
            btnEliminar.Enabled = false;
            btnEliminar.CssClass = "btn btn-warning";
            }
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
        private void Limpiar()
        {
            txtNomb.Text = string.Empty;
            txtDesc.Text = string.Empty;
            ddlTipo.SelectedIndex = 0;
            txtCalle.Text = string.Empty;
            txtNro.Text = null;
            ddlBarrio.SelectedIndex = 0;
            txtTel.Text = null;

            ID = null;
            btnEliminar.Enabled = false;
            btnEliminar.CssClass = "btn btn-warning";
        }
        private void cargarTiposComplejos()
        {
            List<TipoComplejo> tiposComplejos = TipoComplejoDao.ObtenerTodosTiposComplejo();
        
            ddlTipo.DataSource = null;

            ddlTipo.DataTextField = "nombre";

            ddlTipo.DataValueField = "id";

            ddlTipo.DataSource = tiposComplejos;

            ddlTipo.DataBind();
        }

        private void cargarBarrios()
        {
            List<Barrio> barrios = BarrioDao.obtenerBarrios();

            ddlBarrio.DataSource = null;

            ddlBarrio.DataTextField = "nombre";

            ddlBarrio.DataValueField = "id";

            ddlBarrio.DataSource = barrios;

            ddlBarrio.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ComplejoDeportivo complejo = new ComplejoDeportivo();

            complejo.nombre = txtNomb.Text;
            complejo.descripcion = txtDesc.Text;

            int tipoComp;
            if (int.TryParse(ddlTipo.Text, out tipoComp))
                complejo.idTipoComplejo = tipoComp;

            complejo.calle = txtCalle.Text;
            int nroCalle;
            if (int.TryParse(txtNro.Text, out nroCalle))
                complejo.nroCalle = nroCalle;

            int barrio;
            if (int.TryParse(ddlBarrio.Text, out barrio))
                complejo.idBarrio = barrio;

            int tel;
            if (int.TryParse(txtTel.Text, out tel))
                complejo.nroTelefono = tel;


            if (ID.HasValue)
            {
                complejo.id = ID.Value;
                ComplejoDeportivoDao.ActualizarComplejo(complejo);
            }
            else
            {

                ComplejoDeportivoDao.InsertarComplejo(complejo);
            }
           
            CargarGrillaComplejos();
            Limpiar();
        }

        protected void CargarGrillaComplejos()
        {
            gvComplejos.DataSource = null;

            gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
                                     orderby comp.Nombre
                                     select comp);

            gvComplejos.DataKeyNames = new string[] { "ID" };
            gvComplejos.DataBind();
        }

        protected void gvComplejos_SelectedIndexChanged(object sender, EventArgs e)
        {
            Limpiar();
            int idSeleccionado = int.Parse(gvComplejos.SelectedDataKey.Value.ToString());
            ID = idSeleccionado;
            ComplejoDeportivo compSelec = ComplejoDeportivoDao.ObtenerComplejosPorID(idSeleccionado);

            txtNomb.Text = compSelec.nombre;
            txtDesc.Text = compSelec.descripcion;
            ddlTipo.SelectedIndex = (compSelec.idTipoComplejo);
            txtCalle.Text = compSelec.calle;
            txtNro.Text = compSelec.nroCalle.ToString();
            ddlBarrio.SelectedIndex = (compSelec.idBarrio);
            txtTel.Text = compSelec.nroTelefono.ToString();

            btnEliminar.Enabled = true;
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ComplejoDeportivoDao.EliminarComplejo(ID.Value);
            CargarGrillaComplejos();
            Limpiar();
        }
    }
}