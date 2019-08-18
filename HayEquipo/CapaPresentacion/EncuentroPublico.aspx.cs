using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class EncuentroPublico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Salir_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Unirsr_Click(object sender, EventArgs e)
        {

        }

        private void cargarTabla() {

            gdv_EncuentroVigentes.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivos();
            gdv_EncuentroVigentes.DataKeyNames = new string[] { "Id" };
            gdv_EncuentroVigentes.DataBind();
        }
        


    }
}