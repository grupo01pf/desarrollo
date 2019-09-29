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
            }
            
            //   cargarChat();
            // txt_Mensaje.Focus();

        }
        private void cargarDatosEncuentroPublico()
        {
            // if (Session["idEncuentro"] != null) {


                EncuentroDeportivoQueryEntidad edq = new EncuentroDeportivoQueryEntidad();

                // int idEncuentro = int.Parse(Session["idEncuentro"].ToString());

                //  edq = EncuentroDeportivioQueryDao.datosEncuentroPublico(idEncuentro);
                edq = EncuentroDeportivioQueryDao.datosEncuentroPublico(int.Parse(Session["idEncuentro"].ToString()));

                Session["idEncuentro"] = edq.idEncuentroDeportivo;
                int id = int.Parse(Session["idEncuentro"].ToString());

                Session["IdOrganizadorEncuentro"] = edq.idUsuario;

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

                Session["CapacidadMaxima"] = edq.capacidad;

                txt_Organizador.Text = edq.nombreUsuario.ToString();

                bloquearControles();

           // }


            //EncuentroDeportivioQueryDao eqdao = new EncuentroDeportivioQueryDao();
            //  int idUsuario = int.Parse(Session["ID"].ToString());
            //  eq = EncuentroDeportivioQueryDao.datosEncuentroPublico(idUsuario, idEncuentro);
            //cmb_Deporte.SelectedIndex = (int)eq.idDeporte;
            //  cld_Fecha.SelectedDate = eq.fechaInicioEncuentro;
            //cld_Fecha.Text = eq.fechaInicioEncuentro;

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
           // if (Session["idEncuentro"] != null) {

                int id = int.Parse(Session["idEncuentro"].ToString());

                //  Session["ListaUsuariosUnidos"] = UsuarioDao.UsuariosUnidosEncuentroPublico(int.Parse(Session["idEncuentro"].ToString()));            
                //  gdv_UsuariosUnidos.DataSource = Session["ListaUsuariosUnidos"];
                gdv_UsuariosUnidos.DataSource = UsuarioDao.UsuariosUnidosEncuentroPublico(int.Parse(Session["idEncuentro"].ToString()));
                gdv_UsuariosUnidos.DataKeyNames = new string[] { "nombre" };
                gdv_UsuariosUnidos.DataBind();

           // }
            
        }

        //private void cargarDeportes()
        //{
        //    cmb_Deporte.DataSource = DeporteDao.ObtenerDeportes();
        //    cmb_Deporte.DataValueField = "id";
        //    cmb_Deporte.DataValueField = "nombre";
        //    cmb_Deporte.DataBind();
        //}

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

        protected void gdv_Pantalla_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            if (Session["idEncuentro"] != null)
            {
                cargarChat();
            }

            //  gdv_Pantalla.DataSource = sqlData.

            // gdv_Pantalla.DataBind();
        }
    }
}