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
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Usuarios usuario = (Usuarios)Session["usuario"]; // casteo explicito

            if (usuario == null) // Si no hay nadie logueado, que no permita ingresar a la pagina de perfil.
            {
                Session.Add("error", "Debes loguearte para ingresar");
                Response.Redirect("viewLogin.aspx", false);

            }

            if (!IsPostBack)
            {

                CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
                List<Categoria> listacategoria;
                listacategoria = categoriaNegocio.ListarCategorias();
               
                reapeterAgregarPublicacion.DataSource = listacategoria;
                reapeterAgregarPublicacion.DataBind(); // VINCULA LOS DATOS

            }



        }

        protected void btnSeleccionarCategoria_Click(object sender, EventArgs e)
        {

            string IdCategoria = Convert.ToString(((Button)sender).CommandArgument);

            Session.Remove("IdCategoria");

            Session.Add("IdCategoria", IdCategoria);

            Response.Redirect("viewUsuarioAgregarPublicacion_2.aspx");
        }
    }
}