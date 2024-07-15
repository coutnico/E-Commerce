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
    public partial class viewComprasUsuario : System.Web.UI.Page
    {

        private List<Articulo> lista_articulos;
        private List<Publicaciones> lista_publicaciones;
        protected void Page_Load(object sender, EventArgs e)
        {
            Articulo articulo = new Articulo();

            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            lista_articulos = articuloNegocio.ListarArticulos();


            Usuarios usuario = (Usuarios)Session["usuario"]; // casteo explicito
            Session.Remove("IndiceImagen");

            cantidad_compras.Text = "0";
             int cantidad_compras_aux = 0;

            if (usuario == null) // Si no hay nadie logueado, que no permita ingresar a la pagina de perfil.
            {
                Session.Add("error", "Debes loguearte para ingresar");
                Response.Redirect("viewLogin.aspx", false);

            }

            if (!IsPostBack)
            {

                ComprasNegocio comprasNegocio = new ComprasNegocio();
                List<Compras> listaCompras;
                List<Compras> listaComprasfiltradaporusuario = new List<Compras>(); ;



                listaCompras = comprasNegocio.ListarCompras();
                foreach (Compras compras in listaCompras)
                {
                    if ((usuario.Id == compras.IdUsuario) && (compras.Cancelada == false))
                    {

                        listaComprasfiltradaporusuario.Add(compras);

                        cantidad_compras_aux = Convert.ToInt32(cantidad_compras.Text) + 1;
                        cantidad_compras.Text = Convert.ToString(cantidad_compras_aux);
                    }
                }
                reapeterComprasUsuario.DataSource = listaComprasfiltradaporusuario;
                reapeterComprasUsuario.DataBind(); // VINCULA LOS DATOS

            }
        }

        protected void btnChat_Click(object sender, EventArgs e)
        {

            int idCompra = Convert.ToInt32(((Button)sender).CommandArgument);

            Session.Remove("IdCompra");
            Session.Add("IdCompra", idCompra);
            Response.Redirect("viewChatHub.aspx",false);
        }

        protected Publicaciones busquedaPublicacion(int idPublicacion)
        {

            Publicaciones_Negocio publicaciones_Negocio = new Publicaciones_Negocio();
            Publicaciones publicaciones = new Publicaciones();

            return publicaciones = publicaciones_Negocio.Buscar_Publicacion_por_ID(idPublicacion);


        }
    }
}