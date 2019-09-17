﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaEntidades;
using System.Data.SqlClient;
using System.Configuration;

namespace CapaDao
{
    public class DeportistaDao
    {
      
        public static void InsertarDeportista(DeportistaEntidad deportista)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"INSERT into Deportista(apellido, nombres, idTipoDoc, nroDoc, sexo, fechaNacimiento,
                                                       nroTelefono, idUsuario, promedioEstrellas, idEstado)   
                                values(@ape, @nombres, @idTipoDoc, @nroDoc, @sex,
                                       @fechaNac, @nroTel, @idUs, @promEstr, @idEst);
                                select Scope_Identity() as ID";

            cmd.Parameters.AddWithValue("@ape", deportista.apellido);
            cmd.Parameters.AddWithValue("@nombres", deportista.nombres);
            cmd.Parameters.AddWithValue("@idTipoDoc", deportista.idTipoDocumento);
            cmd.Parameters.AddWithValue("@nroDoc", deportista.numeroDocumento);
            cmd.Parameters.AddWithValue("@sex", deportista.sexo);
            cmd.Parameters.AddWithValue("@fechaNac", deportista.fechaNacimiento);
            cmd.Parameters.AddWithValue("@nroTel", deportista.numeroTelefono);
            cmd.Parameters.AddWithValue("@idUs", deportista.idUsuario);
            cmd.Parameters.AddWithValue("@promEstr", deportista.promedioEstrellas);
            cmd.Parameters.AddWithValue("@idEst", deportista.idEstado);

            deportista.idDeportista = Convert.ToInt32(cmd.ExecuteScalar());

            cn.Close();
        }

        public static void ActualizarDeportista(DeportistaEntidad deportista)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"UPDATE Deportista SET apellido=@ape, nombres=@nombres, idTipoDoc=@idTipoDoc, 
                                                      nroDoc=@nroDoc, sexo=@sex, fechaNacimiento=@fechaNac,
                                                      nroTelefono=@nroTel, idUsuario=@idUs, 
                                                      promedioEstrellas=@promEstr, idEstado=@idEst
                                                WHERE id=@idDeportista";

            cmd.Parameters.AddWithValue("@idDeportista", deportista.idDeportista);
            cmd.Parameters.AddWithValue("@ape", deportista.apellido);
            cmd.Parameters.AddWithValue("@nombres", deportista.nombres);
            cmd.Parameters.AddWithValue("@idTipoDoc", deportista.idTipoDocumento);
            cmd.Parameters.AddWithValue("@nroDoc", deportista.numeroDocumento);
            cmd.Parameters.AddWithValue("@sex", deportista.sexo);
            cmd.Parameters.AddWithValue("@fechaNac", deportista.fechaNacimiento);
            cmd.Parameters.AddWithValue("@nroTel", deportista.numeroTelefono);
            cmd.Parameters.AddWithValue("@idUs", deportista.idUsuario);
            cmd.Parameters.AddWithValue("@promEstr", deportista.promedioEstrellas);
            cmd.Parameters.AddWithValue("@idEst", deportista.idEstado);

            cmd.ExecuteNonQuery();

            cn.Close();
        }

        public static void EliminarDeportista(int id)
        {
            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"DELETE from Deportista WHERE id=@idDeportista";

            cmd.Parameters.AddWithValue("@idDeportista", id);

            cmd.ExecuteNonQuery();

            cn.Close();
        }

        public static List<DeportistaEntidad> ObtenerTodosDeportistas()
        {
            List<DeportistaEntidad> deportistas = new List<DeportistaEntidad>();

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT * FROM Deportista";
            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                DeportistaEntidad d = new DeportistaEntidad();

                d.idDeportista = int.Parse(dr["id"].ToString());
                d.apellido = dr["apellido"].ToString();
                d.nombres = dr["nombres"].ToString();
                d.idTipoDocumento = int.Parse(dr["idTipoDoc"].ToString());
                d.numeroDocumento = int.Parse(dr["nroDoc"].ToString());
                d.sexo = dr["sexo"].ToString();
                d.fechaNacimiento = DateTime.Parse(dr["fechaNacimiento"].ToString());
                d.numeroTelefono = int.Parse(dr["nroTelefono"].ToString());
                d.idUsuario = int.Parse(dr["idUsuario"].ToString());
                d.promedioEstrellas = float.Parse(dr["promedioEstrellas"].ToString());
                d.idEstado = int.Parse(dr["idEstado"].ToString());

                deportistas.Add(d);
            }
            dr.Close();
            cn.Close();
            return deportistas;
        }

        public static DeportistaEntidad ObtenerDeportistasPorID(int id)
        {
            DeportistaEntidad d = null;

            SqlConnection cn = new SqlConnection();
            cn.ConnectionString = ConnectionString.Cadena();
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = @"SELECT *
                                FROM Deportista where id=@idDeportista";
            cmd.Parameters.AddWithValue("@idDeportista", id);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                d = new DeportistaEntidad();

                d.idDeportista = int.Parse(dr["id"].ToString());
                d.apellido = dr["apellido"].ToString();
                d.nombres = dr["nombres"].ToString();
                d.idTipoDocumento = int.Parse(dr["idTipoDoc"].ToString());
                d.numeroDocumento = int.Parse(dr["nroDoc"].ToString());
                d.sexo = dr["sexo"].ToString();
                d.fechaNacimiento = DateTime.Parse(dr["fechaNacimiento"].ToString());
                d.numeroTelefono = int.Parse(dr["nroTelefono"].ToString());
                d.idUsuario = int.Parse(dr["idUsuario"].ToString());
                d.promedioEstrellas = float.Parse(dr["promedioEstrellas"].ToString());
                d.idEstado = int.Parse(dr["idEstado"].ToString());

            }
            dr.Close();
            cn.Close();
            return d;
        }
    }
}