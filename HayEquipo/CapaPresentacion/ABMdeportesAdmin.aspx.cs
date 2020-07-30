using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDao;
using CapaEntidades;
using System.Drawing;
using System.Data;

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

        protected void btnPopUp_Click(object sender, EventArgs e)
        {
            btnPopUp_ModalPopupExtender.Show();
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            btnPopUp_ModalPopupExtender.Hide();
        }




        protected void gdv_deportes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string iddeporte = ((GridView)sender).Rows[e.RowIndex].Cells[0].Text;
            int iddep = int.Parse(iddeporte);
            DeporteDao.EliminarDeporte(iddep);
            this.Page_Load(sender, e);
            lblmsjdeporte.Text = "Deporte Eliminado Exitosamente";
           
        }

        protected void gdv_deportes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                LinkButton Lb = (LinkButton)e.Row.FindControl("deletebtn");
                Lb.Attributes.Add("OnClick", "return confirm('Esta seguro de que desea eliminar el registro con nombre " + DataBinder.Eval(e.Row.DataItem, "nombre") + "?')");
                LinkButton Lb2 = (LinkButton)e.Row.FindControl("updatebtn");
                Lb2.Attributes.Add("OnClick",DataBinder.Eval(e.Row.DataItem, "idDeporte").ToString());
              //  Lb2.Attributes.Add("OnClick", "return confirm('Esta seguro de que desea actualizar el registro con id " + idDeporte + "?')");
              
            }

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            DeporteEntidad objDeporte = new DeporteEntidad();
            objDeporte.nombre= txtNombre.Text;
            if (FileUploadAvatar.HasFile)
            {
               
                //obtener datos de la imagen
                int tam = FileUploadAvatar.PostedFile.ContentLength;
                byte[] ImagenOriginal = new byte[tam];

                FileUploadAvatar.PostedFile.InputStream.Read(ImagenOriginal, 0, tam);
                Bitmap ImagenOriginalBinaria = new Bitmap(FileUploadAvatar.PostedFile.InputStream);
                objDeporte.avatar=ImagenOriginal;
                //insertar en BD
                DeporteDao.RegistrarDeporte(objDeporte);
                this.Page_Load(sender, e);
                lblmsjdeporte.Text = "Deporte Agregado Exitosamente";

            }
            else
            {
               lblerror2.Text = "Debe Colocar un nombre y una imagen ";
            }
          
           
        }

        protected void btnPopUp2_Click(object sender, EventArgs e)
        {
         
    

        }

        protected void btnClose2_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1.Hide();
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            
            string nombreDeporte = txtNombre2.Text;
            string id = txtId.Text;
            if (FileUploadAvatar2.HasFile)
            {

                //obtener datos de la imagen
                int tam = FileUploadAvatar2.PostedFile.ContentLength;
                byte[] ImagenOriginal = new byte[tam];

                FileUploadAvatar2.PostedFile.InputStream.Read(ImagenOriginal, 0, tam);
                Bitmap ImagenOriginalBinaria = new Bitmap(FileUploadAvatar2.PostedFile.InputStream);
                byte[] avatar = ImagenOriginal;
                //insertar en BD
                DeporteDao.ActualizarDeporte(id,nombreDeporte,avatar);
                this.Page_Load(sender, e);
                lblmsjdeporte.Text = "Deporte Actualizado Exitosamente";

            }
            else
            {
                lblerror3.Text = "Debe Colocar un nombre y una imagen ";
            }
           
        }

        protected void gdv_deportes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            string iddeporte = ((GridView)sender).Rows[e.RowIndex].Cells[0].Text;
            int iddep = int.Parse(iddeporte);
            Deporte deporte=DeporteDao.ObtenerDeportesPorID(iddep);
            txtId.Text = iddeporte;
            txtNombre2.Text = deporte.nombre;
            Image2.ImageUrl = "~/imagenDeporteAdmin.aspx?id=" + iddeporte;
            ModalPopupExtender1.Show();

        }
    }
}