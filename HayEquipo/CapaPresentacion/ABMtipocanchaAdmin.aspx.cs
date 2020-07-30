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
    public partial class ABMtipocanchaAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gdv_tipocancha.DataSource = TipoCanchaDao.obtenerTipoCancha2();
            gdv_tipocancha.DataKeyNames = new string[] { "idTipoCancha" };
            gdv_tipocancha.DataBind();
        }

        protected void gdv_tipocancha_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string idTipoCancha = ((GridView)sender).Rows[e.RowIndex].Cells[0].Text;
            int idcan = int.Parse(idTipoCancha);
            TipoCanchaDao.EliminarTipoCancha(idcan);
            this.Page_Load(sender, e);
            lblmsjtipocancha.Text = "Tipo de cancha Eliminada Exitosamente";
        }

        protected void gdv_tipocancha_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton Lb = (LinkButton)e.Row.FindControl("deletebtn");
                Lb.Attributes.Add("OnClick", "return confirm('Esta seguro de que desea eliminar el registro con nombre " + DataBinder.Eval(e.Row.DataItem, "nombre") + "?')");
                LinkButton Lb2 = (LinkButton)e.Row.FindControl("updatebtn");
                Lb2.Attributes.Add("OnClick", DataBinder.Eval(e.Row.DataItem, "idTipoCancha").ToString());

            }
        }

        protected void gdv_tipocancha_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string idTipoCancha = ((GridView)sender).Rows[e.RowIndex].Cells[0].Text;
            int idcan = int.Parse(idTipoCancha);
            TipoCancha tipo = TipoCanchaDao.ObtenerTipoPorID(idcan);
            txtId.Text = idTipoCancha;
            txtNombre2.Text = tipo.nombre;
            txtCapacidad2.Text = tipo.capacidad.ToString();
            cargarDeportesActualizar();
            cmb_Deporte2.SelectedValue = tipo.idDeporte.ToString();
            ModalPopupExtender1.Show();
        }

        protected void btnPopUp_Click(object sender, EventArgs e)
        {
            cargarDeportesAgregar();
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
            TipoCanchaEntidad objTipoCancha = new TipoCanchaEntidad();
            objTipoCancha.nombre = txtNombre.Text;
            objTipoCancha.capacidad = int.Parse(txtCapacidad.Text);
            objTipoCancha.idDeporte = int.Parse(cmb_Deporte.SelectedValue);
            TipoCanchaDao.RegistrarTipoCancha(objTipoCancha);
            this.Page_Load(sender, e);
            lblmsjtipocancha.Text = "Tipo de cancha Agregada Exitosamente";
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string nombreTipoCancha = txtNombre2.Text;
            string id = txtId.Text;
            string capacidad = txtCapacidad2.Text;
            string idDepo = cmb_Deporte2.SelectedValue;
            TipoCanchaDao.ActualizarTipoCancha(id,nombreTipoCancha,idDepo,capacidad);
            this.Page_Load(sender, e);
            lblmsjtipocancha.Text = "Tipo de cancha Actualizada Exitosamente";
        }


        public void cargarDeportesAgregar()
        {
            List<DeporteEntidad> deportes = DeporteDao.obtenerDeportes2();

            cmb_Deporte.DataSource = null;

            cmb_Deporte.DataTextField = "nombre";

            cmb_Deporte.DataValueField = "idDeporte";

            cmb_Deporte.DataSource = deportes;

            cmb_Deporte.DataBind();
        }

        public void cargarDeportesActualizar()
        {
            List<DeporteEntidad> deportes = DeporteDao.obtenerDeportes2();

            cmb_Deporte2.DataSource = null;

            cmb_Deporte2.DataTextField = "nombre";

            cmb_Deporte2.DataValueField = "idDeporte";

            cmb_Deporte2.DataSource = deportes;

            cmb_Deporte2.DataBind();
        }
    }
}