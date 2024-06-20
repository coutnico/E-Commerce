using E_Commerce_Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_web_equipo_19.Views
{
    public partial class viewProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuarios usuario = (Usuarios)Session["usuario"]; // casteo explicito

            if (usuario == null) // Si no hay nadie logueado, que no permita ingresar a la pagina de perfil.
            {
                Session.Add("error", "Debes loguearte para ingresar");
                Response.Redirect("viewLogin.aspx", false);

            }
            else
            {
                lblUsuario.Text = usuario.User;
                lblCorreoElectronico.Text = "Correo Electronico";



            }

        }

        protected void btnFotoPerfil_Click(object sender, ImageClickEventArgs e)
        {

        }

        public bool tipoUser_profile()
        {
            Usuarios usuario = (Usuarios)Session["usuario"]; // casteo explicito

            if (usuario != null)
            {
                if (usuario.tipoUsuario == TipoUsuario.ADMIN)
                {
                    return true;
                }
            }
            return false;
        }

        protected void btnMisVentas_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewUsuarioPublicaciones.aspx",false);

        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Session.Remove("usuario");
            Response.Redirect("viewLogin.aspx");
        }

        protected void btnEditarDatosAdmin_Click(object sender, EventArgs e)
        {

        }

        protected void btnABMAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewAdmin_AddArt.aspx");
        }

        protected void btnABMUsuarios_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewManagerUsuarios.aspx");
        }
    }
}