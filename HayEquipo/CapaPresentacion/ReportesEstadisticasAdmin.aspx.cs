using CapaDao;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class ReportesEstadisticasAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        //public string obtenerDatosBarUsuariosRegistrados()
        //{
        //    DataTable Datos = new DataTable();
        //    Datos.Columns.Add(new DataColumn("Mes", typeof(string)));
        //    Datos.Columns.Add(new DataColumn("Usuarios", typeof(string)));



        //    Datos.Rows.Add(new object[] { "Ene.", Estadisticas.obtenerCantidadUsuariosRegistrados("01", ddl_aniosregistros.Text) });
        //    Datos.Rows.Add(new object[] { "Feb.", Estadisticas.obtenerCantidadUsuariosRegistrados("02", ddl_aniosregistros.Text) });
        //    Datos.Rows.Add(new object[] { "Mar.", Estadisticas.obtenerCantidadUsuariosRegistrados("03", ddl_aniosregistros.Text) });
        //    Datos.Rows.Add(new object[] { "Abr.", Estadisticas.obtenerCantidadUsuariosRegistrados("04", ddl_aniosregistros.Text) });
        //    Datos.Rows.Add(new object[] { "May.", Estadisticas.obtenerCantidadUsuariosRegistrados("05", ddl_aniosregistros.Text) });
        //    Datos.Rows.Add(new object[] { "Jun.", Estadisticas.obtenerCantidadUsuariosRegistrados("06", ddl_aniosregistros.Text) });
        //    Datos.Rows.Add(new object[] { "Jul.", Estadisticas.obtenerCantidadUsuariosRegistrados("07", ddl_aniosregistros.Text) });
        //    Datos.Rows.Add(new object[] { "Ago.", Estadisticas.obtenerCantidadUsuariosRegistrados("08", ddl_aniosregistros.Text) });
        //    Datos.Rows.Add(new object[] { "Sep.", Estadisticas.obtenerCantidadUsuariosRegistrados("09", ddl_aniosregistros.Text) });
        //    Datos.Rows.Add(new object[] { "Oct.", Estadisticas.obtenerCantidadUsuariosRegistrados("10", ddl_aniosregistros.Text) });
        //    Datos.Rows.Add(new object[] { "Nov.", Estadisticas.obtenerCantidadUsuariosRegistrados("11", ddl_aniosregistros.Text) });
        //    Datos.Rows.Add(new object[] { "Dic.", Estadisticas.obtenerCantidadUsuariosRegistrados("12", ddl_aniosregistros.Text) });

        //    string strDatos;
        //    strDatos = "[";
        //    foreach (DataRow dr in Datos.Rows)
        //    {
        //        strDatos = strDatos + "[";
        //        strDatos = strDatos + "'" + dr[0] + "'" + "," +
        //            dr[1].ToString().Replace(",", ".") + ",";

        //        strDatos = strDatos + "],";
        //    }
        //    strDatos = strDatos + "],";
        //    return strDatos;
        //}

        protected void btnMostrarEstadistica_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Session["ID"].ToString());
            EstadisticaDao.truncarUsuariosActivos();
            EstadisticaDao.CargarUsuariosActivos();
            elDivDelDashboard.Visible = true;
        }
       
    }
}