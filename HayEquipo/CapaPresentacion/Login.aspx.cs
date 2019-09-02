using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDao;
using CapaEntidades;
using System.Text.RegularExpressions;
using System.Web.Security;

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
            {
                FormsAuthentication.RedirectFromLoginPage(txt_NombreUsuario.Text, false);
                Response.Redirect("HomeAdministrador.aspx");
            }
            if (Session["Rol"].ToString() == "UsuarioDeportista")
            {
                FormsAuthentication.RedirectFromLoginPage(txt_NombreUsuario.Text, false);
                Response.Redirect("Home.aspx");
            }
            if (Session["Rol"].ToString() == "UsuarioComplejoDeportivo")
            {
                FormsAuthentication.RedirectFromLoginPage(txt_NombreUsuario.Text, false);
                Response.Redirect("HomeEstablecimiento.aspx");
            }

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
           
                //aqui tu codigo si el correo es valido

                objUsuario.idUsuario = 0;
                objUsuario.nombreUsuario = txtNombre.Text;
                objUsuario.email = txtEmail.Text;
                objUsuario.contraseña = txtPassword.Text;
                return objUsuario;
           
            
        }

        protected void btn_Registrar_Click(object sender, EventArgs e)
        {

            bool response = false;
            if (checkPrivacidad.Checked)
            {
                if (!UsuarioDao.Existe(txtNombre.Text))
                {
                    if (txtNombre.Text != "" && txtEmail.Text != "" && txtPassword.Text != "" && txtRPassword.Text != "")
                    {
                        if (validar(txtEmail.Text))
                        {

                            if (txtPassword.Text == txtRPassword.Text)
                            {
                                UsuarioEntidad objUsuario = GetEntity();
                                if (radioLogin.SelectedValue.ToString() == "2")
                                {
                                    response = UsuarioDao.getInstance().RegistrarUsuario(objUsuario);
                                }
                                if (radioLogin.SelectedValue.ToString() == "3")
                                {
                                    response = UsuarioDao.getInstance().RegistrarUsuarioEstablecimiento(objUsuario);
                                }
                                if (response == true)
                                {

                                    Response.Write("<script>alert('Registro Correcto')</script>");
                                    if (validarUsuario(txtNombre.Text, txtPassword.Text))
                                    {

                                        Session["Usuario"] = txtNombre.Text;
                                    }
                                    enviarcorreo();
                                    if (Session["Rol"].ToString() == "UsuarioDeportista")
                                    {
                                        FormsAuthentication.RedirectFromLoginPage(txtNombre.Text, false);
                                        Response.Redirect("Home.aspx");
                                    }
                                    if (Session["Rol"].ToString() == "UsuarioComplejoDeportivo")
                                    {
                                        FormsAuthentication.RedirectFromLoginPage(txtNombre.Text, false);
                                        Response.Redirect("HomeEstablecimiento.aspx");
                                    }

                                }
                                else
                                {

                                    Response.Write("<script>alert('Registro Incorrecto')</script>");
                                }
                            }
                            else
                            {

                                Response.Write("<script>alert('Contraseñas no coinciden!!')</script>");
                            }
                        }
                        else
                        {

                            Response.Write("<script>alert('Email no valido!!')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('No debe haber campos vacios')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('El nombre de usuario ya existe,coloque otro')</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Debes Aceptar los Terminos y condiciones!!')</script>");
            }
        }

        public void enviarcorreo()
        {
            string from = "hayequipoteam2019@gmail.com";
            string pass = "hayequipo123..";
            string to = txtEmail.Text;
            string mensaje = "Usted se ha logueado en el sistema HayEquipo con exito";
            new Email().enviarcorreo(from,pass,to,mensaje);
        }
        public bool validar(string correo)
        {
            return Regex.IsMatch(correo, "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*");
        }

        

    }
}
