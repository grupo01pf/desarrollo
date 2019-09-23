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
    public partial class AvatarComplejo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Convert.ToString(Session["ID"]);
            ComplejoDeportivo comp = ComplejoDeportivoDao.ObtenerComplejosPorID(int.Parse(id));
            byte[] img = comp.avatar;
            Response.BinaryWrite(img);
        }
    }
}