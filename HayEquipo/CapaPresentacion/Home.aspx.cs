using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDao;
using CapaEntidades;
using System.Data.SqlClient;
using System.Data;

namespace CapaPresentacion
{
    public partial class Home : System.Web.UI.Page
    {

        HayEquipoEntities contexto = new HayEquipoEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            //****NO BORRAR****

            link_nombreUsuario.Text = Session["Usuario"].ToString();
            if (UsuarioDao.existeImagen(Session["ID"].ToString()) != false)
            {
                Image1.ImageUrl = "~/imagen.aspx?id=" + Session["ID"].ToString();
            }
            if (!IsPostBack)
            {

                CargarDdlDeportes();
                ddlDeportes.AutoPostBack = true;
                CargarDdlZonas();
                ddlZonas.AutoPostBack = true;
                //cargarEventosDisponibles();
                // cargarLugaresPublicos();
                // cargarLugaresPrivados();
            }

            encuentrosRepeater.DataSource = (from encuentro in ObtenerEncuentros()
                 orderby encuentro.fechaInicioEncuentro ascending
                 select encuentro)
                ;
            encuentrosRepeater.DataBind();
            encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
            enviarnotifFinalizadas();
            actualizarNotificaciones();
            if(EncuentroDeportivioQueryDao.existeProximoEncuentro(Session["ID"].ToString())== true)
            {
                cargarProxEncuentro();
                ir.Visible = true;
                imagenProxEnc.Visible = true;
                Label2.Visible = true;
                Label3.Visible = true;
                Label4.Visible = true;
            }
            else
            {
                proxenc.Text = "No cuentas con un encuentro proximo";
                imagenProxEnc.Visible = false;
                Label2.Visible = false;
                Label3.Visible = false;
                Label4.Visible = false;
                ir.Visible = false;
            }


        }

        private void actualizarNotificaciones() {

            lbl_Notificacion.Text = (NotificacionDao.contadorNotificaciones(int.Parse(Session["ID"].ToString()))).ToString();
            lbl_Solicitudes.Text = (NotificacionDao.contadorNotificacionesSolicitudes(int.Parse(Session["ID"].ToString()))).ToString();
        }

        void encuentroRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "btnUnirseEncuentro")
            {
                string idEncuentro = ((LinkButton)e.CommandSource).CommandArgument;
                int id = int.Parse(idEncuentro);

                Session["idEncuentro"] = id;

                Session["idEncuentro"] = id;
                if (EncuentroDeportivioQueryDao.obtenerTipoEncuentroPorId(idEncuentro) == "Publico")
                {
                    //  Response.Redirect("EncuentroPublico.aspx?Id=" + idEncuentro);
                    Response.Redirect("EncuentroPublico.aspx");
                }
                if (EncuentroDeportivioQueryDao.obtenerTipoEncuentroPorId(idEncuentro) == "Privado")
                {
                    // Response.Redirect("EncuentroPrivado.aspx?Id=" + idEncuentro);
                    Response.Redirect("EncuentroPrivado.aspx");
                }

            }
        }

        void DeportistasRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "btnVerPerfil")
            {
                string idDeportista = ((LinkButton)e.CommandSource).CommandArgument;
                //int id = int.Parse(idDeportista);

                //Session["ID"] = id;

                Response.Redirect("PerfilOtrosDeportistas.aspx?Id=" + idDeportista);

            }
        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
            Session["Usuario"] = String.Empty;
            Session["Rol"] = String.Empty;


        }

        protected void link_nombreUsuario_Click(object sender, EventArgs e)
        {
            //****NO BORRAR****
            // redireccionar a MiCuenta o Perfil
            Response.Redirect("PerfilDeportistas.aspx");
        }

        //protected void btn_CrearEncuentro_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("CrearEncuentro.aspx");
        //}

        //protected void cargarEventosDisponibles()
        //{

        //    gdv_EncuentrosDisponibles.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPublicos();
        //    gdv_EncuentrosDisponibles.DataKeyNames = new string[] { "idEncuentroDeportivo" };
        //    gdv_EncuentrosDisponibles.DataBind();

        //}

        //protected void cargarLugaresPublicos() {

        //    //gdv_LugaresPublicos.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPublicos();
        //    //gdv_LugaresPublicos.DataKeyNames = new string[] { "id" };
        //    //gdv_LugaresPublicos.DataBind();

        //}
        //protected void cargarLugaresPrivados()
        //{

        //    //gdv_LugaresPrivados.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPrivados();
        //    //gdv_LugaresPrivados.DataKeyNames = new string[] { "Id" };
        //    //gdv_LugaresPrivados.DataBind();

        //}


        //protected void gdv_EncuentrosDisponibles_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //    GridViewRow fila = gdv_EncuentrosDisponibles.SelectedRow;


        //    string tipoEncuentro = fila.Cells[2].Text;
        //    Session["idEncuentro"] = int.Parse(gdv_EncuentrosDisponibles.SelectedDataKey.Value.ToString());

        //    //string tipoEncuentro = fila.Cells[2].Text; ;

        //    //  lbl_Prueba.Text = tipoEncuentro;


        //    if (tipoEncuentro.Equals("Publico"))
        //    {
        //        Response.Redirect("EncuentroPublico.aspx");

        //    }


        //    else
        //    {
        //        Response.Redirect("EncuentroPrivado.aspx");

        //    }


        //}

        public List<EncuentroDeportivoQueryEntidad> ObtenerEncuentros()
        {
            List<EncuentroDeportivoQueryEntidad> encuentro = new List<EncuentroDeportivoQueryEntidad>();
            encuentro = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosConImagenes();
            //var q = from p in contexto.EncuentroDeportivo
            //        select p;
            //return q.ToList();
            return encuentro;
        }

       public List<DeportistaEntidad> ObtenerDeportistas()
        {
            List<DeportistaEntidad> Deportistas = new List<DeportistaEntidad>();
            Deportistas = DeportistaDao.ObtenerTodosDeportistas();
            return Deportistas;
        }

        protected void btn_Notificacion_Click(object sender, EventArgs e)
        {
            Response.Redirect("PerfilDeportistas.aspx");
        }

        private void CargarDdlDeportes()
        {
            ddlDeportes.DataSource = DeporteDao.ObtenerDeportes();
            ddlDeportes.DataTextField = "nombre";
            ddlDeportes.DataValueField = "id";
            ddlDeportes.DataBind();
        }

        protected void ddlDeportes_SelectedIndexChanged(object sender, EventArgs e)
        {
                CargarRepeaterPorDeporte();
        }

        private void CargarRepeaterPorDeporte()
        {
            encuentrosRepeater.DataSource = (from encuentro in EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPorDeporte(int.Parse(ddlDeportes.SelectedValue.ToString()))
                                             orderby encuentro.fechaInicioEncuentro ascending
                                             select encuentro);
            encuentrosRepeater.DataBind();
            encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
        }

        private void CargarDdlZonas()
        {
            ddlZonas.DataSource = ZonaDao.obtenerZonas();
            ddlZonas.DataTextField = "nombre";
            ddlZonas.DataValueField = "idZona";
            ddlZonas.DataBind();
        }

        protected void ddlZonas_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarRepeaterPorZona();
        }

        private void CargarRepeaterPorZona()
        {
            encuentrosRepeater.DataSource = (from encuentro in EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPorZona(int.Parse(ddlZonas.SelectedValue.ToString()))
                                             orderby encuentro.fechaInicioEncuentro ascending
                                             select encuentro);
            encuentrosRepeater.DataBind();
            encuentrosRepeater.ItemCommand += new RepeaterCommandEventHandler(encuentroRepeater_ItemCommand);
        }


        protected void enviarnotifFinalizadas()
        {

            List<EncuentroDeportivoQueryEntidad> EncDepFinalizados = EncuentroDeportivoDao.obtenerEstadosEncuentrosDeportivosPrivados(); //cargar lista con enc dep finalizados

            foreach (EncuentroDeportivoQueryEntidad e in EncDepFinalizados)
            {

                int estado = 14; // (FINALIZADO)

                // ReservaDao.acutalizarReserva(int.Parse(Session["idEncuentro"].ToString()), estado);
                // EncuentroDeportivoDao.actualizarEncuentroDeportivo(int.Parse(Session["idEncuentro"].ToString()), estado);

                ReservaDao.acutalizarReserva(e.idEncuentroDeportivo2, estado);
                EncuentroDeportivoDao.actualizarEncuentroDeportivo(e.idEncuentroDeportivo2, estado);

                // Enviar notificacion

                //List<Usuario> lista = UsuarioDao.UsuariosUnidosEncuentroEquipoA(int.Parse(Session["idEncuentro"].ToString()));
                //lista.AddRange(UsuarioDao.UsuariosUnidosEncuentroEquipoB(int.Parse(Session["idEncuentro"].ToString())));

                List<Usuario> lista = UsuarioDao.UsuariosUnidosEncuentroEquipoA(e.idEncuentroDeportivo2);
                lista.AddRange(UsuarioDao.UsuariosUnidosEncuentroEquipoB(e.idEncuentroDeportivo2));

                foreach (Usuario u in lista)
                {
                    Notificacion notificacion = null;
                    notificacion = new Notificacion();
                    notificacion.idEmisor = 1;
                    notificacion.nombreEmisor = "Admin";
                    notificacion.idReceptor = u.id;
                    notificacion.nombreReceptor = u.nombre;
                    notificacion.idEncuentro = e.idEncuentroDeportivo2;
                    notificacion.texto = "Encuentro Finalizado. Listo para calificar jugadores.Fecha Encuentro: " + e.fechaInicioEncuentro.ToString("dd-MMMM-yyyy") + " - " + e.horaInicio.ToString("HH") + " Hs";
                    notificacion.idEstado = 10;


                    if (NotificacionDao.ExistePartidoFinalizado(u.id, e.idEncuentroDeportivo2) == false)
                    {
                        NotificacionDao.insertarNotificacion(notificacion);
                    }
                }

            }

        }

        protected void cargarProxEncuentro()
        {
            EncuentroDeportivoQueryEntidad encuentroProximo = new EncuentroDeportivoQueryEntidad();
            encuentroProximo = EncuentroDeportivioQueryDao.obtenerProximoEncuentroPorId(Session["ID"].ToString());
            if (EncuentroDeportivioQueryDao.existeImagenComplejo(Session["ID"].ToString()) != false)
            {
                imagenProxEnc.ImageUrl = "~/imagenComplejoProx.aspx?id=" + Session["ID"].ToString();
            }
            deporte.Text = encuentroProximo.nombreDeporte.ToString();
            lugar.Text = encuentroProximo.nombreComplejo.ToString();
            fecha.Text = encuentroProximo.fechaInicioEncuentro.ToString("dd MMMM ");
            hora.Text = encuentroProximo.horaInicio.ToString("HH");

        }

        protected void ir_Click(object sender, EventArgs e)
        {
            EncuentroDeportivoQueryEntidad encuentroProximo = new EncuentroDeportivoQueryEntidad();
            encuentroProximo = EncuentroDeportivioQueryDao.obtenerProximoEncuentroPorId(Session["ID"].ToString());
            Session["idEncuentro"] = encuentroProximo.idEncuentroDeportivo;
            Response.Redirect("EncuentroPrivado.aspx");
        }
    }
}
