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

        protected void gdv_Usuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            UsuarioDao.desbloqueadoAdmin(((GridView)sender).Rows[e.RowIndex].Cells[0].Text);
            this.Page_Load(sender, e);
            lblmsjusuario.Text = "Usuario Desbloqueado Exitosamente";
        }

        protected void gdv_Usuarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            UsuarioDao.bloqueadoAdmin(((GridView)sender).Rows[e.RowIndex].Cells[0].Text);
            this.Page_Load(sender, e);
            lblmsjusuario.Text = "Usuario Bloqueado Exitosamente";
        }

        protected void gdv_Usuarios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton Lb = (LinkButton)e.Row.FindControl("Deshabilitarbtn");
                Lb.Attributes.Add("OnClick", "return confirm('Esta seguro de que desea Deshabilitar el Usuario de nombre " + DataBinder.Eval(e.Row.DataItem, "nombreUsuario") + "?')");
                LinkButton Lb2 = (LinkButton)e.Row.FindControl("Habilitarbtn");
                Lb2.Attributes.Add("OnClick", "return confirm('Esta seguro de que desea Habilitar el Usuario de nombre " + DataBinder.Eval(e.Row.DataItem, "nombreUsuario") + "?')");

                if (DataBinder.Eval(e.Row.DataItem, "bloqueado").ToString() == "True")
                {
                    Lb.Visible = false;
                    Lb2.Visible = true;
                }
                if (DataBinder.Eval(e.Row.DataItem, "bloqueado").ToString() == "False")
                {
                    Lb.Visible = true;
                    Lb2.Visible = false;
                }
            }
        }

    }
}