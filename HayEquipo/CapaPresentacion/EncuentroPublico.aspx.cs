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
    public partial class EncuentroPublico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack) {
                Session["IdOrganizadorEncuentro"] = null;
                Session["CapacidadMaxima"] = null;
                cargarTabla();
                cargarDatosEncuentroPublico();
                validacionesDeUsuario();
                calcularCapacidad();
                cargarChat();
                //cargarListaInvitar();
            }
            
            txt_Latitud.Enabled = false;
            txt_Longitud.Enabled = false;

        }
        private void cargarDatosEncuentroPublico()
        {
            
            EncuentroDeportivoQueryEntidad edq = new EncuentroDeportivoQueryEntidad();

            edq = EncuentroDeportivioQueryDao.datosEncuentroPublico(int.Parse(Session["idEncuentro"].ToString()));

            Session["idEncuentro"] = edq.idEncuentroDeportivo;
            int id = int.Parse(Session["idEncuentro"].ToString());

            Session["IdOrganizadorEncuentro"] = edq.idUsuario;

            cargarMapa(edq.idMapa);

            
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

            Session["CapacidadMaxima"] = edq.capacidad;

            txt_Organizador.Text = edq.nombreUsuario.ToString();

            bloquearControles();

            
        }

        private void cargarMapa(int idMapa) {
            
            Mapa mapa = MapaDao.obtenerMapaByID(idMapa);
            txt_Latitud.Text = mapa.latitud;
            txt_Longitud.Text = mapa.longitud;
        }


        //  private void calcularCapacidad(int capacidad, int idEncuentro) {
        private void calcularCapacidad()
        {

            //bool completo = false;
            List<Usuario> listaUsuarios = UsuarioDao.UsuariosUnidosEncuentroPublico(int.Parse(Session["idEncuentro"].ToString()));
            // Session["CantidadActual"] = listaUsuarios.Count();
            if (listaUsuarios.Count < int.Parse(Session["CapacidadMaxima"].ToString()))
            {
                lbl_Cantidad.Text = listaUsuarios.Count + "/" + int.Parse(Session["CapacidadMaxima"].ToString());
            }
            else
            {
                lbl_Cantidad.Text = listaUsuarios.Count + "/" + int.Parse(Session["CapacidadMaxima"].ToString());
                btn_Unirse.Enabled = false;
                int estado = 8; // (COMPLETO)
                EncuentroDeportivoDao.actualizarEncuentroDeportivo(int.Parse(Session["idEncuentro"].ToString()), estado);

            }
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
            calcularCapacidad();
            btn_Unirse.Enabled = false;
            btn_Salir.Enabled = true;
        }
        protected void btn_Salir_Click(object sender, EventArgs e)
        {
            EncuentroDeportivoDao.SalirDelEncuentroEquipoA(int.Parse(Session["ID"].ToString()), int.Parse(Session["idEncuentro"].ToString()));
            cargarTabla();
            calcularCapacidad();
            btn_Unirse.Enabled = true;
            btn_Salir.Enabled = false;
        }
        protected void btn_CancelarEncuentro_Click(object sender, EventArgs e)
        {
            int estado = 6; // (CANCELADO)
            EncuentroDeportivoDao.actualizarEncuentroDeportivo(int.Parse(Session["idEncuentro"].ToString()), estado);
            // Pedir confirmacion de cancelacion
            Response.Redirect("Home.aspx");
        }
        protected void btn_Invitar_Click(object sender, EventArgs e)
        {

        }

        private void cargarTabla()
        {

                //  Session["ListaUsuariosUnidos"] = UsuarioDao.UsuariosUnidosEncuentroPublico(int.Parse(Session["idEncuentro"].ToString()));
                //  gdv_UsuariosUnidos.DataSource = Session["ListaUsuariosUnidos"];
                gdv_UsuariosUnidos.DataSource = UsuarioDao.UsuariosUnidosEncuentroPublico(int.Parse(Session["idEncuentro"].ToString()));
                gdv_UsuariosUnidos.DataKeyNames = new string[] { "nombre" };
                gdv_UsuariosUnidos.DataBind();

        }
       

        private void validacionesDeUsuario()
        {

            if (validarOrganizador())
            {
                btn_Unirse.Enabled = false;
                btn_Salir.Enabled = false;
                btn_CancelarEncuentro.Visible = true;
            }
            else
            {
                if (validarJugadorUnido())
                {
                    btn_Unirse.Enabled = false;
                    btn_Salir.Enabled = true;
                    btn_CancelarEncuentro.Visible = false;
                }
                else
                {
                    btn_Unirse.Enabled = true;
                    btn_Salir.Enabled = false;
                    btn_CancelarEncuentro.Visible = false;
                }
            }


        }
        private bool validarOrganizador()
        {
            bool flag = false;

            int idUsuarioEncuentro = int.Parse(Session["ID"].ToString());
            int idUsuarioActual = int.Parse(Session["IdOrganizadorEncuentro"].ToString());

            if (idUsuarioActual == idUsuarioEncuentro)
            { flag = true; }
            return flag;

        }

        private bool validarJugadorUnido()
        {

            bool estaUnido = false;

            List<Usuario> listaUsuariosUnidos = UsuarioDao.UsuariosUnidosEncuentroPublico(int.Parse(Session["idEncuentro"].ToString()));

            foreach (Usuario u in listaUsuariosUnidos)
            {

                if (u.id == int.Parse(Session["ID"].ToString()))
                {
                    return estaUnido = true;
                }
            }
            return estaUnido;

        }

        private void bloquearControles()
        {

            cld_Fecha.Enabled = false;
            txt_HoraInicio.Enabled = false;
            txt_HoraFin.Enabled = false;
            txt_NombreLugar.Enabled = false;
            txt_Direccion.Enabled = false;
            txt_Organizador.Enabled = false;

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
            txt_Mensaje.Focus();
        }

        private void cargarChat()
        {

            // gdv_Pantalla.DataSource = MensajeQueryDao.MostrarMensajes(int.Parse(Session["idEncuentro"].ToString()), int.Parse(Session["ID"].ToString()) );
            gdv_Pantalla.DataSource = MensajeQueryDao.MostrarMensajes(int.Parse(Session["idEncuentro"].ToString()));
            gdv_Pantalla.DataKeyNames = new string[] { "idMensaje" };
            gdv_Pantalla.DataBind();
        }



        protected void Timer1_Tick(object sender, EventArgs e)
        {
            if (Session["idEncuentro"] != null)
            {
                cargarChat();

                cargarTabla();
                calcularCapacidad();
            }
            
        }

        protected void chk_Invitar_CheckedChanged(object sender, EventArgs e)
        {

        }


        private void cargarListaInvitar() {

            gdv_Invitar.DataSource = UsuarioDao.obtenerUsuarios(int.Parse(Session["ID"].ToString()));
            gdv_Invitar.DataKeyNames = new string[] { "id" };
            gdv_Invitar.DataBind();
        }

        // BUSCAR JUGADORES 
        protected void btn_EnviarInvitacion_Click(object sender, EventArgs e)
        {
            // MODAL BTN INVITAR

            // List<Usuario> lista = UsuarioDao.obtenerUsuarios(int.Parse(Session["ID"].ToString())); //(v. Original)

            List<Usuario> listaUsuarios = null;

            if (rdb_PorAmigos.Checked)
            {
                listaUsuarios = UsuarioDao.getAmigos(int.Parse(Session["ID"].ToString()));
            }
            if (rdb_MasOpciones.Checked)
            {
                int sport = 0;
                int.TryParse(cmb_Deporte.SelectedItem.Value, out sport);
                int zona = 0;
                int.TryParse(cmb_Zona.SelectedItem.Value, out zona);
                int barrio = 0;
                int.TryParse(cmb_Barrio.SelectedItem.Value, out barrio);

                listaUsuarios = UsuarioDao.getUsuariosPorFiltro(sport, zona, barrio);
            }

            var lista = listaUsuarios.OrderBy(u => u.nombre);

            int[] idUsuarios = new int[listaUsuarios.Count];
            //int[] idUsuarios = new int[lista.Count]; //(v. Original)
            int i = 0;
            foreach (Usuario u in lista)
            {
                idUsuarios[i] = u.id;
                i++;
            }

            i = 0;
            foreach (GridViewRow fila in gdv_Invitar.Rows)
            {
                Notificacion notificacion = null;
                if ((fila.Cells[0].FindControl("chk_Invitar") as CheckBox).Checked)
                {
                    notificacion = new Notificacion();
                    notificacion.idEmisor = int.Parse(Session["ID"].ToString());
                    notificacion.nombreEmisor = Session["Usuario"].ToString();
                    notificacion.idReceptor = idUsuarios[i];
                    notificacion.nombreReceptor = fila.Cells[2].Text;
                    notificacion.idEncuentro = int.Parse(Session["idEncuentro"].ToString());
                    notificacion.texto = lbl_Deporte.Text + " - " + cld_Fecha.Text + " - " +
                                         txt_HoraInicio.Text + " hs ";
                    
                    notificacion.idEstado = 10; //(No Check)
                    NotificacionDao.insertarNotificacion(notificacion);
                }
                i++;
            }

            limpiarListaInvitar();

            lbl_ResultadosBusqueda.Text = "La/s invitación/es ha/n sido enviada/s";

        }

        private void limpiarListaInvitar()
        {
            foreach (GridViewRow fila in gdv_Invitar.Rows)
            {
                if ((fila.Cells[0].FindControl("chk_Invitar") as CheckBox).Checked)
                {
                    (fila.Cells[0].FindControl("chk_Invitar") as CheckBox).Checked = false;
                }
            }
        }

        protected void btn_Solicitud_Click(object sender, EventArgs e)
        {
            // MODAL BTN SOLICITUD MAS OPCIONES
            List<Usuario> listaUsuarios = null;

            if (rdb_PorAmigos.Checked)
            {
                listaUsuarios = UsuarioDao.getAmigos(int.Parse(Session["ID"].ToString()));
            }
            if (rdb_MasOpciones.Checked)
            {
                int sport = 0;
                int.TryParse(cmb_Deporte.SelectedItem.Value, out sport);
                int zona = 0;
                int.TryParse(cmb_Zona.SelectedItem.Value, out zona);
                int barrio = 0;
                int.TryParse(cmb_Barrio.SelectedItem.Value, out barrio);

                listaUsuarios = UsuarioDao.getUsuariosPorFiltro(sport, zona, barrio);
            }

            var lista = listaUsuarios.OrderBy(u => u.nombre);

            int[] idUsuarios = new int[listaUsuarios.Count];
            //int[] idUsuarios = new int[lista.Count]; //(v. Original)
            int i = 0;
            foreach (Usuario u in lista)
            {
                idUsuarios[i] = u.id;
                i++;
            }

            i = 0;
            foreach (GridViewRow fila in gdv_Invitar.Rows)
            {
                Notificacion notificacion = null;
                if ((fila.Cells[0].FindControl("chk_Invitar") as CheckBox).Checked)
                {
                    notificacion = new Notificacion();
                    notificacion.idEmisor = int.Parse(Session["ID"].ToString());
                    notificacion.nombreEmisor = Session["Usuario"].ToString();
                    notificacion.idReceptor = idUsuarios[i];
                    notificacion.nombreReceptor = fila.Cells[2].Text;
                    notificacion.idEncuentro = 0;
                    notificacion.texto = "Nuevo Contacto";
                    notificacion.idEstado = 10; //(No Check)
                    NotificacionDao.insertarNotificacion(notificacion);
                }
                i++;
            }

            limpiarListaInvitar();


            lbl_ResultadosBusqueda.Text = "La/s solicitud/es ha/n sido enviada/s";
        }



        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            gdv_Invitar.Visible = true;
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

        private void cargarBarrios()
        {
            cmb_Barrio.Items.Clear();
            cmb_Barrio.Items.Insert(0, new ListItem("Sin Seleccionar", ""));

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

        private void cargarPorJugadores()
        {

            List<Usuario> listaUsuarios = crearListaJugadores();
            var lista = listaUsuarios.OrderBy(u => u.nombre);

            cmb_Jugadores.Items.Clear();
            cmb_Jugadores.Items.Insert(0, new ListItem("Sin Seleccionar", ""));

            cmb_Jugadores.DataSource = lista;
            cmb_Jugadores.DataValueField = "id";
            cmb_Jugadores.DataTextField = "nombre";
            cmb_Jugadores.DataBind();
        }

        private List<Usuario> crearListaJugadores()
        {

            List<Usuario> listaUsuarios = UsuarioDao.obtenerUsuarios(int.Parse(Session["ID"].ToString())); ;
            List<Usuario> listaAmigos = UsuarioDao.getAmigos(int.Parse(Session["ID"].ToString())); ;
            List<Usuario> listaJugadores = listaUsuarios;

            for (int i = 0; i < listaUsuarios.Count; i++)
            {
                for (int j = 0; j < listaAmigos.Count; j++)
                {
                    if (listaUsuarios[i].id == listaAmigos[j].id)
                    {
                        listaJugadores.Remove(listaUsuarios[i]);
                    }
                }
            }
            return listaJugadores;
        }

        //protected void rdb_PorDeporte_CheckedChanged(object sender, EventArgs e)
        //{
        //    //if (rdb_PorDeporte.Checked)
        //    //{
        //    //    //cmb_Deporte.Enabled = true;
        //    //    pnl_Lugar.Visible = true;

        //    //}
        //    //else {
        //    //cmb_Deporte.Enabled = false;
        //    // cmb_Deporte.SelectedIndex = 0;

        //    //rdb_PorBarrio.Checked = false;
        //    //cmb_Barrio.Enabled = false;
        //    //cmb_Barrio.SelectedIndex = 0;

        //    //rdb_PorZona.Checked = false;
        //    //cmb_Zona.Enabled = false;
        //    //cmb_Zona.SelectedIndex = 0;

        //    //pnl_Lugar.Visible = false;

        //    //  }
        //}

        protected void rdb_PorZona_CheckedChanged(object sender, EventArgs e)
        {
            if (rdb_PorZona.Checked)
            {
                rdb_PorBarrio.Checked = false;
                cmb_Zona.Enabled = true;
                cmb_Zona.SelectedIndex = 0;
                cmb_Barrio.Enabled = false;
                cmb_Barrio.SelectedIndex = 0;

                // btn_Buscar.Visible = true;
            }
            else
            {
                rdb_PorBarrio.Checked = false;
                cmb_Zona.Enabled = false;
                cmb_Zona.SelectedIndex = 0;
                cmb_Barrio.Enabled = false;
                cmb_Barrio.SelectedIndex = 0;

                btn_Buscar.Visible = false;
            }
        }
        protected void rdb_PorBarrio_CheckedChanged(object sender, EventArgs e)
        {
            if (rdb_PorBarrio.Checked)
            {
                rdb_PorZona.Checked = false;
                cmb_Zona.Enabled = false;
                cmb_Zona.SelectedIndex = 0;
                cmb_Barrio.Enabled = true;
                cmb_Barrio.SelectedIndex = 0;

                // btn_Buscar.Visible = true;
            }
            else
            {
                rdb_PorZona.Checked = false;
                cmb_Zona.Enabled = false;
                cmb_Zona.SelectedIndex = 0;
                cmb_Barrio.Enabled = false;
                cmb_Barrio.SelectedIndex = 0;

                btn_Buscar.Visible = false;
            }
        }
        protected void cmb_Jugadores_SelectedIndexChanged(object sender, EventArgs e)
        {
            btn_CancelarBusqueda.Visible = true;
            btn_InvitarJugador.Visible = true;
            btn_SolicitudJugador.Visible = true;

            btn_CancelarBusqueda.Enabled = true;
            btn_InvitarJugador.Enabled = true;
            btn_SolicitudJugador.Enabled = true;
        }


        protected void btn_CancelarBusqueda_Click(object sender, EventArgs e)
        {
            cmb_Jugadores.SelectedIndex = 0;
            btn_CancelarBusqueda.Visible = false;
            btn_InvitarJugador.Visible = false;
            btn_SolicitudJugador.Visible = false;

            btn_CancelarBusqueda.Enabled = true;
            btn_InvitarJugador.Enabled = false;
            btn_SolicitudJugador.Enabled = false;
        }

        protected void btn_InvitarJugador_Click(object sender, EventArgs e)
        {
            int jugador = 0;
            int.TryParse(cmb_Jugadores.SelectedItem.Value, out jugador);

            Notificacion notificacion = new Notificacion();
            notificacion.idEmisor = int.Parse(Session["ID"].ToString());
            notificacion.nombreEmisor = Session["Usuario"].ToString();
            notificacion.idReceptor = jugador;
            notificacion.nombreReceptor = cmb_Jugadores.SelectedItem.Text;
            notificacion.idEncuentro = int.Parse(Session["idEncuentro"].ToString());
            notificacion.texto = lbl_Deporte.Text + " - " + cld_Fecha.Text + " - " +
                                 txt_HoraInicio.Text + " hs " ;            

            notificacion.idEstado = 10; //(No Check)
            NotificacionDao.insertarNotificacion(notificacion);

            lbl_ResultadosBusqueda.Text = "La invitación ha sido enviada"; lbl_ResultadosBusqueda.Text = "La/s invitación/es ha/n sido enviada/s";

        }

        protected void btn_SolicitudJugador_Click(object sender, EventArgs e)
        {
            // SOLICITUD POR JUGADOR

            int jugador = 0;
            int.TryParse(cmb_Jugadores.SelectedItem.Value, out jugador);

            Notificacion notificacion = new Notificacion();
            notificacion.idEmisor = int.Parse(Session["ID"].ToString());
            notificacion.nombreEmisor = Session["Usuario"].ToString();
            notificacion.idReceptor = jugador;
            notificacion.nombreReceptor = cmb_Jugadores.SelectedItem.Text;
            notificacion.idEncuentro = 0; // 0 = Solicitud

            notificacion.texto = "Nuevo Contacto";


            notificacion.idEstado = 10; //(No Check)
            NotificacionDao.insertarNotificacion(notificacion);

            lbl_ResultadosBusqueda.Text = "La solicitud ha sido enviada";

        }


        private void limpiarCamposBusqueda()
        {

            //txt_NombreJugador.Text = string.Empty;
            cmb_Jugadores.SelectedIndex = 0;
            cmb_Jugadores.Enabled = false;
            // cmb_Deporte.SelectedIndex = 0;
            // cmb_Deporte.Enabled = false;
            cmb_Zona.SelectedIndex = 0;
            cmb_Zona.Enabled = false;
            cmb_Barrio.SelectedIndex = 0;
            cmb_Barrio.Enabled = false;

            rdb_PorZona.Checked = false;
            rdb_PorBarrio.Checked = false;

            cmb_Jugadores.SelectedIndex = 0;
            btn_CancelarBusqueda.Visible = false;
            btn_InvitarJugador.Visible = false;
            btn_SolicitudJugador.Visible = false;

        }



        private void cargarListaAmigos()
        {

            List<Usuario> listaUsuarios = UsuarioDao.getAmigos(int.Parse(Session["ID"].ToString()));
            var lista = listaUsuarios.OrderBy(u => u.nombre);

            //gdv_Invitar.DataSource = UsuarioDao.obtenerUsuarios(int.Parse(Session["ID"].ToString()));
            gdv_Invitar.DataSource = lista;
            gdv_Invitar.DataKeyNames = new string[] { "id" };
            gdv_Invitar.DataBind();
        }

        protected void rdb_PorAmigos_CheckedChanged(object sender, EventArgs e)
        {
            limpiarCamposBusqueda();
            cargarListaAmigos();
            pnl_Opciones.Visible = false;
            pnl_PorJugador.Visible = false;
            btn_Buscar.Visible = true;
            btn_Solicitud.Visible = false;
        }
        protected void rdb_PorNombre_CheckedChanged(object sender, EventArgs e)
        {
            pnl_PorJugador.Visible = true;
            pnl_Opciones.Visible = false;

            cargarPorJugadores();
            cmb_Jugadores.Enabled = true;

            btn_Buscar.Visible = false;
            btn_Solicitud.Visible = false;

            btn_CancelarBusqueda.Enabled = false;
            btn_InvitarJugador.Enabled = false;
            btn_SolicitudJugador.Enabled = false;
        }
        protected void rdb_MasOpciones_CheckedChanged(object sender, EventArgs e)
        {
            pnl_Opciones.Visible = true;
            pnl_PorJugador.Visible = false;
            limpiarCamposBusqueda();
            btn_Buscar.Visible = false;
            btn_Solicitud.Visible = true;

            cargarZonas();
            cargarBarrios();
            cargarDeportes();

            //pnl_Lugar.Visible = true;

        }
        protected void cmb_Deporte_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnl_Lugar.Visible = true;
            cargarListaPorLugar("Deporte");
            btn_Buscar.Visible = true;
        }
        protected void cmb_Zona_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarListaPorLugar("Zona");
            btn_Buscar.Visible = true;

        }

        protected void cmb_Barrio_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarListaPorLugar("Barrio");
            btn_Buscar.Visible = true;
        }

        private void cargarListaPorLugar(string lugar)
        {
            List<Usuario> listaUsuarios = null;
            int zona = 0;
            int barrio = 0;
            int sport = 0;
            if (lugar.Equals("Deporte"))
            {
                int.TryParse(cmb_Deporte.SelectedItem.Value, out sport);
                listaUsuarios = UsuarioDao.getUsuariosPorFiltro(sport, zona, barrio);

            }
            if (lugar.Equals("Zona"))
            {
                int.TryParse(cmb_Zona.SelectedItem.Value, out zona);
                listaUsuarios = UsuarioDao.getUsuariosPorFiltro(sport, zona, barrio);
            }
            else
            {
                int.TryParse(cmb_Barrio.SelectedItem.Value, out barrio);
                listaUsuarios = UsuarioDao.getUsuariosPorFiltro(sport, zona, barrio);
            }
            var lista = listaUsuarios.OrderBy(u => u.nombre);

            gdv_Invitar.DataSource = lista;
            gdv_Invitar.DataKeyNames = new string[] { "id" };
            gdv_Invitar.DataBind();
        }

        // FIN BUSCAR JUGADORES
    }
}
