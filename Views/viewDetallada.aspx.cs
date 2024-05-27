using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tp_web_equipo_19.Models;

namespace tp_web_equipo_19.Views
{
    public partial class viewDetallada : System.Web.UI.Page
    {
        private SiteMaster master;
        private Articulo articulo;
        private int IndiceImagen = 0;

        private ArticuloNegocio articuloNegocio = new ArticuloNegocio();
        private List<Imagen> imagenes = new List<Imagen>() { };
        protected void Page_Load(object sender, EventArgs e)
        {
            ImagenNegocio imagenNegocio = new ImagenNegocio();

            master = (SiteMaster)this.Master;
            master.Contador = Carrito.ContadorArticulos.ToString();

            int id = Convert.ToInt32(Session["IdArticulo"]);


            foreach (Imagen imagen in imagenNegocio.ListarImagen())
            {
                if (imagen.IdArticulo == id)
                {
                    imagenes.Add(imagen);
                }
            }

            foreach (Articulo articulo in articuloNegocio.ListarArticulos())
            {
                if (articulo.ID == id)
                {
                    CantidadImagenes.InnerText = "Cantidad de imagenes: " + imagenes.Count.ToString();
                    ImagenPrincipalArticulo.Src = imagenes[IndiceImagen].URL;
                    NombreProducto.InnerText = articulo.Nombre;
                    lblCategoria.Text = "Categoria: " + articulo.Categoria;
                    DescripcionArticulo.Text = articulo.Descripcion;
                    lblMarca.Text = "Marca: " + articulo.Marca;
                    PrecioProducto.Text = "$" + articulo.Precio.ToString();

                    this.articulo = articulo;
                    break;
                }
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

        protected void btnAgregarAlCarrito_Click(object sender, EventArgs e)
        {
            master = (SiteMaster)this.Master;

            foreach (var articulo in articuloNegocio.ListarArticulos())
            {
                if (articulo.ID == this.articulo.ID)
                {
                    Carrito.AgregarArticulo(this.articulo);
                    Carrito.ContadorArticulos++;
                    master.Contador = Carrito.ContadorArticulos.ToString();
                    break;
                }
            }
        }
    }
}