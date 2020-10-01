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
        //private bool flag;

        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                cargarEquipoA();
                cargarEquipoB();


                cargarDatosEncuentroPrivado();

                cargarChat();

                if (string.Equals(Session["Estado"].ToString(),"Finalizado") || estadoencuentro.Text == "Cancelado")
                {
                    encuentrFinalizadoDesactivarBotones();
                    pnl_MostrarContenido.Visible = true;
                    pnl_Password.Visible = false;
                }
                else
                {
                    if (int.Parse(Session["idClave"].ToString()) == 0)
                    {
                        pnl_MostrarContenido.Visible = true;
                        pnl_Password.Visible = false;
                    }
                    else
                    {
                        pnl_MostrarContenido.Visible = false;
                        pnl_Password.Visible = true;
                    }
                }               

            }

            txt_Latitud.Enabled = false;
            txt_Longitud.Enabled = false;
            cargarValoracion();

            calcularCapacidadEquipoA();
            calcularCapacidadEquipoB();            
            capacidad();
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

            Session["Estado"] = edq.nombreEstado;

            txt_calle.Text = edq.calleComplejo;
            txt_nroCalle.Text = edq.numeroCalleComplejo.ToString();
            txt_Telefono.Text = edq.numeroTelefono.ToString();

            Session["CapacidadMaxima"] = edq.capacidad;

            //lbl_CantidadTotal.Text = ": " + calcularCapacidadTotal(calcularCapacidadEquipoA(), calcularCapacidadEquipoB()).ToString();
            //lbl_CantidadEquipoA.Text = "(" + calcularCapacidadEquipoA() + "/" + (edq.capacidad / 2) + ")";
            //lbl_CantidadEquipoB.Text = "(" + calcularCapacidadEquipoB() + "/" + (edq.capacidad / 2) + ")";
            capacidad();


            txt_Organizador.Text = edq.nombreUsuario.ToString();

            // bloquearBotones();
            estadoencuentro.Text = Session["Estado"].ToString();
            validacionesDeUsuario();


        }

        private void capacidad()
        {
            lbl_CantidadTotal.Text = ": " + calcularCapacidadTotal(calcularCapacidadEquipoA(), calcularCapacidadEquipoB()).ToString();
            lbl_CantidadEquipoA.Text = "(" + calcularCapacidadEquipoA() + "/" + (int.Parse(Session["CapacidadMaxima"].ToString()) / 2) + ")";
            lbl_CantidadEquipoB.Text = "(" + calcularCapacidadEquipoB() + "/" + (int.Parse(Session["CapacidadMaxima"].ToString()) / 2) + ")";

        }

        private void cargarMapa(int idComplejoDeportivo)
        {
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
                if (validarExistenciaEnEquipoA())
                {
                    btn_UnirseEquipoA.Enabled = false;
                    btn_UnirseEquipoB.Enabled = true;
                    btn_Salir.Enabled = false;
                    btn_CancelarEncuentro.Visible = true;
                    ////btn_CerrarEncuentro.Visible = true;
                    ////btn_AbrirEncuentro.Visible = false;
                }
                else if (validarExistenciaEnEquipoB())
                {

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
            else
            {
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

            if (total == int.Parse(Session["CapacidadMaxima"].ToString()))
            {
                if (!(string.Equals(Session["Estado"].ToString(), "Finalizado")
                    || string.Equals(Session["Estado"].ToString(), "Cancelado")))
                {
                    int estado = 8; // (COMPLETO)
                    EncuentroDeportivoDao.actualizarEncuentroDeportivo(int.Parse(Session["idEncuentro"].ToString()), estado);

                }
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

            calcularCapacidadEquipoA();
            calcularCapacidadEquipoB();
            //btn_UnirseEquipoA.Enabled = false;
            //btn_UnirseEquipoA.Visible = false;
            //btn_UnirseEquipoB.Enabled = true;
            //btn_UnirseEquipoB.Visible = true;

            btn_Salir.Enabled = true;
            btn_Salir.Visible = true;
            capacidad();
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
            calcularCapacidadEquipoB();
            calcularCapacidadEquipoA();
            //btn_UnirseEquipoA.Enabled = true;
            //btn_UnirseEquipoA.Visible = true;
            //btn_UnirseEquipoB.Visible = false;
            //btn_UnirseEquipoB.Enabled = false;

            btn_Salir.Enabled = true;
            btn_Salir.Visible = true;
            capacidad();

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
            calcularCapacidadEquipoA();
            calcularCapacidadEquipoB();
            btn_Salir.Enabled = false;
            capacidad();

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
                notificacion.nombreEmisor = Session["Usuario"].ToString();
                notificacion.idReceptor = u.id;
                notificacion.nombreReceptor = u.nombre;
                notificacion.idEncuentro = int.Parse(Session["idEncuentro"].ToString());
                notificacion.texto = "Encuentro deportivo Cancelado: " + " - " + lbl_Deporte.Text + " - " +
                    cld_Fecha.Text + " - " + txt_HoraInicio.Text + " - " + lbl_Complejo.Text;
                notificacion.idEstado = 10;

                NotificacionDao.insertarNotificacion(notificacion);

            }

            alertaCancelacion.Visible = true;

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
                calcularCapacidadEquipoA();
                calcularCapacidadEquipoB();

                //lbl_CantidadTotal.Text = ": " + calcularCapacidadTotal(calcularCapacidadEquipoA(), calcularCapacidadEquipoB()).ToString();
                //lbl_CantidadEquipoA.Text = "(" + calcularCapacidadEquipoA() + "/" + (int.Parse(Session["CapacidadMaxima"].ToString()) / 2) + ")";
                //lbl_CantidadEquipoB.Text = "(" + calcularCapacidadEquipoB() + "/" + (int.Parse(Session["CapacidadMaxima"].ToString()) / 2) + ")";
                capacidad();
            }
        }

        private void cargarListaInvitar()
        {
            List<Usuario> listaUsuarios = UsuarioDao.obtenerUsuarios(int.Parse(Session["ID"].ToString()));
            var lista = listaUsuarios.OrderBy(u => u.nombre);

            //gdv_Invitar.DataSource = UsuarioDao.obtenerUsuarios(int.Parse(Session["ID"].ToString()));
            gdv_Invitar.DataSource = lista;
            gdv_Invitar.DataKeyNames = new string[] { "id" };
            gdv_Invitar.DataBind();
        }

        protected void btn_EnviarInvitacion_Click(object sender, EventArgs e)
        {
            // MODAL BTN INVITAR

            // List<Usuario> lista = UsuarioDao.obtenerUsuarios(int.Parse(Session["ID"].ToString())); //(v. Original)

            List<Usuario> listaUsuarios = null;

            if (rdb_PorAmigos.Checked) {
                listaUsuarios = UsuarioDao.getAmigos(int.Parse(Session["ID"].ToString()));
            }
            

            if (rdb_MasOpciones.Checked) {
                int sport = 0;
                int.TryParse(cmb_Deporte.SelectedItem.Value, out sport);
                int zona = 0;
                int.TryParse(cmb_Zona.SelectedItem.Value, out zona);
                int barrio = 0;
                int.TryParse(cmb_Barrio.SelectedItem.Value, out barrio);

                 listaUsuarios = UsuarioDao.getUsuariosPorFiltro(sport,zona,barrio);
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
                    if (int.Parse(Session["idClave"].ToString()) == 0)
                    {
                        notificacion.texto = lbl_Deporte.Text + " - " + cld_Fecha.Text + " - " +
                            txt_HoraInicio.Text + " hs - " + lbl_Complejo.Text;
                    }
                    else
                    {
                        string clave = CriptografiaDao.desencriptar(int.Parse(Session["idClave"].ToString()));
                        notificacion.texto = lbl_Deporte.Text + " - " + cld_Fecha.Text + " - " +
                            txt_HoraInicio.Text + " hs - " + lbl_Complejo.Text + " - Clave: " + clave;
                    }
                    notificacion.idEstado = 10; //(No Check)
                    NotificacionDao.insertarNotificacion(notificacion);
                }
                i++;
            }

            limpiarListaInvitar();

            lbl_ResultadosBusqueda.Text = "La/s invitación/es ha/n sido enviada/s";

            alertaNotificacion.Visible = true;
        }

        private void limpiarListaInvitar() {
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

                listaUsuarios = UsuarioDao.getUsuariosPorFiltro(sport,zona, barrio);
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
            alertaNotificacion.Visible = true;
        }



        private void cargarModalComplejo(int idComplejo)
        {

            ComplejoDeportivo compSelec = ComplejoDeportivoDao.ObtenerComplejosPorID(idComplejo);

            //lblValoracion.Text = "Valoración: " + compSelec.Valoracion.ToString();
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
            if (string.Equals(pass, clave))
            {
                pnl_MostrarContenido.Visible = true;
                pnl_Password.Visible = false;
            }
            else
            {
                pnl_MostrarContenido.Visible = false;
                pnl_Password.Visible = true;
            }

        }
        protected void btnPopUp_Click(object sender, EventArgs e)
        {

            btnPopUp_ModalPopupExtender.Show();
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            btnPopUp_ModalPopupExtender.Hide();
        }


        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            EncuentroDeportivoQueryEntidad edq = new EncuentroDeportivoQueryEntidad();
            int idEncuentro = int.Parse(Session["idEncuentro"].ToString());
            edq = EncuentroDeportivioQueryDao.datosEncuentroPrivado(idEncuentro);
            int valor = Convert.ToInt32(RadioButtonList1.SelectedValue);
            string usuario = Session["ID"].ToString();
            int usuarioValorador = Convert.ToInt32(usuario);
            int idcomplejo = edq.idComplejo;
            RadioButtonList1.Enabled = false;
            ValoracionDao.RegistrarValoracionComplejo(idcomplejo, usuarioValorador, valor, 1);

            foreach (ListItem item in RadioButtonList1.Items)
            {

                if (Convert.ToInt32(item.Value) < valor && item.Text == "★")
                {
                    item.Attributes.CssStyle.Add("color", "orange");
                }

            }

            lblmsjrb1.Text = "Usted califico este Complejo con un puntuacion de :" + valor + " Puntos";
            cargarValoracion();

        }

        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            EncuentroDeportivoQueryEntidad edq = new EncuentroDeportivoQueryEntidad();
            int idEncuentro = int.Parse(Session["idEncuentro"].ToString());
            edq = EncuentroDeportivioQueryDao.datosEncuentroPrivado(idEncuentro);
            int valor = Convert.ToInt32(RadioButtonList2.SelectedValue);
            string usuario = Session["ID"].ToString();
            int usuarioValorador = Convert.ToInt32(usuario);
            int idcomplejo = edq.idComplejo;
            RadioButtonList2.Enabled = false;
            ValoracionDao.RegistrarValoracionComplejo(idcomplejo, usuarioValorador, valor, 2);

            foreach (ListItem item in RadioButtonList2.Items)
            {

                if (Convert.ToInt32(item.Value) < valor && item.Text == "★")
                {
                    item.Attributes.CssStyle.Add("color", "orange");
                }

            }

            lblmsjrb2.Text = "Usted califico este Complejo con un puntuacion de :" + valor + " Puntos";
            cargarValoracion();
        }

        protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            EncuentroDeportivoQueryEntidad edq = new EncuentroDeportivoQueryEntidad();
            int idEncuentro = int.Parse(Session["idEncuentro"].ToString());
            edq = EncuentroDeportivioQueryDao.datosEncuentroPrivado(idEncuentro);
            int valor = Convert.ToInt32(RadioButtonList3.SelectedValue);
            string usuario = Session["ID"].ToString();
            int usuarioValorador = Convert.ToInt32(usuario);
            int idcomplejo = edq.idComplejo;
            RadioButtonList3.Enabled = false;
            ValoracionDao.RegistrarValoracionComplejo(idcomplejo, usuarioValorador, valor, 3);

            foreach (ListItem item in RadioButtonList3.Items)
            {

                if (Convert.ToInt32(item.Value) < valor && item.Text == "★")
                {
                    item.Attributes.CssStyle.Add("color", "orange");
                }

            }

            lblmsjrb3.Text = "Usted califico este Complejo con un puntuacion de :" + valor + " Puntos";
            cargarValoracion();
        }

        public void cargarValoracion()
        {

            EncuentroDeportivoQueryEntidad edq = new EncuentroDeportivoQueryEntidad();
            int idEncuentro = int.Parse(Session["idEncuentro"].ToString());
            edq = EncuentroDeportivioQueryDao.datosEncuentroPrivado(idEncuentro);
            int idcomplejo = edq.idComplejo;
            string idcomplejo1 = Convert.ToString(idcomplejo);
            string usuarioValorador = Session["ID"].ToString();


            if (ValoracionDao.existeValorParticularComplejoxid(idcomplejo1, "1", usuarioValorador) == true)
            {
                RadioButtonList1.SelectedValue = Convert.ToString(ValoracionDao.obtenerValorParticularComplejoxid(idcomplejo1, "1", usuarioValorador));
                foreach (ListItem item in RadioButtonList1.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerValorParticularComplejoxid(idcomplejo1, "1", usuarioValorador) && item.Text == "★")
                    {
                        item.Attributes.CssStyle.Add("color", "orange");
                    }

                }
                RadioButtonList1.Enabled = false;
                lblmsjrb1.Text = "Usted califico este Complejo con un puntuacion de : " + RadioButtonList1.SelectedValue + " Puntos";

            }

            if (ValoracionDao.existeValorParticularComplejoxid(idcomplejo1, "2", usuarioValorador) == true)
            {
                RadioButtonList2.SelectedValue = Convert.ToString(ValoracionDao.obtenerValorParticularComplejoxid(idcomplejo1, "2", usuarioValorador));
                foreach (ListItem item in RadioButtonList2.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerValorParticularComplejoxid(idcomplejo1, "2", usuarioValorador))
                    {
                        item.Attributes.CssStyle.Add("color", "orange");

                    }

                }
                RadioButtonList2.Enabled = false;
                lblmsjrb2.Text = "Usted califico este Complejo con un puntuacion de : " + RadioButtonList2.SelectedValue + " Puntos";

            }

            if (ValoracionDao.existeValorParticularComplejoxid(idcomplejo1, "3", usuarioValorador) == true)
            {
                RadioButtonList3.SelectedValue = Convert.ToString(ValoracionDao.obtenerValorParticularComplejoxid(idcomplejo1, "3", usuarioValorador));
                foreach (ListItem item in RadioButtonList3.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerValorParticularComplejoxid(idcomplejo1, "3", usuarioValorador) && item.Text == "★")
                    {
                        item.Attributes.CssStyle.Add("color", "orange");
                    }

                }
                RadioButtonList3.Enabled = false;
                lblmsjrb3.Text = "Usted califico este Complejo con un puntuacion de : " + RadioButtonList3.SelectedValue + " Puntos";
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

        private void cargarPorJugadores() {

            List<Usuario> listaUsuarios = crearListaJugadores();
            var lista = listaUsuarios.OrderBy(u => u.nombre);

            cmb_Jugadores.Items.Clear();
            cmb_Jugadores.Items.Insert(0, new ListItem("Sin Seleccionar", ""));

            cmb_Jugadores.DataSource = lista;
            cmb_Jugadores.DataValueField = "id";
            cmb_Jugadores.DataTextField = "nombre";
            cmb_Jugadores.DataBind();
        }

        private List<Usuario> crearListaJugadores() {

            List<Usuario> listaUsuarios = UsuarioDao.obtenerUsuarios(int.Parse(Session["ID"].ToString())); ;
            List<Usuario> listaAmigos = UsuarioDao.getAmigos(int.Parse(Session["ID"].ToString())); ;
            List<Usuario> listaJugadores = listaUsuarios;

            for(int i = 0; i < listaUsuarios.Count; i++)
            {
                for (int j = 0; j < listaAmigos.Count; j++)
                {
                    if (listaUsuarios[i].id == listaAmigos[j].id ) {
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
        //        //cmb_Deporte.Enabled = false;
        //       // cmb_Deporte.SelectedIndex = 0;

        //        //rdb_PorBarrio.Checked = false;
        //        //cmb_Barrio.Enabled = false;
        //        //cmb_Barrio.SelectedIndex = 0;

        //        //rdb_PorZona.Checked = false;
        //        //cmb_Zona.Enabled = false;
        //        //cmb_Zona.SelectedIndex = 0;

        //        //pnl_Lugar.Visible = false;

        //  //  }
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


            if (int.Parse(Session["idClave"].ToString()) == 0)
            {
                notificacion.texto = lbl_Deporte.Text + " - " + cld_Fecha.Text + " - " +
                    txt_HoraInicio.Text + " hs - " + lbl_Complejo.Text ;
            }
            else
            {
                string clave = CriptografiaDao.desencriptar(int.Parse(Session["idClave"].ToString()));
                notificacion.texto = lbl_Deporte.Text + " - " + cld_Fecha.Text + " - " +
                    txt_HoraInicio.Text + " hs - " + lbl_Complejo.Text + "Clave: " + clave ;
            }

            notificacion.idEstado = 10; //(No Check)
            NotificacionDao.insertarNotificacion(notificacion);

            lbl_ResultadosBusqueda.Text = "La invitación ha sido enviada"; lbl_ResultadosBusqueda.Text = "La/s invitación/es ha/n sido enviada/s";

            alertaNotificacion.Visible = true;
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
            alertaNotificacion.Visible = true;

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



        private void cargarListaAmigos() {

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
                int.TryParse(cmb_Deporte.SelectedItem.Value, out sport);
                int.TryParse(cmb_Zona.SelectedItem.Value, out zona);
                listaUsuarios = UsuarioDao.getUsuariosPorFiltro(sport, zona, barrio);
            }
            else
            {
                int.TryParse(cmb_Deporte.SelectedItem.Value, out sport);
                int.TryParse(cmb_Barrio.SelectedItem.Value, out barrio);
                listaUsuarios = UsuarioDao.getUsuariosPorFiltro(sport, zona, barrio);
            }

            var lista = listaUsuarios.OrderBy(u => u.nombre);

            gdv_Invitar.DataSource = lista;
            gdv_Invitar.DataKeyNames = new string[] { "id" };
            gdv_Invitar.DataBind();
        }

        private void encuentrFinalizadoDesactivarBotones()
        {
            btn_UnirseEquipoA.Enabled = false;
            btn_UnirseEquipoB.Enabled = false;
            btn_Salir.Enabled = false;
            btn_Entrar.Enabled = false;
            btn_CancelarEncuentro.Enabled = false;
            btn_Enviar.Enabled = false;
            btn_EnviarInvitacion.Enabled = false;
            btn_InvitarJugador.Enabled = false;
            btn_CancelarBusqueda.Enabled = false;
            btn_Solicitud.Enabled = false;
            btn_SolicitudJugador.Enabled = false;
            btn_CancelarBusqueda.Enabled = false;
            btn_Buscar.Visible = false;

           // btn_EncuentroFinalizado.Visible = true;
        }

        protected void gdv_Equipo_B_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            
            string nombrej = ((GridView)sender).Rows[e.RowIndex].Cells[1].Text;
            string idjugador = DeportistaDao.ObtenerIdDeportistaXNombre(nombrej);
          //  int iddep = int.Parse(idjugador);
            txtIdjugador.Text = idjugador;
            nombreJ.Text = nombrej;
            string usuario = Session["ID"].ToString();


            if (ValoracionDao.existeValorParticularJugadorxid(idjugador, "4", usuario) == true)
            {
                RadioButtonList4.SelectedValue = Convert.ToString(ValoracionDao.obtenerValorParticularJugadorxid(idjugador, "4", usuario));
                foreach (ListItem item in RadioButtonList4.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerValorParticularJugadorxid(idjugador, "4", usuario) && item.Text == "★")
                    {
                        item.Attributes.CssStyle.Add("color", "orange");
                    }

                }
              //  RadioButtonList4.Enabled = false;
                Label4.Text = "Usted califico este Complejo con un puntuacion de : " + RadioButtonList4.SelectedValue + " Puntos";

            }
            if (ValoracionDao.existeValorParticularJugadorxid(idjugador, "5", usuario) == true)
            {
                RadioButtonList5.SelectedValue = Convert.ToString(ValoracionDao.obtenerValorParticularJugadorxid(idjugador, "5", usuario));
                foreach (ListItem item in RadioButtonList5.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerValorParticularJugadorxid(idjugador, "5", usuario) && item.Text == "★")
                    {
                        item.Attributes.CssStyle.Add("color", "orange");
                    }

                }
                RadioButtonList5.Enabled = false;
                Label6.Text = "Usted califico este Complejo con un puntuacion de : " + RadioButtonList5.SelectedValue + " Puntos";

            }
            if (ValoracionDao.existeValorParticularJugadorxid(idjugador, "6", usuario) == true)
            {
                RadioButtonList6.SelectedValue = Convert.ToString(ValoracionDao.obtenerValorParticularJugadorxid(idjugador, "6", usuario));
                foreach (ListItem item in RadioButtonList6.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerValorParticularJugadorxid(idjugador, "6", usuario) && item.Text == "★")
                    {
                        item.Attributes.CssStyle.Add("color", "orange");
                    }

                }
                RadioButtonList6.Enabled = false;
                Label7.Text = "Usted califico este Complejo con un puntuacion de : " + RadioButtonList6.SelectedValue + " Puntos";

            }
            ModalPopupExtender1.Show();
        }

        protected void gdv_Equipo_A_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
            string nombrej = ((GridView)sender).Rows[e.RowIndex].Cells[1].Text;
            string idjugador = DeportistaDao.ObtenerIdDeportistaXNombre(nombrej);
           // int idjug = int.Parse(idjugador);
            txtIdjugador.Text = idjugador;
            nombreJ.Text = nombrej;
            string usuario = Session["ID"].ToString();
            

            if (ValoracionDao.existeValorParticularJugadorxid(idjugador, "4", usuario) == true)
            {
                RadioButtonList4.SelectedValue = Convert.ToString(ValoracionDao.obtenerValorParticularJugadorxid(idjugador, "4", usuario));
                foreach (ListItem item in RadioButtonList4.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerValorParticularJugadorxid(idjugador, "4", usuario) && item.Text == "★")
                    {
                        item.Attributes.CssStyle.Add("color", "orange");
                    }

                }
                RadioButtonList4.Enabled = false;
                Label4.Text = "Usted califico este Complejo con un puntuacion de : " + RadioButtonList4.SelectedValue + " Puntos";

            }
            if (ValoracionDao.existeValorParticularJugadorxid(idjugador, "5", usuario) == true)
            {
                RadioButtonList5.SelectedValue = Convert.ToString(ValoracionDao.obtenerValorParticularJugadorxid(idjugador, "5", usuario));
                foreach (ListItem item in RadioButtonList5.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerValorParticularJugadorxid(idjugador, "5", usuario) && item.Text == "★")
                    {
                        item.Attributes.CssStyle.Add("color", "orange");
                    }

                }
                RadioButtonList5.Enabled = false;
                Label6.Text = "Usted califico este Complejo con un puntuacion de : " + RadioButtonList5.SelectedValue + " Puntos";

            }
            if (ValoracionDao.existeValorParticularJugadorxid(idjugador, "6", usuario) == true)
            {
                RadioButtonList6.SelectedValue = Convert.ToString(ValoracionDao.obtenerValorParticularJugadorxid(idjugador, "6", usuario));
                foreach (ListItem item in RadioButtonList6.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerValorParticularJugadorxid(idjugador, "6", usuario) && item.Text == "★")
                    {
                        item.Attributes.CssStyle.Add("color", "orange");
                    }

                }
                RadioButtonList6.Enabled = false;
                Label7.Text = "Usted califico este Complejo con un puntuacion de : " + RadioButtonList6.SelectedValue + " Puntos";

            }
            ModalPopupExtender1.Show();
        }

        protected void gdv_Equipo_A_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (estadoencuentro.Text == "Finalizado" || estadoencuentro.Text == "Cancelado")
                {
                    LinkButton Lb = (LinkButton)e.Row.FindControl("updatebtn");
                    Lb.Visible = true;
                }
                }
            
        }

        protected void gdv_Equipo_B_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (estadoencuentro.Text == "Finalizado" || estadoencuentro.Text == "Cancelado")
                {
                    LinkButton Lb2 = (LinkButton)e.Row.FindControl("updatebtn2");
                    Lb2.Visible = true;
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("EncuentroPrivado.aspx");
            ModalPopupExtender1.Hide();
        }

        protected void RadioButtonList4_SelectedIndexChanged(object sender, EventArgs e)
        {

            int valor = Convert.ToInt32(RadioButtonList4.SelectedValue);
            string usuario = Session["ID"].ToString();
            int usuarioValorador = Convert.ToInt32(usuario);
            int idjugador = Convert.ToInt32(txtIdjugador.Text);
            RadioButtonList4.Enabled = false;
            ValoracionDao.RegistrarValoracionDeportista(idjugador, usuarioValorador, valor, 4);

            foreach (ListItem item in RadioButtonList4.Items)
            {

                if (Convert.ToInt32(item.Value) < valor && item.Text == "★")
                {
                    item.Attributes.CssStyle.Add("color", "orange");
                }

            }

            Label4.Text = "Usted califico a este jugador con una puntuacion de " + valor + " Puntos";
         
            //cargarValoracion();

        }
        protected void RadioButtonList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            int valor = Convert.ToInt32(RadioButtonList5.SelectedValue);
            string usuario = Session["ID"].ToString();
            int usuarioValorador = Convert.ToInt32(usuario);
            int idjugador = Convert.ToInt32(txtIdjugador.Text);
            RadioButtonList5.Enabled = false;
            ValoracionDao.RegistrarValoracionDeportista(idjugador, usuarioValorador, valor, 5);

            foreach (ListItem item in RadioButtonList5.Items)
            {

                if (Convert.ToInt32(item.Value) < valor && item.Text == "★")
                {
                    item.Attributes.CssStyle.Add("color", "orange");
                }

            }

            Label6.Text = "Usted califico a este jugador con una puntuacion de " + valor + " Puntos";
         
            //cargarValoracion();
        }
        protected void RadioButtonList6_SelectedIndexChanged(object sender, EventArgs e)
        {
            int valor = Convert.ToInt32(RadioButtonList6.SelectedValue);
            string usuario = Session["ID"].ToString();
            int usuarioValorador = Convert.ToInt32(usuario);
            int idjugador = Convert.ToInt32(txtIdjugador.Text);
            RadioButtonList6.Enabled = false;
            ValoracionDao.RegistrarValoracionDeportista(idjugador, usuarioValorador, valor, 6);

            foreach (ListItem item in RadioButtonList6.Items)
            {

                if (Convert.ToInt32(item.Value) < valor && item.Text == "★")
                {
                    item.Attributes.CssStyle.Add("color", "orange");
                }

            }

            Label7.Text = "Usted califico a este jugador con una puntuacion de " + valor + " Puntos";
          
            //cargarValoracion();
        }

    }  
}
