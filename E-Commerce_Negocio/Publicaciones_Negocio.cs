using E_Commerce_Controller;
using E_Commerce_Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
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

                string query = "Select IdPublicacion, IdUsuario, IdArticulo, Stock, Pausada, Baja_Logica from PUBLICACIONES";

                reader = conexionDB_obj.LeerDatos(query);

                
                while (reader.Read())
                {

                    Publicaciones publicaciones = new Publicaciones();

                    publicaciones.IdPublicacion = Convert.ToInt32(reader["IdPublicacion"]);
                    publicaciones.IdUsuario = Convert.ToInt32(reader["IdUsuario"]);
                    publicaciones.articulo.ID = Convert.ToInt32(reader["IdArticulo"]);
                    publicaciones.Stock = Convert.ToInt32(reader["Stock"]);
                    publicaciones.Pausada = Convert.ToBoolean(reader["Pausada"]);
                    publicaciones.Baja_Logica = Convert.ToBoolean(reader["Baja_Logica"]);

                    // Busco en articulos y guardo en publicaciones para listar
                    articulo = articuloNegocio.Buscar_Articulo_por_ID(publicaciones.articulo.ID);
                    publicaciones.articulo = articulo;

                    marca = marcaNegocio.Buscar_Marca_por_ID(articulo.IDMarca);
                    categoria = categoriaNegocio.Buscar_Categoria_por_ID(articulo.IDCategoria);

                    publicaciones.articulo.Marca = marca.Descripcion;
                    publicaciones.articulo.Categoria = categoria.Descripcion;

                    publicaciones.Pausada_String = publicaciones.Pausada ? "Pausada" : "Activa";

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

                conexionDB_Obj.EjecutarComando("Insert into PUBLICACIONES (IdUsuario, IdArticulo, Stock, Pausada, Baja_Logica) Values (" + " '" + publicaciones_obj.IdUsuario + "' , '" + publicaciones_obj.articulo.ID + "' , '" + publicaciones_obj.Stock + "' , '" + 0 + "' , '" + 0 + "' ) ");
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

        public void pausaroactivarPublicacion(bool pausar_activar, int ID_a_pausar) // 1 es pausar
        {
            ConexionDB conexionDB_Obj = new ConexionDB();

            int valor_recibido; // es necesario para enviar al sql (bool/bit)

            valor_recibido = pausar_activar ? 1 : 0;

            try
            {              
                conexionDB_Obj.EjecutarComando("UPDATE PUBLICACIONES SET Pausada = " + valor_recibido + " where IdPublicacion = " + ID_a_pausar);

                string txt_publicacion_actualizado = "Publicacion Actualizada";
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {

               
            }
           
        }




        public void modificarPublicacion(Publicaciones publicacion_obj, int ID_a_modificar) // No se genera la pausa de publicacion desde aca
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

        public Publicaciones Buscar_Publicacion_por_ID(int id_buscado_publi)

        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            Marca marca = new Marca();
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            Categoria categoria = new Categoria();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            Imagen imagen = new Imagen();
            ImagenNegocio imagenNegocio = new ImagenNegocio();
            List<Imagen> listaimagenes = new List<Imagen>();

            // FALTA IMAGEN
            int id_aux = 0;

            try
            {

                string query = "Select IdPublicacion, IdUsuario, IdArticulo, Stock, Pausada, Baja_Logica  from PUBLICACIONES";

                reader = conexionDB_obj.LeerDatos(query); //reader = cmd.ExecuteReader();

                Publicaciones publicaciones = new Publicaciones();
                Articulo articulo = new Articulo();

                int IdArticulo_aux = new int();
                while (reader.Read())
                {

                    id_aux = Convert.ToInt32(reader["IdPublicacion"]);
                    //publicaciones.IdPublicacion = Convert.ToInt32(reader["IdPublicacion"]);

                    if (id_aux == id_buscado_publi)
                    {
                        publicaciones.IdPublicacion = Convert.ToInt32(reader["IdPublicacion"]);
                        publicaciones.IdUsuario = Convert.ToInt32(reader["IdUsuario"]);
                        publicaciones.Pausada = Convert.ToBoolean(reader["Pausada"]);
                        publicaciones.Baja_Logica = Convert.ToBoolean(reader["Baja_Logica"]);

                        // publicaciones.articulo.ID = Convert.ToInt32(reader["IdArticulo"]);
                        IdArticulo_aux = Convert.ToInt32(reader["IdArticulo"]);
                        publicaciones.Stock = Convert.ToInt32(reader["Stock"]);
                        publicaciones.articulo = articuloNegocio.Buscar_Articulo_por_ID(IdArticulo_aux);

                        publicaciones.Pausada_String = publicaciones.Pausada ? "Pausada" : "Activa";

                        marca = marcaNegocio.Buscar_Marca_por_ID(publicaciones.articulo.IDMarca);
                        categoria = categoriaNegocio.Buscar_Categoria_por_ID(publicaciones.articulo.IDCategoria);

                        publicaciones.articulo.Marca = marca.Descripcion;
                        publicaciones.articulo.Categoria = categoria.Descripcion;

                        listaimagenes = imagenNegocio.ListarImagen();
                        foreach (Imagen imagen_aux in listaimagenes)
                        {
                            if (publicaciones.articulo.ID == imagen_aux.IdArticulo)
                            {
                                publicaciones.articulo.ImagenURl = imagen_aux.URL;// Imagen principal (la primera que encuentre)
                                break;
                            };
                        }

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