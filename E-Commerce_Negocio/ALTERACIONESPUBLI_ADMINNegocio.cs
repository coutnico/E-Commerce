using E_Commerce_Controller;
using E_Commerce_Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace E_Commerce_Negocio
{
    public class ALTERACIONESPUBLI_ADMINNegocio
    {
        
        ConexionDB conexionDB_obj = new ConexionDB();

        SqlDataReader reader = null;


        public List<ALTERACIONESPUBLI_ADMIN> ListarAlteraciones()


        {
            List<ALTERACIONESPUBLI_ADMIN> lista = new List<ALTERACIONESPUBLI_ADMIN>();

            try
            {
                
                string query = "Select Id, IdPublicacion,FechaModificacion, TipoModificacion, IdAdministrador from ALTERACIONESPUBLI_ADMIN";

                reader = conexionDB_obj.LeerDatos(query); ;


                while (reader.Read())
                {
                    ALTERACIONESPUBLI_ADMIN alteracionespubli_admin = new ALTERACIONESPUBLI_ADMIN();

                    alteracionespubli_admin.Id = Convert.ToInt32(reader["Id"]);
                    alteracionespubli_admin.IdPublicacion = Convert.ToInt32(reader["IdPublicacion"]);
                    alteracionespubli_admin.FechaModificacion = Convert.ToDateTime(reader["FechaModificacion"]);
                    alteracionespubli_admin.TipoModificacion = Convert.ToInt32(reader["TipoModificacion"]);
                    alteracionespubli_admin.IdAdministrador = Convert.ToInt32(reader["IdAdministrador"]);

                    lista.Add(alteracionespubli_admin);

                }

                return lista;

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }


        }

        public void agregarAlteracionAdmin(ALTERACIONESPUBLI_ADMIN alteracionespubli_admin)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();
            try
            {
                string fecha_YYYMMDD = alteracionespubli_admin.FechaModificacion.ToString("yyyy-MM-dd HH:mm:ss.fff"); // NECESITO FORMATEAR LA FECHA PARA ENVIARLA COMO YYYMMDD a SQL.


                conexionDB_Obj.EjecutarComando("Insert into ALTERACIONESPUBLI_ADMIN (IdPublicacion,FechaModificacion,TipoModificacion,IdAdministrador) Values (" + alteracionespubli_admin.IdPublicacion + ",'" + fecha_YYYMMDD + "'," + alteracionespubli_admin.TipoModificacion + "," + alteracionespubli_admin.IdAdministrador + ")");
  
            }
            catch (Exception)
            {

                throw;
            }

        }

        public void eliminarAlteracionAdmin(int id_delete)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();

            try
            {
                // SQL usa ' para el query. y c# com dobles para separar cadenas
                conexionDB_Obj.EjecutarComando("Delete from ALTERACIONESPUBLI_ADMIN where ID = " + id_delete);

            }
            catch (Exception)
            {

                throw;
            }
        }

        public void modificarAlteracionAdmin(ALTERACIONESPUBLI_ADMIN alteracionespubli_admin_obj, int ID_a_modificar)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();

            try
            {
                string fecha_YYYMMDD = alteracionespubli_admin_obj.FechaModificacion.ToString("yyyy-MM-dd HH:mm:ss.fff"); // NECESITO FORMATEAR LA FECHA PARA ENVIARLA COMO YYYMMDD a SQL.
                conexionDB_Obj.EjecutarComando("UPDATE ALTERACIONESPUBLI_ADMIN SET IdPublicacion =" + alteracionespubli_admin_obj.IdPublicacion + ",'" + fecha_YYYMMDD + "'," + alteracionespubli_admin_obj.TipoModificacion + "," + alteracionespubli_admin_obj.IdAdministrador +  " WHERE Id = " + ID_a_modificar);
                
            }
            catch (Exception)
            {

                throw;
            }
        }

        public ALTERACIONESPUBLI_ADMIN Buscar_AlteracionAdmin_por_ID(int id_buscado)

        {
            int id_aux = 0;
            try
            {
                string query = "Select Id, IdPublicacion,FechaModificacion, TipoModificacion, IdAdministrador from ALTERACIONESPUBLI_ADMIN";

                reader = conexionDB_obj.LeerDatos(query);

                ALTERACIONESPUBLI_ADMIN alteracionespubli_admin = new ALTERACIONESPUBLI_ADMIN();
                while (reader.Read())
                {
                    id_aux = Convert.ToInt32(reader["Id"]);

                    if (id_aux == id_buscado)
                    {
                        alteracionespubli_admin.Id = id_buscado;//
                        alteracionespubli_admin.IdPublicacion = Convert.ToInt32(reader["IdPublicacion"]);
                        alteracionespubli_admin.FechaModificacion = Convert.ToDateTime(reader["FechaModificacion"]);
                        alteracionespubli_admin.TipoModificacion = Convert.ToInt32(reader["TipoModificacion"]);
                        alteracionespubli_admin.IdAdministrador = Convert.ToInt32(reader["IdAdministrador"]);
                    }
                }
                return alteracionespubli_admin;

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }


        }



    }
}