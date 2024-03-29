﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using CapaEntidades;


namespace CapaDao
{
    public class MapaDao
    {

        public static Mapa obtenerMapaByID(int id) {

            Mapa m = new Mapa();
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_MapaDao_ObtenerMapaByID", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                m.id = int.Parse(dr["id"].ToString());
                m.latitud = dr["latitud"].ToString();
                m.longitud = dr["longitud"].ToString();
            }
            dr.Close();
            cn.Close();
            return m;

        }

        public static List<MapaQueryDao> obtenerMapas(){

            List<MapaQueryDao> listaMapa = new List<MapaQueryDao>();
            MapaQueryDao m = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_MapaDao_ObtenerMapas", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            // cmd.ExecuteNonQuery();

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                m = new MapaQueryDao();

                m.id = int.Parse(dr["id"].ToString());
                m.idMapa = int.Parse(dr["mapa"].ToString());
                m.nombre = dr["nombre"].ToString();
                m.calle = dr["calle"].ToString();
                m.nroCalle = int.Parse(dr["nroCalle"].ToString());
                m.latitud = dr["latitud"].ToString();
                m.longitud = dr["longitud"].ToString();

                listaMapa.Add(m);
            }
            dr.Close();
            cn.Close();

            return listaMapa;

        }

        public static int insertarMapa(Mapa m) {

            int id = 0;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_MapaDao_InsertarMapa", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@lat", m.latitud);
            cmd.Parameters.AddWithValue("@lng", m.longitud);
           // cmd.ExecuteNonQuery();

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read()) {
                id = int.Parse(dr["id"].ToString());
            }
            dr.Close();
            cn.Close();


            return id;
        }



        public static void modificarMapa(Mapa m)
        {
            //public static void modificarMapa(int id, string lat, string lng){

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_MapaDao_ModificarMapa", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", m.id);
            cmd.Parameters.AddWithValue("@lat", m.latitud);
            cmd.Parameters.AddWithValue("@lng", m.longitud);
            //cmd.Parameters.AddWithValue("@id", id);
            //cmd.Parameters.AddWithValue("@lat", lat);
            //cmd.Parameters.AddWithValue("@lng", lng);
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        public static void eliminarMapa(int id){

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();
            SqlCommand cmd = new SqlCommand("sp_MapaDao_EliminarMapa", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@id", id);;
            cmd.ExecuteNonQuery();
            cn.Close();
        }
    }
}
