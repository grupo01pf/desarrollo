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
    public partial class EstadisticaComplejo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnMostrarEstadistica_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Session["ID"].ToString());
            EstadisticaDao.truncarTabla();
            EstadisticaDao.CargarTabla(id);
            elDivDelDashboard.Visible = true;
           }
    }
}