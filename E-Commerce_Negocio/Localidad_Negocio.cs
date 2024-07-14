using E_Commerce_Controller;
using E_Commerce_Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace E_Commerce_Negocio
{
    public class Localidad_Negocio
    {
        ConexionDB conexionDB_obj = new ConexionDB();

        SqlDataReader reader = null;


        public List<Localidad> ListarLocalidades()

        {
            List<Localidad> lista = new List<Localidad>();

            try
            {
                //conexion.Open();
                string query = "SELECT ID_Localidad, Nombre FROM LOCALIDADES";
                //cmd = new SqlCommand(query, conexion);
                //reader = cmd.ExecuteReader();
                reader = conexionDB_obj.LeerDatos(query);


                while (reader.Read())
                {

                    Localidad Localidad = new Localidad();

                    Localidad.ID = Convert.ToInt32(reader["ID_Localidad"].ToString());
                    Localidad.Nombre = reader["Nombre"].ToString();
                    

                    lista.Add(Localidad);

                }

                return lista;
            }

            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }


        }
    }
}