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
    public partial class ABMserviciosextrasAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gdv_serviciosextra.DataSource = ServicioExtraDao.ObtenerServicios();
            gdv_serviciosextra.DataKeyNames = new string[] { "id" };
            gdv_serviciosextra.DataBind();
        }

        protected void gdv_serviciosextra_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string idservicio = ((GridView)sender).Rows[e.RowIndex].Cells[0].Text;
            int idserv = int.Parse(idservicio);
            ServicioExtraDao.EliminarServicioExtra(idserv);
            this.Page_Load(sender, e);
            lblmsjservicioextra.Text = "Servicio Extra Eliminado Exitosamente";
        }

        protected void gdv_serviciosextra_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton Lb = (LinkButton)e.Row.FindControl("deletebtn");
                Lb.Attributes.Add("OnClick", "return confirm('Esta seguro de que desea eliminar el registro con nombre " + DataBinder.Eval(e.Row.DataItem, "nombre") + "?')");
                LinkButton Lb2 = (LinkButton)e.Row.FindControl("updatebtn");
                Lb2.Attributes.Add("OnClick", DataBinder.Eval(e.Row.DataItem, "id").ToString());
             
            }
        }

        protected void gdv_serviciosextra_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string idservicio = ((GridView)sender).Rows[e.RowIndex].Cells[0].Text;
            int idserv = int.Parse(idservicio);
            ServicioExtra servicio = ServicioExtraDao.ObtenerServicioPorID(idserv);
            txtId.Text = idservicio;
            txtNombre2.Text = servicio.nombre;
            ModalPopupExtender1.Show();
        }

        protected void btnPopUp_Click(object sender, EventArgs e)
        {
            btnPopUp_ModalPopupExtender.Show();
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            btnPopUp_ModalPopupExtender.Hide();
        }

        protected void btnPopUp2_Click(object sender, EventArgs e)
        {



        }

        protected void btnClose2_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Hide();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            ServicioExtra objServicio = new ServicioExtra();
            objServicio.nombre = txtNombre.Text;
            ServicioExtraDao.RegistrarServicioExtra(objServicio);
            this.Page_Load(sender, e);
            lblmsjservicioextra.Text = "Servicio Extra Agregado Exitosamente";                   
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string nombreDeporte = txtNombre2.Text;
            string id = txtId.Text;
            ServicioExtraDao.ActualizarServicioExtra(id, nombreDeporte);
            this.Page_Load(sender, e);
            lblmsjservicioextra.Text = "Servicio Extra Actualizado Exitosamente";
        }

    }
}