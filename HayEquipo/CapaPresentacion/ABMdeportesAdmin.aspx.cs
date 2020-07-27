using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDao;

namespace CapaPresentacion
{
    public partial class ABMdeportesAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gdv_deportes.DataSource = DeporteDao.obtenerDeportes2();
            gdv_deportes.DataKeyNames = new string[] { "idDeporte" };
            gdv_deportes.DataBind();
        }

        protected void gdv_deportes_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblmsjdeporte.Text = "Deporte Actualizado Exitosamente";
        }

        protected void btn_AgregarDeporte_Click(object sender, EventArgs e)
        {
           lblmsjdeporte.Text = "Deporte Agregado Exitosamente";
        }

        protected void deletebtn_Click(object sender, EventArgs e)
        {
          
        }
      

        protected void gdv_deportes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string iddeporte = ((GridView)sender).Rows[e.RowIndex].Cells[0].Text;
            int iddep = int.Parse(iddeporte);
            DeporteDao.EliminarDeporte(iddep);
            this.Page_Load(sender, e);
            lblmsjdeporte.Text = "Deporte Eliminado Exitosamente";
           
        }
    }
}