using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaDao;

namespace CapaPresentacion
{
    public partial class ABMusuariosAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            gdv_Usuarios.DataSource = UsuarioDao.obtenerTodosUsuarios();
            gdv_Usuarios.DataKeyNames = new string[] { "idUsuario" };
            gdv_Usuarios.DataBind();
        }

        protected void gdv_Usuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
          //  GridViewRow fila = gdv_Usuarios.SelectedRow;
            lblmsjusuario.Text = "Usuario Bloqueado Exitosamente";
        }
    }
}