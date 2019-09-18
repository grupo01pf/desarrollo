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
    public partial class Complejos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                //ddlOrdenar.AutoPostBack = true;
                CargarGrillaComplejos();
                ddlOrdenar.AutoPostBack = true;
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
        protected void CargarGrillaComplejos()
        {
            gvComplejos.DataSource = null;

            gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
                                      select comp);

            gvComplejos.DataKeyNames = new string[] { "ID" };
            gvComplejos.DataBind();       
        }
        protected void CargarGrillaComplejosPorNom()
        {
            gvComplejos.DataSource = null;

            gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
                                      orderby comp.Nombre
                                      select comp);

            gvComplejos.DataKeyNames = new string[] { "ID" };
            gvComplejos.DataBind();
        }
        protected void CargarGrillaComplejosPorVal()
        {
            gvComplejos.DataSource = null;

            gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
                                      orderby comp.Valoracion descending
                                      select comp);

            gvComplejos.DataKeyNames = new string[] { "ID" };
            gvComplejos.DataBind();
        }
        protected void CargarGrillaComplejosBuscar(string nomb)
        {
            gvComplejos.DataSource = null;

            gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosPorNomb(nomb)
                                      orderby comp.Nombre
                                      select comp);

            gvComplejos.DataKeyNames = new string[] { "ID" };
            gvComplejos.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            if (txtBuscar.Text == "")
            {
                CargarGrillaComplejos();
            }
            else
            {
                CargarGrillaComplejosBuscar(txtBuscar.Text);
            }
        }
        protected void gvComplejos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idSeleccionado = int.Parse(gvComplejos.SelectedDataKey.Value.ToString());
            ID = idSeleccionado;
            ComplejoDeportivo compSelec = ComplejoDeportivoDao.ObtenerComplejosPorID(idSeleccionado);
        }

        protected void ddlOrdenar_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlOrdenar.SelectedIndex == 1)
            {
                CargarGrillaComplejosPorVal();
            }
            if (ddlOrdenar.SelectedIndex == 3)
            {
                CargarGrillaComplejosPorNom();
            }
        }
    }
}