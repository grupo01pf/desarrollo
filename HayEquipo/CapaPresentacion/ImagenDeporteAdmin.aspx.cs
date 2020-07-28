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
    public partial class ImagenDeporteAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            byte[] img=null;          
            if (DeporteDao.existeImagen(Request.QueryString["id"])== true) {
             img = DeporteDao.ObtenerImagen(Request.QueryString["id"]);
             Response.BinaryWrite(img);
            }
           
           
        }
    }
}