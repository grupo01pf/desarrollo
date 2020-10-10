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


            if (UsuarioDao.existeImagen(Session["idOtroPerfil"].ToString()) != false)
            {
                Image1.ImageUrl = "~/imagenOtrosPerfiles.aspx?id=" + Session["idOtroPerfil"].ToString();

            }else
            {
                msjimagennNula.Text = "Sin imagen de Perfil";
            }
            if (DeportistaDao.ExisteDeportista(Session["idOtroPerfil"].ToString()))
            {
                DatosCargadosDeportista();

            }else
            {
                DeportistaVacio();
              
            } 

            gdv_EncuentrosDeportista.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPorId2(Session["idOtroPerfil"].ToString());
            gdv_EncuentrosDeportista.DataKeyNames = new string[] { "idEncuentroDeportivo" };
            gdv_EncuentrosDeportista.DataBind();
            manejarValoracion();


        }

       

       


       










        public void DatosCargadosDeportista()
        {
            Deportista deportista = DeportistaDao.ObtenerDeportistaPorID2(DeportistaDao.ObtenerIdDeportista(Session["idOtroPerfil"].ToString()));
            DeportistaEntidad NombrBarrioDeportista = DeportistaDao.ObtenerBarrioDeportistaPorID(DeportistaDao.ObtenerIdDeportista(Session["idOtroPerfil"].ToString()));
           // link_nombreUsuario2.Text = deportista.nombres;
            Nombres.Text = deportista.nombres;
            Apellidos.Text = deportista.apellido;
            Nrodoc.Text = deportista.nroDoc.ToString();
            if (deportista.sexo.ToString() == "1")
            {
                sexo.Text = "Masculino";
            }
            else
            {
                sexo.Text = "Femenino";
            }
            if (deportista.idDeportePreferido.ToString() == "1") DeportePreferido.Text = "Futbol";
            if (deportista.idDeportePreferido.ToString() == "2") DeportePreferido.Text = "Tenis";
            if (deportista.idDeportePreferido.ToString() == "3") DeportePreferido.Text = "Volley";
            if (deportista.idDeportePreferido.ToString() == "4") DeportePreferido.Text = "Paddle";
            if (deportista.idDeportePreferido.ToString() == "5") DeportePreferido.Text = "Karate";
            if (deportista.idDeportePreferido.ToString() == "6") DeportePreferido.Text = "Basquet";
            if (deportista.idDeportePreferido.ToString() == "7") DeportePreferido.Text = "Running";
            if (deportista.idDeportePreferido.ToString() == "8") DeportePreferido.Text = "Golf";
            if (deportista.idDeportePreferido.ToString() == "9") DeportePreferido.Text = "Ping Pong";
            if (deportista.idDeportePreferido.ToString() == "10") DeportePreferido.Text = "Boxeo";
            DateTime fecha = Convert.ToDateTime(deportista.fechaNacimiento.ToString());
            Fechanac.Text = fecha.ToString("dd/MM/yyyy");
            Tel.Text = deportista.nroTelefono.ToString();
            BarrioDeportista.Text = NombrBarrioDeportista.NombreBarrioDeportista.ToString(); 
           
           
        }

        public void DeportistaVacio()
        {
            lbl_Apellidos.Visible = false;
            lbl_FechaNacimiento.Visible = false;
            lbl_Nombres.Visible = false;
            lbl_NumeroDocumento.Visible = false;
            lbl_Sexo.Visible = false;
            lbl_Telefono.Visible = false;
            lbl_BarrioDeportista.Visible = false;
            lbl_DeportePreferido.Visible = false;
            msjdepcompletar.Text = "No se encuentran actualizados los datos de este deportista";
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
            if (ValoracionDao.existePromedioxid(DeportistaDao.ObtenerIdDeportista(Session["idOtroPerfil"].ToString()), "4") == true)
            {
                RadioButtonList1.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["idOtroPerfil"].ToString()), "4"));
                foreach (ListItem item in RadioButtonList1.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["idOtroPerfil"].ToString()), "4") && item.Text == "★")
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
            if (ValoracionDao.existePromedioxid(DeportistaDao.ObtenerIdDeportista(Session["idOtroPerfil"].ToString()), "5") == true)
            {
                RadioButtonList2.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["idOtroPerfil"].ToString()), "5"));
                foreach (ListItem item in RadioButtonList2.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["idOtroPerfil"].ToString()), "5") && item.Text == "★")
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
            if (ValoracionDao.existePromedioxid(DeportistaDao.ObtenerIdDeportista(Session["idOtroPerfil"].ToString()), "6") == true)
            {
                RadioButtonList3.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["idOtroPerfil"].ToString()), "6"));
                foreach (ListItem item in RadioButtonList3.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["idOtroPerfil"].ToString()), "6") && item.Text == "★")
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
            if (ValoracionDao.existePromedioGeneral(DeportistaDao.ObtenerIdDeportista(Session["idOtroPerfil"].ToString())) == true)
            {
                RadioButtonList4.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromediogeneral(DeportistaDao.ObtenerIdDeportista(Session["idOtroPerfil"].ToString())));
                foreach (ListItem item in RadioButtonList4.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromediogeneral(DeportistaDao.ObtenerIdDeportista(Session["idOtroPerfil"].ToString())) && item.Text == "★")
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
