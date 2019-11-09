using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDao;
using CapaEntidades;

namespace CapaPresentacion
{
    public partial class HomeEstablecimiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarRepeaterEncuentros();

            if (!IsPostBack)
            {
                CargarDdlComplejos();
                CargarDdlDeportes();
                ddlComp.AutoPostBack = true;
                ddlDeportes.AutoPostBack = true;
            }
        }

        protected int? IDRes
        {
            get
            {
                if (ViewState["IDRes"] != null)
                    return (int)ViewState["IDRes"];
                else
                {
                    return null;
                }
            }
            set { ViewState["IDRes"] = value; }
        }

        protected void CargarRepeaterEncuentros()
        {
            encuentrosRepeater.DataSource = (from encuentro in EncuentroDeportivioQueryDao.ObtenerEncuentrosPorUsResponsable(int.Parse(Session["ID"].ToString()))
                                             orderby encuentro.fechaInicioEncuentro ascending
                                             select encuentro);
            encuentrosRepeater.DataBind();
            encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
        }

        void encuentroRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "btnUnirseEncuentro")
            {
                string idEncuentro = ((LinkButton)e.CommandSource).CommandArgument;

                if (EncuentroDeportivioQueryDao.obtenerTipoEncuentroPorId(idEncuentro) == "Publico")
                {
                    Response.Redirect("EncuentroPublico.aspx?Id=" + idEncuentro);
                }
                if (EncuentroDeportivioQueryDao.obtenerTipoEncuentroPorId(idEncuentro) == "Privado")
                {
                    Response.Redirect("EncuentroPrivado.aspx?Id=" + idEncuentro);
                }

            }
        }

        private void CargarDdlComplejos()
        {
            ddlComp.DataSource = null;
            ddlComp.DataTextField = "nombre";
            ddlComp.DataValueField = "id";
            ddlComp.DataSource = (from comp in ComplejoDeportivoDao.ObtenerComplejosPorUsuario(int.Parse(Session["ID"].ToString()))
                                    orderby comp.Nombre
                                    select comp);
            ddlComp.DataBind();
        }

        private void CargarDdlDeportes()
        {
            ddlDeportes.DataSource = DeporteDao.ObtenerDeportes();
            ddlDeportes.DataValueField = "id";
            ddlDeportes.DataValueField = "nombre";
            ddlDeportes.DataBind();
        }

        //private void CargarDdlHoras()
        //{
        //    ComplejoDeportivo comp = new ComplejoDeportivo();
        //    comp = ComplejoDeportivoDao.ObtenerComplejosPorID(int.Parse(ddlComp.SelectedValue));

        //    //ddlHora.Items.Add(comp.horaApertura.ToString());
        //    TimeSpan time1 = new TimeSpan(0, 0, 0);
        //    TimeSpan time2 = new TimeSpan(1, 0, 0);
        //    time1 = TimeSpan.Parse(comp.horaApertura.ToString());
        //    while(time1 <= comp.horaCierre)
        //    {
        //        ddlHora.Items.Add(time1.ToString());
        //        time1=+time2;
        //    }
        //}

        //protected void ddlComp_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    ddlHora.Items.Clear();
        //    CargarDdlHoras();
        //}

        //VER COMO HACER PARA QUE TRAIGA TODAS LAS CANCHAS DEL COMPLEJO CON SU ESTADO EN BASE AL DIA Y LA HORA SELECCIONADA

        //protected void CargarGrillaCanchas()
        //{
        //    gvCanchas.DataSource = null;

        //    gvCanchas.DataSource = (from can in CanchaDao.ObtenerCanchasPorComplejos(IDCom.Value)
        //                            orderby can.Deporte, can.Nombre
        //                            select can);

        //    gvCanchas.DataKeyNames = new string[] { "ID" };
        //    gvCanchas.DataBind();
        //}

        private void cargarAgenda()
        {

            lbl_agendaFecha.Text = "Agenda";// + cld_Fecha.SelectedDate; 
            //******************************************
            // Generar Horarios
            ComplejoDeportivo cd = ComplejoDeportivoDao.ObtenerComplejosPorID(int.Parse(ddlComp.SelectedValue));
            DateTime horaApertura = DateTime.Parse((cd.horaApertura).ToString());
            DateTime horario = DateTime.Parse((cd.horaCierre - cd.horaApertura).ToString());
            int ha = int.Parse(horaApertura.Hour.ToString());


            int horas = int.Parse(horario.Hour.ToString());

            List<AgendaEntidad> listaDatosAgenda = AgendaDao.ObtenerAgendaComplejo(int.Parse(ddlComp.SelectedValue), ddlDeportes.SelectedIndex);
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

            List<AgendaEntidad> listaHorariosReservados = AgendaDao.ObtenerHorariosReservados(int.Parse(ddlComp.SelectedValue), cld_Fecha.SelectedDate);
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

        protected void ddlComp_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDeportes.SelectedIndex != 0 && cld_Fecha.SelectedDate.Date > DateTime.MinValue)
            {
                lbl_Reserva.Text = string.Empty;
                lbl_Capacidad.Text = string.Empty;
                cargarAgenda();
                //btn_Agenda.Visible = true;
            }           
        }

        protected void ddlDeportes_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlComp.SelectedIndex != 0 && cld_Fecha.SelectedDate.Date > DateTime.MinValue)
            {
                lbl_Reserva.Text = string.Empty;
                lbl_Capacidad.Text = string.Empty;
                cargarAgenda();
                //btn_Agenda.Visible = true;
            }
        }

        protected void gdv_Agenda_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow fila = gdv_Agenda.SelectedRow;

            string datos = string.Empty;
            datos = fila.Cells[2].Text + " , " + fila.Cells[3].Text + " , " + fila.Cells[4].Text + "hs. , $" + fila.Cells[5].Text;
            lbl_Reserva.Text = "Reservar en: " + datos;

            lbl_Capacidad.Text = fila.Cells[6].Text;
            ReservarCancha();
        }

        //protected void Timer1_Tick(object sender, EventArgs e)
        //{
        //    if (ddlDeportes.SelectedIndex != 0 && cld_Fecha.SelectedDate != null && ddlComp.SelectedIndex != 0)
        //    {
        //        cargarAgenda();
        //        //lbl_agendaFecha.Text = "Agenda día: " + cld_Fecha.SelectedDate;
        //    }
        //}

        protected void cld_Fecha_SelectionChanged(object sender, EventArgs e)
        {
            if (ddlDeportes.SelectedIndex != 0 && ddlComp.SelectedIndex != 0)
            {
                cargarAgenda();
                //lbl_agendaFecha.Text = "Agenda día: " + cld_Fecha.SelectedDate;
            }
        }

        private void ReservarCancha()
        {

            GridViewRow fila = gdv_Agenda.SelectedRow;

            EncuentroDeportivo ed = new EncuentroDeportivo();

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

            //Reserva reserva = new Reserva();
            //reserva.fechaReserva = DateTime.Now;
            //reserva.idEncuentroDeportivo = int.Parse(Session["idEncuentro"].ToString());

            //string fecha = DateTime.Now.ToString("HHmmss");
            //TimeSpan hr = TimeSpan.Parse(fecha.ToString());
            //reserva.horaReserva = hr;

            //reserva.idEstado = 1; //(reservado)
            //ReservaDao.InsertarReserva(reserva);

        }

    }
}