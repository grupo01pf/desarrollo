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

            if (!IsPostBack)
            {
                CargarLstComplejos();
            }
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
            encuentrosRepeater.DataSource = (from encuentro in EncuentroDeportivioQueryDao.ObtenerEncuentrosPorUsResponsable(int.Parse(Session["ID"].ToString()))
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

        private void CargarLstComplejos()
        {
            lstComp.DataSource = null;

            lstComp.DataTextField = "nombre";

            lstComp.DataValueField = "id";

            lstComp.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosPorUsuario(int.Parse(Session["ID"].ToString()))
                                    orderby comp.Nombre
                                    select comp);

            lstComp.DataBind();
        }

        private void CargarDdlHoras()
        {
            ComplejoDeportivo comp = new ComplejoDeportivo();
            comp = ComplejoDeportivoDao.ObtenerComplejosPorID(int.Parse(lstComp.SelectedValue));

            //ddlHora.Items.Add(comp.horaApertura.ToString());
            TimeSpan time1 = new TimeSpan(0, 0, 0);
            TimeSpan time2 = new TimeSpan(1, 0, 0);
            time1 = TimeSpan.Parse(comp.horaApertura.ToString());
            while(time1 <= comp.horaCierre)
            {
                ddlHora.Items.Add(time1.ToString());
                time1=+time2;
            }
        }

        protected void lstComp_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlHora.Items.Clear();
            CargarDdlHoras();
        }

        //VER COMO HACER PARA QUE TRAIGA TODAS LAS CANCHAS DEL COMPLEJO CON SU ESTADO EN BASE AL DIA Y LA HORA SELECCIONADA

        //protected void CargarGrillaCanchas()
        //{
        //    gvCanchas.DataSource = null;

        //    gvCanchas.DataSource = (from can in CanchaDao.ObtenerCanchasPorComplejos(IDCom.Value)
        //                            orderby can.Deporte, can.Nombre
        //                            select can);

        //    gvCanchas.DataKeyNames = new string[] { "ID" };
        //    gvCanchas.DataBind();
        //}

    }
}