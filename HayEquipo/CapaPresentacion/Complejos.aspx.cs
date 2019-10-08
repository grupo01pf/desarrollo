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
    public partial class Complejos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                CargarGrillaComplejos();
                ddlOrdenar.AutoPostBack = true;
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

        protected void CargarGrillaComplejos()
        {
            gvComplejos.DataSource = null;

            gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
                                      select comp);

            gvComplejos.DataKeyNames = new string[] { "ID" };
            gvComplejos.DataBind();       
        }

        protected void CargarGrillaComplejosPorNom()
        {
            gvComplejos.DataSource = null;

            gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
                                      orderby comp.Nombre
                                      select comp);

            gvComplejos.DataKeyNames = new string[] { "ID" };
            gvComplejos.DataBind();
        }

        protected void CargarGrillaComplejosPorVal()
        {
            gvComplejos.DataSource = null;

            gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
                                      orderby comp.Valoracion descending
                                      select comp);

            gvComplejos.DataKeyNames = new string[] { "ID" };
            gvComplejos.DataBind();
        }

        protected void CargarGrillaComplejosPorFecha()
        {
            gvComplejos.DataSource = null;

            gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
                                      orderby comp.FechaRegistro descending
                                      select comp);

            gvComplejos.DataKeyNames = new string[] { "ID" };
            gvComplejos.DataBind();
        }

        protected void CargarGrillaComplejosBuscar(string nomb, int? idUsuario, string d1, string d2, string d3)
        {
            gvComplejos.DataSource = null;

            gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosFiltros(nomb, idUsuario, d1, d2, d3)
                                      orderby comp.Nombre
                                      select comp);

            gvComplejos.DataKeyNames = new string[] { "ID" };
            gvComplejos.DataBind();
        }

        protected void CargarListServicios(int idComp)
        {
            listServicios.DataSource = ServicioExtraDao.ObtenerServiciosPorComp(idComp);
            listServicios.DataTextField = "nombre";
            listServicios.DataValueField = "id";
            listServicios.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {          
            if (txtBuscar.Text == "")
            {
                CargarGrillaComplejos();
            }
            else
            {                            
                string nomb = txtBuscar.Text;
                int? idUs = null;
                string d1 = string.Empty;
                string d2 = string.Empty;
                string d3 = string.Empty;

                CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
            }
            ddlOrdenar.SelectedIndex = 0;
        }

        //protected void LimpiarModal()
        //{
        //    myModalLabel2.InnerText = string.Empty;
        //    lblValoracion.Text = "Valoración: " + compSelec.promedioEstrellas.ToString();
        //    lblDeportes.Text = compSelec.deportes;
        //    lblDescripcion.Text = compSelec.descripcion;
        //}

        protected void gvComplejos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idSeleccionado = int.Parse(gvComplejos.SelectedDataKey.Value.ToString());
            ID = idSeleccionado;
            Session["ID"] = idSeleccionado;
            ComplejoDeportivo compSelec = ComplejoDeportivoDao.ObtenerComplejosPorID(idSeleccionado);

            myModalLabel2.InnerText = compSelec.nombre;
            lblValoracion.Text = "Valoración: " + compSelec.promedioEstrellas.ToString();
            lblDeportes.Text = compSelec.deportes;
            lblDescripcion.Text = compSelec.descripcion;
            listServicios.Items.Clear();
            lblServicios.Text = "Servicios: ";
            if (ServicioExtraDao.ExistenServiciosPorComplejo(compSelec.id) > 0)
            {
                CargarListServicios(compSelec.id);
            }
            else
            {
                lblServicios.Text = "Servicios: - ";
                divListServ.Visible = false;
            }
            lblDireccion.Text = "Dirección: " + compSelec.calle + " " + compSelec.nroCalle.ToString();
            Barrio bar = BarrioDao.ObtenerBarriosPorID(int.Parse(compSelec.idBarrio.ToString()));
            lblBarrio.Text = "Barrio: " + bar.nombre;
            lblZona.Text = "Zona: " + ZonaDao.ObtenerZonasPorID(int.Parse(bar.idZona.ToString())).nombre;
            lblTelefono.Text = "Teléfono: " + compSelec.nroTelefono.ToString();
            if(compSelec.horaApertura != null && compSelec.horaCierre != null)
            {
                TimeSpan hA = (TimeSpan)Convert.ChangeType(compSelec.horaApertura, typeof(TimeSpan));
                TimeSpan hC = (TimeSpan)Convert.ChangeType(compSelec.horaCierre, typeof(TimeSpan));
                lblHorarios.Text = "Horarios: " + hA.ToString(@"hh\:mm") + " a " + hC.ToString(@"hh\:mm");
            }
            else
            {
                lblHorarios.Text = "Horarios: - ";
            }
            
            if (ComplejoDeportivoDao.existeAvatar(Session["ID"].ToString()) != false)
            {
                imgAvatar.ImageUrl = "~/AvatarComplejo.aspx?id=" + Session["ID"].ToString();
            }
            else
            {
                imgAvatar.ImageUrl = "~/Imagenes/complejo_logo_default.png";
            }

            if (ComplejoDeportivoDao.existeImagen(Session["ID"].ToString(), 1) != false)
            {
                img1.Src = "~/ImagenComplejo1.aspx?id=" + Session["ID"].ToString();
            }
            else
            {
                img1.Src = "~/Imagenes/complejo_logo_default.png";
            }
            if (ComplejoDeportivoDao.existeImagen(Session["ID"].ToString(), 2) != false)
            {
                img2.Src = "~/ImagenComplejo2.aspx?id=" + Session["ID"].ToString();
            }
            else
            {
                img2.Src = "~/Imagenes/complejo_logo_default.png";
            }
            if (ComplejoDeportivoDao.existeImagen(Session["ID"].ToString(), 3) != false)
            {
                img3.Src = "~/ImagenComplejo3.aspx?id=" + Session["ID"].ToString();
            }
            else
            {
                img3.Src = "~/Imagenes/complejo_logo_default.png";
            }

            btnPopUp_ModalPopupExtender2.Show();

        }


        protected void ddlOrdenar_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtBuscar.Text = string.Empty;
            //POR DEFECTO
            if (ddlOrdenar.SelectedIndex == 0)
            {
                CargarGrillaComplejos();
            }
            //POR VALORACION
            if (ddlOrdenar.SelectedIndex == 1)
            {
                CargarGrillaComplejosPorVal();
            }
            //POR MAS CERCANO
            if (ddlOrdenar.SelectedIndex == 2)
            {
                string nomb = txtBuscar.Text;
                //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                int? idUs = 2;
                string d1 = string.Empty;
                string d2 = string.Empty;
                string d3 = string.Empty;

                CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
            }
            //ALFABETICAMENTE
            if (ddlOrdenar.SelectedIndex == 3)
            {
                CargarGrillaComplejosPorNom();
            }
            //MÁS NUEVO
            if (ddlOrdenar.SelectedIndex == 4)
            {
                CargarGrillaComplejosPorFecha();
            }
        }
       
        protected void lbFutbol_Click(object sender, EventArgs e)
        {
            lbFutbol.Enabled = false;
            string d1 = string.Empty;
            string d2 = string.Empty;
            string d3 = string.Empty;

            if (btnD1.Visible == false)
            {
                btnD1.Text = lbFutbol.Text;
                btnD1.Visible = true;
                

                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
            }
            
            else if (btnD2.Visible == false && btnD1.Text != "Fútbol" && btnD3.Text != "Fútbol")
            {
                btnD2.Text = lbFutbol.Text;
                btnD2.Visible = true;
                
                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
            }

            else if (btnD3.Visible == false && btnD1.Text != "Fútbol" && btnD2.Text != "Fútbol")
            {
                btnD3.Text = lbFutbol.Text;
                btnD3.Visible = true;

                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
            }
        }

        protected void lbBasket_Click(object sender, EventArgs e)
        {
            lbBasket.Enabled = false;
            string d1 = string.Empty;
            string d2 = string.Empty;
            string d3 = string.Empty;

            if (btnD1.Visible == false)
            {
                btnD1.Text = lbBasket.Text;
                btnD1.Visible = true;

                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
            }

            if (btnD2.Visible == false && btnD1.Text != "Basket" && btnD3.Text != "Basket")
            {
                btnD2.Text = lbBasket.Text;
                btnD2.Visible = true;

                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
            }

            if (btnD3.Visible == false && btnD1.Text != "Basket" && btnD2.Text != "Basket")
            {
                btnD3.Text = lbBasket.Text;
                btnD3.Visible = true;

                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
            }
        }

        protected void lbTenis_Click(object sender, EventArgs e)
        {
            lbTenis.Enabled = false;
            string d1 = string.Empty;
            string d2 = string.Empty;
            string d3 = string.Empty;

            if (btnD1.Visible == false)
            {
                btnD1.Text = lbTenis.Text;
                btnD1.Visible = true;


                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
            }

            else if (btnD2.Visible == false && btnD1.Text != "Tenis" && btnD3.Text != "Tenis")
            {
                btnD2.Text = lbTenis.Text;
                btnD2.Visible = true;

                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
            }

            else if (btnD3.Visible == false && btnD1.Text != "Tenis" && btnD2.Text != "Tenis")
            {
                btnD3.Text = lbTenis.Text;
                btnD3.Visible = true;

                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
            }
        }

        protected void lbPaddle_Click(object sender, EventArgs e)
        {
            lbPaddle.Enabled = false;
            string d1 = string.Empty;
            string d2 = string.Empty;
            string d3 = string.Empty;

            if (btnD1.Visible == false)
            {
                btnD1.Text = lbPaddle.Text;
                btnD1.Visible = true;


                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
            }

            else if (btnD2.Visible == false && btnD1.Text != "Paddle" && btnD3.Text != "Paddle")
            {
                btnD2.Text = lbPaddle.Text;
                btnD2.Visible = true;

                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
            }

            else if (btnD3.Visible == false && btnD1.Text != "Paddle" && btnD2.Text != "Paddle")
            {
                btnD3.Text = lbPaddle.Text;
                btnD3.Visible = true;

                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
            }
        }

        protected void btnClose2_Click(object sender, EventArgs e)
        {
            btnPopUp_ModalPopupExtender2.Hide();
        }

        protected void btnD1_Click(object sender, EventArgs e)
        {
            string d1 = string.Empty;
            string d2 = string.Empty;
            string d3 = string.Empty;

            if (btnD1.Text == "Fútbol")
            {
                lbFutbol.Enabled = true;
            }

            if (btnD1.Text == "Basket")
            {
                lbBasket.Enabled = true;
            }

            if (btnD1.Text == "Tenis")
            {
                lbTenis.Enabled = true;
            }

            if (btnD1.Text == "Paddle")
            {
                lbPaddle.Enabled = true;
            }

            btnD1.Visible = false;
            btnD1.Text = string.Empty;

            if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
        }

        protected void btnD2_Click(object sender, EventArgs e)
        {
            string d1 = string.Empty;
            string d2 = string.Empty;
            string d3 = string.Empty;

            if (btnD2.Text == "Fútbol")
            {
                lbFutbol.Enabled = true;
            }

            if (btnD2.Text == "Basket")
            {
                lbBasket.Enabled = true;
            }

            if (btnD2.Text == "Tenis")
            {
                lbTenis.Enabled = true;
            }

            if (btnD2.Text == "Paddle")
            {
                lbPaddle.Enabled = true;
            }

            btnD2.Visible = false;
            btnD2.Text = string.Empty;

            if (ddlOrdenar.SelectedIndex == 2)
            {
                string nomb = txtBuscar.Text;
                //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                int? idUs = 2;
                d1 = btnD1.Text;
                d2 = btnD2.Text;
                d3 = btnD3.Text;

                CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
            }

            else
            {
                string nomb = txtBuscar.Text;
                int? idUs = null;
                d1 = btnD1.Text;
                d2 = btnD2.Text;
                d3 = btnD3.Text;

                CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
            }
        }

        protected void btnD3_Click(object sender, EventArgs e)
        {
            string d1 = string.Empty;
            string d2 = string.Empty;
            string d3 = string.Empty;

            if (btnD3.Text == "Fútbol")
            {
                lbFutbol.Enabled = true;
            }

            if (btnD3.Text == "Basket")
            {
                lbBasket.Enabled = true;
            }

            if (btnD3.Text == "Tenis")
            {
                lbTenis.Enabled = true;
            }

            if (btnD3.Text == "Paddle")
            {
                lbPaddle.Enabled = true;
            }

            btnD3.Visible = false;
            btnD3.Text = string.Empty;

            if (ddlOrdenar.SelectedIndex == 2)
            {
                string nomb = txtBuscar.Text;
                //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                int? idUs = 2;
                d1 = btnD1.Text;
                d2 = btnD2.Text;
                d3 = btnD3.Text;

                CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
            }

            else
            {
                string nomb = txtBuscar.Text;
                int? idUs = null;
                d1 = btnD1.Text;
                d2 = btnD2.Text;
                d3 = btnD3.Text;

                CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
            }
        }
    }
}