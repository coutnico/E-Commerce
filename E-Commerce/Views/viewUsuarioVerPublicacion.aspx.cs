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

            if (!IsPostBack)
            {

                foreach (Imagen imagen in imagenNegocio.ListarImagen())
                {
                    if (imagen.IdArticulo == id)
                    {
                        imagenes.Add(imagen);
                    }
                }

                articulo = articuloNegocio.Buscar_Articulo_por_ID(id);
                NombreProducto.InnerText = articulo.Nombre;
                CantidadImagenes.InnerText = "Cantidad de imagenes: " + imagenes.Count.ToString();
                ImagenPrincipalArticulo.Src = imagenes[IndiceImagen].URL;
                listMarca.SelectedValue = Convert.ToString(articulo.IDMarca);
                listCat.SelectedValue = Convert.ToString(articulo.IDCategoria);
                //txtMarca.Text = articulo.Marca;
                //txtCategoria.Text = articulo.Categoria;
                DescripcionArticulo.Text = articulo.Descripcion;
                PrecioProducto.Text = "$" + articulo.Precio.ToString();



            }
        }

            protected void btnEliminarPublicacion_Click(object sender, EventArgs e)
            {

            }

            protected void btnModificarPublicacion_Click(object sender, EventArgs e)
            {

            }

            protected void Atras_Click(object sender, EventArgs e)
            {

            }

            protected void Siguiente_Click(object sender, EventArgs e)
            {

            }
        }
    }