using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDao;

namespace CapaPresentacion
{
    public partial class ComplejosWF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarTiposComplejos();
            cargarBarrios();
            CargarGrillaComplejos();
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


            if (ID.HasValue)
            {
                complejo.idComplejoDeportivo = ID.Value;
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

            gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejos()
                                     orderby comp.nombre
                                     select comp);

            gvComplejos.DataKeyNames = new string[] { "idComplejoDeportivo" };
            gvComplejos.DataBind();
        }

        protected void gvComplejos_SelectedIndexChanged(object sender, EventArgs e)
        {
            Limpiar();
            int idSeleccionado = int.Parse(gvComplejos.SelectedDataKey.Value.ToString());
            ID = idSeleccionado;
            ComplejoDeportivoEntidad compSelec = ComplejoDeportivoDao.ObtenerComplejosPorID(idSeleccionado);

            //string[] cadenasNyA = compSelec.nombre.Split(' ');
            txtNomb.Text = compSelec.nombre;
            txtDesc.Text = compSelec.descripcion;
            ddlTipo.SelectedIndex = compSelec.idTipoComplejo;
            txtCalle.Text = compSelec.calle;
            txtNro.Text = compSelec.numeroCalle.ToString();
            ddlBarrio.SelectedIndex = compSelec.idBarrio;
            txtTel.Text = compSelec.numeroTelefono.ToString();

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