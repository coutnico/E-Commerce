using E_Commerce_Controller;
using E_Commerce_Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace E_Commerce_Negocio
{
    public class Suspensiones_Negocio
    {
        public List<Suspension> ListarSuspensiones()
        {
            SqlDataReader reader = null;
            ConexionDB conexionDB_obj = new ConexionDB();

            List<Suspension> lista = new List<Suspension>();

            try
            {
                string query = "Select ID_SUSPENSION, ID_USUARIO, FECHA_INICIO, FECHA_FIN From SUSPENSIONES";
                reader = conexionDB_obj.LeerDatos(query);

                while (reader.Read())
                {

                    Suspension Suspension = new Suspension();

                    Suspension.ID_Suspension = Convert.ToInt32(reader["ID_SUSPENSION"]);
                    Suspension.ID_Usuario = Convert.ToInt32(reader["ID_USUARIO"]);
                    Suspension.Fecha_Inicio = DateTime.Parse(reader["FECHA_INICIO"].ToString());
                    Suspension.Fecha_Fin = DateTime.Parse(reader["FECHA_FIN"].ToString());

                    lista.Add(Suspension);
                }

                return lista;
            }

            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }

        }


        public bool InsertarSuspension(int id_usuario)

        {
            ConexionDB conexionDB_Obj = new ConexionDB();
            try
            {
                conexionDB_Obj.EjecutarComando($"INSERT INTO SUSPENSIONES (ID_USUARIO, FECHA_INICIO, FECHA_FIN) VALUES({id_usuario}, GETDATE(), DATEADD(DAY, 3, GETDATE()))");
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