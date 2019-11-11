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
    public partial class PerfilOtrosDeportistas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (UsuarioDao.existeImagen(DeportistaDao.ObtenerIdUsuario(Request.QueryString["id"].ToString())) != false)
            {
                Image1.ImageUrl = "~/imagenOtrosPerfiles.aspx?id=" + DeportistaDao.ObtenerIdUsuario(Request.QueryString["id"].ToString());

            }

            DatosCargadosDeportista();
           


            gdv_EncuentrosDeportista.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPorId(DeportistaDao.ObtenerIdUsuario(Request.QueryString["id"].ToString()));
            gdv_EncuentrosDeportista.DataKeyNames = new string[] { "idEncuentroDeportivo" };
            gdv_EncuentrosDeportista.DataBind();
            manejarValoracion();


        }

       

       


       










        public void DatosCargadosDeportista()
        {
            Deportista deportista = DeportistaDao.ObtenerDeportistaPorID2(Request.QueryString["id"].ToString());
            link_nombreUsuario2.Text = deportista.nombres;
            Nombres.Text = deportista.nombres;
            Apellidos.Text = deportista.apellido;
            Nrodoc.Text = deportista.nroDoc.ToString();
            sexo.Text = deportista.sexo.ToString();
            Fechanac.Text = deportista.fechaNacimiento.ToString();
            Tel.Text = deportista.nroTelefono.ToString();
           
           
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
       
        public void manejarValoracion()
        {
            if (ValoracionDao.existePromedioxid(Request.QueryString["id"].ToString(), "1") == true)
            {
                RadioButtonList1.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(Request.QueryString["id"].ToString(), "1"));
                foreach (ListItem item in RadioButtonList1.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(Request.QueryString["id"].ToString(), "1") && item.Text == "★")
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
                lblmsjrb1.Text = "El usuario no ha sido calificado en esta seccion";

            }
            if (ValoracionDao.existePromedioxid(Request.QueryString["id"].ToString(), "2") == true)
            {
                RadioButtonList2.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(Request.QueryString["id"].ToString(), "2"));
                foreach (ListItem item in RadioButtonList2.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(Request.QueryString["id"].ToString(), "2") && item.Text == "★")
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
                lblmsjrb2.Text = "El usuario no ha sido calificado en esta seccion";
            }
            if (ValoracionDao.existePromedioxid(Request.QueryString["id"].ToString(), "3") == true)
            {
                RadioButtonList3.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(Request.QueryString["id"].ToString(), "3"));
                foreach (ListItem item in RadioButtonList3.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(Request.QueryString["id"].ToString() ,"3") && item.Text == "★")
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
                lblmsjrb3.Text = "El usuario no ha sido calificado en esta seccion";
            }
            if (ValoracionDao.existePromedioGeneral(Request.QueryString["id"].ToString()) == true)
            {
                RadioButtonList4.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromediogeneral(Request.QueryString["id"].ToString()));
                foreach (ListItem item in RadioButtonList4.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromediogeneral(Request.QueryString["id"].ToString()) && item.Text == "★")
                    {
                        item.Attributes.CssStyle.Add("color", "orange");
                    }

                }
                RadioButtonList4.Enabled = false;
                lblmsjrb4.Text = "Calificacion Promedio General es: " + RadioButtonList4.SelectedValue + " Puntos";
            }
            else
            {
                RadioButtonList4.Enabled = false;
                lblmsjrb4.Text = "El usuario no ha sido calificado";
            }
        }

    }
}
