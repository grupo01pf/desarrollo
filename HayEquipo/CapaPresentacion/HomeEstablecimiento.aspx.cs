using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDao;
using CapaEntidades;

namespace CapaPresentacion
{
    public partial class HomeEstablecimiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarRepeaterEncuentros();
        }

        protected int? IDRes
        {
            get
            {
                if (ViewState["IDRes"] != null)
                    return (int)ViewState["IDRes"];
                else
                {
                    return null;
                }
            }
            set { ViewState["IDRes"] = value; }
        }

        protected void CargarRepeaterEncuentros()
        {
            encuentrosRepeater.DataSource = (from encuentro in EncuentroDeportivioQueryDao.ObtenerEncuentrosPorResponsable(int.Parse(Session["ID"].ToString()))
                                             orderby encuentro.fechaInicioEncuentro ascending
                                             select encuentro);
            encuentrosRepeater.DataBind();
            encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
        }

        void encuentroRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "btnUnirseEncuentro")
            {
                string idEncuentro = ((LinkButton)e.CommandSource).CommandArgument;

                if (EncuentroDeportivioQueryDao.obtenerTipoEncuentroPorId(idEncuentro) == "Publico")
                {
                    Response.Redirect("EncuentroPublico.aspx?Id=" + idEncuentro);
                }
                if (EncuentroDeportivioQueryDao.obtenerTipoEncuentroPorId(idEncuentro) == "Privado")
                {
                    Response.Redirect("EncuentroPrivado.aspx?Id=" + idEncuentro);
                }

            }
        }

    }
}