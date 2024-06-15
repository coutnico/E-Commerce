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


            Usuario usuario = (Usuario)Session["usuario"]; // casteo explicito

            if (usuario == null) // Si no hay nadie logueado, que no permita ingresar a la pagina de perfil.
            {
                Session.Add("error", "Debes loguearte para ingresar");
                Response.Redirect("viewLogin.aspx", false);

            }

            if (!IsPostBack)
            {
                reapeterProductosUsuario.DataSource = lista_articulos;
                reapeterProductosUsuario.DataBind(); // VINCULA LOS DATOS
            }

        }

        protected void BtnVerPublicacion_Click(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;

            // Session.Clear();
            Session.Remove("IDArticulo"); // para que no me deslogue y borre resto de variables guardadas en sesion.
            Session.Add("IDArticulo", id);
          


            Response.Redirect("viewUsuarioVerPublicacion.aspx", false);
        }
    }
}