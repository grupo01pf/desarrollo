using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaDao;
using System.Drawing;
using System.Net;

namespace CapaPresentacion
{
    public partial class ABMComplejosEstablecimiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                ddlTipoCancha.Enabled = false;
                cargarBarrios();
                CargarGrillaComplejos();
                btnEliminar.Enabled = false;
                btnEliminar.CssClass = "btn btn-warning";
                CargarDeportes();
                CargarServicios();
                ddlDep4.AutoPostBack = true;
                ddlServ.AutoPostBack = true;
            }
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

        protected int? IDCom
        {
            get
            {
                if (ViewState["IDCom"] != null)
                    return (int)ViewState["IDCom"];
                else
                {
                    return null;
                }
            }
            set { ViewState["IDCom"] = value; }
        }

        protected int? IDCan
        {
            get
            {
                if (ViewState["IDCan"] != null)
                    return (int)ViewState["IDCan"];
                else
                {
                    return null;
                }
            }
            set { ViewState["IDCan"] = value; }
        }

        protected int? IDServ
        {
            get
            {
                if (ViewState["IDServ"] != null)
                    return (int)ViewState["IDServ"];
                else
                {
                    return null;
                }
            }
            set { ViewState["IDServ"] = value; }
        }
        private void Limpiar()
        {
            txtNomb.Text = string.Empty;
            txtDesc.Text = string.Empty;
            txtCalle.Text = string.Empty;
            txtNro.Text = null;
            ddlBarrio.SelectedIndex = 0;
            txtTel.Text = null;
            txtHoraApe.Text = string.Empty;
            txtHoraCie.Text = string.Empty;

            FileUploadAvatar.Visible = true;
            btn_guardarImagen.Visible = false;
            btn_CambiarImagen.Visible = false;
            lblestado.Text = string.Empty;
            lblestado.Visible = false;
            imgAvatar.ImageUrl = "~/Imagenes/complejo_logo_default.png";
        
            lblDeportes.Visible = false;
            lblDepResultado.Visible = false;

            ID = null;
            btnEliminar.Enabled = false;
            btnEliminar.CssClass = "btn btn-warning";
        }

        private void CargarDeportes()
        {
            ddlDep4.DataSource = null;

            ddlDep4.DataTextField = "nombre";

            ddlDep4.DataValueField = "id";

            ddlDep4.DataSource = (from Dep in DeporteDao.ObtenerDeportes()
                                  orderby Dep.nombre
                                  select Dep);

            ddlDep4.DataBind();
        }

        private void cargarBarrios()
        {
            ddlBarrio.DataSource = null;

            ddlBarrio.DataTextField = "nombre";

            ddlBarrio.DataValueField = "id";

            ddlBarrio.DataSource = (from bar in BarrioDao.obtenerBarrios()
                                    orderby bar.nombre
                                    select bar);

            ddlBarrio.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            ComplejoDeportivo complejo = new ComplejoDeportivo();

            complejo.nombre = txtNomb.Text;
            complejo.descripcion = txtDesc.Text;
            complejo.deportes = lblDepResultado.Text;
            complejo.idResponsable = 2;
            complejo.promedioEstrellas = 0;
            complejo.idEstado = 1;
            complejo.calle = txtCalle.Text;

            int nroCalle;
            if (int.TryParse(txtNro.Text, out nroCalle))
                complejo.nroCalle = nroCalle;

            int barrio;
            if (int.TryParse(ddlBarrio.Text, out barrio))
                complejo.idBarrio = barrio;

            int tel;
            if (int.TryParse(txtTel.Text, out tel))
                complejo.nroTelefono = tel;

            TimeSpan horaApe;
            if (TimeSpan.TryParse(txtHoraApe.Text, out horaApe))
                complejo.horaApertura = horaApe;

            TimeSpan horaCie;
            if (TimeSpan.TryParse(txtHoraCie.Text, out horaCie))
                complejo.horaCierre = horaCie;

            //Guardar Avatar
            if (FileUploadAvatar.HasFile)
            {
                //obtener datos de la imagen
                int tam = FileUploadAvatar.PostedFile.ContentLength;
                byte[] ImagenOriginal = new byte[tam];

                FileUploadAvatar.PostedFile.InputStream.Read(ImagenOriginal, 0, tam);
                Bitmap ImagenOriginalBinaria = new Bitmap(FileUploadAvatar.PostedFile.InputStream);

                //insertar en BD
                complejo.avatar = ImagenOriginal;
                //string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(ImagenOriginal);
                //Image1.ImageUrl = ImagenDataURL64;
                //imgAvatar.ImageUrl = "~/AvatarComplejo.aspx?id=" + Session["ID"].ToString();
                FileUploadAvatar.Visible = false;
                btn_guardarImagen.Visible = false;
                btn_CambiarImagen.Visible = true;
            }

            else
            {
                //obtener datos de la imagen
                byte[] ImagenOriginal;
                string someUrl = @"C:\Users\linov\Documents\GitHub\desarrollo\HayEquipo\CapaPresentacion\Imagenes\complejo_logo_default.png";
                using (var webClient = new WebClient())
                {
                    ImagenOriginal = webClient.DownloadData(someUrl);
                }

                //insertar en BD
                complejo.avatar = ImagenOriginal;

                FileUploadAvatar.Visible = false;
                btn_guardarImagen.Visible = false;
                btn_CambiarImagen.Visible = true;
            }

            if (ID.HasValue)
            {
                complejo.id = ID.Value;
                ComplejoDeportivoDao.ActualizarComplejo(complejo);
            }
            else
            {
                complejo.fechaRegistro = DateTime.Today;
                ComplejoDeportivoDao.InsertarComplejo(complejo);
            }

            CargarGrillaComplejos();
            Limpiar();
        }

        protected void CargarGrillaComplejos()
        {
            Responsable res = ResponsableDao.ObtenerResponsablePorIdUsuario(int.Parse(Session["ID"].ToString()));
            gvComplejos.DataSource = null;

            gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosPorResponsable(res.id)
                                      orderby comp.Nombre
                                      select comp);

            gvComplejos.DataKeyNames = new string[] { "ID" };
            gvComplejos.DataBind();
        }

        protected void gvComplejos_SelectedIndexChanged(object sender, EventArgs e)
        {
            Limpiar();
            int idSeleccionado = int.Parse(gvComplejos.SelectedDataKey.Value.ToString());
            IDCom = idSeleccionado;
            Session["IDCom"] = idSeleccionado;
            ComplejoDeportivo compSelec = ComplejoDeportivoDao.ObtenerComplejosPorID(idSeleccionado);

            txtNomb.Text = compSelec.nombre;
            txtDesc.Text = compSelec.descripcion;
            if (compSelec.deportes != string.Empty)
            {
                lblDepResultado.Text = compSelec.deportes;
            }
            else
            {
                lblDepResultado.Text = "-";
            }
            txtCalle.Text = compSelec.calle;
            txtNro.Text = compSelec.nroCalle.ToString();
            ddlBarrio.SelectedIndex = int.Parse((compSelec.idBarrio).ToString());
            txtTel.Text = compSelec.nroTelefono.ToString();
            txtHoraApe.Text = compSelec.horaApertura.ToString();
            txtHoraCie.Text = compSelec.horaCierre.ToString();
            if (ComplejoDeportivoDao.existeAvatar(Session["IDCom"].ToString()) != false)
            {
                imgAvatar.ImageUrl = "~/AvatarComplejo.aspx?id=" + Session["IDCom"].ToString();
                CambiarImagen();
            }
            else
            {
                imgAvatar.ImageUrl = "~/Imagenes/complejo_logo_default.png";
                btn_guardarImagen.Visible = true;
            }
            if (compSelec.fechaRegistro.ToString() != string.Empty)
            {
                DateTime fecha = (DateTime)Convert.ChangeType(compSelec.fechaRegistro, typeof(DateTime));
                lblFecResultado.Text = fecha.ToString(@"dd/MM/yyyy");
            }
            else
            {
                lblFecResultado.Text = "-";
            }
            

            lblFecha.Visible = true;
            lblFecResultado.Visible = true;
            lblDeportes.Visible = true;
            lblDepResultado.Visible = true;
            btnEliminar.Enabled = true;
            btnCanchas.Enabled = true;
            btnServicios.Enabled = true;
            btnImagenes.Enabled = true;
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (ComplejoDeportivoDao.ExistenCanchasPorComplejo(ID.Value) == true)
            {
                CanchaDao.EliminarCanchasPorComplejo(ID.Value);
            }
            if (ServicioExtraDao.ExistenServiciosPorComplejo(ID.Value) > 0)
            {
                ServicioExtraDao.EliminarServiciosPorComplejo(ID.Value);
            }          
            ComplejoDeportivoDao.EliminarComplejo(ID.Value);
            CargarGrillaComplejos();
            Limpiar();
        }

        private void CargarTipoCancha()
        {
            List<TipoCancha> tiposCanchas = TipoCanchaDao.ObtenerTipoPorIdDeporte(int.Parse(ddlDep4.SelectedValue));

            ddlTipoCancha.DataSource = null;

            ddlTipoCancha.DataTextField = "nombre";

            ddlTipoCancha.DataValueField = "id";

            ddlTipoCancha.DataSource = tiposCanchas;

            ddlTipoCancha.DataBind();
        }

        private void CargarServicios()
        {
            List<ServicioExtra> servicios = ServicioExtraDao.ObtenerServicios();

            ddlServ.DataSource = null;

            ddlServ.DataTextField = "nombre";

            ddlServ.DataValueField = "id";

            ddlServ.DataSource = servicios;

            ddlServ.DataBind();
        }

        protected void ddlDep4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (int.Parse(ddlDep4.SelectedValue) != 0)
            {
                ddlTipoCancha.Items.Clear();
                CargarTipoCancha();
                //ddlTipoCancha.SelectedIndex = 0;
                ddlTipoCancha.Enabled = true;
            }
            else
            {
                ddlTipoCancha.Items.Clear();
                ddlTipoCancha.Enabled = false;
            }
        }

        protected void CargarGrillaCanchas()
        {
            gvCanchas.DataSource = null;

            gvCanchas.DataSource = (from can in CanchaDao.ObtenerCanchasPorComplejos(IDCom.Value)
                                    orderby can.Deporte, can.Nombre
                                    select can);

            gvCanchas.DataKeyNames = new string[] { "ID" };
            gvCanchas.DataBind();
        }

        protected void btnGuardarCan_Click(object sender, EventArgs e)
        {
            Cancha cancha = new Cancha();

            cancha.nombre = txtNomCan.Text;
            cancha.descripcion = txtDesCan.Text;

            int tipoCan;
            if (int.TryParse(ddlTipoCancha.Text, out tipoCan))
                cancha.idTipoCancha = tipoCan;

            cancha.idComplejo = IDCom.Value;

            if (IDCan.HasValue)
            {
                cancha.id = IDCan.Value;
                CanchaDao.ActualizarCancha(cancha);
            }
            else
            {
                CanchaDao.InsertarCancha(cancha);
            }

            if(ComplejoDeportivoDao.ExisteDeporte(IDCom.Value, ddlDep4.SelectedItem.ToString()) == false)
            {
                ComplejoDeportivo complejo = new ComplejoDeportivo();
                complejo.id = ID.Value;
                complejo.deportes = ddlDep4.SelectedItem.ToString();
                ComplejoDeportivoDao.ActualizarDeportesComplejo(complejo);          
            }

            CargarGrillaCanchas();
            LimpiarCanchas();
        }

        private void LimpiarCanchas()
        {
            txtNomCan.Text = string.Empty;
            txtDesCan.Text = string.Empty;
            ddlDep4.Items.Clear();
            CargarDeportes();
            //ddlDep4.SelectedIndex = 0;
            ddlTipoCancha.Items.Clear();
            ddlTipoCancha.Enabled = false;

            IDCan = null;
            btnEliminarCan.Enabled = false;
            btnEliminarCan.CssClass = "btn btn-warning";
        }

        protected void gvCanchas_SelectedIndexChanged(object sender, EventArgs e)
        {
            LimpiarCanchas();
            int idSeleccionado = int.Parse(gvCanchas.SelectedDataKey.Value.ToString());
            IDCan = idSeleccionado;
            Cancha canSelec = CanchaDao.ObtenerCanchasPorID(idSeleccionado);

            ddlTipoCancha.Enabled = true;
            txtNomCan.Text = canSelec.nombre;
            txtDesCan.Text = canSelec.descripcion;
            TipoCancha tc = TipoCanchaDao.ObtenerTipoPorID(int.Parse((canSelec.idTipoCancha).ToString()));
            ddlDep4.SelectedValue = (tc.idDeporte).ToString();
            CargarTipoCancha();
            ddlTipoCancha.SelectedValue = (canSelec.idTipoCancha).ToString();

            btnEliminarCan.Enabled = true;
        }

        protected void btnNuevoCan_Click(object sender, EventArgs e)
        {
            LimpiarCanchas();
        }

        protected void btnEliminarCan_Click(object sender, EventArgs e)
        {
            CanchaDao.EliminarCancha(IDCan.Value);
            CargarGrillaCanchas();
           
            if(ComplejoDeportivoDao.CuantasCanchasPorDeporte(IDCom.Value, ddlDep4.SelectedIndex) == 0)
            {
                ComplejoDeportivoDao.EliminarDeporteComplejo(IDCom.Value, ddlDep4.SelectedItem.ToString());
            }
            LimpiarCanchas();
        }

        protected void CargarGrillaServicios()
        {
            gvServ.DataSource = null;

            gvServ.DataSource = (from serv in ServicioExtraDao.ObtenerServiciosPorComp(IDCom.Value)
                                 orderby serv.nombre
                                 select serv);

            gvServ.DataKeyNames = new string[] { "ID" };
            gvServ.DataBind();
        }
        private void LimpiarServicios()
        {
            ddlServ.Items.Clear();
            CargarServicios();
            //ddlServ.SelectedIndex = 0;

            IDServ = null;
            btnGuardarS.Enabled = false;
        }

        protected void btnGuardarS_Click(object sender, EventArgs e)
        {
            ServiciosPorComplejos servPorComp = new ServiciosPorComplejos();

            int serv;
            if (int.TryParse(ddlServ.Text, out serv))
                servPorComp.idServicio = serv;

            servPorComp.idComplejo = IDCom.Value;

            ServiciosPorComplejosDao.InsertarServicioPorComplejo(servPorComp);

            CargarGrillaServicios();
            LimpiarServicios();
        }

        protected void gvServ_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idSeleccionado = int.Parse(gvServ.SelectedDataKey.Value.ToString());
            IDServ = idSeleccionado;
            ServiciosPorComplejosDao.EliminarServicioPorComplejo(IDServ.Value);
            CargarGrillaServicios();
            LimpiarServicios();
        }

        protected void ddlServ_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlServ.SelectedIndex == 0)
            {
                btnGuardarS.Enabled = false;
            }
            else
            {
                btnGuardarS.Enabled = true;
            }
        }

        //CANCHAS
        protected void btnClose_Click(object sender, EventArgs e)
        {
            ComplejoDeportivo complejo = ComplejoDeportivoDao.ObtenerComplejosPorID(IDCom.Value);
            lblDepResultado.Text = complejo.deportes;
            CargarGrillaComplejos();
            btnPopUp_ModalPopupExtender.Hide();
            LimpiarCanchas();
        }

        protected void btnPopUp_Click(object sender, EventArgs e)
        {
            if (IDCom.HasValue == true)
            {
                CargarGrillaCanchas();
                btnPopUp_ModalPopupExtender.Show();
            }        
        }

        //SERVICIOS
        protected void btnClose2_Click(object sender, EventArgs e)
        {
            btnPopUp_ModalPopupExtender2.Hide();
            LimpiarServicios();
        }

        protected void btnPopUp2_Click(object sender, EventArgs e)
        {
            if (IDCom.HasValue == true)
            {            
                CargarGrillaServicios();
                btnPopUp_ModalPopupExtender2.Show();
            }
        }

        //IMÁGENES
        protected void btnClose3_Click(object sender, EventArgs e)
        {
            btnPopUp_ModalPopupExtender3.Hide();
            LimpiarServicios();
        }

        protected void btnPopUp3_Click(object sender, EventArgs e)
        {
            if (IDCom.HasValue == true)
            {
                CargarGrillaServicios();
                btnPopUp_ModalPopupExtender3.Show();
            }
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
                ComplejoDeportivoDao.AgregarAvatar(Session["IDCom"].ToString(), ImagenOriginal);
                lblestado.Text = "Imagen Guardada Exitosamente";
                //string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(ImagenOriginal);
                //Image1.ImageUrl = ImagenDataURL64;
                imgAvatar.ImageUrl = "~/AvatarComplejo.aspx?id=" + Session["IDCom"].ToString();
                FileUploadAvatar.Visible = false;
                btn_guardarImagen.Visible = false;
                btn_CambiarImagen.Visible = true;
            }
            else
            {
                lblestado.Text = "Coloque un archivo de imagen valido";
            }
            lblestado.Visible = true;
        }

        protected void btnCambiarImagen_Click(object sender, EventArgs e)
        {
            FileUploadAvatar.Visible = true;
            btn_guardarImagen.Visible = true;
            btn_CambiarImagen.Visible = false;
        }

        public void CambiarImagen()
        {
            FileUploadAvatar.Visible = false;
            btn_guardarImagen.Visible = false;
            btn_CambiarImagen.Visible = true;
        }

        protected void btnSubir_Click(object sender, EventArgs e)
        {
            if (fUploadImagen.HasFile)
            {
                //obtener datos de la imagen
                int tam = fUploadImagen.PostedFile.ContentLength;
                byte[] ImagenOriginal = new byte[tam];

                fUploadImagen.PostedFile.InputStream.Read(ImagenOriginal, 0, tam);
                Bitmap ImagenOriginalBinaria = new Bitmap(fUploadImagen.PostedFile.InputStream);

                //insertar en BD
                ComplejoDeportivoDao.InsertarImagenComplejo(IDCom.Value, ImagenOriginal);
                lblEstadoImg.Text = "Imagen Guardada Exitosamente";
                string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(ImagenOriginal);

                CargarRepeaterImagenes();
            }
            else
            {
                lblEstadoImg.Text = "Coloque un archivo de imagen valido";
            }
            lblestado.Visible = true;
        }

        protected void CargarRepeaterImagenes()
        {
            Repeater1.DataSource = ComplejoDeportivoDao.ObtenerImagenesComp(IDCom.Value);
            Repeater1.DataBind();
            Repeater1.ItemCommand += new RepeaterCommandEventHandler(Repeater1_ItemCommand1);
        }

        protected void Repeater1_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "btnEliminarImagen")
            {
                int idImagen = int.Parse(((LinkButton)e.CommandSource).CommandArgument);
                ComplejoDeportivoDao.EliminarImagenComp(idImagen);
                CargarRepeaterImagenes();
            }
        }

    }
}