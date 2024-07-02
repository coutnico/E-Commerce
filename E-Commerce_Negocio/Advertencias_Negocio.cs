using E_Commerce_Controller;
using E_Commerce_Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;

namespace E_Commerce_Negocio
{
    public class Advertencias_Negocio
    {


        public List<Advertencia> ListarAdvertencias()
        {
            SqlDataReader reader = null;
            ConexionDB conexionDB_obj = new ConexionDB();

            List<Advertencia> lista = new List<Advertencia>();

            try
            {
                string query = "Select ID_ADVERTENCIA, ID_USUARIO, DESCRIPCION From ADVERTECIAS";
                reader = conexionDB_obj.LeerDatos(query);

                while (reader.Read())
                {

                    Advertencia advertencia = new Advertencia();

                    advertencia.ID_Advertencia = Convert.ToInt32(reader["ID_ADVERTENCIA"]);
                    advertencia.ID_Usuario = Convert.ToInt32(reader["ID_USUARIO"]);
                    advertencia.Descripcion = reader["DESCRIPCION"].ToString();

                    lista.Add(advertencia);
                }

                return lista;
            }

            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }

        }


        public bool InsertarAdvertencia(int id_usuario, string descripcion)

        {
            ConexionDB conexionDB_Obj = new ConexionDB();
            try
            {
                conexionDB_Obj.EjecutarComando($"INSERT INTO ADVERTECIAS (ID_USUARIO, DESCRIPCION) VALUES({id_usuario},{descripcion})");
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }

        }
    }
}