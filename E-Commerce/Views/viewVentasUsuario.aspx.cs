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
    public partial class viewVentasUsuario : System.Web.UI.Page
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

            cantidad_ventas.Text = "0";
            int cantidad_ventas_aux = 0;

            if (usuario == null) // Si no hay nadie logueado, que no permita ingresar a la pagina de perfil.
            {
                Session.Add("error", "Debes loguearte para ingresar");
                Response.Redirect("viewLogin.aspx", false);

            }

            if (!IsPostBack)
            {

                ComprasNegocio comprasNegocio = new ComprasNegocio();
                List<Compras> listaCompras;
                List<Compras> listaVentasfiltradaporusuario = new List<Compras>(); ;

                Publicaciones_Negocio publicaciones_Negocio = new Publicaciones_Negocio();
                List<Publicaciones> listpublicaciones = new List<Publicaciones>();

                listaCompras = comprasNegocio.ListarCompras();


                listpublicaciones = publicaciones_Negocio.ListarPublicaciones();  // Busco que usuario fue el que realizo la publicacion (es decir, el vendedor)
                foreach (Compras compras in listaCompras)
                {
                    foreach (Publicaciones publicaciones in listpublicaciones) { 

                    if ((usuario.Id == publicaciones.IdUsuario) && (compras.IdPublicacion == publicaciones.IdPublicacion) && ((compras.Estado == 1) || (compras.Estado == 2)) && (compras.Cancelada == false))
                    {

                        listaVentasfiltradaporusuario.Add(compras); // en realidad es una venta que realizó.

                        cantidad_ventas_aux = Convert.ToInt32(cantidad_ventas.Text) + 1;
                        cantidad_ventas.Text = Convert.ToString(cantidad_ventas_aux);
                    }
                    }
                }
                reapeterVentasUsuario.DataSource = listaVentasfiltradaporusuario;
                reapeterVentasUsuario.DataBind(); // VINCULA LOS DATOS

            }
        }

        protected void btnChat_Click(object sender, EventArgs e)
        {

            int idCompra = Convert.ToInt32(((Button)sender).CommandArgument);

            Session.Remove("RemitenteChat");
            Session.Add("RemitenteChat", 2); // 0=admin 1=comprador 2= vendedor

            Session.Remove("IdCompra");
            Session.Add("IdCompra", idCompra);
            Response.Redirect("viewChatHub.aspx", false);
        }

        //funciones auxiliares
        protected Publicaciones busquedaPublicacion(int idPublicacion)
        {

            Publicaciones_Negocio publicaciones_Negocio = new Publicaciones_Negocio();
            Publicaciones publicaciones = new Publicaciones();

            return publicaciones = publicaciones_Negocio.Buscar_Publicacion_por_ID(idPublicacion);
        }


        protected float totalCompra(int QComprada, float precioUnitairo)
        {
            float total = 0;

            return total = QComprada * precioUnitairo;

        }
    }
}