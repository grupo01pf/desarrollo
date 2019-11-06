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
            encuentrosRepeater.DataSource = ObtenerEncuentros();
            encuentrosRepeater.DataBind();
            encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
        }

        //CAMBIAR A OBTENER ENCUENTROS DEPORTIVOS PRIVADOS
        public List<EncuentroDeportivoQueryEntidad> ObtenerEncuentros()
        {
            List<EncuentroDeportivoQueryEntidad> encuentro = new List<EncuentroDeportivoQueryEntidad>();
            encuentro = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPublicos();
            //var q = from p in contexto.EncuentroDeportivo
            //        select p;
            //return q.ToList();
            return encuentro;
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