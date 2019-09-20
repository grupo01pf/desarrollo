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
    public partial class ComplejosWF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                CargarDeporte1();
                CargarDeporte2();
                CargarDeporte3();
                ddlDep2.Enabled = false;
                ddlDep3.Enabled = false;
                ddlTipoCancha.Enabled = false;
                cargarBarrios();
                CargarGrillaComplejos();
                btnEliminar.Enabled = false;
                btnEliminar.CssClass = "btn btn-warning";
                ddlDep1.AutoPostBack = true;
                ddlDep2.AutoPostBack = true;
                ddlDep4.AutoPostBack = true;
                //btnCan.Enabled = false;
                //btnServ.Enabled = false;
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
            ddlDep1.SelectedIndex = 0;
            ddlDep2.SelectedIndex = 0;
            ddlDep3.SelectedIndex = 0;
            txtCalle.Text = string.Empty;
            txtNro.Text = null;
            ddlBarrio.SelectedIndex = 0;
            txtTel.Text = null;

            ID = null;
            btnEliminar.Enabled = false;
            btnEliminar.CssClass = "btn btn-warning";
        }

        private void CargarDeporte(DropDownList ddl)
        {
            List<Deporte> deportes = DeporteDao.ObtenerDeportes();

            ddl.DataSource = null;

            ddl.DataTextField = "nombre";

            ddl.DataValueField = "id";

            ddl.DataSource = deportes;

            ddl.DataBind();
        }

        private void CargarDeporte1()
        {
            CargarDeporte(ddlDep1);
        }

        private void CargarDeporte2()
        {
            CargarDeporte(ddlDep2);
        }

        private void CargarDeporte3()
        {
            CargarDeporte(ddlDep3);
        }

        private void CargarDeporte4()
        {
            CargarDeporte(ddlDep4);
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
            complejo.idResponsable = 2;
            complejo.promedioEstrellas = 0;
            complejo.idEstado = 1;

            int dep1;
            if (int.TryParse(ddlDep1.Text, out dep1))
                complejo.idDeporte1 = dep1;

            if (ddlDep2.SelectedIndex == 0)
            {
                complejo.idDeporte2 = null;
            }
            else
            {
                int dep2;
                if (int.TryParse(ddlDep2.Text, out dep2))
                    complejo.idDeporte2 = dep2;
            }

            if (ddlDep3.SelectedIndex == 0)
            {
                complejo.idDeporte3 = null;
            }
            else
            {
                int dep3;
                if (int.TryParse(ddlDep3.Text, out dep3))
                    complejo.idDeporte3 = dep3;
            }

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


            if (ID.HasValue)
            {
                complejo.id = ID.Value;
                ComplejoDeportivoDao.ActualizarComplejo(complejo);
            }
            else
            {

                ComplejoDeportivoDao.InsertarComplejo(complejo);
            }

            CargarGrillaComplejos();
            Limpiar();
        }

        protected void CargarGrillaComplejos()
        {
            gvComplejos.DataSource = null;

            gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
                                      orderby comp.Nombre
                                      select comp);

            gvComplejos.DataKeyNames = new string[] { "ID" };
            gvComplejos.DataBind();
        }

        protected void gvComplejos_SelectedIndexChanged(object sender, EventArgs e)
        {
            Limpiar();
            int idSeleccionado = int.Parse(gvComplejos.SelectedDataKey.Value.ToString());
            ID = idSeleccionado;
            ComplejoDeportivo compSelec = ComplejoDeportivoDao.ObtenerComplejosPorID(idSeleccionado);

            txtNomb.Text = compSelec.nombre;
            txtDesc.Text = compSelec.descripcion;
            ddlDep1.SelectedIndex = int.Parse((compSelec.idDeporte1).ToString());
            if (compSelec.idDeporte2 == null)
            {
                ddlDep2.SelectedIndex = 0;
                ddlDep3.Enabled = false;
            }
            else
            {
                ddlDep2.SelectedIndex = int.Parse((compSelec.idDeporte2).ToString());
            }
            if (compSelec.idDeporte3 == null)
            {
                ddlDep3.SelectedIndex = 0;
            }
            else
            {
                ddlDep3.SelectedIndex = int.Parse((compSelec.idDeporte3).ToString());
            }
            txtCalle.Text = compSelec.calle;
            txtNro.Text = compSelec.nroCalle.ToString();
            ddlBarrio.SelectedIndex = int.Parse((compSelec.idBarrio).ToString());
            txtTel.Text = compSelec.nroTelefono.ToString();

            btnEliminar.Enabled = true;
            //btnCan.Enabled = true;
            //btnServ.Enabled = true;
            CargarDeporte4();
            CargarGrillaCanchas();
            CargarServicios();
            //CargarGrillaServicios();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ComplejoDeportivoDao.EliminarComplejo(ID.Value);
            CargarGrillaComplejos();
            Limpiar();
        }

        //protected void btnCan_Click(object sender, EventArgs e)
        //{
        //    CargarDeporte4();
        //    CargarGrillaCanchas();
        //    //pnlCan.Visible = true;
        //}

        protected void ddlDep1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlDep2.Enabled = true;
        }

        protected void ddlDep2_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlDep3.Enabled = true;
        }

        private void CargarTipoCancha()
        {
            List<TipoCancha> tiposCanchas = TipoCanchaDao.ObtenerTipoPorIdDeporte(ddlDep4.SelectedIndex);

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
            if (ddlDep4.SelectedIndex != 0)
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

            gvCanchas.DataSource = (from can in CanchaDao.ObtenerCanchasPorComplejos(ID.Value)
                                    orderby can.Deporte, can.Nombre
                                    select can);

            gvCanchas.DataKeyNames = new string[] { "ID" };
            gvCanchas.DataBind();
        }

        //protected void btnServ_Click(object sender, EventArgs e)
        //{
        //    CargarServicios();
        //    CargarGrillaServicios();
        //}

        protected void btnGuardarCan_Click(object sender, EventArgs e)
        {
            Cancha cancha = new Cancha();

            cancha.nombre = txtNomCan.Text;
            cancha.descripcion = txtDesCan.Text;

            int tipoCan;
            if (int.TryParse(ddlTipoCancha.Text, out tipoCan))
                cancha.idTipoCancha = tipoCan;

            cancha.idComplejo = ID.Value;

            if (IDCan.HasValue)
            {
                cancha.id = IDCan.Value;
                CanchaDao.ActualizarCancha(cancha);
            }
            else
            {
                CanchaDao.InsertarCancha(cancha);
            }

            CargarGrillaCanchas();
            LimpiarCanchas();
        }

        private void LimpiarCanchas()
        {
            txtNomCan.Text = string.Empty;
            txtDesCan.Text = string.Empty;
            ddlDep4.SelectedIndex = 0;
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
            ddlDep4.SelectedIndex = int.Parse((tc.idDeporte).ToString());
            ddlTipoCancha.Items.Clear();
            CargarTipoCancha();
            ddlTipoCancha.SelectedIndex = int.Parse((tc.id).ToString()) - 1;

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
            LimpiarCanchas();
        }

        //protected void CargarGrillaServicios()
        //{
        //    gvServ.DataSource = null;

        //    gvServ.DataSource = (from serv in ServiciosPorComplejosDao.ObtenerServiciosPorComplejos(ID.Value)
        //                            orderby serv.Servicio
        //                            select serv);

        //    gvServ.DataKeyNames = new string[] { "ID" };
        //    gvServ.DataBind();
        //}
        private void LimpiarServicios()
        {
            ddlServ.SelectedIndex = 0;

            IDServ = null;
            btnEliminarS.Enabled = false;
            btnEliminarS.CssClass = "btn btn-warning";
        }
        protected void btnGuardarS_Click(object sender, EventArgs e)
        {
            ServiciosPorComplejos servPorComp = new ServiciosPorComplejos();

            int serv;
            if (int.TryParse(ddlServ.Text, out serv))
                servPorComp.idServicio = serv;

            servPorComp.idComplejo = ID.Value;

            ServiciosPorComplejosDao.InsertarServicioPorComplejo(servPorComp);

            //CargarGrillaServicios();
            LimpiarServicios();
        }

        protected void btnNuevoS_Click(object sender, EventArgs e)
        {
            LimpiarServicios();
        }

        protected void btnEliminarS_Click(object sender, EventArgs e)
        {
            ServiciosPorComplejosDao.EliminarServicioPorComplejo(IDServ.Value);
            //CargarGrillaServicios();
            LimpiarServicios();
        }

        protected void gvServ_SelectedIndexChanged(object sender, EventArgs e)
        {
            LimpiarServicios();
            int idSeleccionado = int.Parse(gvServ.SelectedDataKey.Value.ToString());
            IDServ = idSeleccionado;
            ServicioExtra servSelec = ServicioExtraDao.ObtenerServicioPorID(idSeleccionado);

            ddlServ.SelectedIndex = int.Parse((servSelec.id).ToString());

            btnEliminarS.Enabled = true;
        }

        //PROBANDO*********************************************************************
        protected void btn_Registrar_Click(object sender, EventArgs e)
        {
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            btnPopUp_ModalPopupExtender.Hide();
        }



        protected void btnPopUp_Click(object sender, EventArgs e)
        {


            btnPopUp_ModalPopupExtender.Show();
        }
    }
}