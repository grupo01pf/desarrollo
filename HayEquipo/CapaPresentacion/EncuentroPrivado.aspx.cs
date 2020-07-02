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
    public partial class EncuentroPrivado : System.Web.UI.Page
    {
        private bool flag ;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack) {

                cargarEquipoA();
                cargarEquipoB();

                cargarDatosEncuentroPrivado();

                cargarChat();
                cargarListaInvitar();

                if (int.Parse(Session["idClave"].ToString()) == 0)
                {
                    pnl_MostrarContenido.Visible = true;
                    pnl_Password.Visible = false;
                }
                else {
                    pnl_MostrarContenido.Visible = false;
                    pnl_Password.Visible = true;
                }

            }

            txt_Latitud.Enabled = false;
            txt_Longitud.Enabled = false;
        }

    

        private void cargarEquipoA()
        {
            gdv_Equipo_A.DataSource = UsuarioDao.UsuariosUnidosEncuentroEquipoA(int.Parse(Session["idEncuentro"].ToString()));
            gdv_Equipo_A.DataKeyNames = new string[] { "nombre" };
            gdv_Equipo_A.DataBind();
        }
        private void cargarEquipoB()
        {
            gdv_Equipo_B.DataSource = UsuarioDao.UsuariosUnidosEncuentroEquipoB(int.Parse(Session["idEncuentro"].ToString()));
            gdv_Equipo_B.DataKeyNames = new string[] { "nombre" };
            gdv_Equipo_B.DataBind();
        }


        public void cargarDatosEncuentroPrivado()
        {

            EncuentroDeportivoQueryEntidad edq = new EncuentroDeportivoQueryEntidad();

            int idEncuentro = int.Parse(Session["idEncuentro"].ToString());

            edq = EncuentroDeportivioQueryDao.datosEncuentroPrivado(idEncuentro);

            Session["IdOrganizadorEncuentro"] = edq.idUsuario;

            cargarModalComplejo(edq.idComplejo);
            cargarMapa(edq.idComplejo);

            lbl_Deporte.Text = edq.nombreDeporte;

            lbl_Complejo.Text = edq.nombreComplejo;
            lbl_ComplejoTitulo.Text = edq.nombreComplejo;

            cld_Fecha.Text = edq.fechaInicioEncuentro.ToShortDateString();

            txt_HoraInicio.Text = edq.horaInicio.ToShortTimeString();
            //txt_HoraFin.Text = edq.horaFinHorario.ToShortTimeString();

            Session["idClave"] = edq.idClave;

            txt_calle.Text = edq.calleComplejo;
            txt_nroCalle.Text = edq.numeroCalleComplejo.ToString();
            txt_Telefono.Text = edq.numeroTelefono.ToString();

            Session["CapacidadMaxima"] = edq.capacidad;

            lbl_CantidadTotal.Text = ": " + calcularCapacidadTotal(calcularCapacidadEquipoA(), calcularCapacidadEquipoB()).ToString();
            lbl_CantidadEquipoA.Text = "(" + calcularCapacidadEquipoA() + "/" + (edq.capacidad / 2) + ")";
            lbl_CantidadEquipoB.Text = "(" + calcularCapacidadEquipoB() + "/" + (edq.capacidad / 2) + ")";



            txt_Organizador.Text = edq.nombreUsuario.ToString();

           // bloquearBotones();

            validacionesDeUsuario();


        }

        private void cargarMapa(int idComplejoDeportivo){

            ComplejoDeportivo cd = ComplejoDeportivoDao.ObtenerComplejosPorID(idComplejoDeportivo);

            int id = cd.mapa.Value;
            Mapa mapa = MapaDao.obtenerMapaByID(id);
            txt_Latitud.Text = mapa.latitud;
            txt_Longitud.Text = mapa.longitud;
        }
 
        private void validacionesDeUsuario()
        {
            if (validarOrganizador())
            {
                // organizador
                if (validarExistenciaEnEquipoA()) {
                    btn_UnirseEquipoA.Enabled = false;
                    btn_UnirseEquipoB.Enabled = true;
                    btn_Salir.Enabled = false;
                    btn_CancelarEncuentro.Visible = true;
                    ////btn_CerrarEncuentro.Visible = true;
                    ////btn_AbrirEncuentro.Visible = false;
                }
                else if(validarExistenciaEnEquipoB()){

                    btn_UnirseEquipoA.Enabled = true;
                    btn_UnirseEquipoB.Enabled = false;
                    btn_Salir.Enabled = false;
                    btn_CancelarEncuentro.Visible = true;
                }

            }
            else
            {
                if (validarExistenciaEnEquipoA())
                {
                    // usuario equipo a
                    btn_UnirseEquipoA.Enabled = false;
                    btn_UnirseEquipoB.Enabled = true;
                    btn_Salir.Enabled = true;
                    btn_CancelarEncuentro.Visible = false;
                }

                else
                {
                    if (validarExistenciaEnEquipoB())
                    {
                        // equipo B
                        btn_UnirseEquipoA.Enabled = true;
                        btn_UnirseEquipoB.Enabled = false;
                        btn_Salir.Enabled = true;
                        btn_CancelarEncuentro.Visible = false;
                    }
                    else
                    {
                        // usuario no unido
                        btn_UnirseEquipoA.Enabled = true;
                        btn_UnirseEquipoB.Enabled = true;
                        btn_Salir.Enabled = false;
                        btn_CancelarEncuentro.Visible = false;

                    }
                }
            }
        }




        private int calcularCapacidadEquipoA()
        {
            int equipoA = 0;

            equipoA = gdv_Equipo_A.Rows.Count;
            if (equipoA >= (int.Parse(Session["CapacidadMaxima"].ToString())) / 2)
            {

                btn_UnirseEquipoA.Visible = false;
            }
            else {
                btn_UnirseEquipoA.Visible = true;
            }

                return equipoA;
        }

        private int calcularCapacidadEquipoB()
        {
            int equipoB = 0;

            equipoB = gdv_Equipo_B.Rows.Count;
            if (equipoB >= (int.Parse(Session["CapacidadMaxima"].ToString())) / 2)
            {

                btn_UnirseEquipoB.Visible = false;
            }
            else
            {
                btn_UnirseEquipoB.Visible = true;
            }
            return equipoB;

        }

        private int calcularCapacidadTotal(int equipoA, int equipoB)
        {
            int total = 0;

            total = equipoA + equipoB;

            if (total == int.Parse(Session["CapacidadMaxima"].ToString())) {
                int estado = 8; // (COMPLETO)
                EncuentroDeportivoDao.actualizarEncuentroDeportivo(int.Parse(Session["idEncuentro"].ToString()), estado);

            }
            return total;
        }


        protected void UnirseEquipoA_Click(object sender, EventArgs e)
        {
            if (validarExistenciaEnEquipoB())
            {
                EncuentroDeportivoDao.SalirDelEncuentroEquipoB(int.Parse(Session["ID"].ToString()), int.Parse(Session["idEncuentro"].ToString()));
            }
            EncuentroDeportivoDao.insertarUsuarioPorEncuentroEquipoA(int.Parse(Session["ID"].ToString()), int.Parse(Session["idEncuentro"].ToString()));
            cargarEquipoA();
            cargarEquipoB();
            btn_UnirseEquipoA.Enabled = false;
            btn_UnirseEquipoA.Visible = false;
            btn_UnirseEquipoB.Enabled = true;
            btn_UnirseEquipoB.Visible = true;
            btn_Salir.Enabled = true;
            btn_Salir.Visible = true;
        }
        protected void btn_UnirseEquipoB_Click(object sender, EventArgs e)
        {
            if (validarExistenciaEnEquipoA())
            {
                EncuentroDeportivoDao.SalirDelEncuentroEquipoA(int.Parse(Session["ID"].ToString()), int.Parse(Session["idEncuentro"].ToString()));
            }
            EncuentroDeportivoDao.insertarUsuarioPorEncuentroEquipoB(int.Parse(Session["ID"].ToString()), int.Parse(Session["idEncuentro"].ToString()));
            cargarEquipoA();
            cargarEquipoB();
            btn_UnirseEquipoA.Enabled = true;
            btn_UnirseEquipoA.Visible = true;
            btn_UnirseEquipoB.Visible = false;
            btn_UnirseEquipoB.Enabled = false;
            btn_Salir.Enabled = true;
            btn_Salir.Visible = true;

        }

        private bool validarExistenciaEnEquipoA()
        {

            bool flag = false;
            List<Usuario> EquipoA = new List<Usuario>();
            EquipoA = UsuarioDao.UsuariosUnidosEncuentroEquipoA(int.Parse(Session["idEncuentro"].ToString()));
            foreach (Usuario u in EquipoA)
            {
                if (u.id == int.Parse(Session["ID"].ToString()))
                {
                    flag = true;
                }
            }
            return flag;
        }
        private bool validarExistenciaEnEquipoB()
        {

            bool flag = false;
            List<Usuario> EquipoB = new List<Usuario>();
            EquipoB = UsuarioDao.UsuariosUnidosEncuentroEquipoB(int.Parse(Session["idEncuentro"].ToString()));
            foreach (Usuario u in EquipoB)
            {
                if (u.id == int.Parse(Session["ID"].ToString()))
                {
                    flag = true;
                }
            }
            return flag;
        }


        private bool validarOrganizador()
        {
            bool flag = false;

            int idUsuarioLogueado = int.Parse(Session["ID"].ToString());
            int idUsuarioEncuentro = int.Parse(Session["IdOrganizadorEncuentro"].ToString());

            if (idUsuarioLogueado == idUsuarioEncuentro)
            { flag = true; }
            return flag;

        }
        
        protected void btn_Salir_Click(object sender, EventArgs e)
        {
            EncuentroDeportivoDao.SalirDelEncuentroEquipoA(int.Parse(Session["ID"].ToString()), int.Parse(Session["idEncuentro"].ToString()));
            EncuentroDeportivoDao.SalirDelEncuentroEquipoB(int.Parse(Session["ID"].ToString()), int.Parse(Session["idEncuentro"].ToString()));
            cargarEquipoA();
            cargarEquipoB();
            // calcularCapacidad();
            btn_UnirseEquipoA.Visible = true;
            btn_UnirseEquipoA.Enabled = true;
            btn_UnirseEquipoB.Visible = true;
            btn_UnirseEquipoB.Enabled = true;
            btn_Salir.Enabled = false;
        }


        protected void btn_CancelarEncuentro_Click(object sender, EventArgs e)
        {
            int estado = 6; // (CANCELADO)

            ReservaDao.acutalizarReserva(int.Parse(Session["idEncuentro"].ToString()), estado);
            EncuentroDeportivoDao.actualizarEncuentroDeportivo(int.Parse(Session["idEncuentro"].ToString()), estado);


            // Enviar notificacion

            List<Usuario> lista = UsuarioDao.UsuariosUnidosEncuentroEquipoA(int.Parse(Session["idEncuentro"].ToString()));
            lista.AddRange(UsuarioDao.UsuariosUnidosEncuentroEquipoB(int.Parse(Session["idEncuentro"].ToString())));


            foreach (Usuario u in lista)
            {
                Notificacion notificacion = null;
                    notificacion = new Notificacion();
                    notificacion.idEmisor = int.Parse(Session["ID"].ToString());
                    // notificacion.idReceptor = Convert.ToInt32(fila.Cells[1].Text); //NO BORRAR
                    notificacion.idReceptor = u.id;
                    notificacion.nombreReceptor = Session["Usuario"].ToString();
                    notificacion.idEncuentro = int.Parse(Session["idEncuentro"].ToString());
                    notificacion.texto = "El encuentro deportivo ha sido Cancelado";
                    notificacion.idEstado = 10;

                    NotificacionDao.insertarNotificacion(notificacion);

                }

            Response.Redirect("Home.aspx");


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

                cargarEquipoA();
                cargarEquipoB();
            }
        }
        
        private void cargarListaInvitar()
        {
            gdv_Invitar.DataSource = UsuarioDao.obtenerUsuarios(int.Parse(Session["ID"].ToString()));
            gdv_Invitar.DataKeyNames = new string[] { "id" };
            gdv_Invitar.DataBind();
        }

        protected void btn_EnviarInvitacion_Click(object sender, EventArgs e) {

            List<Usuario> lista = UsuarioDao.obtenerUsuarios(int.Parse(Session["ID"].ToString()));
            int[] idUsuarios = new int[lista.Count];
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
                //   bool isChecked = ((CheckBox)fila.FindControl("chk_Invitar")).Checked;
                if ((fila.Cells[0].FindControl("chk_Invitar") as CheckBox).Checked)
                 //   if (isChecked)
                    {
                    notificacion = new Notificacion();
                    notificacion.idEmisor = int.Parse(Session["ID"].ToString());
                   // notificacion.idReceptor = Convert.ToInt32(fila.Cells[1].Text); //NO BORRAR
                    notificacion.idReceptor = idUsuarios[i];
                    notificacion.nombreReceptor = fila.Cells[2].Text;
                    notificacion.idEncuentro = int.Parse(Session["idEncuentro"].ToString());
                    notificacion.texto = "Has sido invitado a participar de un encuentro deportivo";
                    notificacion.idEstado = 10; //(No Check)
                    NotificacionDao.insertarNotificacion(notificacion);
                }
                i++;
            }

        }

        protected void chk_Invitar_CheckedChanged(object sender, EventArgs e)
        {

        }    

        private void cargarModalComplejo(int idComplejo) {

            ComplejoDeportivo compSelec = ComplejoDeportivoDao.ObtenerComplejosPorID(idComplejo);

            lblValoracion.Text = "Valoración: " + compSelec.promedioEstrellas.ToString();
            lblDeportes.Text = compSelec.deportes;
            lblDescripcion.Text = compSelec.descripcion;
            listServicios.Items.Clear();
            lblServicios.Text = "Servicios: ";
            if (ServicioExtraDao.ExistenServiciosPorComplejo(compSelec.id) > 0)
            {
                CargarListServicios(compSelec.id);
            }
            else
            {
                lblServicios.Text = "Servicios: - ";
                divListServ.Visible = false;
            }
            lblDireccion.Text = "Dirección: " + compSelec.calle + " " + compSelec.nroCalle.ToString();
            Barrio bar = BarrioDao.ObtenerBarriosPorID(int.Parse(compSelec.idBarrio.ToString()));
            lblBarrio.Text = "Barrio: " + bar.nombre;
            lblZona.Text = "Zona: " + ZonaDao.ObtenerZonasPorID(int.Parse(bar.idZona.ToString())).nombre;
            lblTelefono.Text = "Teléfono: " + compSelec.nroTelefono.ToString();
            if (compSelec.horaApertura != null && compSelec.horaCierre != null)
            {
                TimeSpan hA = (TimeSpan)Convert.ChangeType(compSelec.horaApertura, typeof(TimeSpan));
                TimeSpan hC = (TimeSpan)Convert.ChangeType(compSelec.horaCierre, typeof(TimeSpan));
                lblHorarios.Text = "Horarios: " + hA.ToString(@"hh\:mm") + " a " + hC.ToString(@"hh\:mm");
            }
            else
            {
                lblHorarios.Text = "Horarios: - ";
            }

            if (ComplejoDeportivoDao.existeAvatar(idComplejo.ToString()) != false)
            {
                byte[] avtr = ComplejoDeportivoDao.ObtenerAvatar(idComplejo.ToString());
                string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(avtr);
                imgAvatar.ImageUrl = ImagenDataURL64;
            }
            else
            {
                imgAvatar.ImageUrl = "~/Imagenes/complejo_logo_default.png";
            }

            if (ComplejoDeportivoDao.existeImagen(idComplejo.ToString(), 1) != false)
            {
                byte[] Img1 = ComplejoDeportivoDao.ObtenerImagen(idComplejo.ToString(), 1);
                string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(Img1);
                img1.Src = ImagenDataURL64;
            }
            else
            {
                img1.Src = "~/Imagenes/complejo_logo_default.png";
            }
            if (ComplejoDeportivoDao.existeImagen(idComplejo.ToString(), 2) != false)
            {
                byte[] Img2 = ComplejoDeportivoDao.ObtenerImagen(idComplejo.ToString(), 2);
                string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(Img2);
                img2.Src = ImagenDataURL64;
            }
            else
            {
                img2.Src = "~/Imagenes/complejo_logo_default.png";
            }
            if (ComplejoDeportivoDao.existeImagen(idComplejo.ToString(), 3) != false)
            {
                byte[] Img3 = ComplejoDeportivoDao.ObtenerImagen(idComplejo.ToString(), 3);
                string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(Img3);
                img3.Src = ImagenDataURL64;
            }
            else
            {
                img3.Src = "~/Imagenes/complejo_logo_default.png";
            }
        }

        private void CargarListServicios(int idComp)
        {
            //listServicios.Items.Clear();
            //listServicios.Items.Insert(0, new ListItem("Sin Seleccionar", ""));

            listServicios.DataSource = ServicioExtraDao.ObtenerServiciosPorComp(idComp);
            listServicios.DataValueField = "id";
            listServicios.DataTextField = "nombre";
            listServicios.DataBind();
        }


        protected void btn_Entrar_Click(object sender, EventArgs e)
        {
            string pass = txt_Password.Text;
            string clave = CriptografiaDao.desencriptar(int.Parse(Session["idClave"].ToString()));
            // buscar idEncuentro e idPass
            if (string.Equals(pass,clave))
            {
                pnl_MostrarContenido.Visible = true;
                pnl_Password.Visible = false;
            }
            else {
                pnl_MostrarContenido.Visible = false;
                pnl_Password.Visible = true;
            }

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

        protected void rdb_PorZona_CheckedChanged(object sender, EventArgs e)
        {
            if (rdb_PorZona.Checked)
            {
                rdb_PorBarrio.Checked = false;
                cmb_Zona.Enabled = true;
                cmb_Zona.SelectedIndex = 0;
                cmb_Barrio.Enabled = false;
                cmb_Barrio.SelectedIndex = 0;
            }
            else
            {
                rdb_PorBarrio.Checked = false;
                cmb_Zona.Enabled = false;
                cmb_Zona.SelectedIndex = 0;
                cmb_Barrio.Enabled = false;
                cmb_Barrio.SelectedIndex = 0;
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
            }
            else
            {
                rdb_PorZona.Checked = false;
                cmb_Zona.Enabled = false;
                cmb_Zona.SelectedIndex = 0;
                cmb_Barrio.Enabled = false;
                cmb_Barrio.SelectedIndex = 0;
            }
        }

        protected void cmb_Deporte_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        protected void cmb_Zona_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void cmb_Barrio_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }
        

        private void limpiarCamposBusqueda() {

            txt_NombreJugador.Text = string.Empty;
            cmb_Deporte.SelectedIndex = 0;
            cmb_Zona.SelectedIndex = 0;
            cmb_Barrio.SelectedIndex = 0;
            rdb_PorZona.Checked = false;
            rdb_PorBarrio.Checked = false;

            cmb_Zona.Enabled = false;
            cmb_Barrio.Enabled = false;
        }

        protected void chk_BuscarJugadores_CheckedChanged(object sender, EventArgs e)
        {

            if (chk_BuscarJugadores.Checked)
            {
                limpiarCamposBusqueda();
                pnl_Busqueda.Visible = true;
                pnl_Opciones.Visible = false;
                btn_Buscar.Visible = false;
            }
            else
            {
                limpiarCamposBusqueda();
                pnl_Busqueda.Visible = false;
                pnl_Opciones.Visible = false;
                btn_Buscar.Visible = false;
            }
        }

        protected void rdb_PorAmigos_CheckedChanged(object sender, EventArgs e)
        {
            
            if (rdb_PorAmigos.Checked)
            {
                limpiarCamposBusqueda();
                cargarListaInvitar();
                pnl_Opciones.Visible = false;
                btn_Buscar.Visible = true;
                btn_Solicitud.Visible = false;
            }
            else
            {
                pnl_Opciones.Visible = true;
                limpiarCamposBusqueda();
                btn_Buscar.Visible = true;
                btn_Solicitud.Visible = true;
            }
        }

        protected void rdb_MasOpciones_CheckedChanged(object sender, EventArgs e)
        {
            if (rdb_MasOpciones.Checked)
            {
                pnl_Opciones.Visible = true;
                limpiarCamposBusqueda();
                btn_Buscar.Visible = true;
                btn_Solicitud.Visible = true;
            }
            else {
                limpiarCamposBusqueda();
                cargarListaInvitar();
                pnl_Opciones.Visible = false;
                btn_Buscar.Visible = true;
                btn_Solicitud.Visible = false;
            }
        }

        protected void btn_Solicitud_Click(object sender, EventArgs e)
        {

        }
    }
}
