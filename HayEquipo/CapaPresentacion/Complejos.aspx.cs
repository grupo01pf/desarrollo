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
                ddlOrdenar.AutoPostBack = true;
            

            string nomb = string.Empty;
            int? idUs = null;
            string d1 = string.Empty;
            string d2 = string.Empty;
            string d3 = string.Empty;
            string d4 = string.Empty;

            CargarRepeaterComplejosPorNom(nomb, idUs, d1, d2, d3, d4);
            }
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

        protected void CargarRepeaterComplejos(string nomb, int? idUsuario, string d1, string d2, string d3, string d4)
        {
            encuentrosRepeater.DataSource = ComplejoDeportivoDao.ObtenerComplejosFiltros(nomb, idUsuario, d1, d2, d3, d4);
            encuentrosRepeater.DataBind();
            //encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
        }

        protected void CargarRepeaterComplejosPorNom(string nomb, int? idUsuario, string d1, string d2, string d3, string d4)
        {
            encuentrosRepeater.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosFiltros(nomb, idUsuario, d1, d2, d3, d4)
                                             orderby comp.Nombre ascending
                                             select comp);
            encuentrosRepeater.DataBind();
            //encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
        }

        protected void CargarRepeaterComplejosPorVal(string nomb, int? idUsuario, string d1, string d2, string d3, string d4)
        {
            encuentrosRepeater.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosFiltros(nomb, idUsuario, d1, d2, d3, d4)
                                             orderby comp.Valoracion descending
                                             select comp);
            encuentrosRepeater.DataBind();
            //encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
        }

        protected void CargarRepeaterComplejosPorFecha(string nomb, int? idUsuario, string d1, string d2, string d3, string d4)
        {
            encuentrosRepeater.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosFiltros(nomb, idUsuario, d1, d2, d3, d4)
                                           //  orderby comp.FechaRegistro descending
                                             select comp);
            encuentrosRepeater.DataBind();
            //encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
        }

        protected void CargarRepeaterComplejosBuscar(string nomb, int? idUsuario, string d1, string d2, string d3, string d4)
        {
            encuentrosRepeater.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosFiltros(nomb, idUsuario, d1, d2, d3, d4)
                                             orderby comp.Nombre
                                             select comp);
            encuentrosRepeater.DataBind();
            //encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
        }

    //    void encuentroRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
    //    {
    //    if (e.CommandName == "btnUnirseEncuentro")
    //    {
    //        string idEncuentro = ((LinkButton)e.CommandSource).CommandArgument;

    //        int idSeleccionado = int.Parse(((LinkButton)e.CommandSource).CommandArgument);
    //        IDCom = idSeleccionado;
    //        Session["IDCom"] = idSeleccionado;
    //        spObtenerComplejosJoin_Result compSelec = ComplejoDeportivoDao.ObtenerComplejoPorID(idSeleccionado);

    //        myModalLabel2.InnerText = compSelec.Nombre;
    //            if (ValoracionDao.existePromedioGeneralComplejo(idSeleccionado.ToString()))
    //            {
    //                RadioButtonList2.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromediogeneralComplejo(idSeleccionado.ToString()));
    //                foreach (ListItem item in RadioButtonList2.Items)
    //                {
    //                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromediogeneralComplejo(idSeleccionado.ToString()) && item.Text == "★")
    //                    {
    //                        item.Attributes.CssStyle.Add("color", "orange");
    //                    }

    //                }
    //                RadioButtonList2.Enabled = false;
    //                //lblValoracion.Text = "Calificacion Promedio General es: " + RadioButtonList2.SelectedValue + " Puntos";

    //            }else
    //            {
    //                RadioButtonList2.Enabled = false;
    //                RadioButtonList2.Visible = false;
    //                //lblValoracion.Text = "nua odarolav odis ah on ojelpmoC etsE";
    //            }
    //        lblDeportes.Text = compSelec.Deportes;
    //        lblDescripcion.Text = compSelec.Descripcion;
    //        listServicios.Items.Clear();
    //        lblServicios.Text = "Servicios: ";
    //        if (ServicioExtraDao.ExistenServiciosPorComplejo(compSelec.ID) > 0)
    //        {
    //            CargarListServicios(compSelec.ID);
    //        }
    //        else
    //        {
    //            lblServicios.Text = "Servicios: - ";
    //            divListServ.Visible = false;
    //        }
    //        lblDireccion.Text = "Dirección: " + compSelec.Calle + " " + compSelec.NroCalle.ToString();
    //        Barrio bar = BarrioDao.ObtenerBarriosPorID(int.Parse(compSelec.IDBarrio.ToString()));
    //        lblBarrio.Text = "Barrio: " + bar.nombre;
    //        lblZona.Text = "Zona: " + ZonaDao.ObtenerZonasPorID(int.Parse(bar.idZona.ToString())).nombre;
    //        lblTelefono.Text = "Teléfono: " + compSelec.Telefono.ToString();
    //        if (compSelec.Apertura != null && compSelec.Cierre != null)
    //        {
    //            TimeSpan hA = (TimeSpan)Convert.ChangeType(compSelec.Apertura, typeof(TimeSpan));
    //            TimeSpan hC = (TimeSpan)Convert.ChangeType(compSelec.Cierre, typeof(TimeSpan));
    //            lblHorarios.Text = "Horarios: " + hA.ToString(@"hh\:mm") + " a " + hC.ToString(@"hh\:mm");
    //        }
    //        else
    //        {
    //            lblHorarios.Text = "Horarios: - ";
    //        }

    //        if (ComplejoDeportivoDao.existeAvatar(Session["IDCom"].ToString()) != false)
    //        {
    //                byte[] avtr = ComplejoDeportivoDao.ObtenerAvatar(Session["IDCom"].ToString());
    //                string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(avtr);
    //                imgAvatar.ImageUrl = ImagenDataURL64;
    //        }
    //        else
    //        {
    //            imgAvatar.ImageUrl = "~/Imagenes/complejo_logo_default.png";
    //        }

    //        if (ComplejoDeportivoDao.existeImagen(Session["IDCom"].ToString(), 1) != false)
    //        {
    //                byte[] Img1 = ComplejoDeportivoDao.ObtenerImagen(Session["IDCom"].ToString(), 1);
    //                string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(Img1);
    //                img1.Src = ImagenDataURL64;
    //            }
    //        else
    //        {
    //            img1.Src = "~/Imagenes/complejo_logo_default.png";
    //        }
    //        if (ComplejoDeportivoDao.existeImagen(Session["IDCom"].ToString(), 2) != false)
    //        {
    //                byte[] Img2 = ComplejoDeportivoDao.ObtenerImagen(Session["IDCom"].ToString(), 2);
    //                string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(Img2);
    //                img2.Src = ImagenDataURL64;
    //            }
    //        else
    //        {
    //            img2.Src = "~/Imagenes/complejo_logo_default.png";
    //        }
    //        if (ComplejoDeportivoDao.existeImagen(Session["IDCom"].ToString(), 3) != false)
    //        {
    //                byte[] Img3 = ComplejoDeportivoDao.ObtenerImagen(Session["IDCom"].ToString(), 3);
    //                string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(Img3);
    //                img3.Src = ImagenDataURL64;
    //            }
    //        else
    //        {
    //            img3.Src = "~/Imagenes/complejo_logo_default.png";
    //        }

    //        btnPopUp_ModalPopupExtender2.Show();
    //    }
    //}

        protected void explorar_Click(object sender, EventArgs e)
        {

                int idSeleccionado = int.Parse((sender as LinkButton).CommandArgument);
                IDCom = idSeleccionado;
                Session["IDCom"] = idSeleccionado;
                spObtenerComplejosJoin_Result compSelec = ComplejoDeportivoDao.ObtenerComplejoPorID(idSeleccionado);

                myModalLabel2.InnerText = compSelec.Nombre;
                if (ValoracionDao.existePromedioGeneralComplejo(idSeleccionado.ToString()))
                {
                    RadioButtonList2.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromediogeneralComplejo(idSeleccionado.ToString()));
                    foreach (ListItem item in RadioButtonList2.Items)
                    {
                        if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromediogeneralComplejo(idSeleccionado.ToString()) && item.Text == "★")
                        {
                            item.Attributes.CssStyle.Add("color", "orange");
                        }

                    }
                    RadioButtonList2.Enabled = false;
                    //lblValoracion.Text = "Calificacion Promedio General es: " + RadioButtonList2.SelectedValue + " Puntos";

                }
                else
                {
                    RadioButtonList2.Enabled = false;
                    RadioButtonList2.Visible = false;
                    //lblValoracion.Text = "nua odarolav odis ah on ojelpmoC etsE";
                }
                lblDeportes.Text = compSelec.Deportes;
                lblDescripcion.Text = compSelec.Descripcion;
                listServicios.Items.Clear();
                lblServicios.Text = "Servicios: ";
                if (ServicioExtraDao.ExistenServiciosPorComplejo(compSelec.ID) > 0)
                {
                    CargarListServicios(compSelec.ID);
                }
                else
                {
                    lblServicios.Text = "Servicios: - ";
                    divListServ.Visible = false;
                }
                lblDireccion.Text = "Dirección: " + compSelec.Calle + " " + compSelec.NroCalle.ToString();
                Barrio bar = BarrioDao.ObtenerBarriosPorID(int.Parse(compSelec.IDBarrio.ToString()));
                lblBarrio.Text = "Barrio: " + bar.nombre;
                lblZona.Text = "Zona: " + ZonaDao.ObtenerZonasPorID(int.Parse(bar.idZona.ToString())).nombre;
                lblTelefono.Text = "Teléfono: " + compSelec.Telefono.ToString();
                if (compSelec.Apertura != null && compSelec.Cierre != null)
                {
                    TimeSpan hA = (TimeSpan)Convert.ChangeType(compSelec.Apertura, typeof(TimeSpan));
                    TimeSpan hC = (TimeSpan)Convert.ChangeType(compSelec.Cierre, typeof(TimeSpan));
                    lblHorarios.Text = "Horarios: " + hA.ToString(@"hh\:mm") + " a " + hC.ToString(@"hh\:mm");
                }
                else
                {
                    lblHorarios.Text = "Horarios: - ";
                }

                if (ComplejoDeportivoDao.existeAvatar(Session["IDCom"].ToString()) != false)
                {
                    byte[] avtr = ComplejoDeportivoDao.ObtenerAvatar(Session["IDCom"].ToString());
                    string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(avtr);
                    imgAvatar.ImageUrl = ImagenDataURL64;
                }
                else
                {
                    imgAvatar.ImageUrl = "~/Imagenes/complejo_logo_default.png";
                }

                if (ComplejoDeportivoDao.existeImagen(Session["IDCom"].ToString(), 1) != false)
                {
                    byte[] Img1 = ComplejoDeportivoDao.ObtenerImagen(Session["IDCom"].ToString(), 1);
                    string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(Img1);
                    img1.Src = ImagenDataURL64;
                }
                else
                {
                    img1.Src = "~/Imagenes/complejo_logo_default.png";
                }
                if (ComplejoDeportivoDao.existeImagen(Session["IDCom"].ToString(), 2) != false)
                {
                    byte[] Img2 = ComplejoDeportivoDao.ObtenerImagen(Session["IDCom"].ToString(), 2);
                    string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(Img2);
                    img2.Src = ImagenDataURL64;
                }
                else
                {
                    img2.Src = "~/Imagenes/complejo_logo_default.png";
                }
                if (ComplejoDeportivoDao.existeImagen(Session["IDCom"].ToString(), 3) != false)
                {
                    byte[] Img3 = ComplejoDeportivoDao.ObtenerImagen(Session["IDCom"].ToString(), 3);
                    string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(Img3);
                    img3.Src = ImagenDataURL64;
                }
                else
                {
                    img3.Src = "~/Imagenes/complejo_logo_default.png";
                }

                btnPopUp_ModalPopupExtender2.Show();
            
        }
        protected void encuentrosRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (encuentrosRepeater.Items.Count < 1)
            {
                if (e.Item.ItemType == ListItemType.Footer)
                {
                    Label lblFooter = (Label)e.Item.FindControl("lblEmptyData");
                    lblFooter.Visible = true;
                }
            }
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
            string nomb = txtBuscar.Text;
            int? idUs = null;
            string d1 = btnD1.Text;
            string d2 = btnD2.Text;
            string d3 = btnD3.Text;
            string d4 = btnD4.Text;

            CargarRepeaterComplejos(nomb, idUs, d1, d2, d3, d4);

            ddlOrdenar.SelectedIndex = 0;
        }

        //protected void LimpiarModal()
        //{
        //    myModalLabel2.InnerText = string.Empty;
        //    lblValoracion.Text = "Valoración: " + compSelec.promedioEstrellas.ToString();
        //    lblDeportes.Text = compSelec.deportes;
        //    lblDescripcion.Text = compSelec.descripcion;
        //}

        protected void ddlOrdenar_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtBuscar.Text = string.Empty;
            //POR DEFECTO
            if (ddlOrdenar.SelectedIndex == 0)
            {
                string nomb = txtBuscar.Text;
                int? idUs = null;
                string d1 = btnD1.Text;
                string d2 = btnD2.Text;
                string d3 = btnD3.Text;
                string d4 = btnD4.Text;

                CargarRepeaterComplejos(nomb, idUs, d1, d2, d3, d4);
            }
            //POR VALORACION
            else if (ddlOrdenar.SelectedIndex == 1)
            {
                string nomb = txtBuscar.Text;
                int? idUs = null;
                string d1 = btnD1.Text;
                string d2 = btnD2.Text;
                string d3 = btnD3.Text;
                string d4 = btnD4.Text;

                CargarRepeaterComplejosPorVal(nomb, idUs, d1, d2, d3, d4);
            }
            //POR MAS CERCANO
            else if (ddlOrdenar.SelectedIndex == 2)
            {
                string nomb = txtBuscar.Text;
                int? idUs = int.Parse(Session["ID"].ToString());
                //int? idUs = 2;
                string d1 = btnD1.Text;
                string d2 = btnD2.Text;
                string d3 = btnD3.Text;
                string d4 = btnD4.Text;

                CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
            }
            //ALFABETICAMENTE
            else if (ddlOrdenar.SelectedIndex == 3)
            {
                string nomb = txtBuscar.Text;
                int? idUs = null;
                string d1 = btnD1.Text;
                string d2 = btnD2.Text;
                string d3 = btnD3.Text;
                string d4 = btnD4.Text;

                CargarRepeaterComplejosPorNom(nomb, idUs, d1, d2, d3, d4);
            }
            //MÁS NUEVO
            else if (ddlOrdenar.SelectedIndex == 4)
            {
                string nomb = txtBuscar.Text;
                int? idUs = null;
                string d1 = btnD1.Text;
                string d2 = btnD2.Text;
                string d3 = btnD3.Text;
                string d4 = btnD4.Text;

                CargarRepeaterComplejosPorFecha(nomb, idUs, d1, d2, d3, d4);
            }
        }

        protected void FiltrosDeportes(LinkButton lbDep, string dep)
        {
            lbDep.Enabled = false;
            string d1 = string.Empty;
            string d2 = string.Empty;
            string d3 = string.Empty;
            string d4 = string.Empty;

            if (btnD1.Visible == false)
            {
                btnD1.Text = lbDep.Text;
                btnD1.Visible = true;

                if (ddlOrdenar.SelectedIndex == 1)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosPorVal(nomb, idUs, d1, d2, d3, d4);
                }

                else if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = int.Parse(Session["ID"].ToString());
                    //int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
                }

                else if (ddlOrdenar.SelectedIndex == 3)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosPorNom(nomb, idUs, d1, d2, d3, d4);
                }

                else if (ddlOrdenar.SelectedIndex == 4)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosPorFecha(nomb, idUs, d1, d2, d3, d4);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
                }
            }

            else if (btnD2.Visible == false && btnD1.Text != dep && btnD3.Text != dep && btnD4.Text != dep)
            {
                btnD2.Text = lbDep.Text;
                btnD2.Visible = true;

                lbQuitarFiltros.Visible = true;

                if (ddlOrdenar.SelectedIndex == 1)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosPorVal(nomb, idUs, d1, d2, d3, d4);
                }

                else if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = int.Parse(Session["ID"].ToString());
                    //int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
                }

                else if (ddlOrdenar.SelectedIndex == 3)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosPorNom(nomb, idUs, d1, d2, d3, d4);
                }

                else if (ddlOrdenar.SelectedIndex == 4)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosPorFecha(nomb, idUs, d1, d2, d3, d4);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
                }
            }

            else if (btnD3.Visible == false && btnD1.Text != dep && btnD2.Text != dep && btnD4.Text != dep)
            {
                btnD3.Text = lbDep.Text;
                btnD3.Visible = true;

                if (ddlOrdenar.SelectedIndex == 1)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosPorVal(nomb, idUs, d1, d2, d3, d4);
                }

                else if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = int.Parse(Session["ID"].ToString());
                    //int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
                }

                else if (ddlOrdenar.SelectedIndex == 3)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosPorNom(nomb, idUs, d1, d2, d3, d4);
                }

                else if (ddlOrdenar.SelectedIndex == 4)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosPorFecha(nomb, idUs, d1, d2, d3, d4);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
                }
            }

            else if (btnD4.Visible == false && btnD1.Text != dep && btnD2.Text != dep && btnD3.Text != dep)
            {
                btnD4.Text = lbDep.Text;
                btnD4.Visible = true;
                //PARA PONER LIMITE DE 4 DEPORTES
                //lbFutbol.Enabled = false;
                //lbBasket.Enabled = false;
                //lbCaminata.Enabled = false;
                //lbCiclismo.Enabled = false;
                //lbPaddle.Enabled = false;
                //lbRunning.Enabled = false;
                //lbTenis.Enabled = false;
                //lbVolley.Enabled = false;

                if (ddlOrdenar.SelectedIndex == 1)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosPorVal(nomb, idUs, d1, d2, d3, d4);
                }

                else if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = int.Parse(Session["ID"].ToString());
                    //int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
                }

                else if (ddlOrdenar.SelectedIndex == 3)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosPorNom(nomb, idUs, d1, d2, d3, d4);
                }

                else if (ddlOrdenar.SelectedIndex == 4)
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosPorFecha(nomb, idUs, d1, d2, d3, d4);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
                }
            }
        }

        protected void lbFutbol_Click(object sender, EventArgs e)
        {
            FiltrosDeportes(lbFutbol, "Fútbol");
        }

        protected void lbBasket_Click(object sender, EventArgs e)
        {
            FiltrosDeportes(lbBasket, "Basket");
        }

        protected void lbTenis_Click(object sender, EventArgs e)
        {
            FiltrosDeportes(lbTenis, "Tenis");
        }

        protected void lbPaddle_Click(object sender, EventArgs e)
        {
            FiltrosDeportes(lbPaddle, "Paddle");
        }

        protected void lbVolley_Click(object sender, EventArgs e)
        {
            FiltrosDeportes(lbVolley, "Volley");
        }

        protected void lbRunning_Click(object sender, EventArgs e)
        {
            FiltrosDeportes(lbRunning, "Running");
        }

        protected void lbCiclismo_Click(object sender, EventArgs e)
        {
            FiltrosDeportes(lbCiclismo, "Ciclismo");
        }

        protected void lbGolf_Click(object sender, EventArgs e)
        {
            FiltrosDeportes(lbGolf, "Golf");
        }

        protected void lbPingPong_Click(object sender, EventArgs e)
        {
            FiltrosDeportes(lbPingPong, "Ping Pong");
        }

        protected void lbBoxeo_Click(object sender, EventArgs e)
        {
            FiltrosDeportes(lbBoxeo, "Boxeo");
        }

        protected void lbKarate_Click(object sender, EventArgs e)
        {
            FiltrosDeportes(lbKarate, "Karate");
        }

        protected void btnClose2_Click(object sender, EventArgs e)
        {
            btnPopUp_ModalPopupExtender2.Hide();
        }

        protected void QuitarFiltrosDeporte(Button btnDep)
        {
            string d1 = string.Empty;
            string d2 = string.Empty;
            string d3 = string.Empty;
            string d4 = string.Empty;

            if (btnDep.Text == "Fútbol")
            {
                lbFutbol.Enabled = true;
            }

            if (btnDep.Text == "Basket")
            {
                lbBasket.Enabled = true;
            }

            if (btnDep.Text == "Tenis")
            {
                lbTenis.Enabled = true;
            }

            if (btnDep.Text == "Paddle")
            {
                lbPaddle.Enabled = true;
            }

            if (btnDep.Text == "Volley")
            {
                lbVolley.Enabled = true;
            }

            if (btnDep.Text == "Running")
            {
                lbRunning.Enabled = true;
            }

            if (btnDep.Text == "Ciclismo")
            {
                lbCiclismo.Enabled = true;
            }

            if (btnDep.Text == "Golf")
            {
                lbGolf.Enabled = true;
            }

            if (btnDep.Text == "Ping Pong")
            {
                lbPingPong.Enabled = true;
            }

            if (btnDep.Text == "Boxeo")
            {
                lbBoxeo.Enabled = true;
            }

            if (btnDep.Text == "Karate")
            {
                lbKarate.Enabled = true;
            }

            btnDep.Visible = false;
            btnDep.Text = string.Empty;

            if (ddlOrdenar.SelectedIndex == 1)
            {
                string nomb = txtBuscar.Text;
                int? idUs = null;
                d1 = btnD1.Text;
                d2 = btnD2.Text;
                d3 = btnD3.Text;
                d4 = btnD4.Text;

                CargarRepeaterComplejosPorVal(nomb, idUs, d1, d2, d3, d4);
            }

            else if (ddlOrdenar.SelectedIndex == 2)
            {
                string nomb = txtBuscar.Text;
                int? idUs = int.Parse(Session["ID"].ToString());
                //int? idUs = 2;
                d1 = btnD1.Text;
                d2 = btnD2.Text;
                d3 = btnD3.Text;
                d4 = btnD4.Text;

                CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
            }

            else if (ddlOrdenar.SelectedIndex == 3)
            {
                string nomb = txtBuscar.Text;
                int? idUs = null;
                d1 = btnD1.Text;
                d2 = btnD2.Text;
                d3 = btnD3.Text;
                d4 = btnD4.Text;

                CargarRepeaterComplejosPorNom(nomb, idUs, d1, d2, d3, d4);
            }

            else if (ddlOrdenar.SelectedIndex == 4)
            {
                string nomb = txtBuscar.Text;
                int? idUs = null;
                d1 = btnD1.Text;
                d2 = btnD2.Text;
                d3 = btnD3.Text;
                d4 = btnD4.Text;

                CargarRepeaterComplejosPorFecha(nomb, idUs, d1, d2, d3, d4);
            }

            else
            {
                string nomb = txtBuscar.Text;
                int? idUs = null;
                d1 = btnD1.Text;
                d2 = btnD2.Text;
                d3 = btnD3.Text;
                d4 = btnD4.Text;

                CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
            }

            if (btnD1.Visible == false && btnD2.Visible == false && btnD3.Visible == false && btnD4.Visible == false)
            {
                lbQuitarFiltros.Visible = false;
            }
        }

        protected void btnD1_Click(object sender, EventArgs e)
        {
            QuitarFiltrosDeporte(btnD1);
        }

        protected void btnD2_Click(object sender, EventArgs e)
        {
            QuitarFiltrosDeporte(btnD2);
        }

        protected void btnD3_Click(object sender, EventArgs e)
        {
            QuitarFiltrosDeporte(btnD3);
        }

        protected void btnD4_Click(object sender, EventArgs e)
        {
            QuitarFiltrosDeporte(btnD4);
        }

        protected void lbQuitarFiltros_Click(object sender, EventArgs e)
        {
            string d1 = string.Empty;
            string d2 = string.Empty;
            string d3 = string.Empty;
            string d4 = string.Empty;

            btnD1.Text = string.Empty;
            btnD2.Text = string.Empty;
            btnD3.Text = string.Empty;
            btnD4.Text = string.Empty;

            if (ddlOrdenar.SelectedIndex == 1)
            {
                string nomb = txtBuscar.Text;
                int? idUs = null;

                CargarRepeaterComplejosPorVal(nomb, idUs, d1, d2, d3, d4);
            }

            else if (ddlOrdenar.SelectedIndex == 2)
            {
                string nomb = txtBuscar.Text;
                int? idUs = int.Parse(Session["ID"].ToString());
                //int? idUs = 2;

                CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
            }

            else if (ddlOrdenar.SelectedIndex == 3)
            {
                string nomb = txtBuscar.Text;
                int? idUs = null;

                CargarRepeaterComplejosPorNom(nomb, idUs, d1, d2, d3, d4);
            }

            else if (ddlOrdenar.SelectedIndex == 4)
            {
                string nomb = txtBuscar.Text;
                int? idUs = null;

                CargarRepeaterComplejosPorFecha(nomb, idUs, d1, d2, d3, d4);
            }

            else
            {
                string nomb = txtBuscar.Text;
                int? idUs = null;

                CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
            }

            lbFutbol.Enabled = true;
            lbBasket.Enabled = true;
            lbTenis.Enabled = true;
            lbPaddle.Enabled = true;
            lbVolley.Enabled = true;

            btnD1.Visible = false;
            btnD2.Visible = false;
            btnD3.Visible = false;
            btnD4.Visible = false;
            lbQuitarFiltros.Visible = false;
        }



    }
}
