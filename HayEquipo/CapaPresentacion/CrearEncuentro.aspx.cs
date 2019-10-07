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
    public partial class CrearEncuentro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                Session["IdEncuentro"] = null;

                deshabilitarControles();

                cargarDeportes();
                // cargarZonas();
                cargarComplejos();
                // cargarBarrios();
                cld_Fecha.SelectedDate = DateTime.Today;

                // cld_Fecha.SelectedDayStyle.BorderColor
            }

            cargarMapa();

            //if (lbl_Reserva.Text != null && lbl_Capacidad != null) {

            //}



        }

        protected void btn_Crear_Click(object sender, EventArgs e)
        {
            if (rdb_Publico.Checked)
            {
                if (controlDatosObligatoriosEncuentroPublico())
                {
                    crearEventoPublico();
                    Response.Redirect("EncuentroPublico.aspx");
                }
                else { rdb_Publico.Checked = false; }

            }
            else
            {

                if (controlDatosObligatoriosEncuentroPublico() && controlDatosObligatoriosEncuentroPrivado() 
                    && !(string.IsNullOrEmpty(lbl_Reserva.Text)))
                {
                    lbl_Error.Visible = false;
                    crearEventoPrivado();
                    Response.Redirect("EncuentroPrivado.aspx");
                }
                else
                {
                    lbl_Error.Visible = true;
                    lbl_Error.Text = "Debe reservar una cahcha de la agenda";
                }
            }
            //if (string.IsNullOrEmpty(lbl_Reserva.Text) || cmb_Complejo.SelectedIndex == 0)
            //{ lbl_Error.Text = "* Debe reservar una cahcha de la agenda"; }
        }
    
        

        private void crearEventoPublico()
        {

            EncuentroDeportivo ed = new EncuentroDeportivo();
            ed.idUsuario = int.Parse(Session["ID"].ToString()); //( USAR cuando este el Login )
            // ed.idUsuario = 1;  // (Usar cuando No este el login)
            // ed.fechaCreacionEncuentro = DateTime.Now;
            ed.idDeporte = cmb_Deporte.SelectedIndex;
            ed.fechaInicioEncuentro = cld_Fecha.SelectedDate;
            ed.idEstado = 7; // (habilitado)

            if (string.IsNullOrEmpty(txt_HoraInicio.Text))
            { ed.horaInicio = TimeSpan.Parse("00:00"); }
            else
            {
                TimeSpan? hi = TimeSpan.Parse(txt_HoraInicio.Text);
                ed.horaInicio = hi;
            }

            if (string.IsNullOrEmpty(txt_HoraFin.Text))
            { ed.horaFin = TimeSpan.Parse("00:00"); }
            else
            {
                TimeSpan? hf = TimeSpan.Parse(txt_HoraFin.Text);
                ed.horaFin = hf;
            }
            ed.tipoEncuentro = "Publico";          

            if (string.IsNullOrEmpty(txt_Clave.Text))
            { ed.clave = string.Empty; ed.accesibilidad = "Abierto"; }
            else
            { ed.clave = txt_Clave.Text; ed.accesibilidad = "Cerrado"; }

            if (string.IsNullOrEmpty(txt_NombreLugar.Text))
                ed.nombreLP = string.Empty;
            else { ed.nombreLP = txt_NombreLugar.Text; }

            if (string.IsNullOrEmpty(txt_Direccion.Text))
                ed.direccion = string.Empty;
            else { ed.direccion = txt_Direccion.Text; }

            if (string.IsNullOrEmpty(txt_Cantidad.Text))
                ed.capacidad = 100; // (POR DEFECTO 100 USUARIOS)
            else { ed.capacidad = int.Parse(txt_Cantidad.Text); }

            Session["idEncuentro"] = EncuentroDeportivoDao.InsertarEncuentroPublico(ed);
            int id = int.Parse(Session["idEncuentro"].ToString());
            EncuentroDeportivoDao.insertarUsuarioPorEncuentro(int.Parse(Session["ID"].ToString()), int.Parse(Session["idEncuentro"].ToString()));

            Mensaje msg = new Mensaje();
            msg.idUsuario = int.Parse(Session["ID"].ToString());
            msg.idEncuentro = int.Parse(Session["idEncuentro"].ToString());
            msg.fechaHora = DateTime.Now;
            // msg.texto = string.Empty;
            msg.texto = "Bienvenidos";
            MensajeDao.InsertarMensaje(msg);
        }


        private void crearEventoPrivado()
        {

            GridViewRow fila = gdv_Agenda.SelectedRow;

            EncuentroDeportivo ed = new EncuentroDeportivo();

            ed.idUsuario = int.Parse(Session["ID"].ToString()); //( USAR cuando este el Login )
           

            ed.idDeporte = cmb_Deporte.SelectedIndex;
            ed.idComplejo = cmb_Complejo.SelectedIndex;
            ed.fechaInicioEncuentro = cld_Fecha.SelectedDate;

            ed.idEstado = 7; // (habilitado)

            ed.tipoEncuentro = "Privado";

           
            if (string.IsNullOrEmpty(txt_Clave.Text))
            { ed.clave = string.Empty; ed.accesibilidad = "Abierto"; }
            else
            { ed.clave = txt_Clave.Text; ed.accesibilidad = "Cerrado"; }

            if (string.IsNullOrEmpty(txt_NombreLugar.Text))
                ed.nombreLP = string.Empty;
            // else { ed.nombreLP = txt_NombreLugar.Text; }

            if (string.IsNullOrEmpty(txt_Direccion.Text))
                ed.direccion = string.Empty;
            // else { ed.direccion = txt_Direccion.Text; }

            if (string.IsNullOrEmpty(fila.Cells[6].Text))
                ed.capacidad = 4; // (POR DEFECTO 4 USUARIOS)
            else { ed.capacidad = int.Parse(fila.Cells[6].Text); }


            Session["idEncuentro"] = EncuentroDeportivoDao.InsertarEncuentroPrivado(ed);
            EncuentroDeportivoDao.insertarUsuarioPorEncuentro(int.Parse(Session["ID"].ToString()), int.Parse(Session["idEncuentro"].ToString()));

            //  string datos = string.Empty;
            //  datos = fila.Cells[1].Text + " , " + fila.Cells[2].Text + " , " + fila.Cells[3].Text + "hs. , $" + fila.Cells[4].Text;

            Horario horario = new Horario();
            //  horario.horaInicio =TimeSpan.Parse(fila.Cells[3].Text);

            if (string.IsNullOrEmpty(fila.Cells[4].Text))
            { horario.horaInicio = TimeSpan.Parse("00:00"); }
            else
            {
                TimeSpan? hr = TimeSpan.Parse(fila.Cells[4].Text);
                horario.horaInicio = hr;
                
            }
            horario.fecha = cld_Fecha.SelectedDate;
            horario.idEstado = 1; // (REESERVADO)


            CanchasPorHorarios cph = new CanchasPorHorarios();
            cph.idHorario = AgendaDao.InsertarHorario(horario);
            cph.idCancha = int.Parse(gdv_Agenda.SelectedDataKey.Value.ToString());

            AgendaDao.InsertarCanchasPorHorarios(cph);

            Reserva reserva = new Reserva();
            reserva.fechaReserva = DateTime.Now;
            reserva.idEncuentroDeportivo = int.Parse(Session["idEncuentro"].ToString());

            reserva.idEstado = 1; //(reservado)
            ReservaDao.InsertarReserva(reserva);

            Mensaje msg = new Mensaje();
            msg.idUsuario = int.Parse(Session["ID"].ToString());
            msg.idEncuentro = int.Parse(Session["idEncuentro"].ToString());
            msg.fechaHora = DateTime.Now;
           
            msg.texto = "Bienvenidos";
            MensajeDao.InsertarMensaje(msg);

        }

        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }



    

        private void cargarDeportes()
        {
            cmb_Deporte.DataSource = DeporteDao.ObtenerDeportes();
            cmb_Deporte.DataValueField = "id";
            cmb_Deporte.DataValueField = "nombre";
            cmb_Deporte.DataBind();


        }

        private void cargarZonas()
        {

            //cmb_Zona.DataSource = ZonaDao.obtenerZonas();
            //cmb_Zona.DataValueField = "IdZona";
            //cmb_Zona.DataValueField = "nombre";
            //cmb_Zona.DataBind();
        }
        private void cargarComplejos()
        {

            cmb_Complejo.DataSource = ComplejoDeportivoDao.ObtenerComplejos();
            cmb_Complejo.DataValueField = "id";
            cmb_Complejo.DataValueField = "nombre";
            cmb_Complejo.DataBind();
        }

        private void cargarMapa(){

            if (cmb_Complejo.SelectedIndex != 0)
            {
                contenedorDelMapa.Visible = true;
                frm_map.Visible = true;
                ComplejoDeportivo cd = ComplejoDeportivoDao.ObtenerComplejosPorID(cmb_Complejo.SelectedIndex);
                frm_map.Src = cd.mapa;
                btn_Agenda.Visible = true;
            }
            if (cmb_Complejo.SelectedIndex == 0)
            {
                contenedorDelMapa.Visible = false;
                frm_map.Visible = false;
            }

        }

        private void cargarBarrios()
        {

            //cmb_Barrio.DataSource = BarrioDao.obtenerBarrios();
            //cmb_Barrio.DataValueField = "IdBarrio";
            //cmb_Barrio.DataValueField = "nombre";
            //cmb_Barrio.DataBind();
        }

        private void deshabilitarControles()
        {


            txt_Direccion.Enabled = false;
            txt_NombreLugar.Enabled = false;
            txt_HoraInicio.Enabled = false;
            txt_HoraFin.Enabled = false;

            cmb_Complejo.Enabled = false;
            btn_Crear.Enabled = false;
            btn_Cancelar.Enabled = false;
            txt_Cantidad.Enabled = false;

            btn_Agenda.Visible = false;
            // lbl_Capacidad.Visible = true;

            contenedorDelMapa.Visible = false;
            frm_map.Visible = false;

        }



        protected void rdb_Publico_CheckedChanged(object sender, EventArgs e)
        {


            if (cmb_Deporte.SelectedIndex == 0)
            {
                rdb_Publico.Checked = false;
                lbl_Error.Visible = true;
                lbl_Error.Text = "Debe seleccionar un Deporte";
                cmb_Deporte.BorderColor = System.Drawing.Color.Red;
                cmb_Deporte.Focus();
            }
            else {

                txt_Direccion.Enabled = true;
                txt_NombreLugar.Enabled = true;
                txt_HoraInicio.Enabled = true;
                txt_HoraFin.Enabled = true;
                txt_Cantidad.Enabled = true;
                cmb_Complejo.Enabled = false;

                btn_Agenda.Visible = false;

                btn_Crear.Enabled = true;
                btn_Cancelar.Enabled = true;
                lbl_Error.Text = string.Empty;

            }


        }

        protected void rdb_Privado_CheckedChanged(object sender, EventArgs e)
        {
           
               
            if (cmb_Deporte.SelectedIndex == 0)
            {
                rdb_Privado.Checked = false;
                lbl_Error.Visible = true;
                lbl_Error.Text = "Debe seleccionar un Deporte";
                cmb_Deporte.BorderColor = System.Drawing.Color.Red;
                cmb_Deporte.Focus();
            }
            else {

                txt_Direccion.Enabled = false;
                txt_NombreLugar.Enabled = false;
                txt_HoraInicio.Enabled = false;
                txt_HoraFin.Enabled = false;
                txt_Cantidad.Enabled = false;
                cmb_Complejo.Enabled = true;
                
                btn_Crear.Enabled = true;
                btn_Cancelar.Enabled = true;
                lbl_Error.Text = string.Empty;
               
            }
        }

        private bool controlDatosObligatoriosEncuentroPublico() {

            bool flag = false;
            if (cmb_Deporte.SelectedIndex == 0)
            {
                lbl_Error.Visible = true;
                lbl_Error.Text = "Debe seleccionar un Deporte";
                cmb_Deporte.BorderColor = System.Drawing.Color.Red;
                cmb_Deporte.Focus();
                flag = false;
            }
            else {
                lbl_Error.Visible = false;
                lbl_Error.Text = string.Empty;
                cmb_Deporte.BorderColor = System.Drawing.Color.Transparent;
                flag = true;
            }
            return flag;
        }

        private bool controlDatosObligatoriosEncuentroPrivado() {
            bool flag = false;

            if (cmb_Complejo.SelectedIndex == 0)
            {
                lbl_Error.Visible = true;
                lbl_Error.Text = "Debe seleccionar un Complejo Deportivo";
                cmb_Complejo.BorderColor = System.Drawing.Color.Red;
                cmb_Complejo.Focus();
                
                flag = false;
            }
            else
            {
                lbl_Error.Visible = false;
                lbl_Error.Text = string.Empty;
                cmb_Complejo.BorderColor = System.Drawing.Color.Transparent;
                flag = true;
            }


            return flag;
        }
        



        private void cargarAgenda()
        {

            lbl_agendaFecha.Text = "Agenda día: " + cld_Fecha.SelectedDate.ToShortDateString(); 
            //******************************************
            // Generar Horarios
            ComplejoDeportivo cd = ComplejoDeportivoDao.ObtenerComplejosPorID(cmb_Complejo.SelectedIndex);
            DateTime horaApertura = DateTime.Parse((cd.horaApertura).ToString());
            DateTime horario = DateTime.Parse((cd.horaCierre - cd.horaApertura).ToString());
            int ha = int.Parse(horaApertura.Hour.ToString());


            int horas = int.Parse(horario.Hour.ToString());

            List<AgendaEntidad> listaDatosAgenda = AgendaDao.ObtenerAgendaComplejo(cmb_Complejo.SelectedIndex, cmb_Deporte.SelectedIndex);
            AgendaEntidad agenda = null;
            List<AgendaEntidad> listaAgendaGenerada = new List<AgendaEntidad>();
            foreach (AgendaEntidad a in listaDatosAgenda)
            {

                for (int i = 0; i < horas; i++)
                {
                    agenda = new AgendaEntidad();
                    agenda.idCancha = a.idCancha;
                    agenda.nombreCancha = a.nombreCancha;
                    agenda.nombreTipoCancha = a.nombreTipoCancha;
                    agenda.horaInicioHorario = TimeSpan.FromHours((ha + i));
                    agenda.precioCancha = a.precioCancha;
                    agenda.capacidadTipoCancha = a.capacidadTipoCancha;

                    listaAgendaGenerada.Add(agenda);
                }
            }

            //**************************************************
            // Quitar Horarios Reservados

            List<AgendaEntidad> listaHorariosReservados = AgendaDao.ObtenerHorariosReservados(cmb_Complejo.SelectedIndex, cld_Fecha.SelectedDate);
            List<AgendaEntidad> listaHorariosDisponibles = new List<AgendaEntidad>();
            if (listaHorariosReservados.Count != 0)
            {
                foreach (AgendaEntidad lg in listaAgendaGenerada)
                {
                    foreach (AgendaEntidad lr in listaHorariosReservados)
                    {

                        // if (!(lg.idCancha == lr.idCancha && lg.horaInicioHorario == lr.horaInicioHorario))
                        if (lg.idCancha == lr.idCancha && lg.horaInicioHorario == lr.horaInicioHorario)
                        {

                            lg.idEstadoHorario = lr.idEstadoHorario;
                           
                        }
                    }
                }
            }
            
            foreach (AgendaEntidad lg in listaAgendaGenerada)
            {
                if (lg.idEstadoHorario == null)
                {
                    listaHorariosDisponibles.Add(lg);
                }
            }

            if (listaHorariosDisponibles.Count > 0)
            {
                gdv_Agenda.DataSource = listaHorariosDisponibles;
            }
            else { gdv_Agenda.DataSource = listaAgendaGenerada; }


            //  gdv_Agenda.DataSource = AgendaDao.ObtenerAgendaComplejo(cmb_Complejo.SelectedIndex);
            gdv_Agenda.DataKeyNames = new string[] { "idCancha" };
            gdv_Agenda.DataBind();
        }

        protected void cmb_Complejo_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbl_Reserva.Text = string.Empty;

            if (cmb_Deporte.SelectedIndex != 0 && cld_Fecha.SelectedDate != null
                 && cmb_Complejo.SelectedIndex != 0)
            {
                cargarAgenda();

                lbl_Reserva.Visible = false;
                lbl_Capacidad.Visible = false;
            }
            lbl_Error.Text = string.Empty;
        }

        protected void gdv_Agenda_SelectedIndexChanged(object sender, EventArgs e)
        {

            GridViewRow fila = gdv_Agenda.SelectedRow;

            string datos = string.Empty;
            datos = fila.Cells[2].Text + " , " + fila.Cells[3].Text + " , " + fila.Cells[4].Text + "hs. , $" + fila.Cells[5].Text;
            lbl_Reserva.Text = "Reservar en: " + datos;
            lbl_Capacidad.Text = "Capacidad: " + fila.Cells[6].Text;

            lbl_Reserva.Visible = true;
            lbl_Capacidad.Visible = true;
            lbl_Error.Text = string.Empty;
           
        }


        //protected void btn_VerAgenda_Click(object sender, EventArgs e)
        //{
        //    cargarAgenda();


        //}

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            
            if ( cmb_Deporte.SelectedIndex != 0 && cld_Fecha.SelectedDate != null
                && cmb_Complejo.SelectedIndex != 0 )
            {
                
                cargarAgenda();

                if (lbl_Reserva.Text != null && lbl_Capacidad.Text != null) {
                    lbl_Reserva.Visible = true;
                    lbl_Capacidad.Visible = true;
                }

            }
        }

        protected void cld_Fecha_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date < DateTime.Now.Date)
            {
                e.Day.IsSelectable = false;
               
            }
        }

        protected void cld_Fecha_SelectionChanged(object sender, EventArgs e)
        {
            if (cmb_Deporte.SelectedIndex != 0 && cld_Fecha.SelectedDate != null
                && cmb_Complejo.SelectedIndex != 0)
            {               
                cargarAgenda();

                lbl_Reserva.Visible = false;
                lbl_Capacidad.Visible = false;
            }
        }
    }
}


