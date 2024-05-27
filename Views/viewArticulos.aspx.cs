using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tp_web_equipo_19.Models;

namespace tp_web_equipo_19.Views
{
    public partial class viewArticulos : System.Web.UI.Page
    {
        private SiteMaster master;
        private List<Articulo> lista_articulos;
        protected void Page_Load(object sender, EventArgs e)
        {
            master = (SiteMaster)this.Master;
            master.Contador = Carrito.ContadorArticulos.ToString();

            Articulo articulo = new Articulo();

            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            lista_articulos = articuloNegocio.ListarArticulos();


            if (!IsPostBack)
            {
                reapeter_articulos.DataSource = lista_articulos;
                reapeter_articulos.DataBind(); // VINCULA LOS DATOS
            }

        }

        protected void btnAgregarCarrito_Click(object sender, EventArgs e)
        {

            master = (SiteMaster)this.Master;

            Carrito.ContadorArticulos++;

            master.Contador = Carrito.ContadorArticulos.ToString();


            string valor = ((Button)sender).CommandArgument;

            foreach (var articulo in lista_articulos)
            {
                if (articulo.ID == Convert.ToInt32(valor))
                {
                    Carrito.AgregarArticulo(articulo);
                   // Carrito.ListaArticulosFiltrados(); // AGREGADO
                    break;
                }
            }

        }

        protected void BtnVerDetalle_Click1(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;

            Session.Clear();
            Session.Add("IdArticulo", id);

            Response.Redirect("viewDetallada.aspx");

        }

        protected void txtBuscador_TextChanged(object sender, EventArgs e)
        {
            string textoFiltardo = ((TextBox)sender).Text.ToUpper();

            List<Articulo> listaFiltrada = new List<Articulo>() { };

            foreach (Articulo articulo in lista_articulos)
            {
                if (articulo.Nombre.ToUpper().Contains(textoFiltardo))
                {
                    listaFiltrada.Add(articulo);
                }
            }

            reapeter_articulos.DataSource = listaFiltrada;
            reapeter_articulos.DataBind();
        }
    }
}