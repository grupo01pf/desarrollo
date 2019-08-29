using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CapaPresentacion
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          

        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Login.aspx");
            Session["Usuario"] = String.Empty;
            Session["Rol"] = String.Empty;
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
        }

        protected void link_nombreUsuario_Click(object sender, EventArgs e)
        {

            //  Response.Redirect("");
        }


        //protected void btn_Login_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Login.aspx");
        //    Session["Usuario"] = String.Empty;
        //    Session["Rol"] = String.Empty;
        //}
    }
}