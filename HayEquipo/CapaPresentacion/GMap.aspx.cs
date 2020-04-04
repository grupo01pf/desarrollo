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

            if (!IsPostBack)
            {
                Session["idMapa"] = string.Empty;
                Session["idComplejo"] = string.Empty;

               // txt_Latitud.Enabled = true;
               // txt_Longitud.Enabled = true;

                cargarComplejos();
                cargarGrilla();
                
            }

            obtenerCoordenadas();
        }

        private void mostrarUbicacion(int idMapa) {

            Mapa mapa = MapaDao.obtenerMapaByID(idMapa);

            //txt_Latitud.Text = mapa.latitud;
            //txt_Longitud.Text = mapa.longitud; 
            txt_Latitud.Value = mapa.latitud;
            txt_Longitud.Value = mapa.longitud;

        }


        private void cargarComplejos()
        {

            cmb_Complejo.DataSource = ComplejoDeportivoDao.ObtenerComplejos();
            cmb_Complejo.DataValueField = "id";
            cmb_Complejo.DataTextField = "nombre";
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


            //m.latitud = txt_Latitud.Text;            
            //m.longitud = txt_Longitud.Text;
            m.latitud = txt_Latitud.Value;
            m.longitud = txt_Longitud.Value;

            int idMapa =  MapaDao.insertarMapa(m);

            // cd.id = cmb_Complejo.SelectedIndex;
            int cmbID = 0;
            if(int.TryParse(cmb_Complejo.SelectedItem.Value,out cmbID))
                cd.id = cmbID;

            cd.mapa = idMapa;
            ComplejoDeportivoDao.ActualizarMapaComplejo(cd);

            limpiarCampos();
            cargarGrilla();
        }

        protected void btn_Modificar_Click(object sender, EventArgs e)
        {
            Mapa m = new Mapa();      
             
            m.id = int.Parse(Session["idMapa"].ToString());
            //m.latitud = txt_Latitud.Text;
            //m.longitud = txt_Longitud.Text;
            m.latitud = txt_Latitud.Value;
            m.longitud = txt_Longitud.Value;
            MapaDao.modificarMapa(m);

            limpiarCampos();
            cargarGrilla();
        }

        protected void btn_Eliminar_Click(object sender, EventArgs e)
        {

            MapaDao.eliminarMapa(int.Parse(Session["idMapa"].ToString()));
            ComplejoDeportivo cd = new ComplejoDeportivo();
            cd.id = int.Parse(Session["idComplejo"].ToString());
            cd.mapa = null;
            ComplejoDeportivoDao.ActualizarMapaComplejo(cd);

            limpiarCampos();
            cargarGrilla();
        }

        protected void btn_Limpiar_Click(object sender, EventArgs e)
        {
            limpiarCampos();
        }


        private void obtenerCoordenadas(){
            List<MapaQueryDao> listaMapas = MapaDao.obtenerMapas();

           // string str = "[";
            string str = "";
            int contador = 0;


            //foreach (MapaQueryDao m in listaMapas)
            //{
            //    if (contador != listaMapas.Count - 1)
            //    {
            //        str += "{lat:" + m.latitud + ",lon:" + m.longitud + "},";
            //    }
            //    else
            //    {
            //        str += "{lat:" + m.latitud + ",lon:" + m.longitud + "}";
            //    }

            //    contador++;
            //}

            //foreach (MapaQueryDao m in listaMapas)
            //{
            //    if (contador != listaMapas.Count - 1)
            //    {
            //        str += "[" + m.latitud + "," + m.longitud + "],";
            //    }
            //    else
            //    {
            //        str += "[" + m.latitud + "," + m.longitud + "]";
            //    }

            //    contador++;
            //}


            //foreach (MapaQueryDao m in listaMapas)
            //{
            //    if (contador != listaMapas.Count - 1)
            //    {
            //        str += m.latitud + "," + m.longitud + ",";
            //    }
            //    else
            //    {
            //        str +=  m.latitud + "," + m.longitud ;
            //    }

            //    contador++;
            //}


           // str += "]";

            txt_Todos.Text = str;
        }


        protected void gdv_Ubicaciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow fila = gdv_Ubicaciones.SelectedRow;

            //txt_Latitud.Text = fila.Cells[6].Text;
            //txt_Longitud.Text = fila.Cells[7].Text;
            txt_Latitud.Value = fila.Cells[6].Text;
            txt_Longitud.Value = fila.Cells[7].Text;

            Session["idComplejo"] = int.Parse(fila.Cells[1].Text);
            Session["idMapa"] = int.Parse(fila.Cells[2].Text);

            mostrarUbicacion(int.Parse(Session["idMapa"].ToString()));


            //int idMapa = 0;
            //string map = fila.Cells[2].Text;
            //if (int.TryParse(map, out idMapa)) {
            //    Session["idMapa"] = idMapa;
            //    mostrarUbicacion(idMapa);                
            //}               

        }

        private void cargarGrilla() {

            gdv_Ubicaciones.DataSource = MapaDao.obtenerMapas();
            gdv_Ubicaciones.DataKeyNames = new string[] { "id" };
            gdv_Ubicaciones.DataBind();

        }

        private void limpiarCampos() {

            //txt_Latitud.Text = string.Empty;
            //txt_Longitud.Text = string.Empty;
            txt_Latitud.Value = string.Empty;
            txt_Longitud.Value = string.Empty;
        }

       
    }
}