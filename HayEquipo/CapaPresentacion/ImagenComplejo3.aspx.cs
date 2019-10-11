using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDao;

namespace CapaPresentacion
{
    public partial class ImagenComplejo3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            byte[] img = ComplejoDeportivoDao.ObtenerImagen(Session["IDCom"].ToString(), 3);
            Response.BinaryWrite(img);
        }
    }
}