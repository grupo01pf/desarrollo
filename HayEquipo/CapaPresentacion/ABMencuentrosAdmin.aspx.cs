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
    public partial class ABMencuentrosAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gdv_Encuentros.DataSource = EncuentroDeportivioQueryDao.obtenerTodosEncuentrosDeportivos();
            gdv_Encuentros.DataKeyNames = new string[] { "idEncuentroDeportivo" };
            gdv_Encuentros.DataBind();
        }

        protected void gdv_Encuentros_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void gdv_Encuentros_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int estado = 6; 

            ReservaDao.acutalizarReserva(int.Parse(((GridView)sender).Rows[e.RowIndex].Cells[0].Text), estado);
            EncuentroDeportivoDao.actualizarEncuentroDeportivo(int.Parse(((GridView)sender).Rows[e.RowIndex].Cells[0].Text), estado);
            this.Page_Load(sender, e);
            lblmsjencuentro.Text = "Encuentro Deportivo Cancelado Exitosamente";
        }

        protected void gdv_Encuentros_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton Lb = (LinkButton)e.Row.FindControl("Cancelarbtn");
                Lb.Attributes.Add("OnClick", "return confirm('Esta seguro de que desea Cancelar este encuentro con id: " + DataBinder.Eval(e.Row.DataItem, "idEncuentroDeportivo") + "?')");
                LinkButton Lb2 = (LinkButton)e.Row.FindControl("Habilitarbtn");
                if (DataBinder.Eval(e.Row.DataItem, "nombreEstado").ToString() == "Cancelado")
                {
                    Lb.Visible = false;
                    Lb2.Visible = true;
                }
            }
        }
    }
}