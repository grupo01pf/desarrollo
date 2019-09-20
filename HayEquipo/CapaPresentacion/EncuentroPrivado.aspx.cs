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
            Session["IdUsuarioEncuentro"] = null;

            cargarDeportes();
            cargarComplejos();
            cargarDatosEncuentroPrivado();
            cargarEquipoA();
            cargarEquipoB();
            if (validarOrganizador())
            {
                btn_UnirseEquipoA.Enabled = false;
                btn_UnirseEquipoB.Enabled = true;
                btn_Salir.Enabled = false;
                btn_CancelarEncuentro.Visible = true;
            }
            else
            {
                if (validarJugadorUnido())
                {
                    // verificar en que equipo esta unido el usuario
                    // equipo A
                    btn_UnirseEquipoA.Enabled = false;
                    btn_UnirseEquipoB.Enabled = true;
                    btn_Salir.Enabled = true;
                    btn_CancelarEncuentro.Visible = false;

                    // equipo B
                    btn_UnirseEquipoA.Enabled = true;
                    btn_UnirseEquipoB.Enabled = false;
                    btn_Salir.Enabled = true;
                    btn_CancelarEncuentro.Visible = false;
                }


                else
                {
                    btn_UnirseEquipoA.Enabled = true;
                    btn_UnirseEquipoB.Enabled = true;
                    btn_Salir.Enabled = false;
                    btn_CancelarEncuentro.Visible = false;
                }
            }
            
            cargarChat();
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

            Session["IdUsuarioEncuentro"] = edq.idUsuario;

            cmb_Deporte.SelectedValue = edq.nombreDeporte;
            cmb_Complejo.SelectedValue = edq.nombreComplejo;

            cld_Fecha.Text = edq.fechaInicioEncuentro.ToShortDateString();

            txt_calle.Text = edq.calleComplejo;
            txt_nroCalle.Text = edq.numeroCalleComplejo.ToString();
            txt_Telefono.Text = edq.numeroTelefono.ToString();

            txt_Organizador.Text = edq.nombreUsuario.ToString();

            bloquearBotones();

            // txt_HoraInicio.Text = eq.horaInicio.ToShortTimeString();
            // txt_HoraFin.Text = eq.horaFin.ToShortTimeString();

            //if (string.IsNullOrEmpty(eq.nombreLP))
            //    txt_NombreLugar.Text = string.Empty;
            //else { txt_NombreLugar.Text = eq.nombreLP.ToString(); }

            //if (string.IsNullOrEmpty(eq.direccion))
            //    txt_Direccion.Text = string.Empty;
            //else { txt_Direccion.Text = eq.direccion.ToString(); }


        }


        protected void btn_Ingresar_Click(object sender, EventArgs e)
        {
            btn_UnirseEquipoA.Enabled = true;
            btn_UnirseEquipoB.Enabled = true;
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
            btn_UnirseEquipoB.Enabled = true;
            btn_Salir.Enabled = true;
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
            btn_UnirseEquipoB.Enabled = false;
            btn_Salir.Enabled = true;

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

        private bool validarJugadorUnido()
        {
            bool estaUnido = false;
            
            return estaUnido;
        }


        protected void btn_Invitar_Click(object sender, EventArgs e)
        {

        }

        protected void btn_Salir_Click(object sender, EventArgs e)
        {

        }

        private void cargarDeportes()
        {
            cmb_Deporte.DataSource = DeporteDao.ObtenerDeportes();
            cmb_Deporte.DataValueField = "id";
            cmb_Deporte.DataValueField = "nombre";
            cmb_Deporte.DataBind();

        }
        private void cargarComplejos()
        {

            cmb_Complejo.DataSource = ComplejoDeportivoDao.ObtenerComplejos();
            cmb_Complejo.DataValueField = "id";
            cmb_Complejo.DataValueField = "nombre";
            cmb_Complejo.DataBind();
        }
        private bool validarOrganizador()
        {
            bool flag = false;

            int idUsuarioLogueado = int.Parse(Session["ID"].ToString());
            int idUsuarioEncuentro = int.Parse(Session["IdUsuarioEncuentro"].ToString());

            if (idUsuarioLogueado == idUsuarioEncuentro)
            { flag = true; }
            return flag;

        }

        private void bloquearBotones()
        {

            cmb_Deporte.Enabled = false;
            cmb_Complejo.Enabled = false;
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
        }

        private void cargarChat()
        {

            // gdv_Pantalla.DataSource = MensajeQueryDao.MostrarMensajes(int.Parse(Session["idEncuentro"].ToString()), int.Parse(Session["ID"].ToString()) );
            gdv_Pantalla.DataSource = MensajeQueryDao.MostrarMensajes(int.Parse(Session["idEncuentro"].ToString()));
            gdv_Pantalla.DataKeyNames = new string[] { "idMensaje" };
            gdv_Pantalla.DataBind();
        }
    }
}