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
                cargarZonas();
                cargarComplejos();
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

            
            // ed.idEncuentroDeportivo = null;
            //  ed.idAUsuario = int.Parse(Session["ID"].ToString());
            ed.idAUsuario = 1;
            
            DateTime hoy = DateTime.Now;
           // string fechaHoy = hoy.ToString("dd/MM/yyyy");
            DateTime fecha;
            if (DateTime.TryParse(hoy.ToString("dd/MM/yyyy"), out fecha))
            ed.fechaCreacionEncuentro = fecha;

            ed.idDeporte = cmb_Deporte.SelectedIndex;
          //  ed.idComplejo = cmb_Complejo.SelectedIndex;
            ed.calle = txt_Direccion.Text;
            //  ed.numeroCalle = 0;
            // ed.idEquipo 

            DateTime calendario = cld_Fecha.SelectedDate;
            DateTime fi;
            if (DateTime.TryParse(calendario.ToString("dd/MM/yyyy"), out fi))
                ed.fechaInicioEncuentro = fi;
           
            //  ed.fechaFinEncuentro 

            ed.idEstado = 1; //habilitado

           // string hi = txt_HoraInicio.Text;
           DateTime hi;
            if (DateTime.TryParse(txt_HoraInicio.Text, out hi)) { ed.horaInicio = hi; }
            

           DateTime hf;
            if (DateTime.TryParse(txt_HoraFin.Text, out hf)) { ed.horaFIn = hf; }
               

            if (rdb_Publico.Checked) { ed.tipoEncuentro = 1; }
            else { ed.tipoEncuentro = 2; }
                

            if (chk_EncuentroPrivado.Checked) { ed.accesibilidad = 2; }
            else { ed.accesibilidad = 1; }


            ed.clave = txt_ClaveEncuentro.Text;
         

            EncuentroDeportivoDao.InsertarEncuentroPublico(ed);

    }

        private void crearEventoPrivado()
        {


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

            cmb_Zona.DataSource = ZonaDao.obtenerZonas();
            cmb_Zona.DataValueField = "IdZona";
            cmb_Zona.DataValueField = "nombre";
            cmb_Zona.DataBind();
        }
        private void cargarComplejos() {

            cmb_Complejo.DataSource = ComplejoDeportivoDao.obtenerComplejos();
            cmb_Complejo.DataValueField = "idComplejoDeportivo";
            cmb_Complejo.DataValueField = "nombre";
            cmb_Complejo.DataBind();
        }

        private void cargarTipoCanchas() {

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