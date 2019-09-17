﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDao;
using CapaEntidades;

namespace CapaPresentacion
{
    public partial class EncuentroPublico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["IdUsuarioEncuentro"] = null;

            //cargarDeportes();
            cargarTabla();
            cargarDatosEncuentroPublico();
            if (validarOrganizador())
            {
                btn_Unirse.Visible = false;
                btn_Salir.Visible = false;
            }
            else
            {
                btn_Unirse.Visible = true;
                btn_Salir.Visible = false;
            }
            cargarChat();
        }
        private void cargarDatosEncuentroPublico()
        {

            EncuentroDeportivoQueryEntidad edq = new EncuentroDeportivoQueryEntidad();

            int idEncuentro = int.Parse(Session["idEncuentro"].ToString());

            edq = EncuentroDeportivioQueryDao.datosEncuentroPublico(idEncuentro);

            Session["IdUsuarioEncuentro"] = edq.idUsuario;

            //cmb_Deporte.SelectedValue = edq.nombreDeporte;
            lbl_Deporte.Text = edq.nombreDeporte;

            cld_Fecha.Text = edq.fechaInicioEncuentro.ToShortDateString();

            txt_HoraInicio.Text = edq.horaInicio.ToShortTimeString();
            txt_HoraFin.Text = edq.horaFin.ToShortTimeString();

            if (string.IsNullOrEmpty(edq.nombreLP))
                txt_NombreLugar.Text = string.Empty;
            else { txt_NombreLugar.Text = edq.nombreLP.ToString(); }

            if (string.IsNullOrEmpty(edq.direccion))
                txt_Direccion.Text = string.Empty;
            else { txt_Direccion.Text = edq.direccion.ToString(); }

            txt_Organizador.Text = edq.nombreUsuario.ToString();

            bloquearBotones();


            //EncuentroDeportivioQueryDao eqdao = new EncuentroDeportivioQueryDao();
            //  int idUsuario = int.Parse(Session["ID"].ToString());
            //  eq = EncuentroDeportivioQueryDao.datosEncuentroPublico(idUsuario, idEncuentro);
            //cmb_Deporte.SelectedIndex = (int)eq.idDeporte;
            //  cld_Fecha.SelectedDate = eq.fechaInicioEncuentro;
            //cld_Fecha.Text = eq.fechaInicioEncuentro;

        }


        protected void btn_Ingresar_Click(object sender, EventArgs e)
        {
            // btn_Unirse.Enabled = true;
            // btn_Salir.Enabled = true;
        }



        protected void btn_Unirse_Click(object sender, EventArgs e)
        {

            EncuentroDeportivoDao.insertarUsuarioPorEncuentroEquipoA(int.Parse(Session["ID"].ToString()), int.Parse(Session["idEncuentro"].ToString()));
            cargarTabla();
            btn_Unirse.Visible = false;
            btn_Salir.Visible = true;
        }
        protected void btn_Salir_Click(object sender, EventArgs e)
        {
            EncuentroDeportivoDao.SalirDelEncuentroEquipoA(int.Parse(Session["ID"].ToString()), int.Parse(Session["idEncuentro"].ToString()));
            cargarTabla();
            btn_Unirse.Visible = true;
            btn_Salir.Visible = false;
        }
        protected void btn_CancelarEncuentro_Click(object sender, EventArgs e)
        {
            // cambiar el estado 
            // chequear que solo el organizador pueda cancelar
            EncuentroDeportivoDao.CancelarEncuentro();
        }
        protected void btn_Invitar_Click(object sender, EventArgs e)
        {

        }

        private void cargarTabla()
        {
            gdv_UsuariosUnidos.DataSource = UsuarioDao.UsuariosUnidosEncuentroPublico(int.Parse(Session["idEncuentro"].ToString()));
            gdv_UsuariosUnidos.DataKeyNames = new string[] { "nombre" };
            gdv_UsuariosUnidos.DataBind();
        }

        //private void cargarDeportes()
        //{
        //    cmb_Deporte.DataSource = DeporteDao.ObtenerDeportes();
        //    cmb_Deporte.DataValueField = "id";
        //    cmb_Deporte.DataValueField = "nombre";
        //    cmb_Deporte.DataBind();
        //}

        private bool validarOrganizador()
        {
            bool flag = false;

            int idUsuarioEncuentro = int.Parse(Session["ID"].ToString());
            int idUsuarioActual = int.Parse(Session["IdUsuarioEncuentro"].ToString());

            if (idUsuarioActual == idUsuarioEncuentro)
            { flag = true; }
            return flag;

        }
        private void bloquearBotones()
        {

            //cmb_Deporte.Enabled = false;
            cld_Fecha.Enabled = false;
            txt_HoraInicio.Enabled = false;
            txt_HoraFin.Enabled = false;
            txt_NombreLugar.Enabled = false;
            txt_Direccion.Enabled = false;
            txt_Organizador.Enabled = false;

            // btn_Unirse.Enabled = false;
            // btn_Salir.Enabled = false;
        }

        protected void btn_Enviar_Click(object sender, EventArgs e)
        {
            Mensaje msg = new Mensaje();
            msg.idUsuario = int.Parse(Session["ID"].ToString());
            msg.idEncuentro = int.Parse(Session["idEncuentro"].ToString());
            msg.texto = txt_Mensaje.Text;
            msg.fechaHora = DateTime.Now;

            MensajeDao.InsertarMensaje(msg);

            txt_Mensaje.Text = string.Empty;
            cargarChat();
        }

        private void cargarChat()
        {

            // gdv_Pantalla.DataSource = MensajeQueryDao.MostrarMensajes(int.Parse(Session["idEncuentro"].ToString()), int.Parse(Session["ID"].ToString()) );
            gdv_Pantalla.DataSource = MensajeQueryDao.MostrarMensajes(int.Parse(Session["idEncuentro"].ToString()));
            gdv_Pantalla.DataKeyNames = new string[] { "idMensaje" };
            gdv_Pantalla.DataBind();
        }
    }
}