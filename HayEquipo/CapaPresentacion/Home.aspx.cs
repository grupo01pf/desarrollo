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
    public partial class Home : System.Web.UI.Page
    {

        HayEquipoEntities contexto = new HayEquipoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            //****NO BORRAR****

            link_nombreUsuario.Text = Session["Usuario"].ToString();
            if (UsuarioDao.existeImagen(Session["ID"].ToString()) != false)
            {
                Image1.ImageUrl = "~/imagen.aspx?id=" + Session["ID"].ToString();
            }
            if (!IsPostBack)
            {

                //cargarEventosDisponibles();
                // cargarLugaresPublicos();
                // cargarLugaresPrivados();
            }
           
            encuentrosRepeater.DataSource = ObtenerEncuentros();
            encuentrosRepeater.DataBind();
            encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);


        }

        void encuentroRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "btnUnirseEncuentro")
            {
                string idEncuentro = ((LinkButton)e.CommandSource).CommandArgument;

                if (EncuentroDeportivioQueryDao.obtenerTipoEncuentroPorId(idEncuentro) == "Publico")
                {
                    Response.Redirect("EncuentroPublico.aspx?Id=" + idEncuentro);
                }
                if (EncuentroDeportivioQueryDao.obtenerTipoEncuentroPorId(idEncuentro) == "Privado")
                {
                    Response.Redirect("EncuentroPrivado.aspx?Id=" + idEncuentro);
                }

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
            // redireccionar a MiCuenta o Perfil
            //  Response.Redirect("");
        }

        //protected void btn_CrearEncuentro_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("CrearEncuentro.aspx");
        //}

        //protected void cargarEventosDisponibles()
        //{

        //    gdv_EncuentrosDisponibles.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPublicos();
        //    gdv_EncuentrosDisponibles.DataKeyNames = new string[] { "idEncuentroDeportivo" };
        //    gdv_EncuentrosDisponibles.DataBind();

        //}

        //protected void cargarLugaresPublicos() {

        //    //gdv_LugaresPublicos.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPublicos();
        //    //gdv_LugaresPublicos.DataKeyNames = new string[] { "id" };
        //    //gdv_LugaresPublicos.DataBind();

        //}
        //protected void cargarLugaresPrivados()
        //{

        //    //gdv_LugaresPrivados.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPrivados();
        //    //gdv_LugaresPrivados.DataKeyNames = new string[] { "Id" };
        //    //gdv_LugaresPrivados.DataBind();

        //}


        //protected void gdv_EncuentrosDisponibles_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //    GridViewRow fila = gdv_EncuentrosDisponibles.SelectedRow;


        //    string tipoEncuentro = fila.Cells[2].Text;
        //    Session["idEncuentro"] = int.Parse(gdv_EncuentrosDisponibles.SelectedDataKey.Value.ToString());

        //    //string tipoEncuentro = fila.Cells[2].Text; ;

        //    //  lbl_Prueba.Text = tipoEncuentro;


        //    if (tipoEncuentro.Equals("Publico"))
        //    {
        //        Response.Redirect("EncuentroPublico.aspx");

        //    }


        //    else
        //    {
        //        Response.Redirect("EncuentroPrivado.aspx");

        //    }


        //}
         
        public List<EncuentroDeportivoQueryEntidad> ObtenerEncuentros()
        {
            List<EncuentroDeportivoQueryEntidad> encuentro = new List<EncuentroDeportivoQueryEntidad>();
            encuentro= EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPublicos();
            //var q = from p in contexto.EncuentroDeportivo
            //        select p;
            //return q.ToList();
            return encuentro;
        }


    }
}