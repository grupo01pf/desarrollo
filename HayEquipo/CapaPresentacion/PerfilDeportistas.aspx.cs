using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaDao;
using System.Drawing;

namespace CapaPresentacion
{
    public partial class PerfilDeportistas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            link_nombreUsuario2.Text = Session["Usuario"].ToString();
            if (UsuarioDao.existeImagen(Session["ID"].ToString()) != false)
            {
                Image1.ImageUrl = "~/imagen.aspx?id=" + Session["ID"].ToString();
                cambiarImagen();
            }
            if (DeportistaDao.ExisteDeportista(Session["ID"].ToString()))
            {
                if (btnActualizar.Visible == false)
                {
                    DatosCargadosDeportista();
                }
            }

            else
            {
                cargarTipoDocumento();
            }
           
            gdv_EncuentrosDeportista.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPorId(Session["ID"].ToString());
            gdv_EncuentrosDeportista.DataKeyNames = new string[] { "idEncuentroDeportivo" };
            gdv_EncuentrosDeportista.DataBind();
            manejarValoracion();
            

        }

        private void cargarTipoDocumento()
        {
            List<TipoDocumentoEntidad> tiposDocumento = TipoDocumentoDao.obtenerTiposDocumento();

            ddl_TipoDocumento.DataSource = null;

            ddl_TipoDocumento.DataTextField = "nombre";

            ddl_TipoDocumento.DataValueField = "idTipoDocumento";

            ddl_TipoDocumento.DataSource = tiposDocumento;

            ddl_TipoDocumento.DataBind();
        }

        protected int? ID
        {
            get
            {
                if (ViewState["ID"] != null)
                    return (int)ViewState["ID"];
                else
                {
                    return null;
                }
            }
            set { ViewState["ID"] = value; }
        }


        private DeportistaEntidad GetEntity()
        {
            DeportistaEntidad objDeportista = new DeportistaEntidad();
            objDeportista.apellido = txt_Apellidos.Text;
            objDeportista.nombres = txt_Nombres.Text;
            objDeportista.idTipoDocumento = ddl_TipoDocumento.SelectedIndex;
            int tipoDoc;
            if (int.TryParse(ddl_TipoDocumento.Text, out tipoDoc))
                objDeportista.idTipoDocumento = tipoDoc;
            objDeportista.numeroDocumento = Convert.ToInt32(txt_NumeroDocumento.Text);
            objDeportista.sexo = txt_Sexo.Text;
            objDeportista.fechaNacimiento = Convert.ToDateTime(txt_FechaNacimiento.Text);
            objDeportista.numeroTelefono = Convert.ToInt32(txt_Telefono.Text);
            objDeportista.idUsuario = Convert.ToInt32(Session["id"]) ;
            objDeportista.promedioEstrellas = 0;
            objDeportista.idEstado = 1;
            return objDeportista;
        }



        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            DeportistaEntidad deportista = GetEntity();

            DeportistaDao.InsertarDeportista(deportista);
            txt_Apellidos.Enabled = false;
            txt_Nombres.Enabled = false;
            txt_FechaNacimiento.Enabled = false;
            txt_NumeroDocumento.Enabled = false;
            txt_Sexo.Enabled = false;
            txt_Telefono.Enabled = false;
            ddl_TipoDocumento.Visible = false;
            lbl_TipoDocumento.Visible = false;
            btnGuardar.Visible = false;
            btnCambiar.Visible = true;
            lblmsj.Text = "Datos Guardados Exitosamente";
           

        }
        protected void btnCambiar_Click(object sender, EventArgs e)
        {
            txt_Apellidos.Enabled = true;
            txt_Nombres.Enabled = true;
            txt_FechaNacimiento.Enabled = true;
            txt_NumeroDocumento.Enabled = true;
            txt_Sexo.Enabled = true;
            txt_Telefono.Enabled = true;
            ddl_TipoDocumento.Visible = true;
            lbl_TipoDocumento.Visible = true;
            cargarTipoDocumento();
            btnActualizar.Visible = true;
            btnCambiar.Visible = false;
        }
        protected void btnActualizar_Click(object sender, EventArgs e)
        {

            string ape = txt_Apellidos.Text;
            string nom = txt_Nombres.Text;
            int tipoDoc;
            int.TryParse(ddl_TipoDocumento.Text, out tipoDoc);
            string doc = txt_NumeroDocumento.Text;
            string sexo = txt_Sexo.Text;
            string fc = txt_FechaNacimiento.Text;
            string tel = txt_Telefono.Text;
            DeportistaDao.ActualizarDeportista(Session["ID"].ToString(),ape,nom,tipoDoc.ToString(),doc,sexo,fc,tel);
            txt_Apellidos.Enabled = false;
            txt_Nombres.Enabled = false;
            txt_FechaNacimiento.Enabled = false;
            txt_NumeroDocumento.Enabled = false;
            txt_Sexo.Enabled = false;
            txt_Telefono.Enabled = false;
            ddl_TipoDocumento.Visible = false;
            lbl_TipoDocumento.Visible = false;
            btnActualizar.Visible = false;
            btnCambiar.Visible = true;
            lblmsj.Text = "Datos Actualizados Exitosamente";
        }

        protected void btnGuardarImagen_Click(object sender, EventArgs e)
        {
            if (FileUploadAvatar.HasFile)
            {
                //obtener datos de la imagen
                int tam = FileUploadAvatar.PostedFile.ContentLength;
                byte[] ImagenOriginal = new byte[tam];

                FileUploadAvatar.PostedFile.InputStream.Read(ImagenOriginal, 0, tam);
                Bitmap ImagenOriginalBinaria = new Bitmap(FileUploadAvatar.PostedFile.InputStream);

                //insertar en BD
                UsuarioDao.AgregarImagen(Session["ID"].ToString(), ImagenOriginal);
                lblestado.Text = "Imagen Guardada Exitosamente";
                //string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(ImagenOriginal);
                //Image1.ImageUrl = ImagenDataURL64;
                Image1.ImageUrl = "~/imagen.aspx?id=" + Session["ID"].ToString();
                FileUploadAvatar.Visible = false;
                btn_guardarImagen.Visible = false;
                btn_CambiarImagen.Visible = true;
            }
            else
            {
                lblestado.Text = "Coloque un Archivo de imagen valido";
            }
           
        }
        protected void btnCambiarImagen_Click(object sender, EventArgs e)
        {
            FileUploadAvatar.Visible = true;
            btn_guardarImagen.Visible = true;
            btn_CambiarImagen.Visible = false;
        }


        public void DatosCargadosDeportista()
        {
            Deportista deportista = DeportistaDao.ObtenerDeportistaPorID(Session["ID"].ToString());
            txt_Nombres.Text = deportista.nombres;
            txt_Apellidos.Text = deportista.apellido;
            txt_NumeroDocumento.Text = deportista.nroDoc.ToString();
            txt_Sexo.Text = deportista.sexo.ToString();
            txt_FechaNacimiento.Text = deportista.fechaNacimiento.ToString();
            txt_Telefono.Text = deportista.nroTelefono.ToString();
            txt_Apellidos.Enabled = false;
            txt_Nombres.Enabled = false;
            txt_FechaNacimiento.Enabled = false;
            txt_NumeroDocumento.Enabled = false;
            txt_Sexo.Enabled = false;
            txt_Telefono.Enabled = false;
            ddl_TipoDocumento.Visible = false;
            lbl_TipoDocumento.Visible = false;
            btnGuardar.Visible = false;
            btnCambiar.Visible = true;
        }


        protected void gdv_EncuentrosDisponibles_SelectedIndexChanged(object sender, EventArgs e)
        {

            GridViewRow fila = gdv_EncuentrosDeportista.SelectedRow;


            string tipoEncuentro = fila.Cells[2].Text;
            Session["idEncuentro"] = int.Parse(gdv_EncuentrosDeportista.SelectedDataKey.Value.ToString());

            //string tipoEncuentro = fila.Cells[2].Text; ;

            //  lbl_Prueba.Text = tipoEncuentro;


            if (tipoEncuentro.Equals("Publico"))
            {
                Response.Redirect("EncuentroPublico.aspx");

            }


            else
            {
                Response.Redirect("EncuentroPrivado.aspx");

            }


        }
        public void cambiarImagen()
        {
            FileUploadAvatar.Visible = false;
            btn_guardarImagen.Visible = false;
            btn_CambiarImagen.Visible = true;
        }
        //protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    lblmsjrb1.Text = "Calificacion seleccionada es: " + RadioButtonList1.SelectedValue;
        //}
        public void manejarValoracion()
        {
            if (ValoracionDao.existePromedioxid(Session["id"].ToString(), "1") == true)
            {
                RadioButtonList1.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(Session["id"].ToString(), "1"));
                foreach (ListItem item in RadioButtonList1.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(Session["id"].ToString(), "1") && item.Text == "★")
                    {
                        item.Attributes.CssStyle.Add("color", "orange");
                    }

                }
                RadioButtonList1.Enabled = false;
                lblmsjrb1.Text = "Calificacion Promedio de Comportamiento es: " + RadioButtonList1.SelectedValue + " Puntos";
            }
            else
            {
                RadioButtonList1.Enabled = false;
                lblmsjrb1.Text = "Usted no ha sido calificado en esta seccion";

            }
            if (ValoracionDao.existePromedioxid(Session["id"].ToString(), "2") == true)
            {
                RadioButtonList2.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(Session["id"].ToString(), "2"));
                foreach (ListItem item in RadioButtonList2.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(Session["id"].ToString(), "2") && item.Text == "★")
                    {
                        item.Attributes.CssStyle.Add("color", "orange");
                    }

                }
                RadioButtonList2.Enabled = false;
                lblmsjrb2.Text = "Calificacion Promedio de Puntualidad es: " + RadioButtonList2.SelectedValue + " Puntos";

            }
            else
            {
                RadioButtonList2.Enabled = false;
                lblmsjrb2.Text = "Usted no ha sido calificado en esta seccion";
            }
            if (ValoracionDao.existePromedioxid(Session["id"].ToString(), "3") == true)
            {
                RadioButtonList3.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(Session["id"].ToString(), "3"));
                foreach (ListItem item in RadioButtonList3.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(Session["id"].ToString(), "3") && item.Text == "★")
                    {
                        item.Attributes.CssStyle.Add("color", "orange");
                    }

                }
                RadioButtonList3.Enabled = false;
                lblmsjrb3.Text = "Calificacion Promedio de Habilidad Deportiva es: " + RadioButtonList3.SelectedValue + " Puntos";

            }
            else
            {
                RadioButtonList3.Enabled = false;
                lblmsjrb3.Text = "Usted no ha sido calificado en esta seccion";
            }
            if(ValoracionDao.existePromedioGeneral(Session["id"].ToString()) == true){ 
            RadioButtonList4.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromediogeneral(Session["id"].ToString()));
            foreach (ListItem item in RadioButtonList4.Items)
            {
                if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromediogeneral(Session["id"].ToString()) && item.Text == "★")
                {
                    item.Attributes.CssStyle.Add("color", "orange");
                }

            }
            RadioButtonList4.Enabled = false;
            lblmsjrb4.Text = "Calificacion Promedio General es: " + RadioButtonList4.SelectedValue + " Puntos";
            }else{
                RadioButtonList4.Enabled = false;
                lblmsjrb4.Text = "Usted no ha sido calificado";
            }
        }

    }
}
