using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDao;

namespace CapaPresentacion
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //****NO BORRAR****

            link_nombreUsuario.Text = Session["Usuario"].ToString();
            if (!IsPostBack)
            {

                cargarEventosDisponibles();
                // cargarLugaresPublicos();
                // cargarLugaresPrivados();
            }

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

        protected void cargarEventosDisponibles()
        {

            gdv_EncuentrosDisponibles.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPublicos();
            //  gdv_EncuentrosDisponibles.DataKeyNames = new string[] { "id" };
            gdv_EncuentrosDisponibles.DataBind();

        }
        protected void cargarLugaresPublicos() {

          //  gdv_LugaresPublicos.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPublicos();
          //  gdv_LugaresPublicos.DataKeyNames = new string[] { "id" };
          //  gdv_LugaresPublicos.DataBind();

        }
        protected void cargarLugaresPrivados()
        {

          //  gdv_LugaresPrivados.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPrivados();
          //  gdv_LugaresPrivados.DataKeyNames = new string[] { "Id" };
         //   gdv_LugaresPrivados.DataBind();

        }

        protected void gdv_LugaresPublicos_SelectedIndexChanged(object sender, EventArgs e)
        {

            GridViewRow fila = gdv_EncuentrosDisponibles.SelectedRow;

            string tipoEncuentro = fila.Cells[2].Text;

            //  lbl_Prueba.Text = tipoEncuentro;

            if (tipoEncuentro.Equals("Publico"))
                Response.Redirect("EncuentroPublico.aspx");
            else
                Response.Redirect("EncuentroPrivado.aspx");
        }

       
    }
}