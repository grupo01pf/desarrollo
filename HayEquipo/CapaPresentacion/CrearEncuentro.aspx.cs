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
                Response.Redirect("EncuentroPublico.aspx");
            }else
            {
                Response.Redirect("EncuentroPrivado.aspx");
            }
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
    }
}