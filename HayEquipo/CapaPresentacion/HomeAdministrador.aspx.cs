using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDao;

namespace CapaPresentacion
{
    public partial class HomeAdministrador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnMostrarEstadistica_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Session["ID"].ToString());
            EstadisticaDao.truncarUsuariosActivos();
            EstadisticaDao.CargarUsuariosActivos();
            elDivDelDashboard.Visible = true;
        }

        protected void btn_Usuarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMusuariosAdmin.aspx");
        }

        protected void btn_deportes_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMdeportesAdmin.aspx");
        }

        protected void btn_encuentros_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMencuentrosAdmin.aspx");
        }

        protected void btn_serviciosExtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMserviciosextrasAdmin.aspx");
        }

        protected void btn_tipoCancha_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMtipocanchaAdmin.aspx");
        }
    }
}