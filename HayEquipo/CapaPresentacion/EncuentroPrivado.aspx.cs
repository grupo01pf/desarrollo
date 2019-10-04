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


        protected void Page_Load(object sender, EventArgs e)
        {

            /*
             Session["IdOrganizadorEncuentro"] = null;
            Session["CapacidadMaxima"] = null;
            cargarDeportes();
            cargarComplejos();
            cargarEquipoA();
            cargarEquipoB();

            cargarDatosEncuentroPrivado();

            calcularCapacidadTotal(calcularCapacidadEquipoA(),calcularCapacidadEquipoB());

            cargarMapa();

            cargarChat();
            txt_Mensaje.Focus();
            */

            /*
            Session["IdUsuarioEncuentro"] = null;

            //cargarDeportes();
            //cargarComplejos();
            cargarDatosEncuentroPrivado();
            cargarEquipoA();
            cargarEquipoB();
            if (validarOrganizador())
            {
                btn_UnirseEquipoA.Enabled = false;
                btn_UnirseEquipoA.Visible = false;
                btn_UnirseEquipoB.Enabled = true;
                btn_UnirseEquipoB.Visible = true;
                btn_Salir.Enabled = false;
            }
            else
            {
                btn_UnirseEquipoA.Enabled = true;
                btn_UnirseEquipoB.Enabled = true;
                btn_Salir.Enabled = false;
                btn_Salir.Visible = false;
            }

            cargarChat();
            txt_Mensaje.Focus();
            */
            if (!IsPostBack) {

                Session["IdOrganizadorEncuentro"] = null;
                Session["CapacidadMaxima"] = null;
                // cargarDeportes();
                // cargarComplejos();
                cargarEquipoA();
                cargarEquipoB();

                cargarDatosEncuentroPrivado();

                calcularCapacidadTotal(calcularCapacidadEquipoA(), calcularCapacidadEquipoB());

              //  cargarMapa();
                cargarChat();
                cargarListaInvitar();
            }
            
           // txt_Mensaje.Focus();
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

            //cmb_Deporte.SelectedValue = edq.nombreDeporte;
            lbl_Deporte.Text = edq.nombreDeporte;
            //cmb_Complejo.SelectedValue = edq.nombreComplejo;
            lbl_Complejo.Text = edq.nombreComplejo;

            cld_Fecha.Text = edq.fechaInicioEncuentro.ToShortDateString();

            txt_calle.Text = edq.calleComplejo;
            txt_nroCalle.Text = edq.numeroCalleComplejo.ToString();
            txt_Telefono.Text = edq.numeroTelefono.ToString();

            Session["CapacidadMaxima"] = edq.capacidad;

            txt_Organizador.Text = edq.nombreUsuario.ToString();

            bloquearBotones();

            validacionesDeUsuario();

            // txt_HoraInicio.Text = eq.horaInicio.ToShortTimeString();
            // txt_HoraFin.Text = eq.horaFin.ToShortTimeString();

            //if (string.IsNullOrEmpty(eq.nombreLP))
            //    txt_NombreLugar.Text = string.Empty;
            //else { txt_NombreLugar.Text = eq.nombreLP.ToString(); }

            //if (string.IsNullOrEmpty(eq.direccion))
            //    txt_Direccion.Text = string.Empty;
            //else { txt_Direccion.Text = eq.direccion.ToString(); }


        }

        //private void cargarMapa() {
        //    contenedorDelMapa.Visible = true;
        //    frm_map.Visible = true;
        //    //ComplejoDeportivo cd = ComplejoDeportivoDao.ObtenerComplejosPorID(cmb_Complejo.SelectedIndex);
        //    ComplejoDeportivo cd = ComplejoDeportivoDao.ObtenerComplejosPorID(int.Parse(lbl_Complejo.te);
        //    frm_map.Src = cd.mapa;
        //}

        private void validacionesDeUsuario()
        {
            if (validarOrganizador())
            {
                btn_UnirseEquipoA.Enabled = false;
                btn_UnirseEquipoB.Enabled = true;
                btn_Salir.Enabled = false;
                btn_CancelarEncuentro.Visible = true;
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
            List<Usuario> listaUsuariosEuqipoA = UsuarioDao.UsuariosUnidosEncuentroEquipoA(int.Parse(Session["idEncuentro"].ToString()));
            if (listaUsuariosEuqipoA.Count < int.Parse(Session["CapacidadMaxima"].ToString()))
            {
                // lbl_CantidadEquipoA.Text = listaUsuariosEuqipoA.Count + "/" + int.Parse(Session["CapacidadMaxima"].ToString());
                equipoA = listaUsuariosEuqipoA.Count;
            }
            else
            {
                equipoA = listaUsuariosEuqipoA.Count;
                // lbl_CantidadEquipoA.Text = listaUsuariosEuqipoA.Count + "/" + int.Parse(Session["CapacidadMaxima"].ToString());
                btn_UnirseEquipoA.Enabled = false;
                // actualizar estado
                int estado = 8; // (COMPLETO)
                EncuentroDeportivoDao.actualizarEncuentroDeportivo(int.Parse(Session["idEncuentro"].ToString()), estado);
            }
            return equipoA;
        }

        private int calcularCapacidadEquipoB()
        {
            int equipoB = 0;
            List<Usuario> listaUsuariosEquipoB = UsuarioDao.UsuariosUnidosEncuentroEquipoB(int.Parse(Session["idEncuentro"].ToString()));
            if (listaUsuariosEquipoB.Count < int.Parse(Session["CapacidadMaxima"].ToString()))
            {
                //  lbl_CantidadEquipoB.Text = listaUsuariosEquipoB.Count + "/" + int.Parse(Session["CapacidadMaxima"].ToString());
                equipoB = listaUsuariosEquipoB.Count;
            }
            else
            {
                equipoB = listaUsuariosEquipoB.Count;
                //  lbl_CantidadEquipoB.Text = listaUsuariosEquipoB.Count + "/" + int.Parse(Session["CapacidadMaxima"].ToString());
                btn_UnirseEquipoB.Enabled = false;
                int estado = 8; // (COMPLETO)
                EncuentroDeportivoDao.actualizarEncuentroDeportivo(int.Parse(Session["idEncuentro"].ToString()), estado);

            }
            return equipoB;

        }

        private void calcularCapacidadTotal(int equipoA, int equipoB)
        {
            //int total = 0;



        }


        protected void btn_Ingresar_Click(object sender, EventArgs e)
        {
            btn_UnirseEquipoA.Enabled = true;
            btn_UnirseEquipoA.Visible = true;
            btn_UnirseEquipoB.Enabled = true;
            btn_UnirseEquipoB.Visible = true;
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

        protected void btn_Invitar_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Salir_Click(object sender, EventArgs e)
        {

        }

        //private void cargarDeportes()
        //{
        //    cmb_Deporte.DataSource = DeporteDao.ObtenerDeportes();
        //    cmb_Deporte.DataValueField = "id";
        //    cmb_Deporte.DataValueField = "nombre";
        //    cmb_Deporte.DataBind();

        //}
        //private void cargarComplejos()
        //{

        //    cmb_Complejo.DataSource = ComplejoDeportivoDao.ObtenerComplejos();
        //    cmb_Complejo.DataValueField = "id";
        //    cmb_Complejo.DataValueField = "nombre";
        //    cmb_Complejo.DataBind();
        //}

        private void bloquearBotones()
        {

            //cmb_Deporte.Enabled = false;
            //cmb_Complejo.Enabled = false;
            cld_Fecha.Enabled = false;
            txt_calle.Enabled = false;
            txt_nroCalle.Enabled = false;
            txt_Telefono.Enabled = false;
            txt_Organizador.Enabled = false;
            // txt_HoraInicio.Enabled = false;
            // txt_HoraFin.Enabled = false;
            //  txt_NombreLugar.Enabled = false;
            //  txt_Direccion.Enabled = false;
        }

        protected void btn_CancelarEncuentro_Click(object sender, EventArgs e)
        {

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
            }
        }

        protected void chk_Invitar_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void cargarListaInvitar()
        {
            gdv_Invitar.DataSource = UsuarioDao.obtenerUsuarios(int.Parse(Session["ID"].ToString()));
            gdv_Invitar.DataKeyNames = new string[] { "id" };
            gdv_Invitar.DataBind();
        }

    }
}
