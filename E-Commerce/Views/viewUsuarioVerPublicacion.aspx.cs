using E_Commerce_Models;
using E_Commerce_Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_web_equipo_19.Views
{
    public partial class viewUsuarioVerPublicacion : System.Web.UI.Page
    {
        private List<Imagen> imagenes = new List<Imagen>() { };
        private int IndiceImagen = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Publicaciones_Negocio publicacionesNegocio = new Publicaciones_Negocio();
            Publicaciones publicaciones = new Publicaciones();

            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            Articulo articulo = new Articulo();
            
            ImagenNegocio imagenNegocio = new ImagenNegocio();
            Imagen imagen_aux = new Imagen();

            ////////-------------- VERIFICO QUE ESTE LOGUEADO
            Usuarios usuario = (Usuarios)Session["usuario"]; // casteo explicito

            if (usuario == null) // Si no hay nadie logueado, que no permita ingresar a la pagina de perfil.
            {
                Session.Add("error", "Debes loguearte para ingresar");
                Response.Redirect("viewLogin.aspx", false);

            }
            ////////-------------- Genero lista por def.

            //Cargo lista cat y marca
            Marca marca = new Marca();
            MarcaNegocio marcaNegocio = new MarcaNegocio();

            List<Marca> marca_list = marcaNegocio.ListarMarcas();

            if (!IsPostBack)
            {
                //lblposback.Text = "PRIMER POSBACK";
                try
                {
                    listMarca.DataSource = marca_list;
                    listMarca.DataTextField = "Descripcion"; // Nombre del campo que se mostrará
                    listMarca.DataValueField = "Id";   // Nombre del campo que se utilizará como valor
                    listMarca.DataBind();
                }
                catch (Exception ex)
                {

                }
            } // else { lblposback.Text = "SEGUNDO POSBACK"; }


            Categoria categoria = new Categoria();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

            List<Categoria> categoria_list = categoriaNegocio.ListarCategorias();

            if (!IsPostBack)
            {
                try
                {

                    listCat.DataSource = categoria_list;
                    listCat.DataTextField = "Descripcion"; // Nombre del campo que se mostrará
                    listCat.DataValueField = "Id";   // Nombre del campo que se utilizará como valor
                    listCat.DataBind();
                }
                catch (Exception ex)
                {

                }
            }


            ////////-------------- Valores por sesion 
            if  (Convert.ToString(Session["IdPublicacion"]) == null)
            {
                Session.Add("error", "Error publicacion");
                Response.Redirect("viewLogin.aspx", false);
            }


            int IdPublicacion = Convert.ToInt32(Session["IdPublicacion"]);
            
            lblIdPubli.Text = Convert.ToString(IdPublicacion);

            publicaciones = publicacionesNegocio.Buscar_Publicacion_por_ID(IdPublicacion);
            

            if (!IsPostBack)
            {

                foreach (Imagen imagen in imagenNegocio.ListarImagen())
                {
                    if (imagen.IdArticulo == publicaciones.articulo.ID)
                    {
                        imagenes.Add(imagen);
                        
                    }
                }

                imagen_aux = imagenes[0];

                txtStock.Text = Convert.ToString(publicaciones.Stock);
                txtNombre.Text = publicaciones.articulo.Nombre;
                txtCodigo.Text = publicaciones.articulo.Codigo;
                CantidadImagenes.InnerText = "Cantidad de imagenes: " + imagenes.Count.ToString();
                ImagenPrincipalArticulo.Src = imagenes[IndiceImagen].URL;
                listMarca.SelectedValue = Convert.ToString(publicaciones.articulo.IDMarca);
                listCat.SelectedValue = Convert.ToString(publicaciones.articulo.IDCategoria);
                txtDescripcion.Text = publicaciones.articulo.Descripcion;
                txtPrecio.Text = publicaciones.articulo.Precio.ToString();
                txtImagenUrl.Text = imagen_aux.URL;
                // txtImagenUrl.Text = publicaciones.articulo.ImagenURl;

            }
        }

        protected void btnEliminarPublicacion_Click(object sender, EventArgs e)
        {
           // lblposback.Text = "";
            Publicaciones publicaciones = new Publicaciones();  
            Publicaciones_Negocio publicacionesNegocio = new Publicaciones_Negocio();   


            Articulo articulo = new Articulo();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            //Imagen imagen = new Imagen();
            ImagenNegocio imagenNegocio = new ImagenNegocio();

            int IdPublicacion = Convert.ToInt32(Session["IdPublicacion"]);

            publicaciones = publicacionesNegocio.Buscar_Publicacion_por_ID(IdPublicacion);

            try
            {     
                publicacionesNegocio.eliminarPublicacion(IdPublicacion);

                foreach (Imagen imagen in imagenNegocio.ListarImagen())
                {
                    if (imagen.IdArticulo == publicaciones.articulo.ID)
                    {
                        imagenNegocio.EliminarImagen(publicaciones.articulo.ID);
                    }
                }
                
                string mensaje = "Articulo ID " + publicaciones.articulo.ID + " se ha eliminado Correctamente ";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "');", true);

                Response.Redirect("viewUsuarioPublicaciones.aspx");

            }
            catch
            {
              //  lblposback.Text = "ERROR AL ELIMINAR. refresque la pagina ! ";
            }


        }


        protected void btnModificarPublicacion_Click(object sender, EventArgs e)
        {
            Publicaciones publicaciones = new Publicaciones();
            Publicaciones_Negocio publicacionesNegocio = new Publicaciones_Negocio();

            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            Articulo articulo = new Articulo();
            Usuarios usuario = (Usuarios)Session["usuario"];
            int IdPublicacion = Convert.ToInt32(Session["IdPublicacion"]);

            Imagen imagen = new Imagen();
            ImagenNegocio imagenNegocio = new ImagenNegocio();

            
            publicaciones = publicacionesNegocio.Buscar_Publicacion_por_ID(IdPublicacion); // lo necesito para el ID del art y pub


            string mensaje;
            try
            {
                
                publicaciones.IdUsuario = usuario.Id;
                publicaciones.Stock = Convert.ToInt32(txtStock.Text);
                publicaciones.articulo.ID = publicaciones.articulo.ID;
                publicaciones.articulo.Nombre = txtNombre.Text;
                publicaciones.articulo.Codigo = txtCodigo.Text;
                publicaciones.articulo.Descripcion = txtDescripcion.Text;
                publicaciones.articulo.IDMarca = Convert.ToInt32(listMarca.SelectedValue);
                publicaciones.articulo.IDCategoria = Convert.ToInt32(listCat.SelectedValue);
                publicaciones.articulo.Precio = Convert.ToDecimal(txtPrecio.Text);
                imagen.URL = txtImagenUrl.Text;

                
                publicacionesNegocio.modificarPublicacion(publicaciones, publicaciones.IdPublicacion);
                imagenNegocio.ModificarImagen(publicaciones.articulo.ID, imagen.URL); // 

                mensaje = "Articulo ID " + publicaciones.articulo.ID + " se ha modificado Correctamente ";
                // Registra el script para mostrar una alerta al usuario en el navegador
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "');", true);

            }
            catch (Exception ex)
            {
                mensaje = "Se produjo una excepción: " + ex.Message;
                // Registra el script para mostrar una alerta al usuario en el navegador
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "');", true);
            }


        }
        protected void Atras_Click(object sender, EventArgs e)
        {
            if (IndiceImagen != 0)
            {
                IndiceImagen--;
                ImagenPrincipalArticulo.Src = imagenes[IndiceImagen].URL;
            }
        }

        protected void Siguiente_Click(object sender, EventArgs e)
        {
            if (IndiceImagen != imagenes.Count - 1)
            {
                IndiceImagen++;
                ImagenPrincipalArticulo.Src = imagenes[IndiceImagen].URL;
            }
        }

       
    }
    }