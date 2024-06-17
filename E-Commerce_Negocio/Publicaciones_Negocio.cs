using E_Commerce_Controller;
using E_Commerce_Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;

namespace E_Commerce_Negocio
{
    public class Publicaciones_Negocio

    {

        ConexionDB conexionDB_obj = new ConexionDB();

        //SqlConnection conexion = new SqlConnection(conexionstring);
        //SqlCommand cmd;
        SqlDataReader reader = null;


        public List<Publicaciones> ListarPublicaciones()

        {
            Marca marca = new Marca();
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            Categoria categoria = new Categoria();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

            Imagen imagen = new Imagen();
            ImagenNegocio imagenNegocio = new ImagenNegocio();
            List<Imagen> listaimagenes = new List<Imagen>();
            List<Publicaciones> listaPublicaciones = new List<Publicaciones>();

            Articulo articulo = new Articulo();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            int x = 0, y = 0;



            try
            {

                string query = "Select IdPublicacion, IdUsuario, IdArticulo, Stock from PUBLICACIONES";

                reader = conexionDB_obj.LeerDatos(query);

                while (reader.Read())
                {

                    Publicaciones publicaciones = new Publicaciones();

                    publicaciones.IdPublicacion = Convert.ToInt32(reader["IdPublicacion"]);
                    publicaciones.IdUsuario = Convert.ToInt32(reader["IdUsuario"]);
                    publicaciones.articulo.ID = Convert.ToInt32(reader["IdArticulo"]);
                    publicaciones.Stock = Convert.ToInt32(reader["Stock"]);

                    // Busco en articulos y guardo en publicaciones para listar
                    articulo = articuloNegocio.Buscar_Articulo_por_ID(publicaciones.articulo.ID);
                    publicaciones.articulo = articulo;
                    //publicaciones.articulo.Codigo = articulo.Codigo;
                    //publicaciones.articulo.Nombre = articulo.Nombre;
                    //publicaciones.articulo.Descripcion = articulo.Descripcion;
                    //publicaciones.articulo.IDMarca = articulo.IDMarca;
                    //publicaciones.articulo.IDCategoria = articulo.IDCategoria;
                    //publicaciones.articulo.Precio = articulo.Precio;

                    listaimagenes = imagenNegocio.ListarImagen();
                    foreach (Imagen imagen_aux in listaimagenes)
                    {
                        if (publicaciones.articulo.ID == imagen_aux.IdArticulo) {
                            publicaciones.articulo.ImagenURl = imagen_aux.URL;// Imagen principal (la primera que encuentre)
                            break;
                        }; 
                    }
                   
                    

                    listaPublicaciones.Add(publicaciones);

                }

                return listaPublicaciones;
                //}
            }

            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }


        }

        public void agregarPublicacion(Publicaciones publicaciones_obj)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();
            Articulo articulo = new Articulo();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            List<Articulo> articulosList = new List<Articulo>();
            int x = 0, y = 0;

            try
            {

                // SQL usa ' para el query. y c# com dobles para separar cadenas

                articuloNegocio.agregarArticulo(publicaciones_obj.articulo);

                articulosList = articuloNegocio.ListarArticulos();

                for (x = 0; x < articulosList.Count; x++)
                {
                    articulo = articulosList[x]; // cargo el ultimo articulo para obtener el ultimo ID
                }
                publicaciones_obj.articulo.ID = articulo.ID;

                conexionDB_Obj.EjecutarComando("Insert into PUBLICACIONES (IdUsuario, IdArticulo, Stock) Values (" + " '" + publicaciones_obj.IdUsuario + "' , '" + publicaciones_obj.articulo.ID + "' , '" + publicaciones_obj.Stock + "' ) ");
                string txt_Publicacion_agregada = "Publicacion agregada exitosamente";
                //return 1;
            }
            catch (Exception)
            {
                //return 0;
                throw;

            }

        }

        public void eliminarPublicacion(int id_delete)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();
            Publicaciones publicaciones = new Publicaciones();
            Publicaciones_Negocio publicaciones_Negocio = new Publicaciones_Negocio();
            Articulo articulo = new Articulo();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            int x = 0;

            try
            {
                // SQL usa ' para el query. y c# com dobles para separar cadenas
                publicaciones = Buscar_Publicacion_por_ID(id_delete);

                articuloNegocio.eliminarArticulo(publicaciones.articulo.ID);

                conexionDB_Obj.EjecutarComando("Delete from PUBLICACIONES where IdPublicacion = " + id_delete);

                string txt_Publicacion_eliminada = "Publicacion eliminada";
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void modificarPublicacion(Publicaciones publicacion_obj, int ID_a_modificar)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();
            Publicaciones publicaciones = new Publicaciones();
            Publicaciones_Negocio publicaciones_Negocio = new Publicaciones_Negocio();
            Articulo articulo = new Articulo();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();



            try
            {
                //publicaciones = Buscar_Publicacion_por_ID(ID_a_modificar);
                articuloNegocio.modificarArticulo(publicacion_obj.articulo, publicacion_obj.articulo.ID);

                conexionDB_Obj.EjecutarComando("UPDATE PUBLICACIONES SET  IdUsuario=" + publicacion_obj.IdUsuario + ", IdArticulo =" + publicacion_obj.articulo.ID + ", Stock =" + publicacion_obj.Stock + " where IdPublicacion = " + ID_a_modificar);

                string txt_publicacion_actualizado = "Publicacion Actualizada";
            }
            catch (Exception)
            {

                throw;
            }


        }

        public Publicaciones Buscar_Publicacion_por_ID(int id_buscado)

        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            Articulo articulo = new Articulo();

            try
            {

                string query = "Select IdPublicacion, IdUsuario, IdArticulo, Stock from PUBLICACIONES";

                reader = conexionDB_obj.LeerDatos(query); //reader = cmd.ExecuteReader();

                Publicaciones publicaciones = new Publicaciones();

                int IdArticulo_aux=0;
                while (reader.Read())
                {

                    publicaciones.IdPublicacion = Convert.ToInt32(reader["IdPublicacion"]);

                    if (publicaciones.IdPublicacion == id_buscado)
                    {
                        publicaciones.IdUsuario = Convert.ToInt32(reader["IdUsuario"]);
                        // publicaciones.articulo.ID = Convert.ToInt32(reader["IdArticulo"]);
                        IdArticulo_aux = Convert.ToInt32(reader["IdArticulo"]);
                        publicaciones.Stock = Convert.ToInt32(reader["Stock"]);
                        articulo = articuloNegocio.Buscar_Articulo_por_ID(IdArticulo_aux);
                        // articulo = articuloNegocio.Buscar_Articulo_por_ID(publicaciones.articulo.ID);
                        publicaciones.articulo = articulo;
                        
                       
                    }
                }
                return publicaciones;

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }


        }

    }


}