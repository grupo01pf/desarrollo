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
    public partial class CrearEncuentro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["IdEncuentro"] = null;

            if (!IsPostBack)
            {

                deshabilitarControles();

                cargarDeportes();
                // cargarZonas();
                cargarComplejos();
                // cargarBarrios();
            }

            if (cmb_Complejo.SelectedIndex != 0)
            {
                contenedorDelMapa.Visible = true;
                frm_map.Visible = true;
                ComplejoDeportivo cd = ComplejoDeportivoDao.ObtenerComplejosPorID(cmb_Complejo.SelectedIndex);
                frm_map.Src = cd.mapa;
            }
            if (cmb_Complejo.SelectedIndex == 0)
            {
                contenedorDelMapa.Visible = false;
                frm_map.Visible = false;
            }




        }

        protected void btn_Crear_Click(object sender, EventArgs e)
        {
            if (rdb_Publico.Checked)
            {
                crearEventoPublico();
                Response.Redirect("EncuentroPublico.aspx");
            }
            else
            {


                if (string.IsNullOrEmpty(lbl_Reserva.Text))
                { lbl_Error.Text = "* Debe reservar una cahcha de la agenda"; }
                else
                {
                    crearEventoPrivado();
                    Response.Redirect("EncuentroPrivado.aspx");
                }
            }
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

            //  if (chk_Accesibilidad.Checked) { ed.accesibilidad = "Cerrado"; }
            //  else { ed.accesibilidad = "Abierto"; }

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
            // ed.idUsuario = 1;
            // ed.fechaCreacionEncuentro = DateTime.Now; (reserva)

            ed.idDeporte = cmb_Deporte.SelectedIndex;
            ed.idComplejo = cmb_Complejo.SelectedIndex;
            ed.fechaInicioEncuentro = cld_Fecha.SelectedDate;

            ed.idEstado = 7; // (habilitado)

            ed.tipoEncuentro = "Privado";

            // if (chk_Accesibilidad.Checked) { ed.accesibilidad = "Cerrado"; }
            //  else { ed.accesibilidad = "Abierto"; }

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
               // horario.horaInicio =
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

            //string fecha = DateTime.Now.ToString("HHmmss");
            //TimeSpan hr = TimeSpan.Parse(fecha.ToString());
            //reserva.horaReserva = hr;

            reserva.idEstado = 1; //(reservado)
            ReservaDao.InsertarReserva(reserva);

            Mensaje msg = new Mensaje();
            msg.idUsuario = int.Parse(Session["ID"].ToString());
            msg.idEncuentro = int.Parse(Session["idEncuentro"].ToString());
            msg.fechaHora = DateTime.Now;
            // msg.texto = string.Empty;
            msg.texto = "Bienvenidos";
            MensajeDao.InsertarMensaje(msg);

             




        }

        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void btn_BuscarHorarios_Click(object sender, EventArgs e)
        {

        }

        private void cargarGrilla()
        {

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

        private void cargarTipoCanchas()
        {

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


            txt_Direccion.Enabled = true;
            txt_NombreLugar.Enabled = true;
            txt_HoraInicio.Enabled = true;
            txt_HoraFin.Enabled = true;
            txt_Cantidad.Enabled = true;
            cmb_Complejo.Enabled = false;

            btn_Crear.Enabled = true;
            btn_Cancelar.Enabled = true;


        }

        protected void rdb_Privado_CheckedChanged(object sender, EventArgs e)
        {

            txt_Direccion.Enabled = false;
            txt_NombreLugar.Enabled = false;
            txt_HoraInicio.Enabled = false;
            txt_HoraFin.Enabled = false;
            txt_Cantidad.Enabled = false;
            cmb_Complejo.Enabled = true;

            btn_Crear.Enabled = true;
            btn_Cancelar.Enabled = true;


        }



        private void cargarAgenda()
        {
            
            lbl_agendaFecha.Text = "Agenda día: " + cld_Fecha.SelectedDate; 
            //******************************************
            // Generar Horarios
            ComplejoDeportivo cd = ComplejoDeportivoDao.ObtenerComplejosPorID(cmb_Complejo.SelectedIndex);
            DateTime horaApertura = DateTime.Parse((cd.horaApertura).ToString());
            DateTime horario = DateTime.Parse((cd.horaCierre - cd.horaApertura).ToString());
            int ha = int.Parse(horaApertura.Hour.ToString());


            int horas = int.Parse(horario.Hour.ToString());

            List<AgendaEntidad> listaDatosAgenda = AgendaDao.ObtenerAgendaComplejo(cmb_Complejo.SelectedIndex,cmb_Deporte.SelectedIndex);
            AgendaEntidad agenda = null;
            List<AgendaEntidad> listaAgendaGenerada = new List<AgendaEntidad>();
            foreach (AgendaEntidad a in listaDatosAgenda)
            {

                for(int i = 0; i < horas; i++)
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
                    foreach (AgendaEntidad lr in listaHorariosReservados) {

                       // if (!(lg.idCancha == lr.idCancha && lg.horaInicioHorario == lr.horaInicioHorario))
                        if (lg.idCancha == lr.idCancha && lg.horaInicioHorario == lr.horaInicioHorario)
                        {

                            lg.idEstadoHorario = lr.idEstadoHorario;
                            //agenda = new AgendaEntidad();

                            //agenda.idCancha = lg.idCancha;
                            //agenda.nombreCancha = lg.nombreCancha;
                            //agenda.nombreTipoCancha = lg.nombreTipoCancha;
                            //agenda.horaInicioHorario = lg.horaInicioHorario;
                            //agenda.precioCancha = lg.precioCancha;
                            //agenda.capacidadTipoCancha = lg.capacidadTipoCancha;

                            //listaHorariosDisponibles.Add(agenda);
                        }
                    }        
            }
            }
            //else { listaHorariosDisponibles = listaAgendaGenerada; }


            //*************************************************
            // Cargar Horarios
            // gdv_Agenda.DataSource = listaAgenda;
            // gdv_Agenda.DataSource = listaHorariosDisponibles;

            foreach (AgendaEntidad lg in listaAgendaGenerada) {
                if (lg.idEstadoHorario == null) {
                    listaHorariosDisponibles.Add(lg);
                }
            }

            if (listaHorariosDisponibles.Count > 0 ) {
                gdv_Agenda.DataSource = listaHorariosDisponibles;
            } else { gdv_Agenda.DataSource = listaAgendaGenerada; }
                

            //  gdv_Agenda.DataSource = AgendaDao.ObtenerAgendaComplejo(cmb_Complejo.SelectedIndex);
            gdv_Agenda.DataKeyNames = new string[] { "idCancha" };
            gdv_Agenda.DataBind();
        }

        protected void cmb_Complejo_SelectedIndexChanged(object sender, EventArgs e)
        {
            lbl_Reserva.Text = string.Empty;
            // lbl_Capacidad.Text = string.Empty;
            cargarAgenda();
            btn_Agenda.Visible = true;
          
        }

        protected void gdv_Agenda_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            GridViewRow fila = gdv_Agenda.SelectedRow;

            string datos = string.Empty;
            datos = fila.Cells[2].Text + " , " + fila.Cells[3].Text + " , " + fila.Cells[4].Text +"hs. , $" + fila.Cells[5].Text;
            lbl_Reserva.Text = "Reservar en: " + datos;

            lbl_Capacidad.Text = fila.Cells[6].Text;


        }

       
        protected void btn_VerAgenda_Click(object sender, EventArgs e)
        {
           cargarAgenda();
          
           
        }

      



    }
}
    
