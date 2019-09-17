using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDao;
using CapaEntidades;

namespace CapaPresentacion
{
    public partial class Restaurar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
            
        }


        protected void btn_Restaurar_Click(object sender, EventArgs e)
        {
            string nombre = UsuarioDao.obtenerNombrebloqueado(txt_ConfirmarEmail.Text);
            if (txt_ConfirmarEmail.Text == UsuarioDao.CoincideEmail()) {
                if (txt_NuevaPassword.Text == txt_RNuevaPassword.Text)
                {
                    if (nombre != "")
                    {
                        UsuarioDao.restaurarIntentosyDesbloquearXNombre(nombre);
                        UsuarioDao.cambiarContraseña(nombre, txt_NuevaPassword.Text);
                        FormsAuthentication.SignOut();
                        FormsAuthentication.RedirectToLoginPage();

                    }
                    else
                    {
                        lblerror.Text = "Usuario no encontrado,por favor registrese";
                    }
                }
                else
                {
                    lblerror.Text = "Contraseñas no coinciden";
                }
            }
            else
            {
                lblerror.Text = "Email no coincide con nuestra base de datos.";
            }
           
        }
        
     }
}