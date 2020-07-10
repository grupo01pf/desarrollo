using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidades;
using CapaDao;
using System.Drawing;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace CapaPresentacion
{
    public partial class PerfilDeportistas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            link_nombreUsuario2.Text = Session["Usuario"].ToString();
            if (UsuarioDao.existeImagen(Session["ID"].ToString()) != false)
            {
                Image1.ImageUrl = "~/imagen.aspx?id=" + Session["ID"].ToString();
                cambiarImagen();
            }
            if (DeportistaDao.ExisteDeportista(Session["ID"].ToString()))
            {
                if (btnActualizar.Visible == false)
                {
                    DatosCargadosDeportista();
                }
            }

            else
            {
                cargarTipoDocumento();
            }

            gdv_EncuentrosDeportista.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPorId(Session["ID"].ToString());
            gdv_EncuentrosDeportista.DataKeyNames = new string[] { "idEncuentroDeportivo" };
            gdv_EncuentrosDeportista.DataBind();
            manejarValoracion();
            //ReporteDeportesxFecha();

            actualizarNotificaciones();
            mostrarNotificaciones();
            mostrarSolicitudes();

            cargarListaAmigos();

            cargarBarrios();
        }

        private void cargarTipoDocumento()
        {
            List<TipoDocumentoEntidad> tiposDocumento = TipoDocumentoDao.obtenerTiposDocumento();

            ddl_TipoDocumento.DataSource = null;

            ddl_TipoDocumento.DataTextField = "nombre";

            ddl_TipoDocumento.DataValueField = "idTipoDocumento";

            ddl_TipoDocumento.DataSource = tiposDocumento;

            ddl_TipoDocumento.DataBind();
        }

        protected int? ID
        {
            get
            {
                if (ViewState["ID"] != null)
                    return (int)ViewState["ID"];
                else
                {
                    return null;
                }
            }
            set { ViewState["ID"] = value; }
        }


        private DeportistaEntidad GetEntity()
        {
            DeportistaEntidad objDeportista = new DeportistaEntidad();
            objDeportista.apellido = txt_Apellidos.Text;
            objDeportista.nombres = txt_Nombres.Text;
            objDeportista.idTipoDocumento = ddl_TipoDocumento.SelectedIndex;
            int tipoDoc;
            if (int.TryParse(ddl_TipoDocumento.Text, out tipoDoc))
                objDeportista.idTipoDocumento = tipoDoc;
            objDeportista.numeroDocumento = Convert.ToInt32(txt_NumeroDocumento.Text);
            objDeportista.sexo = txt_Sexo.Text;
            objDeportista.fechaNacimiento = Convert.ToDateTime(txt_FechaNacimiento.Text);
            objDeportista.numeroTelefono = Convert.ToInt32(txt_Telefono.Text);
            objDeportista.idUsuario = Convert.ToInt32(Session["id"]) ;
            objDeportista.promedioEstrellas = 0;
            objDeportista.idEstado = 1;
            int barrio = 0;
            if (int.TryParse(cmb_Barrio.SelectedItem.Value, out barrio))
                objDeportista.idBarrio = barrio;

            return objDeportista;
        }



        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            DeportistaEntidad deportista = GetEntity();

            DeportistaDao.InsertarDeportista(deportista);
            txt_Apellidos.Enabled = false;
            txt_Nombres.Enabled = false;
            txt_FechaNacimiento.Enabled = false;
            txt_NumeroDocumento.Enabled = false;
            txt_Sexo.Enabled = false;
            txt_Telefono.Enabled = false;
            ddl_TipoDocumento.Visible = false;
            lbl_TipoDocumento.Visible = false;
            btnGuardar.Visible = false;
            btnCambiar.Visible = true;
            cmb_Barrio.SelectedIndex = 0;
            lblmsj.Text = "Datos Guardados Exitosamente";


        }
        protected void btnCambiar_Click(object sender, EventArgs e)
        {
            txt_Apellidos.Enabled = true;
            txt_Nombres.Enabled = true;
            txt_FechaNacimiento.Enabled = true;
            txt_NumeroDocumento.Enabled = true;
            txt_Sexo.Enabled = true;
            txt_Telefono.Enabled = true;
            ddl_TipoDocumento.Visible = true;
            lbl_TipoDocumento.Visible = true;
            cargarTipoDocumento();
            btnActualizar.Visible = true;
            btnCambiar.Visible = false;
        }
        protected void btnActualizar_Click(object sender, EventArgs e)
        {

            string ape = txt_Apellidos.Text;
            string nom = txt_Nombres.Text;
            int tipoDoc;
            int.TryParse(ddl_TipoDocumento.Text, out tipoDoc);
            string doc = txt_NumeroDocumento.Text;
            string sexo = txt_Sexo.Text;
            string fc = txt_FechaNacimiento.Text;
            string tel = txt_Telefono.Text;
            DeportistaDao.ActualizarDeportista(Session["ID"].ToString(),ape,nom,tipoDoc.ToString(),doc,sexo,fc,tel);
            txt_Apellidos.Enabled = false;
            txt_Nombres.Enabled = false;
            txt_FechaNacimiento.Enabled = false;
            txt_NumeroDocumento.Enabled = false;
            txt_Sexo.Enabled = false;
            txt_Telefono.Enabled = false;
            ddl_TipoDocumento.Visible = false;
            lbl_TipoDocumento.Visible = false;
            btnActualizar.Visible = false;
            btnCambiar.Visible = true;
            lblmsj.Text = "Datos Actualizados Exitosamente";
        }

        protected void btnGuardarImagen_Click(object sender, EventArgs e)
        {
            if (FileUploadAvatar.HasFile)
            {
                //obtener datos de la imagen
                int tam = FileUploadAvatar.PostedFile.ContentLength;
                byte[] ImagenOriginal = new byte[tam];

                FileUploadAvatar.PostedFile.InputStream.Read(ImagenOriginal, 0, tam);
                Bitmap ImagenOriginalBinaria = new Bitmap(FileUploadAvatar.PostedFile.InputStream);

                //insertar en BD
                UsuarioDao.AgregarImagen(Session["ID"].ToString(), ImagenOriginal);
                lblestado.Text = "Imagen Guardada Exitosamente";
                //string ImagenDataURL64 = "data:image/jpg;base64," + Convert.ToBase64String(ImagenOriginal);
                //Image1.ImageUrl = ImagenDataURL64;
                Image1.ImageUrl = "~/imagen.aspx?id=" + Session["ID"].ToString();
                FileUploadAvatar.Visible = false;
                btn_guardarImagen.Visible = false;
                btn_CambiarImagen.Visible = true;
            }
            else
            {
                lblestado.Text = "Coloque un Archivo de imagen valido";
            }

        }
        protected void btnCambiarImagen_Click(object sender, EventArgs e)
        {
            FileUploadAvatar.Visible = true;
            btn_guardarImagen.Visible = true;
            btn_CambiarImagen.Visible = false;
        }


        public void DatosCargadosDeportista()
        {
            Deportista deportista = DeportistaDao.ObtenerDeportistaPorID(Session["ID"].ToString());
            txt_Nombres.Text = deportista.nombres;
            txt_Apellidos.Text = deportista.apellido;
            txt_NumeroDocumento.Text = deportista.nroDoc.ToString();
            txt_Sexo.Text = deportista.sexo.ToString();
            txt_FechaNacimiento.Text = deportista.fechaNacimiento.ToString();
            txt_Telefono.Text = deportista.nroTelefono.ToString();
            txt_Apellidos.Enabled = false;
            txt_Nombres.Enabled = false;
            txt_FechaNacimiento.Enabled = false;
            txt_NumeroDocumento.Enabled = false;
            txt_Sexo.Enabled = false;
            txt_Telefono.Enabled = false;
            ddl_TipoDocumento.Visible = false;
            lbl_TipoDocumento.Visible = false;
            btnGuardar.Visible = false;
            btnCambiar.Visible = true;
        }


        protected void gdv_EncuentrosDisponibles_SelectedIndexChanged(object sender, EventArgs e)
        {

            GridViewRow fila = gdv_EncuentrosDeportista.SelectedRow;


            string tipoEncuentro = fila.Cells[2].Text;
            Session["idEncuentro"] = int.Parse(gdv_EncuentrosDeportista.SelectedDataKey.Value.ToString());

            //string tipoEncuentro = fila.Cells[2].Text; ;

            //  lbl_Prueba.Text = tipoEncuentro;


            if (tipoEncuentro.Equals("Publico"))
            {
                Response.Redirect("EncuentroPublico.aspx");

            }


            else
            {
                Response.Redirect("EncuentroPrivado.aspx");

            }


        }
        public void cambiarImagen()
        {
            FileUploadAvatar.Visible = false;
            btn_guardarImagen.Visible = false;
            btn_CambiarImagen.Visible = true;
        }
        //protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    lblmsjrb1.Text = "Calificacion seleccionada es: " + RadioButtonList1.SelectedValue;
        //}
        public void manejarValoracion()
        {
            if (ValoracionDao.existePromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "4") == true)
            {
                RadioButtonList1.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "4"));
                foreach (ListItem item in RadioButtonList1.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "4") && item.Text == "★")
                    {
                        item.Attributes.CssStyle.Add("color", "orange");
                    }

                }
                RadioButtonList1.Enabled = false;
                lblmsjrb1.Text = "Calificacion Promedio de Comportamiento es: " + RadioButtonList1.SelectedValue + " Puntos";
            }
            else
            {
                RadioButtonList1.Enabled = false;
                lblmsjrb1.Text = "Usted no ha sido calificado en esta seccion";

            }
            if (ValoracionDao.existePromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "5") == true)
            {
                RadioButtonList2.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "5"));
                foreach (ListItem item in RadioButtonList2.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "5") && item.Text == "★")
                    {
                        item.Attributes.CssStyle.Add("color", "orange");
                    }

                }
                RadioButtonList2.Enabled = false;
                lblmsjrb2.Text = "Calificacion Promedio de Puntualidad es: " + RadioButtonList2.SelectedValue + " Puntos";

            }
            else
            {
                RadioButtonList2.Enabled = false;
                lblmsjrb2.Text = "Usted no ha sido calificado en esta seccion";
            }
            if (ValoracionDao.existePromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "6") == true)
            {
                RadioButtonList3.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "6"));
                foreach (ListItem item in RadioButtonList3.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "6") && item.Text == "★")
                    {
                        item.Attributes.CssStyle.Add("color", "orange");
                    }

                }
                RadioButtonList3.Enabled = false;
                lblmsjrb3.Text = "Calificacion Promedio de Habilidad Deportiva es: " + RadioButtonList3.SelectedValue + " Puntos";

            }
            else
            {
                RadioButtonList3.Enabled = false;
                lblmsjrb3.Text = "Usted no ha sido calificado en esta seccion";
            }
            if(ValoracionDao.existePromedioGeneral(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString())) == true){
            RadioButtonList4.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromediogeneral(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString())));
            foreach (ListItem item in RadioButtonList4.Items)
            {
                if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromediogeneral(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString())) && item.Text == "★")
                {
                    item.Attributes.CssStyle.Add("color", "orange");
                }

            }
            RadioButtonList4.Enabled = false;
            lblmsjrb4.Text = "Calificacion Promedio General es: " + RadioButtonList4.SelectedValue + " Puntos";
            }else{
                RadioButtonList4.Enabled = false;
                lblmsjrb4.Text = "Usted no ha sido calificado";
            }
        }



        public string obtenerDatosBar()
        {
            DataTable Datos = new DataTable();
            Datos.Columns.Add(new DataColumn("Mes",typeof(string)));
            Datos.Columns.Add(new DataColumn("Jugados", typeof(string)));
            Datos.Columns.Add(new DataColumn("Organizados", typeof(string)));


            Datos.Rows.Add(new object[] { "Ene.", Estadisticas.obtenerCantidadPartidos("01", Session["ID"].ToString(),ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("01", Session["ID"].ToString(), ddl_anios.Text) });
            Datos.Rows.Add(new object[] { "Feb.", Estadisticas.obtenerCantidadPartidos("02", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("02", Session["ID"].ToString(), ddl_anios.Text) });
            Datos.Rows.Add(new object[] { "Mar.", Estadisticas.obtenerCantidadPartidos("03", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("03", Session["ID"].ToString(), ddl_anios.Text) });
            Datos.Rows.Add(new object[] { "Abr.", Estadisticas.obtenerCantidadPartidos("04", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("04", Session["ID"].ToString(), ddl_anios.Text) });
            Datos.Rows.Add(new object[] { "May.", Estadisticas.obtenerCantidadPartidos("05", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("05", Session["ID"].ToString(), ddl_anios.Text) });
            Datos.Rows.Add(new object[] { "Jun.", Estadisticas.obtenerCantidadPartidos("06", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("06", Session["ID"].ToString(), ddl_anios.Text) });
            Datos.Rows.Add(new object[] { "Jul.", Estadisticas.obtenerCantidadPartidos("07", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("07", Session["ID"].ToString(), ddl_anios.Text) });
            Datos.Rows.Add(new object[] { "Ago.", Estadisticas.obtenerCantidadPartidos("08", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("08", Session["ID"].ToString(), ddl_anios.Text) });
            Datos.Rows.Add(new object[] { "Sep.", Estadisticas.obtenerCantidadPartidos("09", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("09", Session["ID"].ToString(), ddl_anios.Text) });
            Datos.Rows.Add(new object[] { "Oct.", Estadisticas.obtenerCantidadPartidos("10", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("10", Session["ID"].ToString(), ddl_anios.Text) });
            Datos.Rows.Add(new object[] { "Nov.", Estadisticas.obtenerCantidadPartidos("11", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("11", Session["ID"].ToString(), ddl_anios.Text) });
            Datos.Rows.Add(new object[] { "Dic.", Estadisticas.obtenerCantidadPartidos("12", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("12", Session["ID"].ToString(), ddl_anios.Text) });

            string strDatos;
            strDatos = "[";
            foreach(DataRow dr in Datos.Rows)
            {
                strDatos = strDatos + "[";
                strDatos = strDatos + "'" + dr[0] + "'" + "," +
                    dr[1].ToString().Replace(",", ".") + "," +
                     dr[2].ToString().Replace(",", ".");

                strDatos = strDatos + "],";
            }
            strDatos = strDatos + "],";
            return strDatos;
        }

        //public void ReporteDeportesxFecha()
        //{
        //   ReporteCantidadDeportesxFecha reporte = new ReporteCantidadDeportesxFecha();
        //    reporte.SetParameterValue("@Complejo",1);
        //    CrystalReportViewer1.ReportSource = reporte;

        //}

        protected void gdv_Notificaciones_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow fila = gdv_Notificaciones.SelectedRow;
            // string idEncuentro = fila.Cells[4].Text;
            // int id = int.Parse(fila.Cells[4].Text);
            string idEncuentro = Convert.ToString(fila.RowIndex);
            int id = fila.RowIndex;
            List<NotificacionQueryEntidad> lista = NotificacionDao.mostrarNotificaciones(int.Parse(Session["ID"].ToString()));
            int[] idEncuentrosDeportivos = new int[lista.Count];
            int i = 0;
            foreach (NotificacionQueryEntidad n in lista)
            {
                idEncuentrosDeportivos[i] = n.idEncuentro;
                i++;
            }
            idEncuentro = idEncuentrosDeportivos[id].ToString();

            if (!idEncuentro.Equals("0")) {

                int idNotif = int.Parse(gdv_Notificaciones.SelectedDataKey.Value.ToString());
                NotificacionDao.actualizarEstadoNotificacion(9, idNotif);

                Session["idEncuentro"] = idEncuentrosDeportivos[id];

                if (EncuentroDeportivioQueryDao.obtenerTipoEncuentroPorId(idEncuentro) == "Privado")
                {
                    //  Session["idEncuentro"] = id;
                    // Session["idEncuentro"] = idEncuentrosDeportivos[id];
                    Response.Redirect("EncuentroPrivado.aspx");
                }
                if (EncuentroDeportivioQueryDao.obtenerTipoEncuentroPorId(idEncuentro) == "Publico")
                {
                    //  Session["idEncuentro"] = id;
                    // Session["idEncuentro"] = idEncuentrosDeportivos[id];
                    Response.Redirect("EncuentroPublico.aspx");
                }
            }
            
            
        }

        private void actualizarNotificaciones()
        {

            lbl_Notificacion.Text = (NotificacionDao.contadorNotificaciones(int.Parse(Session["ID"].ToString()))).ToString();
            lbl_Contactos.Text = (NotificacionDao.contadorNotificacionesSolicitudes(int.Parse(Session["ID"].ToString()))).ToString();
        }

        private void mostrarNotificaciones()
        {
            gdv_Notificaciones.DataSource = NotificacionDao.mostrarNotificaciones(int.Parse(Session["ID"].ToString()));
            gdv_Notificaciones.DataKeyNames = new string[] { "idNotificacion" };
            gdv_Notificaciones.DataBind();
        }

        protected void gdv_Notificaciones_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {            
            int idNotif = int.Parse(gdv_Notificaciones.DataKeys[e.RowIndex].Value.ToString());

            NotificacionDao.actualizarEstadoNotificacion(11, idNotif);

            mostrarNotificaciones();
            actualizarNotificaciones();
        }

        private void cargarListaAmigos()
        {
            List<Usuario> listaUsuarios = UsuarioDao.getAmigos(int.Parse(Session["ID"].ToString()));
            var lista = listaUsuarios.OrderBy(u => u.nombre);

            //gdv_Invitar.DataSource = UsuarioDao.obtenerUsuarios(int.Parse(Session["ID"].ToString()));
            gdv_Contactos.DataSource = lista;
            gdv_Contactos.DataKeyNames = new string[] { "id" };
            gdv_Contactos.DataBind();
        }

        protected void gdv_Contactos_SelectedIndexChanged(object sender, EventArgs e)
        {
            // ir al perfil del amigo seleccionado
            GridViewRow fila = gdv_Contactos.SelectedRow;
        }
        protected void gdv_Contactos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int idNotif = int.Parse(gdv_Contactos.DataKeys[e.RowIndex].Value.ToString());

            
        }

        protected void gdv_Solicitudes_SelectedIndexChanged(object sender, EventArgs e)
        {
            // IR AL PERFIL DEL DEPORTISTA

            GridViewRow fila = gdv_Solicitudes.SelectedRow;
            
        }

        protected void gdv_Solicitudes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // ELIMINAR SOLICITUD

            int idNotif = int.Parse(gdv_Solicitudes.DataKeys[e.RowIndex].Value.ToString());

            NotificacionDao.actualizarEstadoNotificacion(11, idNotif);

            mostrarSolicitudes();
            actualizarNotificaciones();
        }

        protected void gdv_Solicitudes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Aceptar")
            {
                // ACEPTAR SOLICITUD
                int index = Convert.ToInt32(e.CommandArgument);                
                GridViewRow fila = gdv_Solicitudes.Rows[index];

                int idNotif = int.Parse(gdv_Solicitudes.DataKeys[index].Value.ToString());
                

                int idUsuario = int.Parse(fila.Cells[8].Text);
                int idAmigo = int.Parse(fila.Cells[9].Text);
                string receptor = fila.Cells[10].Text;
                UsuarioDao.aceptarSolicitud(idUsuario,idAmigo);
                UsuarioDao.aceptarSolicitud(idAmigo, idUsuario);

                // string texto = receptor + " ha aceptado tu solicitud";

                NotificacionDao.actualizarEstadoNotificacion(13, idNotif);

                mostrarSolicitudes();
                actualizarNotificaciones();

                cargarListaAmigos();

            }
            if (e.CommandName == "Cancelar")
            {
                //// ELIMINAR SOLICITUD (Funciona)

                //int index = Convert.ToInt32(e.CommandArgument);
                //GridViewRow fila = gdv_Solicitudes.Rows[index];
                //int idNotif = int.Parse(gdv_Solicitudes.DataKeys[index].Value.ToString());

                //NotificacionDao.actualizarEstadoNotificacion(11, idNotif);

                //mostrarSolicitudes();
                //actualizarNotificaciones();
            }
         }

        private void mostrarSolicitudes() {

            gdv_Solicitudes.DataSource = NotificacionDao.mostrarNotificacionesSolicitudes(int.Parse(Session["ID"].ToString()));
            gdv_Solicitudes.DataKeyNames = new string[] { "idNotificacion" };
            gdv_Solicitudes.DataBind();

            //gdv_Solicitudes.Columns[8].Visible = false;
            //gdv_Solicitudes.Columns[9].Visible = false;
        }
       

        private void cargarBarrios()
        {
            cmb_Barrio.Items.Clear();
            cmb_Barrio.Items.Insert(0, new ListItem("Sin Seleccionar", ""));
            // cmb_Barrio.DataSource = BarrioDao.obtenerBarrios();
            cmb_Barrio.DataSource = BarrioDao.obtenerBarriosOrdenados();
            cmb_Barrio.DataValueField = "id";
            cmb_Barrio.DataTextField = "nombre";
            cmb_Barrio.DataBind();
        }

       
    }
}
