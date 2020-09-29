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
            if (!IsPostBack)
            {
                if (DeportistaDao.ExisteDeportista(Session["ID"].ToString()))
                {
                    if (btnActualizar.Visible == false)
                    {
                        cargarSexo();
                        cargarBarrios();
                        cargarDeportes();
                        DatosCargadosDeportista();

                    }
                }

                else
                {
                    cargarSexo2();
                    cargarBarrios2();
                    cargarDeportes2();
                    cargarTipoDocumento();
                }
            }
            gdv_EncuentrosDeportista.DataSource = EncuentroDeportivioQueryDao.obtenerEncuentrosDeportivosPorId(Session["ID"].ToString());
            gdv_EncuentrosDeportista.DataKeyNames = new string[] { "idEncuentroDeportivo" };
            gdv_EncuentrosDeportista.DataBind();
            manejarValoracion();
            //ReporteDeportesxFecha();

            actualizarNotificaciones();
            mostrarNotificaciones();
            mostrarSolicitudes();

            cargarListaContactos();


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


        private void cargarBarrios2()
        {
            List<BarrioEntidad> barrios = BarrioDao.obtenerBarrios2();

            cmb_Barrio.DataSource = null;

            cmb_Barrio.DataTextField = "nombre";

            cmb_Barrio.DataValueField = "idBarrio";

            cmb_Barrio.DataSource = barrios;

            cmb_Barrio.DataBind();
        }

        public void cargarDeportes2()
        {
            List<DeporteEntidad> deportes = DeporteDao.obtenerDeportes2();

            cmb_DeportePrederido.DataSource = null;

            cmb_DeportePrederido.DataTextField = "nombre";

            cmb_DeportePrederido.DataValueField = "idDeporte";

            cmb_DeportePrederido.DataSource = deportes;

            cmb_DeportePrederido.DataBind();
        }

        public void cargarSexo2()
        {
            List<SexoEntidad> sexo = DeportistaDao.obtenerSexo2();

            cmb_sexo.DataSource = null;

            cmb_sexo.DataTextField = "nombre";

            cmb_sexo.DataValueField = "idSexo";

            cmb_sexo.DataSource = sexo;

            cmb_sexo.DataBind();
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
            objDeportista.sexo = cmb_sexo.SelectedIndex;
            int sexo;
            if (int.TryParse(cmb_sexo.Text, out sexo))
                objDeportista.sexo = sexo;
            objDeportista.fechaNacimiento = Convert.ToDateTime(txt_FechaNacimiento.Text);
            objDeportista.numeroTelefono = Convert.ToInt64(txt_Telefono.Text);
            objDeportista.idUsuario = Convert.ToInt32(Session["id"]) ;
            objDeportista.promedioEstrellas = 0;
            objDeportista.idEstado = 1;
            objDeportista.idBarrio = cmb_Barrio.SelectedIndex;
            int barrio;
            if (int.TryParse(cmb_Barrio.Text, out barrio))
                objDeportista.idBarrio = barrio;
            objDeportista.idDeportePreferido = cmb_DeportePrederido.SelectedIndex;
            int DeportePreferido;
            if (int.TryParse(cmb_DeportePrederido.Text, out DeportePreferido))
                objDeportista.idDeportePreferido = DeportePreferido;

            return objDeportista;
        }



        protected void btnGuardar_Click(object sender, EventArgs e)
        {
          
            if (txt_Apellidos.Text != "" && txt_Nombres.Text != "" && txt_FechaNacimiento.Text != "" && txt_NumeroDocumento.Text != ""
                 && txt_Telefono.Text != "" 
               ) {
                DeportistaEntidad deportista = GetEntity();

                DeportistaDao.InsertarDeportista(deportista);
            txt_Apellidos.Enabled = false;
            txt_Nombres.Enabled = false;
            txt_FechaNacimiento.Enabled = false;
            txt_NumeroDocumento.Enabled = false;
            cmb_sexo.Enabled = false;
            txt_Telefono.Enabled = false;
            ddl_TipoDocumento.Visible = false;
            lbl_TipoDocumento.Visible = false;
            btnGuardar.Visible = false;
            btnCambiar.Visible = true;
            cmb_Barrio.Enabled = false;
            cmb_DeportePrederido.Enabled = false;
            calendario.Visible = false;
            cmb_Barrio.CssClass = "";
            cmb_DeportePrederido.CssClass = "";
            cmb_sexo.CssClass = "";
            lblmsj.Text = "Datos Guardados Exitosamente";
            }else
            {
                Page_Load(sender, e);
                lblmsj.Text = "Todos los campos deben ser completados";
            }

        }
        protected void btnCambiar_Click(object sender, EventArgs e)
        {
            txt_Apellidos.Enabled = true;
            txt_Nombres.Enabled = true;
            txt_FechaNacimiento.Enabled = true;
            txt_NumeroDocumento.Enabled = true;
            cmb_sexo.Enabled = true;
            txt_Telefono.Enabled = true;
            ddl_TipoDocumento.Visible = true;
            lbl_TipoDocumento.Visible = true;
            cargarTipoDocumento();
            cargarSexo();
            cargarBarrios();
            cargarDeportes();
            btnActualizar.Visible = true;
            btnCambiar.Visible = false;
            cmb_Barrio.Enabled = true;
            cmb_DeportePrederido.Enabled = true;
            calendario.Visible = true;
            cmb_Barrio.CssClass = "form-control";
            cmb_DeportePrederido.CssClass = "form-control";
            cmb_sexo.CssClass = "form-control";
        }
        protected void btnActualizar_Click(object sender, EventArgs e)
        {

            string ape = txt_Apellidos.Text;
            string nom = txt_Nombres.Text;
            int tipoDoc;
            int.TryParse(ddl_TipoDocumento.Text, out tipoDoc);
            string doc = txt_NumeroDocumento.Text;
            int sexo = 0;
            int.TryParse(cmb_sexo.SelectedItem.Value, out sexo);
            string fc = txt_FechaNacimiento.Text;
            string tel = txt_Telefono.Text;
            int barrio = 0;
            int.TryParse(cmb_Barrio.SelectedItem.Value,  out barrio);
            int DeportePreferido = 0;
            int.TryParse(cmb_DeportePrederido.SelectedItem.Value, out DeportePreferido);
            DeportistaDao.ActualizarDeportista(Session["ID"].ToString(),ape,nom,tipoDoc.ToString(),doc,sexo,fc,tel,barrio,DeportePreferido);
            txt_Apellidos.Enabled = false;
            txt_Nombres.Enabled = false;
            txt_FechaNacimiento.Enabled = false;
            txt_NumeroDocumento.Enabled = false;
            cmb_sexo.Enabled = false;
            txt_Telefono.Enabled = false;
            ddl_TipoDocumento.Visible = false;
            lbl_TipoDocumento.Visible = false;
            btnActualizar.Visible = false;
            btnCambiar.Visible = true;
            cmb_Barrio.Enabled = false;
            cmb_DeportePrederido.Enabled = false;
            calendario.Visible = false;
            cmb_Barrio.CssClass = "";
            cmb_DeportePrederido.CssClass = "";
            cmb_sexo.CssClass = "";
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
            cmb_sexo.Text = deportista.sexo.ToString();
            DateTime fecha = Convert.ToDateTime(deportista.fechaNacimiento.ToString());
            txt_FechaNacimiento.Text = fecha.ToString("dd/MM/yyyy");
            txt_Telefono.Text = deportista.nroTelefono.ToString();
            txt_Apellidos.Enabled = false;
            txt_Nombres.Enabled = false;
            txt_FechaNacimiento.Enabled = false;
            txt_NumeroDocumento.Enabled = false;
            cmb_sexo.Enabled = false;
            txt_Telefono.Enabled = false;
            ddl_TipoDocumento.Visible = false;
            lbl_TipoDocumento.Visible = false;
            btnGuardar.Visible = false;
            btnCambiar.Visible = true;
            calendario.Visible = false;
            cmb_Barrio.CssClass = "";
            cmb_DeportePrederido.CssClass = "";
            cmb_sexo.CssClass = "";

            cmb_Barrio.SelectedIndex = deportista.idBarrio.Value;
            cmb_DeportePrederido.SelectedIndex = deportista.idDeportePreferido.Value;
            cmb_Barrio.Enabled = false;
            cmb_DeportePrederido.Enabled = false;
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
            if (ValoracionDao.existePromedioxid(Session["ID"].ToString(), "4") == true)
            {
                RadioButtonList1.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(Session["ID"].ToString(), "4"));
                foreach (ListItem item in RadioButtonList1.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(Session["ID"].ToString(), "4") && item.Text == "★")
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
            if (ValoracionDao.existePromedioxid(Session["ID"].ToString(), "5") == true)
            {
                RadioButtonList2.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(Session["ID"].ToString(), "5"));
                foreach (ListItem item in RadioButtonList2.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(Session["ID"].ToString(), "5") && item.Text == "★")
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
            if (ValoracionDao.existePromedioxid(Session["ID"].ToString(), "6") == true)
            {
                RadioButtonList3.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(Session["ID"].ToString(), "6"));
                foreach (ListItem item in RadioButtonList3.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(Session["ID"].ToString(), "6") && item.Text == "★")
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
            if(ValoracionDao.existePromedioGeneral(Session["ID"].ToString()) == true){
            RadioButtonList4.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromediogeneral(Session["ID"].ToString()));
            foreach (ListItem item in RadioButtonList4.Items)
            {
                if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromediogeneral(Session["ID"].ToString()) && item.Text == "★")
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



        //public string obtenerDatosBar()
        //{
        //    DataTable Datos = new DataTable();
        //    Datos.Columns.Add(new DataColumn("Mes",typeof(string)));
        //    Datos.Columns.Add(new DataColumn("Jugados", typeof(string)));
        //    Datos.Columns.Add(new DataColumn("Organizados", typeof(string)));


        //    Datos.Rows.Add(new object[] { "Ene.", Estadisticas.obtenerCantidadPartidos("01", Session["ID"].ToString(),ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("01", Session["ID"].ToString(), ddl_anios.Text) });
        //    Datos.Rows.Add(new object[] { "Feb.", Estadisticas.obtenerCantidadPartidos("02", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("02", Session["ID"].ToString(), ddl_anios.Text) });
        //    Datos.Rows.Add(new object[] { "Mar.", Estadisticas.obtenerCantidadPartidos("03", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("03", Session["ID"].ToString(), ddl_anios.Text) });
        //    Datos.Rows.Add(new object[] { "Abr.", Estadisticas.obtenerCantidadPartidos("04", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("04", Session["ID"].ToString(), ddl_anios.Text) });
        //    Datos.Rows.Add(new object[] { "May.", Estadisticas.obtenerCantidadPartidos("05", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("05", Session["ID"].ToString(), ddl_anios.Text) });
        //    Datos.Rows.Add(new object[] { "Jun.", Estadisticas.obtenerCantidadPartidos("06", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("06", Session["ID"].ToString(), ddl_anios.Text) });
        //    Datos.Rows.Add(new object[] { "Jul.", Estadisticas.obtenerCantidadPartidos("07", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("07", Session["ID"].ToString(), ddl_anios.Text) });
        //    Datos.Rows.Add(new object[] { "Ago.", Estadisticas.obtenerCantidadPartidos("08", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("08", Session["ID"].ToString(), ddl_anios.Text) });
        //    Datos.Rows.Add(new object[] { "Sep.", Estadisticas.obtenerCantidadPartidos("09", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("09", Session["ID"].ToString(), ddl_anios.Text) });
        //    Datos.Rows.Add(new object[] { "Oct.", Estadisticas.obtenerCantidadPartidos("10", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("10", Session["ID"].ToString(), ddl_anios.Text) });
        //    Datos.Rows.Add(new object[] { "Nov.", Estadisticas.obtenerCantidadPartidos("11", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("11", Session["ID"].ToString(), ddl_anios.Text) });
        //    Datos.Rows.Add(new object[] { "Dic.", Estadisticas.obtenerCantidadPartidos("12", Session["ID"].ToString(), ddl_anios.Text), Estadisticas.obtenerCantidadPartidosAdmin("12", Session["ID"].ToString(), ddl_anios.Text) });

        //    string strDatos;
        //    strDatos = "[";
        //    foreach(DataRow dr in Datos.Rows)
        //    {
        //        strDatos = strDatos + "[";
        //        strDatos = strDatos + "'" + dr[0] + "'" + "," +
        //            dr[1].ToString().Replace(",", ".") + "," +
        //             dr[2].ToString().Replace(",", ".");

        //        strDatos = strDatos + "],";
        //    }
        //    strDatos = strDatos + "],";
        //    return strDatos;
        //}

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
            lbl_Solicitudes.Text = (NotificacionDao.contadorNotificacionesSolicitudes(int.Parse(Session["ID"].ToString()))).ToString();

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

        private void cargarListaContactos()
        {
            List<Usuario> listaUsuarios = UsuarioDao.getAmigos(int.Parse(Session["ID"].ToString()));
            var lista = listaUsuarios.OrderBy(u => u.nombre);

            //gdv_Invitar.DataSource = UsuarioDao.obtenerUsuarios(int.Parse(Session["ID"].ToString()));
            gdv_Contactos.DataSource = lista;
            gdv_Contactos.DataKeyNames = new string[] { "id" };
            gdv_Contactos.DataBind();

            lbl_Contactos.Text = lista.Count().ToString();
        }

        protected void gdv_Contactos_SelectedIndexChanged(object sender, EventArgs e)
        {
            // ir al perfil del amigo seleccionado
            //   GridViewRow fila = gdv_Contactos.SelectedRow;

            Session["idOtroPerfil"] = int.Parse(gdv_Contactos.SelectedDataKey.Value.ToString());
            Response.Redirect("PerfilOtrosDeportistas.aspx");

        }
        protected void gdv_Contactos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow fila = gdv_Contactos.SelectedRow;

            int idUsuario = int.Parse(Session["ID"].ToString());
            int idAmigo = int.Parse(gdv_Contactos.DataKeys[e.RowIndex].Value.ToString());

            UsuarioDao.eliminarContacto(idUsuario, idAmigo);
            UsuarioDao.eliminarContacto(idAmigo, idUsuario);

            cargarListaContactos();

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

            actualizarNotificaciones();
            mostrarNotificaciones();
            mostrarSolicitudes();

            cargarListaContactos();
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

                
                actualizarNotificaciones();
                mostrarNotificaciones();
                mostrarSolicitudes();

                cargarListaContactos();

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
          //  cmb_Barrio.Items.Insert(0, new ListItem("Sin Seleccionar", ""));

            cmb_Barrio.DataSource = BarrioDao.obtenerBarrios();
            cmb_Barrio.DataValueField = "id";
            cmb_Barrio.DataTextField = "nombre";
            cmb_Barrio.DataBind();
        }

        private void cargarDeportes()
        {
            cmb_DeportePrederido.Items.Clear();
           // cmb_DeportePrederido.Items.Insert(0, new ListItem("Sin Seleccionar", ""));

            cmb_DeportePrederido.DataSource = DeporteDao.ObtenerDeportes();
            cmb_DeportePrederido.DataValueField = "id";
            cmb_DeportePrederido.DataTextField = "nombre";
            cmb_DeportePrederido.DataBind();
        }

        private void cargarSexo()
        {
            cmb_sexo.Items.Clear();
           // cmb_sexo.Items.Insert(0, new ListItem("Sin Seleccionar", ""));

            cmb_sexo.DataSource = DeportistaDao.obtenerSexo();
            cmb_sexo.DataValueField = "id";
            cmb_sexo.DataTextField = "nombre";
            cmb_sexo.DataBind();
        }

        private void limpiarListaInvitar()
        {
            foreach (GridViewRow fila in gdv_Invitar.Rows)
            {
                if ((fila.Cells[0].FindControl("chk_Invitar") as CheckBox).Checked)
                {
                    (fila.Cells[0].FindControl("chk_Invitar") as CheckBox).Checked = false;
                }
            }
        }

        protected void btn_Solicitud_Click(object sender, EventArgs e)
        {
            // MODAL BTN SOLICITUD MAS OPCIONES
            List<Usuario> listaUsuarios = null;

            if (rdb_PorAmigos.Checked)
            {
                listaUsuarios = UsuarioDao.getAmigos(int.Parse(Session["ID"].ToString()));
            }
            if (rdb_MasOpciones.Checked)
            {
                int sport = 0;
                int.TryParse(cmb_Deporte.SelectedItem.Value, out sport);
                int zona = 0;
                int.TryParse(cmb_Zona.SelectedItem.Value, out zona);
                int barrio = 0;
                int.TryParse(cmb_BuscarBarrio.SelectedItem.Value, out barrio);

                listaUsuarios = UsuarioDao.getUsuariosPorFiltro(sport, zona, barrio);
            }

            var lista = listaUsuarios.OrderBy(u => u.nombre);

            int[] idUsuarios = new int[listaUsuarios.Count];
            //int[] idUsuarios = new int[lista.Count]; //(v. Original)
            int i = 0;
            foreach (Usuario u in lista)
            {
                idUsuarios[i] = u.id;
                i++;
            }

            i = 0;
            foreach (GridViewRow fila in gdv_Invitar.Rows)
            {
                Notificacion notificacion = null;
                if ((fila.Cells[0].FindControl("chk_Invitar") as CheckBox).Checked)
                {
                    notificacion = new Notificacion();
                    notificacion.idEmisor = int.Parse(Session["ID"].ToString());
                    notificacion.nombreEmisor = Session["Usuario"].ToString();
                    notificacion.idReceptor = idUsuarios[i];
                    notificacion.nombreReceptor = fila.Cells[2].Text;
                    notificacion.idEncuentro = 0;
                    notificacion.texto = "Nuevo Contacto";
                    notificacion.idEstado = 10; //(No Check)
                    NotificacionDao.insertarNotificacion(notificacion);
                }
                i++;
            }

            limpiarListaInvitar();


            lbl_ResultadosBusqueda.Text = "La/s solicitud/es ha/n sido enviada/s";
        }

      


        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            gdv_Invitar.Visible = true;
        }

        private void cargarSports() {   
            cmb_Deporte.Items.Clear();
            cmb_Deporte.Items.Insert(0, new ListItem("Sin Seleccionar", ""));
            cmb_Deporte.DataSource = DeporteDao.ObtenerDeportes();
            cmb_Deporte.DataValueField = "id";
            cmb_Deporte.DataTextField = "nombre";
            cmb_Deporte.DataBind();
        }
        private void loadBarrios()
        {
            cmb_BuscarBarrio.Items.Clear();
            cmb_BuscarBarrio.Items.Insert(0, new ListItem("Sin Seleccionar", ""));

            cmb_BuscarBarrio.DataSource = BarrioDao.obtenerBarriosOrdenados();
            cmb_BuscarBarrio.DataValueField = "id";
            cmb_BuscarBarrio.DataTextField = "nombre";
            cmb_BuscarBarrio.DataBind();
        }


        private void cargarZonas()
        {
            cmb_Zona.Items.Clear();
            cmb_Zona.Items.Insert(0, new ListItem("Sin Seleccionar", ""));

            cmb_Zona.DataSource = ZonaDao.obtenerZonasEF();
            cmb_Zona.DataValueField = "id";
            cmb_Zona.DataTextField = "nombre";
            cmb_Zona.DataBind();
        }

        private void cargarPorJugadores()
        {

            List<Usuario> listaUsuarios = crearListaJugadores();
            var lista = listaUsuarios.OrderBy(u => u.nombre);

            cmb_Jugadores.Items.Clear();
            cmb_Jugadores.Items.Insert(0, new ListItem("Sin Seleccionar", ""));

            cmb_Jugadores.DataSource = lista;
            cmb_Jugadores.DataValueField = "id";
            cmb_Jugadores.DataTextField = "nombre";
            cmb_Jugadores.DataBind();
        }

        private List<Usuario> crearListaJugadores()
        {

            List<Usuario> listaUsuarios = UsuarioDao.obtenerUsuarios(int.Parse(Session["ID"].ToString())); ;
            List<Usuario> listaAmigos = UsuarioDao.getAmigos(int.Parse(Session["ID"].ToString())); ;
            List<Usuario> listaJugadores = listaUsuarios;

            for (int i = 0; i < listaUsuarios.Count; i++)
            {
                for (int j = 0; j < listaAmigos.Count; j++)
                {
                    if (listaUsuarios[i].id == listaAmigos[j].id)
                    {
                        listaJugadores.Remove(listaUsuarios[i]);
                    }
                }
            }
            return listaJugadores;
        }

        //protected void rdb_PorDeporte_CheckedChanged(object sender, EventArgs e)
        //{
        //    //if (rdb_PorDeporte.Checked)
        //    //{
        //    //    //cmb_Deporte.Enabled = true;
        //    //    pnl_Lugar.Visible = true;

        //    //}
        //    //else {
        //    //cmb_Deporte.Enabled = false;
        //    // cmb_Deporte.SelectedIndex = 0;

        //    //rdb_PorBarrio.Checked = false;
        //    //cmb_Barrio.Enabled = false;
        //    //cmb_Barrio.SelectedIndex = 0;

        //    //rdb_PorZona.Checked = false;
        //    //cmb_Zona.Enabled = false;
        //    //cmb_Zona.SelectedIndex = 0;

        //    //pnl_Lugar.Visible = false;

        //    //  }
        //}

        protected void rdb_PorZona_CheckedChanged(object sender, EventArgs e)
        {
            if (rdb_PorZona.Checked)
            {
                rdb_PorBarrio.Checked = false;
                cmb_Zona.Enabled = true;
                cmb_Zona.SelectedIndex = 0;
                cmb_BuscarBarrio.Enabled = false;
                cmb_BuscarBarrio.SelectedIndex = 0;

                // btn_Buscar.Visible = true;
            }
            else
            {
                rdb_PorBarrio.Checked = false;
                cmb_Zona.Enabled = false;
                cmb_Zona.SelectedIndex = 0;
                cmb_BuscarBarrio.Enabled = false;
                cmb_BuscarBarrio.SelectedIndex = 0;

                btn_Buscar.Visible = false;
            }
        }
        protected void rdb_PorBarrio_CheckedChanged(object sender, EventArgs e)
        {
            if (rdb_PorBarrio.Checked)
            {
                rdb_PorZona.Checked = false;
                cmb_Zona.Enabled = false;
                cmb_Zona.SelectedIndex = 0;
                cmb_BuscarBarrio.Enabled = true;
                cmb_BuscarBarrio.SelectedIndex = 0;

                // btn_Buscar.Visible = true;
            }
            else
            {
                rdb_PorZona.Checked = false;
                cmb_Zona.Enabled = false;
                cmb_Zona.SelectedIndex = 0;
                cmb_BuscarBarrio.Enabled = false;
                cmb_BuscarBarrio.SelectedIndex = 0;

                btn_Buscar.Visible = false;
            }
        }
        protected void cmb_Jugadores_SelectedIndexChanged(object sender, EventArgs e)
        {
            btn_CancelarBusqueda.Visible = true;
           // btn_InvitarJugador.Visible = true;
            btn_SolicitudJugador.Visible = true;

            btn_CancelarBusqueda.Enabled = true;
           // btn_InvitarJugador.Enabled = true;
            btn_SolicitudJugador.Enabled = true;
        }


        protected void btn_CancelarBusqueda_Click(object sender, EventArgs e)
        {
            cmb_Jugadores.SelectedIndex = 0;
            btn_CancelarBusqueda.Visible = false;
           // btn_InvitarJugador.Visible = false;
            btn_SolicitudJugador.Visible = false;

            btn_CancelarBusqueda.Enabled = true;
           // btn_InvitarJugador.Enabled = false;
            btn_SolicitudJugador.Enabled = false;
        }


        protected void btn_SolicitudJugador_Click(object sender, EventArgs e)
        {
            // SOLICITUD POR JUGADOR

            int jugador = 0;
            int.TryParse(cmb_Jugadores.SelectedItem.Value, out jugador);

            Notificacion notificacion = new Notificacion();
            notificacion.idEmisor = int.Parse(Session["ID"].ToString());
            notificacion.nombreEmisor = Session["Usuario"].ToString();
            notificacion.idReceptor = jugador;
            notificacion.nombreReceptor = cmb_Jugadores.SelectedItem.Text;
            notificacion.idEncuentro = 0; // 0 = Solicitud

            notificacion.texto = "Nuevo Contacto";


            notificacion.idEstado = 10; //(No Check)
            NotificacionDao.insertarNotificacion(notificacion);

            lbl_ResultadosBusqueda.Text = "La solicitud ha sido enviada";

        }


        private void limpiarCamposBusqueda()
        {

            //txt_NombreJugador.Text = string.Empty;
            cmb_Jugadores.SelectedIndex = 0;
            cmb_Jugadores.Enabled = false;
            // cmb_Deporte.SelectedIndex = 0;
            // cmb_Deporte.Enabled = false;
            cmb_Zona.SelectedIndex = 0;
            cmb_Zona.Enabled = false;
            cmb_BuscarBarrio.SelectedIndex = 0;
            cmb_BuscarBarrio.Enabled = false;

            rdb_PorZona.Checked = false;
            rdb_PorBarrio.Checked = false;

            cmb_Jugadores.SelectedIndex = 0;
            btn_CancelarBusqueda.Visible = false;
            //btn_InvitarJugador.Visible = false;
            btn_SolicitudJugador.Visible = false;

        }



        private void cargarListaAmigos()
        {

            List<Usuario> listaUsuarios = UsuarioDao.getAmigos(int.Parse(Session["ID"].ToString()));
            var lista = listaUsuarios.OrderBy(u => u.nombre);

            //gdv_Invitar.DataSource = UsuarioDao.obtenerUsuarios(int.Parse(Session["ID"].ToString()));
            gdv_Invitar.DataSource = lista;
            gdv_Invitar.DataKeyNames = new string[] { "id" };
            gdv_Invitar.DataBind();
        }

        protected void rdb_PorAmigos_CheckedChanged(object sender, EventArgs e)
        {
            limpiarCamposBusqueda();
            cargarListaAmigos();
            pnl_Opciones.Visible = false;
            pnl_PorJugador.Visible = false;
            btn_Buscar.Visible = true;
            btn_Solicitud.Visible = false;
        }
        protected void rdb_PorNombre_CheckedChanged(object sender, EventArgs e)
        {
            pnl_PorJugador.Visible = true;
            pnl_Opciones.Visible = false;

            cargarPorJugadores();
            cmb_Jugadores.Enabled = true;

            btn_Buscar.Visible = false;
            btn_Solicitud.Visible = false;

            btn_CancelarBusqueda.Enabled = false;
            //btn_InvitarJugador.Enabled = false;
            btn_SolicitudJugador.Enabled = false;
        }
        protected void rdb_MasOpciones_CheckedChanged(object sender, EventArgs e)
        {
            pnl_Opciones.Visible = true;
            pnl_PorJugador.Visible = false;
            limpiarCamposBusqueda();
            btn_Buscar.Visible = false;
            btn_Solicitud.Visible = true;

            cargarZonas();
            loadBarrios();
            cargarSports();

            //pnl_Lugar.Visible = true;

        }

        protected void cmb_Deporte_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnl_Lugar.Visible = true;
            cargarListaPorLugar("Deporte");
            btn_Buscar.Visible = true;
        }

        protected void cmb_Zona_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarListaPorLugar("Zona");
            btn_Buscar.Visible = true;

        }

        protected void cmb_BuscarBarrio_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarListaPorLugar("Barrio");
            btn_Buscar.Visible = true;
        }

        //private void cargarBuscarBarrios()
        //{
        //    cmb_BuscarBarrio.Items.Clear();
        //    cmb_BuscarBarrio.Items.Insert(0, new ListItem("Sin Seleccionar", ""));

        //    cmb_BuscarBarrio.DataSource = BarrioDao.obtenerBarriosOrdenados();
        //    cmb_BuscarBarrio.DataValueField = "id";
        //    cmb_BuscarBarrio.DataTextField = "nombre";
        //    cmb_BuscarBarrio.DataBind();
        //}

        private void cargarListaPorLugar(string lugar)
        {
            List<Usuario> listaUsuarios = null;
            int zona = 0;
            int barrio = 0;
            int sport = 0;
            if (lugar.Equals("Deporte"))
            {
                int.TryParse(cmb_Deporte.SelectedItem.Value, out sport);
                listaUsuarios = UsuarioDao.getUsuariosPorFiltro(sport, zona, barrio);

            }
            if (lugar.Equals("Zona"))
            {
                int.TryParse(cmb_Deporte.SelectedItem.Value, out sport);
                int.TryParse(cmb_Zona.SelectedItem.Value, out zona);
                listaUsuarios = UsuarioDao.getUsuariosPorFiltro(sport, zona, barrio);
            }
            else
            {
                int.TryParse(cmb_Deporte.SelectedItem.Value, out sport);
                int.TryParse(cmb_BuscarBarrio.SelectedItem.Value, out barrio);
                listaUsuarios = UsuarioDao.getUsuariosPorFiltro(sport, zona, barrio);
            }

            var lista = listaUsuarios.OrderBy(u => u.nombre);

            gdv_Invitar.DataSource = lista;
            gdv_Invitar.DataKeyNames = new string[] { "id" };
            gdv_Invitar.DataBind();
        }

        // FIN BUSCAR JUGADORES



    }
}
