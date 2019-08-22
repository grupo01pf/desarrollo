using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDao;

namespace CapaPresentacion
{
    public partial class EncuentroPublico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btn_Unirse.Enabled = false;
            btn_Salir.Enabled = false;
        }

        protected void btn_Salir_Click(object sender, EventArgs e)
        {

        }



        private void cargarTabla() {

          /*  gdv_UsuariosUnidos.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivos();
            gdv_UsuariosUnidos.DataKeyNames = new string[] { "Id" };
            gdv_UsuariosUnidos.DataBind();
            
           */
        }

        protected void btn_Ingresar_Click(object sender, EventArgs e)
        {

            btn_Unirse.Enabled = true;
            btn_Salir.Enabled = true;

        }

        

        protected void btn_Unirse_Click(object sender, EventArgs e)
        {

        }
    }
}