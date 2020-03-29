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
    public partial class GMap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            txt_Latitud.Enabled = true;
            txt_Longitud.Enabled = true;

            cargarComplejos();
            cargarGrilla();
        }


        private void cargarComplejos()
        {

            cmb_Complejo.DataSource = ComplejoDeportivoDao.ObtenerComplejos();
            cmb_Complejo.DataValueField = "id";
            cmb_Complejo.DataValueField = "nombre";
            cmb_Complejo.DataBind();
        }

        protected void btn_Agregar_Click(object sender, EventArgs e)
        {
            Mapa m = new Mapa();
            ComplejoDeportivo cd = new ComplejoDeportivo();

            // ** NO BORRAR **
            //double lat;
            //double lng;
            //if(double.TryParse(txt_Latitud.Text,out lat))
            //    m.latitud = lat;
            //if (double.TryParse(txt_Longitud.Text, out lng))
            //    m.longitud = lng;
            m.latitud = txt_Latitud.Text;
            m.longitud = txt_Longitud.Text;

            int idMapa =  MapaDao.insertarMapa(m);
            
            cd.id = cmb_Complejo.SelectedIndex;
            cd.mapa = idMapa;
            ComplejoDeportivoDao.ActualizarMapaComplejo(cd);

            limpiarCampos();
        }

        protected void btn_Modificar_Click(object sender, EventArgs e)
        {


            limpiarCampos();
        }

        protected void btn_Eliminar_Click(object sender, EventArgs e)
        {


            limpiarCampos();
        }

        protected void btn_Limpiar_Click(object sender, EventArgs e)
        {
            limpiarCampos();
        }

        protected void gdv_Ubicaciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow fila = gdv_Ubicaciones.SelectedRow;

            txt_Latitud.Text = fila.Cells[3].Text;
            txt_Longitud.Text = fila.Cells[3].Text;
        }

        private void cargarGrilla() {

            gdv_Ubicaciones.DataSource = MapaDao.obtenerMapas();
            gdv_Ubicaciones.DataKeyNames = new string[] { "id" };
            gdv_Ubicaciones.DataBind();
        }

        private void limpiarCampos() {

            txt_Latitud.Text = string.Empty;
            txt_Longitud.Text = string.Empty;
        }
    }
}