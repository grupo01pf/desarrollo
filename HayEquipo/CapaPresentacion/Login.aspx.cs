using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDao;

namespace CapaPresentacion
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            if (validarUsuario(txt_NombreUsuario.Text, txt_Password.Text)){

                Session["Usuario"] = txt_NombreUsuario.Text;
                Response.Redirect("Home.aspx");
            }
           
        }

        public bool validarUsuario(string usuario, string clave) {

            bool flag = false;
            if (UsuarioDao.Usuario(usuario, clave))
            {
                flag = true;
                Session["Rol"] = UsuarioDao.Permiso(usuario);
            }

            return flag;
           
        }
    }
}