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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Usuario"] = String.Empty;
            Session["Rol"] = String.Empty;
            Session["ID"] = String.Empty;

        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {

            //****NO BORRAR****

            //if (validarUsuario(txt_NombreUsuario.Text, txt_Password.Text))
            //{

            //    Session["Usuario"] = txt_NombreUsuario.Text;


            //    if (Session["Rol"].ToString() == "Administrador")
          //  Response.Redirect("Home.aspx");
            //    if (Session["Rol"].ToString() == "UsuarioDeportista")
            //        Response.Redirect("Home.aspx");
            //    if (Session["Rol"].ToString() == "UsuarioComplejoDeportivo")
            //        Response.Redirect("Home.aspx");
            //}



            if (validarUsuario(txt_NombreUsuario.Text, txt_Password.Text))
            {

                Session["Usuario"] = txt_NombreUsuario.Text;
            }

            if (Session["Rol"].ToString() == "Administrador")
                Response.Redirect("Home.aspx");
            if (Session["Rol"].ToString() == "UsuarioDeportista")
                Response.Redirect("Home.aspx");
            if (Session["Rol"].ToString() == "UsuarioComplejoDeportivo")
                Response.Redirect("Home.aspx");

        }

        public bool validarUsuario(string usuario, string clave) {

            bool flag = false;
            if (UsuarioDao.Usuario(usuario, clave))
            {
                flag = true;
                Session["Rol"] = UsuarioDao.Permiso(usuario);
                Session["ID"] = UsuarioDao.ID(usuario);
            }

            return flag;

        }

        private UsuarioEntidad GetEntity()
        {
            UsuarioEntidad objUsuario = new UsuarioEntidad();
            objUsuario.idUsuario = 0;
            objUsuario.nombreUsuario = txtNombre.Text;
            objUsuario.email = txtEmail.Text;
            objUsuario.contraseña = txtPassword.Text;
            return objUsuario;
        }

        protected void btn_Registrar_Click(object sender, EventArgs e)
        {

            UsuarioEntidad objUsuario = GetEntity();

            bool response = UsuarioDao.getInstance().RegistrarUsuario(objUsuario);
            if (response == true)
            {

                Response.Write("<script>alert('Registro Correcto')</script>");
                if (validarUsuario(txtNombre.Text, txtPassword.Text))
                {

                    Session["Usuario"] = txtNombre.Text;
                }

                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Write("<script>alert('Registro Incorrecto')</script>");
            }

        }
    }
}
