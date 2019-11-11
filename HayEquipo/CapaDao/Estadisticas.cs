using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using CapaEntidades;
using System.Data;
using System.Configuration;

namespace CapaDao
{
    public class Estadisticas
    {

        public static int obtenerCantidadPartidos(string mes, string usuario , string anio)
        {
            int cantidadPartidos = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT COUNT(*) as CantidadPartidos
                     FROM EncuentroDeportivo e JOIN UsuariosPorEncuentroDeportivo ue on(e.id=ue.idEncuentro)
                      WHERE (ue.idUsuarioEquipoA = @usuario or ue.idUsuarioEquipoB = @usuario) and MONTH(e.fechaInicioEncuentro) = @mes 
                         and year(e.fechaInicioEncuentro) = @anio";
            cmd.Parameters.AddWithValue("@mes", mes);
            cmd.Parameters.AddWithValue("@usuario", usuario);
            cmd.Parameters.AddWithValue("@anio", anio);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                cantidadPartidos = int.Parse(dr["CantidadPartidos"].ToString());
            }
            dr.Close();
            cn.Close();

            return cantidadPartidos;
        }

        public static int obtenerCantidadPartidosAdmin(string mes, string usuario , string anio)
        {
            int cantidadPartidos = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT  COUNT(*) as CantidadPartidos
                                FROM EncuentroDeportivo e
                      WHERE e.idUsuario = @usuario and MONTH(e.fechaInicioEncuentro) = @mes 
                         and year(e.fechaInicioEncuentro) = @anio";
            cmd.Parameters.AddWithValue("@mes", mes);
            cmd.Parameters.AddWithValue("@usuario", usuario);
            cmd.Parameters.AddWithValue("@anio", anio);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                cantidadPartidos = int.Parse(dr["CantidadPartidos"].ToString());
            }
            dr.Close();
            cn.Close();

            return cantidadPartidos;
        }

        public static List<string> obtenerAnios()
        {
            string anio;
            List<string> ListaAnios = new List<string>();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "SELECT Distinct  year(e.fechaInicioEncuentro) as anio FROM EncuentroDeportivo e";
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                
                anio = dr["anio"].ToString();
                ListaAnios.Add(anio);

            }
            dr.Close();
            cn.Close();
            return ListaAnios;
        }




        public static int obtenerCantidadUsuariosRegistrados(string mes,string anio)
        {
            int cantidadRegistros = 0;
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT COUNT(*) as CantidadUsuariosRegistrados
                            FROM Usuario u 
                      WHERE MONTH(u.fechaAlta) = @mes 
                         and year(u.fechaAlta) = @anio";
            cmd.Parameters.AddWithValue("@mes", mes);
            cmd.Parameters.AddWithValue("@anio", anio);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                cantidadRegistros = int.Parse(dr["CantidadUsuariosRegistrados"].ToString());
            }
            dr.Close();
            cn.Close();

            return cantidadRegistros;
        }
    }
    }
