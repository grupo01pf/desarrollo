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
            ReporteDeportesxFecha();

            actualizarNotificaciones();
            mostrarNotificaciones();
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
            if (ValoracionDao.existePromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "1") == true)
            {
                RadioButtonList1.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "1"));
                foreach (ListItem item in RadioButtonList1.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "1") && item.Text == "★")
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
            if (ValoracionDao.existePromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "2") == true)
            {
                RadioButtonList2.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "2"));
                foreach (ListItem item in RadioButtonList2.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "2") && item.Text == "★")
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
            if (ValoracionDao.existePromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "3") == true)
            {
                RadioButtonList3.SelectedValue = Convert.ToString(ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "3"));
                foreach (ListItem item in RadioButtonList3.Items)
                {
                    if (Convert.ToInt32(item.Value) < ValoracionDao.obtenerPromedioxid(DeportistaDao.ObtenerIdDeportista(Session["ID"].ToString()), "3") && item.Text == "★")
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

        public string obtenerDatosBarUsuariosRegistrados()
        {
            DataTable Datos = new DataTable();
            Datos.Columns.Add(new DataColumn("Mes", typeof(string)));
            Datos.Columns.Add(new DataColumn("Usuarios", typeof(string)));



            Datos.Rows.Add(new object[] { "Ene.", Estadisticas.obtenerCantidadUsuariosRegistrados("01",ddl_aniosregistros.Text)});
            Datos.Rows.Add(new object[] { "Feb.", Estadisticas.obtenerCantidadUsuariosRegistrados("02", ddl_aniosregistros.Text)});
            Datos.Rows.Add(new object[] { "Mar.", Estadisticas.obtenerCantidadUsuariosRegistrados("03", ddl_aniosregistros.Text)});
            Datos.Rows.Add(new object[] { "Abr.", Estadisticas.obtenerCantidadUsuariosRegistrados("04", ddl_aniosregistros.Text)});
            Datos.Rows.Add(new object[] { "May.", Estadisticas.obtenerCantidadUsuariosRegistrados("05", ddl_aniosregistros.Text)});
            Datos.Rows.Add(new object[] { "Jun.", Estadisticas.obtenerCantidadUsuariosRegistrados("06", ddl_aniosregistros.Text)});
            Datos.Rows.Add(new object[] { "Jul.", Estadisticas.obtenerCantidadUsuariosRegistrados("07", ddl_aniosregistros.Text)});
            Datos.Rows.Add(new object[] { "Ago.", Estadisticas.obtenerCantidadUsuariosRegistrados("08", ddl_aniosregistros.Text)});
            Datos.Rows.Add(new object[] { "Sep.", Estadisticas.obtenerCantidadUsuariosRegistrados("09", ddl_aniosregistros.Text)});
            Datos.Rows.Add(new object[] { "Oct.", Estadisticas.obtenerCantidadUsuariosRegistrados("10", ddl_aniosregistros.Text)});
            Datos.Rows.Add(new object[] { "Nov.", Estadisticas.obtenerCantidadUsuariosRegistrados("11", ddl_aniosregistros.Text)});
            Datos.Rows.Add(new object[] { "Dic.", Estadisticas.obtenerCantidadUsuariosRegistrados("12", ddl_aniosregistros.Text)});

            string strDatos;
            strDatos = "[";
            foreach (DataRow dr in Datos.Rows)
            {
                strDatos = strDatos + "[";
                strDatos = strDatos + "'" + dr[0] + "'" + "," +
                    dr[1].ToString().Replace(",", ".") + ",";

                strDatos = strDatos + "],";
            }
            strDatos = strDatos + "],";
            return strDatos;
        }

        public void ReporteDeportesxFecha()
        {

           ReporteCantidadDeportesxFecha reporte = new ReporteCantidadDeportesxFecha();
            reporte.SetParameterValue("@Complejo",1);
            CrystalReportViewer1.ReportSource = reporte;

        }

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

        private void actualizarNotificaciones()
        {

            lbl_Notificacion.Text = (NotificacionDao.contadorNotificaciones(int.Parse(Session["ID"].ToString()))).ToString();
        }

        private void mostrarNotificaciones() {

            gdv_Notificaciones.DataSource = NotificacionDao.mostrarNotificaciones(int.Parse(Session["ID"].ToString()));
            gdv_Notificaciones.DataKeyNames = new string[] { "idNotificacion" };
            gdv_Notificaciones.DataBind();

        }

        protected void btn_Eliminar_Click(object sender, EventArgs e)
        {


            List<NotificacionQueryEntidad> lista = NotificacionDao.mostrarNotificaciones(int.Parse(Session["ID"].ToString()));

            int[] idNotificaciones = new int[lista.Count];
            int i = 0;
            foreach (NotificacionQueryEntidad n in lista)
            {
                idNotificaciones[i] = n.idNotificacion;
                i++;
            }

            i = 0;


            foreach (GridViewRow fila in gdv_Notificaciones.Rows)
            {

                if ((fila.Cells[0].FindControl("chk_Eliminar") as CheckBox).Checked)
                {

                    NotificacionDao.actualizarEstadoNotificacion(11,idNotificaciones[i]);

                }
                i++;
            }

        }


    }
}
