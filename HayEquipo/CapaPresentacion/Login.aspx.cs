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
            //if (validarUsuario(txt_NombreUsuario.Text, txt_Password.Text))
            //{
            //    UsuarioDao.restaurarintentos(Session["ID"].ToString());
            //    Session["Usuario"] = txt_NombreUsuario.Text;
            //    if (Session["Rol"].ToString() == "Administrador")
            //    {
            //        if (bloqueado == false)
            //        {
            //            if (validarUsuario(txt_NombreUsuario.Text, txt_Password.Text))
            //            {
            //                UsuarioDao.restaurarintentos(Session["ID"].ToString());
            //                Session["Usuario"] = txt_NombreUsuario.Text;
            //                if (Session["Rol"].ToString() == "Administrador")
            //                {
            //                    FormsAuthentication.RedirectFromLoginPage(txt_NombreUsuario.Text, false);
            //                    Response.Redirect("HomeAdministrador.aspx");
            //                }
            //                if (Session["Rol"].ToString() == "UsuarioDeportista")
            //                {
            //                    FormsAuthentication.RedirectFromLoginPage(txt_NombreUsuario.Text, false);
            //                    Response.Redirect("Home.aspx");
            //                }
            //                if (Session["Rol"].ToString() == "UsuarioComplejoDeportivo")
            //                {
            //                    FormsAuthentication.RedirectFromLoginPage(txt_NombreUsuario.Text, false);
            //                    Response.Redirect("HomeEstablecimiento.aspx");
            //                }
            //            }
            //            else
            //            {
            //                Session["ID"] = UsuarioDao.ID(txt_NombreUsuario.Text);
            //                UsuarioDao.intentos(Session["ID"].ToString());
            //                int intentos = UsuarioDao.obtenerintentos(txt_NombreUsuario.Text);
            //                if (intentos == 3)
            //                {
            //                    UsuarioDao.bloqueado(Session["ID"].ToString());

            //                    enviarcorreorestauracion();
            //                    lblerror.Text = "Usuario bloqueado,se le enviara un email para restaurar su contraseña";



            //                }
            //                else
            //                {
            //                    lblerror.Text = "Contraseña Erronea";
            //                }
            //            }
            //        }
            //        else
            //        {
            //            lblerror.Text = "Usuario bloqueado,por favor acceda a su mail para restaurar su contraseña";
            //        }
            //    }
            //    if (Session["Rol"].ToString() == "UsuarioDeportista")
            //    {
            //        FormsAuthentication.RedirectFromLoginPage(txt_NombreUsuario.Text, false);
            //        Response.Redirect("Home.aspx");
            //    }
            //    if (Session["Rol"].ToString() == "UsuarioComplejoDeportivo")
            //    {
            //        FormsAuthentication.RedirectFromLoginPage(txt_NombreUsuario.Text, false);
            //        Response.Redirect("HomeEstablecimiento.aspx");
            //    }
            //}
           



            if (validarUsuario(txt_NombreUsuario.Text, txt_Password.Text))
            {
                UsuarioDao.restaurarintentos(Session["ID"].ToString());
                Session["Usuario"] = txt_NombreUsuario.Text;
                if (Session["Rol"].ToString() == "Administrador")
                {
                    FormsAuthentication.RedirectFromLoginPage(txt_NombreUsuario.Text, false);
                    Response.Redirect("Home.aspx");
                }
                if (Session["Rol"].ToString() == "UsuarioDeportista")
                {
                    FormsAuthentication.RedirectFromLoginPage(txt_NombreUsuario.Text, false);
                    Response.Redirect("Home.aspx");
                }
                if (Session["Rol"].ToString() == "UsuarioComplejoDeportivo")
                {
                    FormsAuthentication.RedirectFromLoginPage(txt_NombreUsuario.Text, false);
                    Response.Redirect("Home.aspx");
                }
            }

        }

        public bool validarUsuario(string usuario, string clave)
        {

            bool flag = false;
            if (UsuarioDao.Usuario(usuario, clave))
            {

                //FormsAuthentication.RedirectFromLoginPage(txt_NombreUsuario.Text, false);
             //   Response.Redirect("HomeEstablecimiento.aspx");

                flag = true;
                Session["Rol"] = UsuarioDao.Permiso(usuario);
                Session["ID"] = UsuarioDao.ID(usuario);

            }

            return flag;

        }
        public bool validarUsuarioErroneo(string usuario, string clave) {

            bool flag = false;
            if (UsuarioDao.Usuario(usuario, clave))
            {
                flag = true;
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

            if (!UsuarioDao.ExisteEmail(txtEmail.Text))
            {
                if (!UsuarioDao.Existe(txtNombre.Text))
                {
                    if (txtNombre.Text != "" && txtEmail.Text != "" && txtPassword.Text != "" && txtRPassword.Text != "")
                    {
                        if (checkPrivacidad.Checked)
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

                                       lblerror2.Text= "Registro Incorrecto";
                                    }
                                }
                                else
                                {

                                lblerror2.Text = "Contraseñas no coinciden";
                                }
                            }
                            else { lblerror2.Text = "Email no valido!!"; }
                        }
                        else { lblerror2.Text = "Debes Aceptar los Terminos y condiciones!!"; }
                    }
                    else { lblerror2.Text = "No debe haber campos vacios"; }
                }
                else { lblerror2.Text = "El nombre de usuario ya existe,coloque otro"; }
            }
            else { lblerror2.Text = "El Email ya existe,coloque otro"; }

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

        public void enviarcorreorestauracion()
        {
            string from = "hayequipoteam2019@gmail.com";
            string pass = "hayequipo123..";
            string to = UsuarioDao.obtenerEmail(txt_NombreUsuario.Text);
            string mensaje = "<p>Acceda a este link para restaurar su contraseña</p></n>"+
                "<a href='http://localhost/CapaPresentacion/Restaurar.aspx'>Click Aqui</a>";
            new Email().enviarcorreo2(from, pass, to, mensaje);
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            btnPopUp_ModalPopupExtender.Hide();
        }



        protected void btnPopUp_Click(object sender, EventArgs e)
        {


            btnPopUp_ModalPopupExtender.Show();
        }



    }
}
