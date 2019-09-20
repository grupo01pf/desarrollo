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
                crearEventoPrivado();
                Response.Redirect("EncuentroPrivado.aspx");
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
            ed.idEstado = 1; // (habilitado)
            TimeSpan? hi = TimeSpan.Parse(txt_HoraInicio.Text);
            ed.horaInicio = hi;
            TimeSpan? hf = TimeSpan.Parse(txt_HoraFin.Text);
            ed.horaFin = hf;

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

            EncuentroDeportivo ed = new EncuentroDeportivo();

            ed.idUsuario = int.Parse(Session["ID"].ToString()); //( USAR cuando este el Login )
            // ed.idUsuario = 1;
            // ed.fechaCreacionEncuentro = DateTime.Now; (reserva)

            ed.idDeporte = cmb_Deporte.SelectedIndex;
            ed.idComplejo = cmb_Complejo.SelectedIndex;
            ed.fechaInicioEncuentro = cld_Fecha.SelectedDate;

            ed.idEstado = 1; // (habilitado)

            ed.tipoEncuentro = "Privado";

            // if (chk_Accesibilidad.Checked) { ed.accesibilidad = "Cerrado"; }
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


            Session["idEncuentro"] = EncuentroDeportivoDao.InsertarEncuentroPrivado(ed);
            EncuentroDeportivoDao.insertarUsuarioPorEncuentro(int.Parse(Session["ID"].ToString()), int.Parse(Session["idEncuentro"].ToString()));

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
    }
}
    
