﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDao;

namespace CapaPresentacion
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //****NO BORRAR****

            link_nombreUsuario.Text = Session["Usuario"].ToString();
            if (!IsPostBack)
            {

                cargarEventosDisponibles();
                // cargarLugaresPublicos();
                // cargarLugaresPrivados();
            }

        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
            Session["Usuario"] = String.Empty;
            Session["Rol"] = String.Empty;


        }

        protected void link_nombreUsuario_Click(object sender, EventArgs e)
        {
            //****NO BORRAR****
            // redireccionar a MiCuenta o Perfil
            //  Response.Redirect("");
        }

        protected void btn_CrearEncuentro_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearEncuentro.aspx");
        }

        protected void cargarEventosDisponibles()
        {

            gdv_EncuentrosDisponibles.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPublicos();
            gdv_EncuentrosDisponibles.DataKeyNames = new string[] { "idEncuentroDeportivo" };
            gdv_EncuentrosDisponibles.DataBind();

        }


        protected void gdv_EncuentrosDisponibles_SelectedIndexChanged(object sender, EventArgs e)
        {

            GridViewRow fila = gdv_EncuentrosDisponibles.SelectedRow;

            string tipoEncuentro = fila.Cells[2].Text;
            Session["idEncuentro"] = int.Parse(gdv_EncuentrosDisponibles.SelectedDataKey.Value.ToString());

            if (tipoEncuentro.Equals("Publico"))
            {
                Response.Redirect("EncuentroPublico.aspx");

            }


            else
            {
                Response.Redirect("EncuentroPrivado.aspx");
            }

        }


    }
}