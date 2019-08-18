﻿using System;
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
            Session["Usuario"] = String.Empty;
            Session["Rol"] = String.Empty;
            Session["ID"] = String.Empty;
            
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            //****NO BORRAR****

            //if (validarUsuario(txt_NombreUsuario.Text, txt_Password.Text)) {

            //    Session["Usuario"] = txt_NombreUsuario.Text;
            //}

            //if (Session["Rol"].ToString() == "Administrador")
            //     Response.Redirect("Home.aspx");
            //if (Session["Rol"].ToString() == "UsuarioDeportista")
            //    Response.Redirect("Home.aspx");
            //if (Session["Rol"].ToString() == "UsuarioComplejoDeportivo")
            //    Response.Redirect("Home.aspx");
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
    }
}