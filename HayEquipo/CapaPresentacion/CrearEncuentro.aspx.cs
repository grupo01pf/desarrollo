using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaDao;
using System.Security.Cryptography;

namespace CapaPresentacion
{
    public partial class CrearEncuentro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {
                Session["IdEncuentro"] = null;
                Session["idComplejo"] = null;

                deshabilitarControles();

                cargarDeportes();
                cargarBarrios();
                cargarZonas();
                
                cld_Fecha.SelectedDate = DateTime.Today;

                // cld_Fecha.SelectedDayStyle.BorderColor

                txt_Clave.Enabled = false;
               // lbl_ConsejoMapa.Visible = false;
            }

            cargarMapa();

        }

        protected void btn_Crear_Click(object sender, EventArgs e)
        {
            if (rdb_Publico.Checked)
            {
                // lbl_ConsejoMapa.Visible = true;
                if (controlDatosObligatoriosEncuentroPublico())
                {
                    lbl_ConsejoMapa.Visible = true;
                    crearEventoPublico();
                    Response.Redirect("EncuentroPublico.aspx");
                }
                else { rdb_Publico.Checked = false; }

            }
            else
            {
                if (rdb_Complejo.Checked){

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

                } else if (rdb_Horario.Checked) {
                        lbl_Error.Visible = false;
                        crearEventoPrivadoPorHorario();
                        Response.Redirect("EncuentroPrivado.aspx");
                }


            }
            //if (string.IsNullOrEmpty(lbl_Reserva.Text) || cmb_Complejo.SelectedIndex == 0)
            //{ lbl_Error.Text = "* Debe reservar una cahcha de la agenda"; }
        }
    
        

        private void crearEventoPublico()
        {

            EncuentroDeportivo ed = new EncuentroDeportivo();
            ed.idUsuario = int.Parse(Session["ID"].ToString()); 
            //( USAR cuando este el Login )
                                                                
            // ed.idUsuario = 1;  // (Usar cuando No este el login)
                                                                
            // ed.fechaCreacionEncuentro = DateTime.Now;

            int sport = 0;
            if (int.TryParse(cmb_Deporte.SelectedItem.Value, out sport))
                ed.idDeporte = sport;

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

            insertarMapaEncuentroPublico(id);

        }

        private void insertarMapaEncuentroPublico(int id) {
            Mapa m = new Mapa();
            EncuentroDeportivo ed = new EncuentroDeportivo();
            if (string.IsNullOrEmpty(txt_Latitud.Text) || string.IsNullOrEmpty(txt_Longitud.Text)) {
                m.latitud = "-31.416563";
                m.longitud = "-64.183533";
            }
            else
            {            
                m.latitud = txt_Latitud.Text;
                m.longitud = txt_Longitud.Text;
                //m.latitud = txt_Latitud.Value;
                //m.longitud = txt_Longitud.Value;
            }
            int idMapa = MapaDao.insertarMapa(m);

            ed.id = id;
            ed.idMapa = idMapa;
            EncuentroDeportivoDao.ActualizarMapaEncuentro(ed);

        }


        private void crearEventoPrivado()
        {

            GridViewRow fila = gdv_Agenda.SelectedRow;

            EncuentroDeportivo ed = new EncuentroDeportivo();

            ed.idUsuario = int.Parse(Session["ID"].ToString()); //( USAR cuando este el Login )

            int sport = 0;
            if (int.TryParse(cmb_Deporte.SelectedItem.Value, out sport))                
                ed.idDeporte = sport;

            int compDep = 0;
            if (int.TryParse(cmb_Complejo.SelectedItem.Value, out compDep))
                ed.idComplejo = compDep;

            ed.fechaInicioEncuentro = cld_Fecha.SelectedDate;

            ed.idEstado = 7; // (habilitado)

            ed.tipoEncuentro = "Privado";

            
            if (string.IsNullOrEmpty(txt_Clave.Text))
            {
                ed.accesibilidad = "Abierto";
                // ed.clave = string.Empty;
                ed.clave = "";
            }            
            else
            {
                ed.accesibilidad = "Cerrado";
                ed.clave = txt_Clave.Text; // NO USAR
                ed.idClave = CriptografiaDao.encriptar(txt_Clave.Text);
            }


            if (string.IsNullOrEmpty(txt_NombreLugar.Text))
                ed.nombreLP = string.Empty;
            // else { ed.nombreLP = txt_NombreLugar.Text; }

            if (string.IsNullOrEmpty(txt_Direccion.Text))
                ed.direccion = string.Empty;
            // else { ed.direccion = txt_Direccion.Text; }

            if (string.IsNullOrEmpty(fila.Cells[6].Text))
                ed.capacidad = 4; // (POR DEFECTO 4 USUARIOS)
            else { ed.capacidad = int.Parse(fila.Cells[6].Text); }

            if (string.IsNullOrEmpty(fila.Cells[4].Text))
                ed.horaInicio = TimeSpan.Parse("00:00")  ; // (POR DEFECTO )
            else { ed.horaInicio = TimeSpan.Parse(fila.Cells[4].Text); }



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

        private void crearEventoPrivadoPorHorario() {

            GridViewRow fila = gdv_AgendaComplejos.SelectedRow;

            EncuentroDeportivo ed = new EncuentroDeportivo();

            ed.idUsuario = int.Parse(Session["ID"].ToString()); //( USAR cuando este el Login )

            int sport = 0;
            if (int.TryParse(cmb_Deporte.SelectedItem.Value, out sport))
                ed.idDeporte = sport;

            ed.idComplejo = int.Parse(Session["idComplejo"].ToString());

            ed.fechaInicioEncuentro = cld_Fecha.SelectedDate;
            ed.idEstado = 7; // (habilitado)

            if (string.IsNullOrEmpty(txt_PorHora.Text))
            { ed.horaInicio = TimeSpan.Parse("00:00"); }
            else
            {
                TimeSpan? hi = TimeSpan.Parse(txt_PorHora.Text);
                ed.horaInicio = hi;
            }            

            ed.tipoEncuentro = "Privado";

            if (string.IsNullOrEmpty(txt_Clave.Text))
            {
                ed.accesibilidad = "Abierto";
                // ed.clave = string.Empty;
                ed.clave = "";
            }
            else
            {
                ed.accesibilidad = "Cerrado";
                ed.clave = txt_Clave.Text; // NO USAR
                ed.idClave = CriptografiaDao.encriptar(txt_Clave.Text);
            }


            if (string.IsNullOrEmpty(txt_NombreLugar.Text))
                ed.nombreLP = string.Empty;

            if (string.IsNullOrEmpty(txt_Direccion.Text))
                ed.direccion = string.Empty;


            if (string.IsNullOrEmpty(fila.Cells[6].Text))
                ed.capacidad = 4; // (POR DEFECTO 4 USUARIOS)
            else { ed.capacidad = int.Parse(fila.Cells[6].Text); }

            Session["idEncuentro"] = EncuentroDeportivoDao.InsertarEncuentroPrivado(ed);
            EncuentroDeportivoDao.insertarUsuarioPorEncuentro(int.Parse(Session["ID"].ToString()), int.Parse(Session["idEncuentro"].ToString()));

            Horario horario = new Horario();

            if (string.IsNullOrEmpty(txt_PorHora.Text))
            { horario.horaInicio = TimeSpan.Parse("00:00"); }
            else
            {
                TimeSpan? hr = TimeSpan.Parse(txt_PorHora.Text);
                horario.horaInicio = hr;

            }

            horario.fecha = cld_Fecha.SelectedDate;
            horario.idEstado = 1; // (REESERVADO)


            CanchasPorHorarios cph = new CanchasPorHorarios();
            cph.idHorario = AgendaDao.InsertarHorario(horario);
            cph.idCancha = int.Parse(gdv_AgendaComplejos.SelectedDataKey.Value.ToString());
         
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
            cmb_Deporte.Items.Clear();
            cmb_Deporte.Items.Insert(0, new ListItem("Sin Seleccionar", ""));
            cmb_Deporte.DataSource = DeporteDao.ObtenerDeportes();
            cmb_Deporte.DataValueField = "id";
            cmb_Deporte.DataTextField = "nombre";
            cmb_Deporte.DataBind();
        }
        private void cargarTipoCancha()
        {
            int sport = 0;
            int.TryParse(cmb_Deporte.SelectedItem.Value, out sport);

            cmb_TipoCancha.Items.Clear();
            cmb_TipoCancha.Items.Insert(0, new ListItem("Sin Seleccionar", ""));

            cmb_TipoCancha.DataSource = TipoCanchaDao.ObtenerTipoPorIdDeporte(sport);
            cmb_TipoCancha.DataValueField = "id";
            cmb_TipoCancha.DataTextField = "nombre";
            cmb_TipoCancha.DataBind();
        }

        private void cargarBarrios()
        {
            cmb_Barrio.Items.Clear();
            cmb_Barrio.Items.Insert(0, new ListItem("Sin Seleccionar", ""));
            // cmb_Barrio.DataSource = BarrioDao.obtenerBarrios();
            cmb_Barrio.DataSource = BarrioDao.obtenerBarriosOrdenados();
            cmb_Barrio.DataValueField = "id";
            cmb_Barrio.DataTextField = "nombre";
            cmb_Barrio.DataBind();
        }
        private void cargarZonas()
        {
            cmb_Zona.Items.Clear();
            cmb_Zona.Items.Insert(0, new ListItem("Sin Seleccionar", ""));

            cmb_Zona.DataSource = ZonaDao.obtenerZonasEF();
            cmb_Zona.DataValueField = "id";
            cmb_Zona.DataTextField = "nombre";
            cmb_Zona.DataBind();
        }

        private void cargarComplejos()
        {

            string sport = cmb_Deporte.SelectedItem.Text;

            int barrio = 0;
            int.TryParse(cmb_Barrio.SelectedItem.Value, out barrio);

            int zona = 0;
            int.TryParse(cmb_Zona.SelectedItem.Value, out zona);

            cmb_Complejo.Items.Clear();
            cmb_Complejo.Items.Insert(0, new ListItem("Sin Seleccionar", ""));

            if (cmb_Barrio.SelectedIndex == 0 && cmb_Zona.SelectedIndex == 0)
            {
                cmb_Complejo.DataSource = ComplejoDeportivoDao.obtenerComplejoPorDeporte(sport);
            }
            else if (cmb_Barrio.SelectedIndex != 0)
            {
                cmb_Complejo.DataSource = ComplejoDeportivoDao.getComplejoPorDeporteBarrio(sport,barrio);
            }
            else if (cmb_Zona.SelectedIndex != 0) {
                cmb_Complejo.DataSource = ComplejoDeportivoDao.getComplejoPorDeporteZona(sport, zona);
            }            
            
            cmb_Complejo.DataValueField = "id";
            cmb_Complejo.DataTextField = "nombre";
            cmb_Complejo.DataBind();
        }

        private void cargarMapa(){

            if (cmb_Complejo.SelectedIndex != 0)
            {
                int idComplejo = 0;
                int.TryParse(cmb_Complejo.SelectedItem.Value, out idComplejo);
                    //contenedorDelMapa.Visible = true;
                    // frm_map.Visible = true;
                    ComplejoDeportivo cd = ComplejoDeportivoDao.ObtenerComplejosPorID(idComplejo);
               // frm_map.Src = cd.mapa;
                btn_Agenda.Visible = true;
                btn_VerComplejo.Visible = true;
                cargarModalComplejo(idComplejo);
            }
            if (cmb_Complejo.SelectedIndex == 0)
            {
               // contenedorDelMapa.Visible = false;
               // frm_map.Visible = false;
            }

        }
        

        private void deshabilitarControles()
        {

            cmb_Zona.Enabled = false;
            cmb_Barrio.Enabled = false;

            txt_Direccion.Enabled = false;
            txt_NombreLugar.Enabled = false;
            txt_HoraInicio.Enabled = false;
            txt_HoraFin.Enabled = false;

           // link_ComplejosInfo.Enabled = false;
            lbl_Complejo.Enabled = false;
            cmb_Complejo.Enabled = false;            

            btn_Crear.Enabled = false;
            btn_Cancelar.Enabled = false;
            txt_Cantidad.Enabled = false;

            btn_Agenda.Visible = false;
            btn_VerComplejo.Visible = false;

            rdb_Horario.Enabled = false;
            rdb_Complejo.Enabled = false;

            lbl_PorHora.Enabled = false;
            txt_PorHora.Enabled = false;
            lbl_TipoCancha.Enabled = false;
            cmb_TipoCancha.Enabled = false;
            
            // lbl_Capacidad.Visible = true;

           // contenedorDelMapa.Visible = false;
           // frm_map.Visible = false;

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

                rdb_Horario.Enabled = false;
                rdb_Complejo.Enabled = false;

                // link_ComplejosInfo.Enabled = false;
                lbl_Complejo.Enabled = false;
                cmb_Complejo.Enabled = false;

                lbl_PorHora.Enabled = false;
                txt_PorHora.Enabled = false;
                lbl_TipoCancha.Enabled = false;
                cmb_TipoCancha.Enabled = false;
                rdb_Horario.Checked = false;
                rdb_Complejo.Checked = false;

                cmb_Complejo.SelectedIndex = 0;
                cmb_TipoCancha.SelectedIndex = 0;

                gdv_Agenda.Visible = false;
                gdv_AgendaComplejos.Visible = false;

                btn_Agenda.Visible = false;
                btn_VerComplejo.Visible = false;

                btn_Crear.Enabled = true;
                btn_Cancelar.Enabled = true;
                lbl_Error.Text = string.Empty;
                lbl_ConsejoMapa.Visible = true;

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
                cmb_Complejo.Enabled = false;
                

                btn_Crear.Enabled = true;
                btn_Cancelar.Enabled = true;
                lbl_Error.Text = string.Empty;
                                
                rdb_Horario.Enabled = true;
                rdb_Horario.Checked = false;
                rdb_Complejo.Enabled = true;
                rdb_Complejo.Checked = false;

                cmb_Complejo.SelectedIndex = 0;
                cmb_TipoCancha.SelectedIndex = 0;

                lbl_ConsejoMapa.Visible = false;
              

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
            int idComplejo = 0;
            int.TryParse(cmb_Complejo.SelectedItem.Value, out idComplejo);
            int sport = 0;
            int.TryParse(cmb_Deporte.SelectedItem.Value, out sport);
            lbl_agendaFecha.Text = "Agenda día: " + cld_Fecha.SelectedDate.ToShortDateString();
            //******************************************
            // Generar Horarios
            // ComplejoDeportivo cd = ComplejoDeportivoDao.ObtenerComplejosPorID(cmb_Complejo.SelectedIndex);
            ComplejoDeportivo cd = ComplejoDeportivoDao.ObtenerComplejosPorID(idComplejo);
            DateTime horaApertura = DateTime.Parse((cd.horaApertura).ToString());
            DateTime horario = DateTime.Parse((cd.horaCierre - cd.horaApertura).ToString());
            int ha = int.Parse(horaApertura.Hour.ToString());


            int horas = int.Parse(horario.Hour.ToString());

            // List<AgendaEntidad> listaDatosAgenda = AgendaDao.ObtenerAgendaComplejo(cmb_Complejo.SelectedIndex, cmb_Deporte.SelectedIndex);
            List<AgendaEntidad> listaDatosAgenda = AgendaDao.ObtenerAgendaComplejo(idComplejo, sport);
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

            //  List<AgendaEntidad> listaHorariosReservados = AgendaDao.ObtenerHorariosReservados(cmb_Complejo.SelectedIndex, cld_Fecha.SelectedDate);
            List<AgendaEntidad> listaHorariosReservados = AgendaDao.ObtenerHorariosReservados(idComplejo, cld_Fecha.SelectedDate);
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

            int cd = 0;
            if (int.TryParse(cmb_Complejo.SelectedItem.Value, out cd))
                mostrarUbicacion(cd);


        }

        private void cargarAgendaPorHorario() {

           

            string sport = cmb_Deporte.SelectedItem.Text;

            TimeSpan? hi = TimeSpan.Parse(txt_PorHora.Text);


            int tipoCancha = 0;
            if (cmb_TipoCancha.SelectedIndex != 0) {               
                int.TryParse(cmb_TipoCancha.SelectedItem.Value, out tipoCancha);                                   
            }

            lbl_agendaFecha.Text = "Agenda día: " + cld_Fecha.SelectedDate.ToShortDateString() + " Horario: " + hi;
            //******************************************
            List<ComplejoDeportivo> listaComplejos = null;
            List<ComplejoDeportivo> listaComplejosReservados = null;
            List<ComplejoDeportivo> listaComplejosDisponibles = null;

            int b = 0;
            int.TryParse(cmb_Barrio.SelectedItem.Value, out b);
            int z = 0;
            int.TryParse(cmb_Zona.SelectedItem.Value, out z);
            if (z != 0)
            {
                listaComplejos = ComplejoDeportivoDao.getComplejoPorHorarioDeporteZona(sport, z, tipoCancha, hi);
                listaComplejosReservados = ComplejoDeportivoDao.getComplejoPorHorarioDeporteReservados(tipoCancha, sport, hi, cld_Fecha.SelectedDate);

            }
            
            else if (b != 0) {
                listaComplejos = ComplejoDeportivoDao.getComplejoPorHorarioDeporteBarrio(sport, tipoCancha, b, hi);
                listaComplejosReservados = ComplejoDeportivoDao.getComplejoPorHorarioDeporteReservados(tipoCancha, sport, hi, cld_Fecha.SelectedDate);
            }
            else
            {
                listaComplejos = ComplejoDeportivoDao.getComplejoPorHorarioDeporte(tipoCancha, sport, hi);
                listaComplejosReservados = ComplejoDeportivoDao.getComplejoPorHorarioDeporteReservados(tipoCancha, sport, hi, cld_Fecha.SelectedDate);
            }

            // List<ComplejoDeportivo> listaComplejos = ComplejoDeportivoDao.getComplejoPorHorarioDeporte(tipoCancha, sport);
            // List<ComplejoDeportivo> listaComplejosReservados = ComplejoDeportivoDao.getComplejoPorHorarioDeporteReservados(tipoCancha,sport,hi,cld_Fecha.SelectedDate);
            
            listaComplejosDisponibles = listaComplejos;
            //foreach(ComplejoDeportivo lc in listaComplejos)
            //{
            //    foreach (ComplejoDeportivo lcr in listaComplejosReservados) {
            //        if (lc.id == lcr.id) {
            //            listaComplejosDisponibles.Remove(lc);
            //            break;
            //        }
            //    }

            //}
            ComplejoDeportivo lc = null;
            ComplejoDeportivo lcr = null;
            for (int i = 0; i < listaComplejos.Count; i++) {
                lc = listaComplejos.ElementAt(i);
                for (int j = 0; j < listaComplejosReservados.Count; j++)
                {
                    lcr = listaComplejosReservados.ElementAt(j);

                    if (lc.id == lcr.id)
                    {
                        listaComplejosDisponibles.Remove(lc);
                      
                    }
                }
            }
            List<AgendaEntidad> listaDatosAgenda = new List<AgendaEntidad>();


            foreach (ComplejoDeportivo lcd in listaComplejosDisponibles) {

                listaDatosAgenda.Add(AgendaDao.ObtenerAgendaComplejoPorHorario(lcd.id, cmb_Deporte.SelectedIndex));
            }

            gdv_AgendaComplejos.DataSource = listaDatosAgenda;
            gdv_AgendaComplejos.DataKeyNames = new string[] { "idCancha" };
            gdv_AgendaComplejos.DataBind();
                    

        }


        private void mostrarUbicacion(int idMapa){

            ComplejoDeportivo cd = ComplejoDeportivoDao.ObtenerComplejosPorID(idMapa);
            int id = cd.mapa.Value;
            Mapa mapa = MapaDao.obtenerMapaByID(id);

            txt_Latitud.Text = mapa.latitud;
            txt_Longitud.Text = mapa.longitud;
            //txt_Latitud.Value = mapa.latitud;
            //txt_Longitud.Value = mapa.longitud;

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

        protected void chk_Accesibilidad_CheckedChanged(object sender, EventArgs e)
        {
            txt_Clave.Enabled = true;
            txt_Clave.Text = string.Empty;
        }

   

        protected void rdb_Horario_CheckedChanged(object sender, EventArgs e)
        {
            btn_Agenda.Visible = false;
            btn_VerComplejo.Visible = false;

            lbl_PorHora.Enabled = true;
            txt_PorHora.Enabled = true;
            cargarTipoCancha();
            lbl_TipoCancha.Enabled = true;
            cmb_TipoCancha.Enabled = true;

            // link_ComplejosInfo.Enabled = false;
            btn_VerComplejo.Visible = false;
            lbl_Complejo.Enabled = false;
            cmb_Complejo.Enabled = false;

            gdv_Agenda.Visible = false;
            gdv_AgendaComplejos.Visible = true;

            cmb_Complejo.SelectedIndex = 0;

        }

        protected void rdb_Complejo_CheckedChanged(object sender, EventArgs e)
        {
            btn_Agenda.Visible = false;
            btn_VerComplejo.Visible = false;

           // link_ComplejosInfo.Enabled = true;
            lbl_Complejo.Enabled = true;
            cmb_Complejo.Enabled = true;
            cargarComplejos();

            lbl_PorHora.Enabled = false;
            txt_PorHora.Enabled = false;
            txt_PorHora.Text = string.Empty;

            lbl_TipoCancha.Enabled = false;
            cmb_TipoCancha.Enabled = false;            

            gdv_Agenda.Visible = true;
            gdv_AgendaComplejos.Visible = false;

            cmb_TipoCancha.SelectedIndex = 0;

        }

        protected void rdb_PorBarrio_CheckedChanged(object sender, EventArgs e)
        {
            cmb_Zona.Enabled = false;
            cmb_Barrio.Enabled = true;

            txt_PorHora.Text = string.Empty;
            cmb_TipoCancha.SelectedIndex = 0;

            cmb_Complejo.SelectedIndex = 0;
        }

        protected void rdb_PorZona_CheckedChanged(object sender, EventArgs e)
        {
            cmb_Zona.Enabled = true;
            cmb_Barrio.Enabled = false;

            txt_PorHora.Text = string.Empty;
            cmb_TipoCancha.SelectedIndex = 0;

            cmb_Complejo.SelectedIndex = 0;
        }

        protected void cmb_TipoCancha_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            if (!string.IsNullOrEmpty(txt_PorHora.Text))
            {
                cargarAgendaPorHorario();

                btn_Agenda.Visible = true;
                btn_VerComplejo.Visible = false;

                lbl_Error.Visible = false;
                cmb_TipoCancha.SelectedIndex = 0;
            }
            else {
                lbl_Error.Text = "Falta ingresar hora de inicio";
                txt_PorHora.Text = string.Empty;
                cmb_TipoCancha.SelectedIndex = 0;
            }
            
        }

        protected void gdv_AgendaComplejos_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow fila = gdv_AgendaComplejos.SelectedRow;

            string datos = string.Empty;
            datos = fila.Cells[3].Text + " , " + fila.Cells[4].Text + " , " + txt_PorHora.Text + "hs. , $" + fila.Cells[5].Text;
            lbl_Reserva.Text = "Reservar en: " + datos;
            lbl_Capacidad.Text = "Capacidad: " + fila.Cells[6].Text;

            lbl_Reserva.Visible = true;
            lbl_Capacidad.Visible = true;
            lbl_Error.Text = string.Empty;

            Session["idComplejo"] = fila.Cells[2].Text;

            mostrarUbicacion(int.Parse(Session["idComplejo"].ToString()));

            btn_VerComplejo.Visible = true;
            cargarModalComplejo(int.Parse(Session["idComplejo"].ToString()));
        }

        private void cargarModalComplejo(int idComplejo)
        {

            ComplejoDeportivo compSelec = ComplejoDeportivoDao.ObtenerComplejosPorID(idComplejo);

            // myModalLabel2.InnerText = compSelec.nombre;
            lblValoracion.Text = "Valoración: " + compSelec.promedioEstrellas.ToString();

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
                // imgAvatar.ImageUrl = "~/AvatarComplejo.aspx?id=" + Session["ID"].ToString();
            }


            //img1.Src = "~/AvatarComplejo.aspx?id=" + Session["ID"].ToString();
            //img2.Src = "~/AvatarComplejo.aspx?id=" + Session["ID"].ToString();
            //img3.Src = "~/AvatarComplejo.aspx?id=" + Session["ID"].ToString();

            // btnPopUp_ModalPopupExtender2.Show();
        }

        protected void cmb_Zona_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdb_Publico.Checked) {
                habilitarEncuentroPublico();
            }
            if (rdb_Privado.Checked && rdb_Horario.Checked)
            {
                cargarTipoCancha();
                habilitarPorHorario();
            }
            if (rdb_Privado.Checked && rdb_Complejo.Checked)
            {
                cargarComplejos();
                habilitarPorComplejo();
            }

        }

        protected void cmb_Barrio_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdb_Publico.Checked)
            {
                habilitarEncuentroPublico();
            }
            if (rdb_Privado.Checked && rdb_Horario.Checked)
            {
                cargarTipoCancha();
                habilitarPorHorario();
            }
            if (rdb_Privado.Checked && rdb_Complejo.Checked)
            {
                cargarComplejos();
                habilitarPorComplejo();
            }
        }

        private void deshabilitarEncuentroPublico() {

            txt_HoraInicio.Enabled = false;
            txt_HoraInicio.Text = string.Empty;
            txt_HoraFin.Enabled = false;
            txt_HoraFin.Text = string.Empty;
            txt_Cantidad.Enabled = false;
            txt_Cantidad.Text = string.Empty;
            txt_Direccion.Enabled = false;
            txt_Direccion.Text = string.Empty;
            txt_NombreLugar.Enabled = false;
            txt_NombreLugar.Text = string.Empty;

            btn_Crear.Enabled = false;
            btn_Cancelar.Enabled = false;
            lbl_Error.Text = string.Empty;

            lbl_ConsejoMapa.Visible = false;

        }
        private void habilitarEncuentroPublico()
        {
            txt_HoraInicio.Enabled = true;
            txt_HoraInicio.Text = string.Empty;
            txt_HoraFin.Enabled = true;
            txt_HoraFin.Text = string.Empty;
            txt_Cantidad.Enabled = true;
            txt_Cantidad.Text = string.Empty;
            txt_Direccion.Enabled = true;
            txt_Direccion.Text = string.Empty;
            txt_NombreLugar.Enabled = true;
            txt_NombreLugar.Text = string.Empty;

            btn_Crear.Enabled = true;
            btn_Cancelar.Enabled = true;
            lbl_Error.Text = string.Empty;

            lbl_ConsejoMapa.Visible = true;

        }
        private void deshabilitarEncuentroPrivado() {
            rdb_Complejo.Checked = false;
            rdb_Horario.Checked = false;
            deshabilitarPorHorario();
            deshabilitarPorComplejo();

            btn_Crear.Enabled = false;
            btn_Cancelar.Enabled = false;
            lbl_Error.Text = string.Empty;

            lbl_ConsejoMapa.Visible = false;

            btn_Agenda.Visible = false;
            btn_VerComplejo.Visible = false;

        }
        private void habilitarEncuentroPrivado()
        {
            rdb_Complejo.Checked = true;
            rdb_Horario.Checked = true;

            habilitarPorHorario();
            habilitarPorComplejo();

            btn_Crear.Enabled = true;
            btn_Cancelar.Enabled = true;
            lbl_Error.Text = string.Empty;

        }
        private void deshabilitarPorHorario() {
           // rdb_Horario.Checked = false;
            txt_PorHora.Enabled = false;
            txt_PorHora.Text = string.Empty;
            cmb_TipoCancha.Enabled = false;
            cmb_TipoCancha.SelectedIndex = 0;

            btn_Agenda.Visible = false;
            btn_VerComplejo.Visible = false;
        }
        private void habilitarPorHorario()
        {
           // rdb_Horario.Checked = true;
            txt_PorHora.Enabled = true;
            txt_PorHora.Text = string.Empty;
            cmb_TipoCancha.Enabled = true;
            cmb_TipoCancha.SelectedIndex = 0;
        }
        private void deshabilitarPorComplejo() {
           // rdb_Complejo.Checked = false;
            cmb_Complejo.Enabled = false;
            cmb_Complejo.SelectedIndex = 0;
        }
        private void habilitarPorComplejo()
        {
           // rdb_Complejo.Checked = true;
            cmb_Complejo.Enabled = true;
            cmb_Complejo.SelectedIndex = 0;
        }
    }
}


