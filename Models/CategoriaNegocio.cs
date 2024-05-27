using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace tp_web_equipo_19.Models
{
    public class CategoriaNegocio
    {
        //static string conexionstring = "server=(local); database=CATALOGO_P3_DB; integrated security=true";
        ConexionDB conexionDB_obj = new ConexionDB();

        //SqlConnection conexion = new SqlConnection(conexionstring);
        //SqlCommand cmd;
        SqlDataReader reader = null;


        public List<Categoria> ListarCategorias()
        {
            List<Categoria> lista = new List<Categoria>();

            try
            {

                string query = "Select Id, Descripcion from CATEGORIAS";
                //cmd = new SqlCommand(query, conexion);


                reader = conexionDB_obj.LeerDatos(query);  //cmd.ExecuteReader();


                while (reader.Read())
                {
                    Categoria categoria = new Categoria();

                    categoria.Id = Convert.ToInt32(reader["Id"]);
                    categoria.Descripcion = reader["Descripcion"].ToString();

                    lista.Add(categoria);

                }

                return lista;

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }


        }
        public void agregarCategoria(Categoria Categoria_obj)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();
            try
            {

                // SQL usa ' para el query. y c# com dobles para separar cadenas
                conexionDB_Obj.EjecutarComando("Insert into CATEGORIAS (Descripcion) Values (" + " ' " + Categoria_obj.Descripcion + " ') ");
                string txt_categoria_agregada = "Categoria agregada exitosamente";
            }
            catch (Exception)
            {

                throw;
            }

        }
            public void eliminarCategoria(int id_delete)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();

            try
            {
                // SQL usa ' para el query. y c# com dobles para separar cadenas
                conexionDB_Obj.EjecutarComando("Delete from CATEGORIAS where ID = " + id_delete);

                string txt_categoria_eliminada = "Categoria eliminada";
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void modificarCategoria(Categoria Categoria_obj, int ID_a_modificar)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();

            try
            {
                // SQL usa ' para el query. y c# com dobles para separar cadenas
                conexionDB_Obj.EjecutarComando("UPDATE CATEGORIAS SET Descripcion = '" + Categoria_obj.Descripcion + " ' WHERE ID = " + ID_a_modificar);
                string txt_categoria_actualizada = "Categoria Actualizada";
            }
            catch (Exception)
            {

                throw;
            }
        }

        public Categoria Buscar_Categoria_por_ID(int id_buscado)

        {
            try
            {
                //conexion.Open();

                string query = "Select id, Descripcion from CATEGORIAS";
                //cmd = new SqlCommand(query, conexion);

                reader = conexionDB_obj.LeerDatos(query); // cmd.ExecuteReader();

                Categoria Categoria = new Categoria();
                while (reader.Read())
                {

                    Categoria.Id = Convert.ToInt32(reader["Id"]);

                    if (Categoria.Id == id_buscado)
                    {
                        Categoria.Id = Convert.ToInt32(reader["Id"]);
                        Categoria.Descripcion = reader["Descripcion"].ToString();
                    }
                }
                return Categoria;

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }


        }
    }
}  