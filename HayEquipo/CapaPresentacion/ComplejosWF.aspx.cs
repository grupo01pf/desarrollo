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
                CargarDeporte1();
                CargarDeporte2();
                CargarDeporte3();
                //ddlDep2.Enabled = false;
                //ddlDep3.Enabled = false;
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
            ddlDep1.SelectedIndex = 0;
            ddlDep2.SelectedIndex = 0;
            ddlDep3.SelectedIndex = 0;
            txtCalle.Text = string.Empty;
            txtNro.Text = null;
            ddlBarrio.SelectedIndex = 0;
            txtTel.Text = null;

            ID = null;
            btnEliminar.Enabled = false;
            btnEliminar.CssClass = "btn btn-warning";
        }

        private void CargarDeporte(DropDownList ddl)
        {
            List<Deporte> Deportes = DeporteDao.ObtenerDeportes();

            ddl.DataSource = null;

            ddl.DataTextField = "nombre";

            ddl.DataValueField = "id";

            ddl.DataSource = Deportes;

            ddl.DataBind();
        }

        private void CargarDeporte1()
        {
            CargarDeporte(ddlDep1);
        }

        private void CargarDeporte2()
        {
            CargarDeporte(ddlDep2);
        }

        private void CargarDeporte3()
        {
            CargarDeporte(ddlDep3);
        }

        private void CargarDeporte4()
        {
            CargarDeporte(ddlDep4);
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
        //HAY PROBLEMAS PARA GUARDAR Y ACTUALIZAR LOS COMPLEJOS
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ComplejoDeportivo complejo = new ComplejoDeportivo();

            complejo.nombre = txtNomb.Text;
            complejo.descripcion = txtDesc.Text;
            complejo.idResponsable = 2;
            complejo.promedioEstrellas = 0;
            complejo.idEstado = 1;

            int dep1;
            if (int.TryParse(ddlDep1.Text, out dep1))
                complejo.idDeporte1 = dep1;

            if(ddlDep2.SelectedIndex == 0)
            {
                complejo.idDeporte2 = null;
            }
            else
            {
                int dep2;
                if (int.TryParse(ddlDep2.Text, out dep2))
                complejo.idDeporte2 = dep2;
            }

            if (ddlDep3.SelectedIndex == 0)
            {
                complejo.idDeporte3 = null;
            }
            else
            {
                int dep3;
                if (int.TryParse(ddlDep3.Text, out dep3))
                    complejo.idDeporte3 = dep3;
            }

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
            ddlDep1.SelectedIndex = int.Parse((compSelec.idDeporte1).ToString());
            if (compSelec.idDeporte2 == null)
            {
                ddlDep2.SelectedIndex = 0;
            }
            else
            {
                ddlDep2.SelectedIndex = int.Parse((compSelec.idDeporte2).ToString());
            }
            if (compSelec.idDeporte3 == null)
            {
                ddlDep3.SelectedIndex = 0;
            }
            else
            {
                ddlDep3.SelectedIndex = int.Parse((compSelec.idDeporte3).ToString());
            }
            txtCalle.Text = compSelec.calle;
            txtNro.Text = compSelec.nroCalle.ToString();
            ddlBarrio.SelectedIndex = compSelec.idBarrio;
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

        protected void btnCanYServ_Click(object sender, EventArgs e)
        {
            CargarDeporte4();
            pnlCyS.Visible = true;
        }

        protected void ddlDep1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if(ddlDep1.SelectedIndex != 0)
            //ddlDep2.Enabled = true;
        }

        protected void ddlDep2_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (ddlDep2.SelectedIndex != 0)
            //ddlDep3.Enabled = true;
        }
    }
}