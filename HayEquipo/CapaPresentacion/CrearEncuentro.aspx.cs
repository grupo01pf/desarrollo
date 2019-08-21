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
            if (!IsPostBack) {
                cargarDeportes();
               // cargarZonas();
                cargarComplejos();
               // cargarBarrios();
            }

        }

        protected void btn_Crear_Click(object sender, EventArgs e)
        {
            if (rdb_Publico.Checked)
            {
                crearEventoPublico();
                Response.Redirect("EncuentroPublico.aspx");
            }else
            {
                crearEventoPrivado();
                Response.Redirect("EncuentroPrivado.aspx");
            }
        }

        private void crearEventoPublico()
        {
            EncuentroDeportivoEntidad ed = new EncuentroDeportivoEntidad();
            
            
           //  ed.idAUsuario = int.Parse(Session["ID"].ToString()); //( USAR cuando este el Login )
            ed.idAUsuario = 1;
            // string fechaHoy = hoy.ToString("dd/MM/yyyy");
            DateTime hoy = DateTime.Now;
            DateTime fecha;
            if (DateTime.TryParse(hoy.ToString("dd/MM/yyyy"), out fecha))
            ed.fechaCreacionEncuentro = fecha;
            ed.idDeporte = cmb_Deporte.SelectedIndex;
           // ed.idEquipo = 0;

            DateTime calendario = cld_Fecha.SelectedDate;
            DateTime fi;
            if (DateTime.TryParse(calendario.ToString("dd/MM/yyyy"), out fi))
                ed.fechaInicioEncuentro = fi;

            ed.idEstado = 1; // (habilitado)

            
            DateTime hi;
            if (DateTime.TryParse(txt_HoraInicio.Text, out hi)) { ed.horaInicio = hi; }

            DateTime hf;
            if (DateTime.TryParse(txt_HoraFin.Text, out hf)) { ed.horaFIn = hf; }

            ed.tipoEncuentro = "Publico";

            if (chk_Accesibilidad.Checked) { ed.accesibilidad = "Cerrado"; }
            else{ ed.accesibilidad = "Abierto"; }

            if (string.IsNullOrEmpty(txt_Clave.Text))
                ed.clave = string.Empty;
            else
                ed.clave = txt_Clave.Text;
            
            if (string.IsNullOrEmpty(txt_NombreLugar.Text))
                ed.nombreLP = string.Empty;
            else { ed.nombreLP = txt_NombreLugar.Text; }

            if (string.IsNullOrEmpty(txt_Direccion.Text))
                ed.direccion = string.Empty;
            else { ed.direccion = txt_Direccion.Text; }
            
            EncuentroDeportivoDao.InsertarEncuentroPublico(ed);


        }


        private void crearEventoPrivado()
        {
            EncuentroDeportivoEntidad ed = new EncuentroDeportivoEntidad();


            //  ed.idAUsuario = int.Parse(Session["ID"].ToString()); //( USAR cuando este el Login )
            ed.idAUsuario = 1;
            // string fechaHoy = hoy.ToString("dd/MM/yyyy");
            DateTime hoy = DateTime.Now;
            DateTime fecha;
            if (DateTime.TryParse(hoy.ToString("dd/MM/yyyy"), out fecha))
                ed.fechaCreacionEncuentro = fecha;

            ed.idDeporte = cmb_Deporte.SelectedIndex;
            ed.idComplejo = cmb_Complejo.SelectedIndex;

            DateTime calendario = cld_Fecha.SelectedDate;
            DateTime fi;
            if (DateTime.TryParse(calendario.ToString("dd/MM/yyyy"), out fi))
                ed.fechaInicioEncuentro = fi;

            ed.idEstado = 1; // (habilitado)

            ed.tipoEncuentro = "Privado";

            if (chk_Accesibilidad.Checked) { ed.accesibilidad = "Cerrado"; }
            else { ed.accesibilidad = "Abierto"; }

            if (string.IsNullOrEmpty(txt_Clave.Text))
                ed.clave = string.Empty;
            else
                ed.clave = txt_Clave.Text;

            if (string.IsNullOrEmpty(txt_NombreLugar.Text))
                ed.nombreLP = string.Empty;
            else { ed.nombreLP = txt_NombreLugar.Text; }

            if (string.IsNullOrEmpty(txt_Direccion.Text))
                ed.direccion = string.Empty;
            else { ed.direccion = txt_Direccion.Text; }


            if (string.IsNullOrEmpty(txt_HoraInicio.Text)) {
                DateTime hi;
                if (DateTime.TryParse(txt_HoraInicio.Text, out hi)) { ed.horaInicio = hi; }
            }

            if (string.IsNullOrEmpty(txt_HoraInicio.Text)){
                DateTime hf;
                if (DateTime.TryParse(txt_HoraFin.Text, out hf)) { ed.horaFIn = hf; }
            }

            EncuentroDeportivoDao.InsertarEncuentroPrivado(ed);

        }

        protected void btn_Cancelar_Click(object sender, EventArgs e)
        {

        }

        protected void btn_BuscarHorarios_Click(object sender, EventArgs e)
        {

        }

        private void cargarGrilla() {

        }

        private void cargarDeportes() {
            cmb_Deporte.DataSource = DeporteDao.obtenerDeportes();
            cmb_Deporte.DataValueField = "idDeporte";
            cmb_Deporte.DataValueField = "nombre";
            cmb_Deporte.DataBind();

        }

        private void cargarZonas() {

            //cmb_Zona.DataSource = ZonaDao.obtenerZonas();
            //cmb_Zona.DataValueField = "IdZona";
            //cmb_Zona.DataValueField = "nombre";
            //cmb_Zona.DataBind();
        }
        private void cargarComplejos() {

            cmb_Complejo.DataSource = ComplejoDeportivoDao.obtenerComplejos();
            cmb_Complejo.DataValueField = "idComplejoDeportivo";
            cmb_Complejo.DataValueField = "nombre";
            cmb_Complejo.DataBind();
        }

        private void cargarTipoCanchas() {

        }

        private void cargarBarrios()
        {

            //cmb_Barrio.DataSource = BarrioDao.obtenerBarrios();
            //cmb_Barrio.DataValueField = "IdBarrio";
            //cmb_Barrio.DataValueField = "nombre";
            //cmb_Barrio.DataBind();
        }



        protected int? ID
        {
            get
            {
                if (ViewState["ID"] != null)
                    return (int)ViewState["ID"];
                else
                { return null; }
            }
            set { ViewState["ID"] = value; }
        }


    }
}