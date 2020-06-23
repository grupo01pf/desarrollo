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

                pnl_MostrarContenido.Visible = false;
                pnl_Password.Visible = true;

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

            spObtenerComplejosJoin_Result cd = ComplejoDeportivoDao.ObtenerComplejoPorID(idComplejoDeportivo);

            int id = cd.Mapa.Value;
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


        protected void btn_Ingresar_Click(object sender, EventArgs e)
        {
            //btn_UnirseEquipoA.Enabled = true;
            //btn_UnirseEquipoA.Visible = true;
            //btn_UnirseEquipoB.Enabled = true;
            //btn_UnirseEquipoB.Visible = true;
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

        protected void btn_CerrarEncuentro_Click(object sender, EventArgs e)
        {
            //btn_UnirseEquipoA.Enabled = false;
            //btn_UnirseEquipoB.Enabled = false;
            //btn_CerrarEncuentro.Visible = false;
            //btn_AbrirEncuentro.Visible = true;

          //  Session["Unirse"] = false;
        }

        protected void btn_AbrirEncuentro_Click(object sender, EventArgs e)
        {
            //btn_AbrirEncuentro.Visible = false;
            //btn_CerrarEncuentro.Visible = true;
            //validacionesDeUsuario();
         //   Session["Unirse"] = true;
        }

       

        private void cargarModalComplejo(int idComplejo) {

            spObtenerComplejosJoin_Result compSelec = ComplejoDeportivoDao.ObtenerComplejoPorID(idComplejo);

           // myModalLabel2.InnerText = compSelec.nombre;
            lblValoracion.Text = "Valoración: " + compSelec.Valoracion.ToString();

            lblDeportes.Text = compSelec.Deportes;
            lblDescripcion.Text = compSelec.Descripcion;
            //CargarListServicios(compSelec.id);
            lblDireccion.Text = "Dirección: " + compSelec.Calle + " " + compSelec.NroCalle.ToString();
            Barrio bar = BarrioDao.ObtenerBarriosPorID(int.Parse(compSelec.IDBarrio.ToString()));
            lblBarrio.Text = "Barrio: " + bar.nombre;
            lblZona.Text = "Zona: " + ZonaDao.ObtenerZonasPorID(int.Parse(bar.idZona.ToString())).nombre;
            lblTelefono.Text = "Teléfono: " + compSelec.Telefono.ToString();


            //ARREGLAR QUE PASA CUANDO NO HAY IMAGEN
            if (compSelec.Avatar != null)
            {
               // imgAvatar.ImageUrl = "~/AvatarComplejo.aspx?id=" + Session["ID"].ToString();
            }


            //img1.Src = "~/AvatarComplejo.aspx?id=" + Session["ID"].ToString();
            //img2.Src = "~/AvatarComplejo.aspx?id=" + Session["ID"].ToString();
            //img3.Src = "~/AvatarComplejo.aspx?id=" + Session["ID"].ToString();

           // btnPopUp_ModalPopupExtender2.Show();
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
    }
}
