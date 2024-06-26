using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using E_Commerce_Models;
using E_Commerce_Controller;


namespace E_Commerce_Negocio
{
    public class MarcaNegocio
    {
        //static string conexionstring = "server=(local); database=CATALOGO_P3_DB; integrated security=true";
        ConexionDB conexionDB_obj = new ConexionDB();

        //SqlConnection conexion = new SqlConnection(conexionstring);
        //SqlCommand cmd;
        SqlDataReader reader = null;


        public List<Marca> ListarMarcas()


        {
            List<Marca> lista = new List<Marca>();

            try
            {
                //conexion.Open();
                string query = "Select Id, Descripcion,IdCategoria from MARCAS";
                //cmd = new SqlCommand(query, conexion);


                reader = conexionDB_obj.LeerDatos(query); ;// cmd.ExecuteReader();


                while (reader.Read())
                {
                    Marca marca = new Marca();

                    marca.Id = Convert.ToInt32(reader["Id"]);
                    marca.Descripcion = reader["Descripcion"].ToString();
                    marca.IdCategoria = Convert.ToInt32(reader["IdCategoria"]);
                    lista.Add(marca);

                }

                return lista;

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }


        }

        public void agregarMarca(Marca marca_obj)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();
            try
            {

                // SQL usa ' para el query. y c# com dobles para separar cadenas
                conexionDB_Obj.EjecutarComando("Insert into MARCAS (Descripcion, IdCategoria) Values (" + " ' " + marca_obj.Descripcion + "'," + marca_obj.IdCategoria + ") ");
                string txt_categoria_agregada = "Marca agregada exitosamente";
            }
            catch (Exception)
            {

                throw;
            }

        }

        public void eliminarMarca(int id_delete)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();

            try
            {
                // SQL usa ' para el query. y c# com dobles para separar cadenas
                conexionDB_Obj.EjecutarComando("Delete from MARCAS where ID = " + id_delete);

                string txt_categoria_eliminada = "Marca eliminada";
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void modificarMarca(Marca marca_obj, int ID_a_modificar)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();

            try
            {
                // SQL usa ' para el query. y c# com dobles para separar cadenas
                conexionDB_Obj.EjecutarComando("UPDATE MARCAS SET Descripcion = '" + marca_obj.Descripcion + "'," + marca_obj.IdCategoria + " WHERE ID = " + ID_a_modificar);
                string txt_categoria_actualizada = "Marca Actualizada";
            }
            catch (Exception)
            {

                throw;
            }
        }

        public Marca Buscar_Marca_por_ID(int id_buscado)

        {
            int id_aux = 0;
            try
            {
                //conexion.Open();
                string query = "Select id, Descripcion, IdCategoria from MARCAS";
                //cmd = new SqlCommand(query, conexion);


                reader = conexionDB_obj.LeerDatos(query); ;// cmd.ExecuteReader();

                Marca marca = new Marca();
                while (reader.Read())
                {
                    id_aux = Convert.ToInt32(reader["Id"]);

                    if (id_aux == id_buscado)
                    {
                        marca.Id = id_buscado;//Convert.ToInt32(reader["Id"]);
                        marca.Descripcion = reader["Descripcion"].ToString();
                        marca.IdCategoria = Convert.ToInt32(reader["IdCategoria"]);
                    }
                }
                return marca;

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }


        }


    }
}