using E_Commerce_Controller;
using E_Commerce_Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;

namespace E_Commerce_Negocio
{
    public class Datos_Personales_Negocio
    {

        ConexionDB conexionDB_obj = new ConexionDB();

        SqlDataReader reader = null;


        public List<Datos_Personales> ListarDatosPersonales()

        {
            List<Datos_Personales> lista = new List<Datos_Personales>();

            try
            {
                //conexion.Open();
                string query = "Select ID, ID_USUARIO, Nombres, Apellido, Genero, Telefono, Telefono_Aux, Documento from DATOS_PERSONALES";
                //cmd = new SqlCommand(query, conexion);
                //reader = cmd.ExecuteReader();
                reader = conexionDB_obj.LeerDatos(query);


                while (reader.Read())
                {

                    Datos_Personales datos = new Datos_Personales();

                    datos.ID = Convert.ToInt32(reader["ID"].ToString());
                    datos.ID_Usuario = Convert.ToInt32(reader["ID_USUARIO"].ToString());
                    datos.Nombres = reader["Nombres"].ToString();
                    datos.Apellidos = reader["Apellido"].ToString();
                    datos.Genero = reader["Genero"].ToString();
                    datos.Telefono = reader["Telefono"] != DBNull.Value ? Convert.ToInt32(reader["Telefono"].ToString()) : 0;
                    datos.TelefonoAux = reader["Telefono_Aux"] != DBNull.Value ? Convert.ToInt32(reader["Telefono_Aux"].ToString()) : 0;
                    datos.Documento = reader["Documento"] != DBNull.Value ? Convert.ToInt32(reader["Documento"].ToString()) : 0;


                    lista.Add(datos);

                }

                return lista;
            }

            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }


        }
        public void ModificarDatos_Personales(Datos_Personales datos_personales)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();

            try
            {
                if (datos_personales.TelefonoAux == 0)
                    conexionDB_Obj.EjecutarComando($"UPDATE DATOS_PERSONALES SET Nombres = '{datos_personales.Nombres}', Apellido = '{datos_personales.Apellidos}', Genero = '{datos_personales.Genero}', Telefono = {datos_personales.Telefono}, Telefono_Aux = {datos_personales.TelefonoAux}, Documento = {datos_personales.Documento} WHERE ID_USUARIO = {datos_personales.ID_Usuario}");
                else
                    conexionDB_Obj.EjecutarComando($"UPDATE DATOS_PERSONALES SET Nombres = '{datos_personales.Nombres}', Apellido = '{datos_personales.Apellidos}', Genero = '{datos_personales.Genero}', Telefono = {datos_personales.Telefono}, Documento = {datos_personales.Documento} WHERE ID_USUARIO = {datos_personales.ID_Usuario}");
            }
            catch (Exception)
            {

                throw;
            }


        }
    }
}