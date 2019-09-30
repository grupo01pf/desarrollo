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
                //ddlOrdenar.AutoPostBack = true;
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
        protected void CargarGrillaComplejosBuscar(string nomb, int? idUsuario, string d1, string d2, string d3)
        {
            gvComplejos.DataSource = null;

            gvComplejos.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosFiltros(nomb, idUsuario, d1, d2, d3)
                                      orderby comp.Nombre
                                      select comp);

            gvComplejos.DataKeyNames = new string[] { "ID" };
            gvComplejos.DataBind();
        }

        //protected void CargarListServicios(int idComp)
        //{
        //    listServicios.DataSource = null;

        //    listServicios.DataSource = (from serv in ServicioExtraDao.ObtenerServiciosPorComp(idComp)
        //                             orderby serv.nombre
        //                              select serv);

        //    listServicios.DataBind();
        //}

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
        protected void gvComplejos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idSeleccionado = int.Parse(gvComplejos.SelectedDataKey.Value.ToString());
            ID = idSeleccionado;
            Session["ID"] = idSeleccionado;
            ComplejoDeportivo compSelec = ComplejoDeportivoDao.ObtenerComplejosPorID(idSeleccionado);

            myModalLabel2.InnerText = compSelec.nombre;
            lblValoracion.Text = "Valoración: " + compSelec.promedioEstrellas.ToString();
            //string dep1 = DeporteDao.ObtenerDeportesPorID(int.Parse(compSelec.idDeporte1.ToString())).nombre;
            //string dep2;
            //string dep3;
            //if (compSelec.idDeporte2 != null)
            //{
            //    dep2 = " - " + DeporteDao.ObtenerDeportesPorID(int.Parse(compSelec.idDeporte2.ToString())).nombre;
            //}
            //else
            //{
            //    dep2 = "";
            //}
            //if (compSelec.idDeporte3 != null)
            //{
            //    dep3 = " - " + DeporteDao.ObtenerDeportesPorID(int.Parse(compSelec.idDeporte3.ToString())).nombre;
            //}
            //else
            //{
            //    dep3 = "";
            //}
            lblDeportes.Text = compSelec.deportes;
            lblDescripcion.Text = compSelec.descripcion;
            //CargarListServicios(compSelec.id);
            lblDireccion.Text = "Dirección: " + compSelec.calle + " " + compSelec.nroCalle.ToString();
            Barrio bar = BarrioDao.ObtenerBarriosPorID(int.Parse(compSelec.idBarrio.ToString()));
            lblBarrio.Text = "Barrio: " + bar.nombre;
            lblZona.Text = "Zona: " + ZonaDao.ObtenerZonasPorID(int.Parse(bar.idZona.ToString())).nombre;
            lblTelefono.Text = "Teléfono: " + compSelec.nroTelefono.ToString();


            //ARREGLAR QUE PASA CUANDO NO HAY IMAGEN
            if (compSelec.avatar != null)
            {
                imgAvatar.ImageUrl = "~/AvatarComplejo.aspx?id=" + Session["ID"].ToString();
            }


            img1.Src = "~/AvatarComplejo.aspx?id=" + Session["ID"].ToString();
            img2.Src = "~/AvatarComplejo.aspx?id=" + Session["ID"].ToString();
            img3.Src = "~/AvatarComplejo.aspx?id=" + Session["ID"].ToString();

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
        }
        //SI APRETO EN FUTBOL Y BASKET ME TRAE FUTBOL O BASKET (TIENE Q TRAER FUTBOL Y BASQUET) 
        //ARREGLAR CUANDO string d2 = btnD2.Text.Remove(4); Y BTND2.TEXT ESTA VACIO
        protected void lbFutbol_Click(object sender, EventArgs e)
        {
            lbFutbol.Enabled = false;
            string d1 = string.Empty;
            string d2 = string.Empty;
            string d3 = string.Empty;

            if (btnD1.Visible == false)
            {
                btnD1.InnerText = lbFutbol.Text + "  x";
                btnD1.Visible = true;
                

                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.InnerText.Remove(4);
                    if (btnD2.Text != string.Empty)
                    {
                        d2 = btnD2.Text.Remove(4);
                    }
                    if (btnD3.Text != string.Empty)
                    {
                        d3 = btnD3.Text.Remove(4);
                    }

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.InnerText.Remove(4);
                    if (btnD2.Text != string.Empty)
                    {
                        d2 = btnD2.Text.Remove(4);
                    }
                    if (btnD3.Text != string.Empty)
                    {
                        d3 = btnD3.Text.Remove(4);
                    }

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
            }

            else if (btnD2.Visible == false && btnD1.InnerText != "Fútbol  x" && btnD3.Text != "Fútbol  x")
            {
                btnD2.Text = lbFutbol.Text + "  x";
                btnD2.Visible = true;

                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.InnerText.Remove(4);
                    d2 = btnD2.Text.Remove(4);
                    if (btnD3.Text != string.Empty)
                    {
                        d3 = btnD3.Text.Remove(4);
                    }

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.InnerText.Remove(4);
                    d2 = btnD2.Text.Remove(4);
                    if (btnD3.Text != string.Empty)
                    {
                        d3 = btnD3.Text.Remove(4);
                    }

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
            }

            else if (btnD3.Visible == false && btnD1.InnerText != "Fútbol  x" && btnD2.Text != "Fútbol  x")
            {
                btnD3.Text = lbFutbol.Text + "  x";
                btnD3.Visible = true;

                if (ddlOrdenar.SelectedIndex == 2)
                {
                    string nomb = txtBuscar.Text;
                    //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
                    int? idUs = 2;
                    d1 = btnD1.InnerText.Remove(4);
                    d2 = btnD2.Text.Remove(4);
                    d3 = btnD3.Text.Remove(4);

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }

                else
                {
                    string nomb = txtBuscar.Text;
                    int? idUs = null;
                    d1 = btnD1.InnerText.Remove(4);
                    d2 = btnD2.Text.Remove(4);
                    d3 = btnD3.Text.Remove(4);

                    CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
                }
            }
        }

        //protected void lbBasket_Click(object sender, EventArgs e)
        //{
        //    lbBasket.Enabled = false;
        //    string d1 = string.Empty;
        //    string d2 = string.Empty;
        //    string d3 = string.Empty;

        //    if (btnD1.Visible == false)
        //    {
        //        btnD1.Text = lbBasket.Text + "  x";
        //        btnD1.Visible = true;

        //        if (ddlOrdenar.SelectedIndex == 2)
        //        {
        //            string nomb = txtBuscar.Text;
        //            //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
        //            int? idUs = 2;
        //            d1 = btnD1.Text.Remove(4);
        //            if (btnD2.Text != string.Empty)
        //            {
        //                d2 = btnD2.Text.Remove(4);
        //            }
        //            if (btnD3.Text != string.Empty)
        //            {
        //                d3 = btnD3.Text.Remove(4);
        //            }

        //            CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
        //        }

        //        else
        //        {
        //            string nomb = txtBuscar.Text;
        //            int? idUs = null;
        //            d1 = btnD1.Text.Remove(4);
        //            if (btnD2.Text != string.Empty)
        //            {
        //                d2 = btnD2.Text.Remove(4);
        //            }
        //            if (btnD3.Text != string.Empty)
        //            {
        //                d3 = btnD3.Text.Remove(4);
        //            }
        //            CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
        //        }
        //    }

        //    if (btnD2.Visible == false && btnD1.Text != "Basket  x" && btnD3.Text != "Basket  x")
        //    {
        //        btnD2.Text = lbBasket.Text + "  x";
        //        btnD2.Visible = true;

        //        if (ddlOrdenar.SelectedIndex == 2)
        //        {
        //            string nomb = txtBuscar.Text;
        //            //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
        //            int? idUs = 2;
        //            d1 = btnD1.Text.Remove(4);
        //            d2 = btnD2.Text.Remove(4);
        //            if (btnD3.Text != string.Empty)
        //            {
        //                d3 = btnD3.Text.Remove(4);
        //            }

        //            CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
        //        }

        //        else
        //        {
        //            string nomb = txtBuscar.Text;
        //            int? idUs = null;
        //            d1 = btnD1.Text.Remove(4);
        //            d2 = btnD2.Text.Remove(4);
        //            if (btnD3.Text != string.Empty)
        //            {
        //                d3 = btnD3.Text.Remove(4);
        //            }

        //            CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
        //        }
        //    }

        //    if (btnD3.Visible == false && btnD1.Text != "Basket  x" && btnD2.Text != "Basket  x")
        //    {
        //        btnD3.Text = lbBasket.Text + "  x";
        //        btnD3.Visible = true;

        //        if (ddlOrdenar.SelectedIndex == 2)
        //        {
        //            string nomb = txtBuscar.Text;
        //             //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
        //        int? idUs = 2;
        //            d1 = btnD1.Text.Remove(4);
        //            d2 = btnD2.Text.Remove(4);
        //            d3 = btnD3.Text.Remove(4);

        //            CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
        //        }

        //        else
        //        {
        //            string nomb = txtBuscar.Text;
        //            int? idUs = null;
        //            d1 = btnD1.Text.Remove(4);
        //            d2 = btnD2.Text.Remove(4);
        //            d3 = btnD3.Text.Remove(4);

        //            CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
        //        }
        //    }
        //}

        protected void btnClose2_Click(object sender, EventArgs e)
        {
            btnPopUp_ModalPopupExtender2.Hide();
        }

        //protected void btnD1_Click(object sender, EventArgs e)
        //{
        //    btnD1.Visible = false;
        //    string d1 = string.Empty;
        //    string d2 = string.Empty;
        //    string d3 = string.Empty;

        //    if (btnD1.Text == "Fútbol  x")
        //    {
        //        btnD1.Text = lbFutbol.Text + "  x";


        //        if (ddlOrdenar.SelectedIndex == 2)
        //        {
        //            string nomb = txtBuscar.Text;
        //            //int? idUs = int.Parse(Session["ID"].ToString()); COMENTADO PARA USAR SIN LOGGEARSE
        //            int? idUs = 2;
        //            d1 = btnD1.Text.Remove(4);
        //            if (btnD2.Text != string.Empty)
        //            {
        //                d2 = btnD2.Text.Remove(4);
        //            }
        //            if (btnD3.Text != string.Empty)
        //            {
        //                d3 = btnD3.Text.Remove(4);
        //            }

        //            CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
        //        }

        //        else
        //        {
        //            string nomb = txtBuscar.Text;
        //            int? idUs = null;
        //            d1 = btnD1.Text.Remove(4);
        //            if (btnD2.Text != string.Empty)
        //            {
        //                d2 = btnD2.Text.Remove(4);
        //            }
        //            if (btnD3.Text != string.Empty)
        //            {
        //                d3 = btnD3.Text.Remove(4);
        //            }

        //            CargarGrillaComplejosBuscar(nomb, idUs, d1, d2, d3);
        //        }
        //    }
        //}
    }
}