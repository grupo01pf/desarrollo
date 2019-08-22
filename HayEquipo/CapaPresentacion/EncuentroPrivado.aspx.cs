using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class EncuentroPrivado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btn_UnirseEquipoA.Enabled = false;
            btn_UnirseEquipoA.Enabled = false;

        }

        protected void btn_Ingresar_Click(object sender, EventArgs e)
        {
            btn_UnirseEquipoA.Enabled = true;
            btn_UnirseEquipoA.Enabled = true;
        }



       

        protected void UnirseEquipoA_Click(object sender, EventArgs e)
        {
            btn_UnirseEquipoA.Enabled = false;
            btn_UnirseEquipoA.Enabled = true;
        }

        protected void btn_UnirseEquipoB_Click(object sender, EventArgs e)
        {
            btn_UnirseEquipoA.Enabled = true;
            btn_UnirseEquipoA.Enabled = false;

        }
    }
}