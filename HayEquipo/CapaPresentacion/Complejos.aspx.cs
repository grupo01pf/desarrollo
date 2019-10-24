﻿using System;
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
            }

            CargarRepeaterComplejos();
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

        protected void CargarRepeaterComplejos()
        {
            encuentrosRepeater.DataSource = ComplejoDeportivoDao.ObtenerComplejosJoin();
            encuentrosRepeater.DataBind();
            encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
        }

        protected void CargarRepeaterComplejosPorNom()
        {
            encuentrosRepeater.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
                                             orderby comp.Nombre
                                             select comp);
            encuentrosRepeater.DataBind();
            encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
        }

        protected void CargarRepeaterComplejosPorVal()
        {
            encuentrosRepeater.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
                                             orderby comp.Valoracion descending
                                             select comp);
            encuentrosRepeater.DataBind();
            encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
        }

        protected void CargarRepeaterComplejosPorFecha()
        {
            encuentrosRepeater.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
                                             orderby comp.FechaRegistro descending
                                             select comp);
            encuentrosRepeater.DataBind();
            encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
        }

        protected void CargarRepeaterComplejosBuscar(string nomb, int? idUsuario, string d1, string d2, string d3, string d4)
        {
            encuentrosRepeater.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosFiltros(nomb, idUsuario, d1, d2, d3, d4)
                                             orderby comp.Nombre
                                             select comp);
            encuentrosRepeater.DataBind();
            encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
        }


        void encuentroRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
        if (e.CommandName == "btnUnirseEncuentro")
        {
            string idEncuentro = ((LinkButton)e.CommandSource).CommandArgument;

            int idSeleccionado = int.Parse(((LinkButton)e.CommandSource).CommandArgument);
            IDCom = idSeleccionado;
            Session["IDCom"] = idSeleccionado;
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
            if (compSelec.horaApertura != null && compSelec.horaCierre != null)
            {
                TimeSpan hA = (TimeSpan)Convert.ChangeType(compSelec.horaApertura, typeof(TimeSpan));
                TimeSpan hC = (TimeSpan)Convert.ChangeType(compSelec.horaCierre, typeof(TimeSpan));
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
    }

    //protected void CargarGrillaComplejos()
    //    {
    //        gvComplejos.DataSource = null;

    //        gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
    //                                  select comp);

    //        gvComplejos.DataKeyNames = new string[] { "ID" };
    //        gvComplejos.DataBind();       
    //    }

        //protected void CargarGrillaComplejosPorNom()
        //{
        //    gvComplejos.DataSource = null;

        //    gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
        //                              orderby comp.Nombre
        //                              select comp);

        //    gvComplejos.DataKeyNames = new string[] { "ID" };
        //    gvComplejos.DataBind();
        //}

        //protected void CargarGrillaComplejosPorVal()
        //{
        //    gvComplejos.DataSource = null;

        //    gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
        //                              orderby comp.Valoracion descending
        //                              select comp);

        //    gvComplejos.DataKeyNames = new string[] { "ID" };
        //    gvComplejos.DataBind();
        //}

        //protected void CargarGrillaComplejosPorFecha()
        //{
        //    gvComplejos.DataSource = null;

        //    gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosJoin()
        //                              orderby comp.FechaRegistro descending
        //                              select comp);

        //    gvComplejos.DataKeyNames = new string[] { "ID" };
        //    gvComplejos.DataBind();
        //}

        //protected void CargarGrillaComplejosBuscar(string nomb, int? idUsuario, string d1, string d2, string d3)
        //{
        //    gvComplejos.DataSource = null;

        //    gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosFiltros(nomb, idUsuario, d1, d2, d3)
        //                              orderby comp.Nombre
        //                              select comp);

        //    gvComplejos.DataKeyNames = new string[] { "ID" };
        //    gvComplejos.DataBind();
        //}

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
                CargarRepeaterComplejos();
            }
            else
            {                            
                string nomb = txtBuscar.Text;
                int? idUs = null;
                string d1 = string.Empty;
                string d2 = string.Empty;
                string d3 = string.Empty;
                string d4 = string.Empty;

                CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
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

        //protected void gvComplejos_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int idSeleccionado = int.Parse(gvComplejos.SelectedDataKey.Value.ToString());
        //    ID = idSeleccionado;
        //    Session["ID"] = idSeleccionado;
        //    ComplejoDeportivo compSelec = ComplejoDeportivoDao.ObtenerComplejosPorID(idSeleccionado);

        //    myModalLabel2.InnerText = compSelec.nombre;
        //    lblValoracion.Text = "Valoración: " + compSelec.promedioEstrellas.ToString();
        //    lblDeportes.Text = compSelec.deportes;
        //    lblDescripcion.Text = compSelec.descripcion;
        //    listServicios.Items.Clear();
        //    lblServicios.Text = "Servicios: ";
        //    if (ServicioExtraDao.ExistenServiciosPorComplejo(compSelec.id) > 0)
        //    {
        //        CargarListServicios(compSelec.id);
        //    }
        //    else
        //    {
        //        lblServicios.Text = "Servicios: - ";
        //        divListServ.Visible = false;
        //    }
        //    lblDireccion.Text = "Dirección: " + compSelec.calle + " " + compSelec.nroCalle.ToString();
        //    Barrio bar = BarrioDao.ObtenerBarriosPorID(int.Parse(compSelec.idBarrio.ToString()));
        //    lblBarrio.Text = "Barrio: " + bar.nombre;
        //    lblZona.Text = "Zona: " + ZonaDao.ObtenerZonasPorID(int.Parse(bar.idZona.ToString())).nombre;
        //    lblTelefono.Text = "Teléfono: " + compSelec.nroTelefono.ToString();
        //    if(compSelec.horaApertura != null && compSelec.horaCierre != null)
        //    {
        //        TimeSpan hA = (TimeSpan)Convert.ChangeType(compSelec.horaApertura, typeof(TimeSpan));
        //        TimeSpan hC = (TimeSpan)Convert.ChangeType(compSelec.horaCierre, typeof(TimeSpan));
        //        lblHorarios.Text = "Horarios: " + hA.ToString(@"hh\:mm") + " a " + hC.ToString(@"hh\:mm");
        //    }
        //    else
        //    {
        //        lblHorarios.Text = "Horarios: - ";
        //    }
            
        //    if (ComplejoDeportivoDao.existeAvatar(Session["ID"].ToString()) != false)
        //    {
        //        imgAvatar.ImageUrl = "~/AvatarComplejo.aspx?id=" + Session["ID"].ToString();
        //    }
        //    else
        //    {
        //        imgAvatar.ImageUrl = "~/Imagenes/complejo_logo_default.png";
        //    }

        //    if (ComplejoDeportivoDao.existeImagen(Session["ID"].ToString(), 1) != false)
        //    {
        //        img1.Src = "~/ImagenComplejo1.aspx?id=" + Session["ID"].ToString();
        //    }
        //    else
        //    {
        //        img1.Src = "~/Imagenes/complejo_logo_default.png";
        //    }
        //    if (ComplejoDeportivoDao.existeImagen(Session["ID"].ToString(), 2) != false)
        //    {
        //        img2.Src = "~/ImagenComplejo2.aspx?id=" + Session["ID"].ToString();
        //    }
        //    else
        //    {
        //        img2.Src = "~/Imagenes/complejo_logo_default.png";
        //    }
        //    if (ComplejoDeportivoDao.existeImagen(Session["ID"].ToString(), 3) != false)
        //    {
        //        img3.Src = "~/ImagenComplejo3.aspx?id=" + Session["ID"].ToString();
        //    }
        //    else
        //    {
        //        img3.Src = "~/Imagenes/complejo_logo_default.png";
        //    }

        //    btnPopUp_ModalPopupExtender2.Show();

        //}


        protected void ddlOrdenar_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtBuscar.Text = string.Empty;
            //POR DEFECTO
            if (ddlOrdenar.SelectedIndex == 0)
            {
                CargarRepeaterComplejos();
            }
            //POR VALORACION
            if (ddlOrdenar.SelectedIndex == 1)
            {
                CargarRepeaterComplejosPorVal();
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
                string d4 = string.Empty;

                CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
            }
            //ALFABETICAMENTE
            if (ddlOrdenar.SelectedIndex == 3)
            {
                CargarRepeaterComplejosPorNom();
            }
            //MÁS NUEVO
            if (ddlOrdenar.SelectedIndex == 4)
            {
                CargarRepeaterComplejosPorFecha();
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


                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
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

                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
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

                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
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

                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.Text;
                    d2 = btnD2.Text;
                    d3 = btnD3.Text;
                    d4 = btnD4.Text;

                    CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
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

            btnDep.Visible = false;
            btnDep.Text = string.Empty;

            if (ddlOrdenar.SelectedIndex == 2)
            {
                string nomb = txtBuscar.Text;
                //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                int? idUs = 2;
                d1 = btnD1.Text;
                d2 = btnD2.Text;
                d3 = btnD3.Text;
                d4 = btnD4.Text;

                CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
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

            if(btnD1.Visible == false && btnD2.Visible == false && btnD3.Visible == false && btnD4.Visible == false)
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

            if (ddlOrdenar.SelectedIndex == 2)
            {
                string nomb = txtBuscar.Text;
                //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                int? idUs = 2;

                CargarRepeaterComplejosBuscar(nomb, idUs, d1, d2, d3, d4);
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