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
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            Articulo articulo = new Articulo();
            ImagenNegocio imagenNegocio = new ImagenNegocio();

            ////////-------------- VERIFICO QUE ESTE LOGUEADO
            Usuario usuario = (Usuario)Session["usuario"]; // casteo explicito

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

            int id = Convert.ToInt32(Session["IdArticulo"]);
            Imagen imagen_aux = new Imagen();
            if (!IsPostBack)
            {

                foreach (Imagen imagen in imagenNegocio.ListarImagen())
                {
                    if (imagen.IdArticulo == id)
                    {
                        imagenes.Add(imagen);
                        imagen_aux = imagen;
                    }
                }
              

                articulo = articuloNegocio.Buscar_Articulo_por_ID(id);
                txtNombre.Text = articulo.Nombre;
                txtCodigo.Text = articulo.Codigo;
                CantidadImagenes.InnerText = "Cantidad de imagenes: " + imagenes.Count.ToString();
                ImagenPrincipalArticulo.Src = imagenes[IndiceImagen].URL;
                listMarca.SelectedValue = Convert.ToString(articulo.IDMarca);
                listCat.SelectedValue = Convert.ToString(articulo.IDCategoria);
                //txtMarca.Text = articulo.Marca;
                //txtCategoria.Text = articulo.Categoria;
                txtDescripcion.Text = articulo.Descripcion;
                txtPrecio.Text = articulo.Precio.ToString();

                txtImagenUrl.Text = imagen_aux.URL;



            }
        }

        protected void btnEliminarPublicacion_Click(object sender, EventArgs e)
        {
           // lblposback.Text = "";
            Articulo articulo = new Articulo();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            //Imagen imagen = new Imagen();
            ImagenNegocio imagenNegocio = new ImagenNegocio();

            int id = Convert.ToInt32(Session["IdArticulo"]);

            try
            {

                articuloNegocio.eliminarArticulo(id);


                foreach (Imagen imagen in imagenNegocio.ListarImagen())
                {
                    if (imagen.IdArticulo == id)
                    {
                        imagenNegocio.EliminarImagen(id);
                    }
                }
                

                articulo.ID = id;

                string mensaje = "Articulo ID " + articulo.ID + " se ha eliminado Correctamente ";
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
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            Articulo articulo = new Articulo();
            int id = Convert.ToInt32(Session["IdArticulo"]);

            Imagen imagen = new Imagen();
            ImagenNegocio imagenNegocio = new ImagenNegocio();

            string mensaje;
            try
            {

                articulo.Nombre = txtNombre.Text;
                articulo.Codigo = txtCodigo.Text;
                articulo.Descripcion = txtDescripcion.Text;
                articulo.IDMarca = Convert.ToInt32(listMarca.SelectedValue);
                articulo.IDCategoria = Convert.ToInt32(listCat.SelectedValue);


                articulo.Precio = Convert.ToDecimal(txtPrecio.Text);
                // articulo.Precio = Convert.ToDecimal(txtPrecio.Text.ToString(CultureInfo.InvariantCulture));
                articulo.ID = id;

                imagen.URL = txtImagenUrl.Text;

                articuloNegocio.modificarArticulo(articulo,id);
                imagenNegocio.ModificarImagen(articulo.ID, imagen.URL); // 


                mensaje = "Articulo ID " + articulo.ID + " se ha modificado Correctamente ";
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