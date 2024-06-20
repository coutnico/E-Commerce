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
        private List<Publicaciones> lista_publicaciones;


        protected void Page_Load(object sender, EventArgs e)
        {

            Articulo articulo = new Articulo();

            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            lista_articulos = articuloNegocio.ListarArticulos();


            Usuarios usuario = (Usuarios)Session["usuario"]; // casteo explicito

            if (usuario == null) // Si no hay nadie logueado, que no permita ingresar a la pagina de perfil.
            {
                Session.Add("error", "Debes loguearte para ingresar");
                Response.Redirect("viewLogin.aspx", false);

            }

            if (!IsPostBack)
            {

                Publicaciones_Negocio publicaciones_Negocio = new Publicaciones_Negocio();
                List<Publicaciones> listapublicaciones;
                List<Publicaciones> listapublicacionesfiltradaporusuario = new List<Publicaciones>(); ;
                
                listapublicaciones = publicaciones_Negocio.ListarPublicaciones();
                foreach (Publicaciones publicaciones in listapublicaciones)
                {
                    if (usuario.Id == publicaciones.IdUsuario)
                    {

                        //imgProductosUsuario.ImageUrl = publicaciones.articulo.ImagenURl; // img principal
                        //lblNombre.Text = publicaciones.articulo.Nombre;
                        //lblPrecio.Text = "$" + Convert.ToString(publicaciones.articulo.Precio);
                        //lblStock.Text = "Stock: " + Convert.ToString(publicaciones.Stock);
                        //BtnVerPublicacion.CommandArgument = "1010";//Convert.ToString(publicaciones.IdPublicacion);

                        listapublicacionesfiltradaporusuario.Add(publicaciones);
                    }
                }
                reapeterProductosUsuario.DataSource = listapublicacionesfiltradaporusuario;
                reapeterProductosUsuario.DataBind(); // VINCULA LOS DATOS

            }

        }

        protected void BtnVerPublicacion_Click(object sender, EventArgs e)
        {

            string id = ((Button)sender).CommandArgument;


            // Session.Clear();
            Session.Remove("IdPublicacion"); // solo borra esta variable de la sesion.
            Session.Add("IdPublicacion", id);



            Response.Redirect("viewUsuarioVerPublicacion.aspx", false);
        }
    }
}