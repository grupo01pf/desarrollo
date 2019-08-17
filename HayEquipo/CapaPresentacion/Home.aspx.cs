using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //****NO BORRAR****
            
           // link_nombreUsuario.Text = Session["Usuario"].ToString();

        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
            Session["Usuario"] = String.Empty;
            Session["Rol"] = String.Empty;
        }

        protected void link_nombreUsuario_Click(object sender, EventArgs e)
        {
            //****NO BORRAR****

            //  Response.Redirect("");
        }

        protected void btn_CrearEncuentro_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearEncuentro.aspx");
        }

    }
}