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
    public partial class viewUsuarioPublicaciones : System.Web.UI.Page
    {
        private List<Articulo> lista_articulos;
        protected void Page_Load(object sender, EventArgs e)
        {


            Articulo articulo = new Articulo();

            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            lista_articulos = articuloNegocio.ListarArticulos();


            if (!IsPostBack)
            {
                reapeterProductosUsuario.DataSource = lista_articulos;
                reapeterProductosUsuario.DataBind(); // VINCULA LOS DATOS
            }

        }
    }
}