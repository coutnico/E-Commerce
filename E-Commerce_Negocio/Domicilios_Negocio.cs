using E_Commerce_Controller;
using E_Commerce_Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace E_Commerce_Negocio
{
    public class Domicilios_Negocio
    {
        ConexionDB conexionDB_obj = new ConexionDB();

        SqlDataReader reader = null;


        public List<Domicilio> ListarDomicilios()

        {
            List<Domicilio> lista = new List<Domicilio>();

            try
            {
                //conexion.Open();
                string query = "SELECT ID_Domicilio, ID_Usuario, Calle, Altura, Localidad, Observacion FROM DOMICILIOS";
                //cmd = new SqlCommand(query, conexion);
                //reader = cmd.ExecuteReader();
                reader = conexionDB_obj.LeerDatos(query);


                while (reader.Read())
                {

                    Domicilio domicilio = new Domicilio();

                    domicilio.ID = Convert.ToInt32(reader["ID_Domicilio"].ToString());
                    domicilio.ID_Usuario = Convert.ToInt32(reader["ID_Usuario"].ToString());
                    domicilio.Calle = reader["Calle"].ToString();
                    domicilio.Altura = Convert.ToInt32(reader["Altura"].ToString());
                    domicilio.ID_Localidad = Convert.ToInt32(reader["Localidad"].ToString());
                    domicilio.Observacion = reader["Observacion"] != DBNull.Value ? reader["Observacion"].ToString() : string.Empty;

                    lista.Add(domicilio);

                }

                return lista;
            }

            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }


        }
        public void AgregarDomicilio(Domicilio domicilio)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();

            try
            {
                if(domicilio.Observacion != string.Empty)
                {
                    string query = $"INSERT INTO DOMICILIOS (ID_Usuario, Calle, Altura, Localidad, Observacion) VALUES({domicilio.ID_Usuario}, '{domicilio.Calle}', {domicilio.Altura}, {domicilio.ID_Localidad}, {domicilio.Observacion})";
                    conexionDB_obj.EjecutarComando(query); 
                }
                else
                {
                    string query = $"INSERT INTO DOMICILIOS (ID_Usuario, Calle, Altura, Localidad) VALUES({domicilio.ID_Usuario}, '{domicilio.Calle}', {domicilio.Altura}, {domicilio.ID_Localidad})";
                    conexionDB_obj.EjecutarComando(query);
                }
            }
            catch (Exception)
            {

                throw;
            }


        }

    }
}