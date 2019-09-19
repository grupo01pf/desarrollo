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
        protected void CargarGrillaComplejosBuscar(string nomb, int? idUsuario)
        {
            gvComplejos.DataSource = null;

            gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosFiltros(nomb, idUsuario)
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
                int? idUs = null;
                string nomb = txtBuscar.Text;
                CargarGrillaComplejosBuscar(nomb, idUs);
            }
            ddlOrdenar.SelectedIndex = 0;
        }
        protected void gvComplejos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idSeleccionado = int.Parse(gvComplejos.SelectedDataKey.Value.ToString());
            ID = idSeleccionado;
            //ComplejoDeportivo compSelec = ComplejoDeportivoDao.ObtenerComplejosPorID(idSeleccionado);

            //GridViewRow fila = gvComplejos.SelectedRow;

            Session["id"] = int.Parse(gvComplejos.SelectedDataKey.Value.ToString());

            Response.Redirect("ComplejoInfo.aspx");

        }

        protected void ddlOrdenar_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtBuscar.Text = string.Empty;
            if (ddlOrdenar.SelectedIndex == 0)
            {
                CargarGrillaComplejos();
            }
            if (ddlOrdenar.SelectedIndex == 1)
            {
                CargarGrillaComplejosPorVal();
            }
            if (ddlOrdenar.SelectedIndex == 2)
            {
                int? idUs = int.Parse(Session["ID"].ToString());
                string nomb = string.Empty;

                CargarGrillaComplejosBuscar(nomb, idUs);
            }
            if (ddlOrdenar.SelectedIndex == 3)
            {
                CargarGrillaComplejosPorNom();
            }
        }
    }
}