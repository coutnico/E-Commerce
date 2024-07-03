using E_Commerce_Models;
using E_Commerce_Negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_web_equipo_19.Views
{
    public partial class viewManagerUsuarios : System.Web.UI.Page
    {
        private Usuario_Negocio usuario_Negocio = new Usuario_Negocio();
        public List<Usuarios> Lista_Usuarios { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuarios usuario = (Usuarios)Session["usuario"]; // casteo explicito
            if (usuario == null) // Si no hay nadie logueado, que no permita ingresar a la pagina de perfil.
            {
                Session.Add("error", "Debes loguearte para ingresar");
                Response.Redirect("viewLogin.aspx", false);

            }

            Lista_Usuarios = usuario_Negocio.ListarUsuarios();
            if (!IsPostBack)
            {
                rpUsuarios.DataSource = Lista_Usuarios;
                rpUsuarios.DataBind();
            }

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    int ID = Convert.ToInt32(((Button)sender).CommandArgument);
            //    usuario_Negocio.EliminarUsaurioPorID(ID);

            //    // Recargar los datos y volver a enlazar el control Repeater
            //    rpUsuarios.DataSource = usuario_Negocio.ListarUsuarios();
            //    rpUsuarios.DataBind();

            //}
            //catch (Exception)
            //{

            //    throw;
            //}

        }

        protected void txtBuscador_TextChanged(object sender, EventArgs e)
        {
            string textoFiltardo = ((TextBox)sender).Text.ToUpper();

            List<Usuarios> listaFiltrada = new List<Usuarios>() { };

            foreach (Usuarios usuario in Lista_Usuarios)
            {
                if (usuario.User.ToUpper().Contains(textoFiltardo))
                {
                    listaFiltrada.Add(usuario);
                }
            }

            rpUsuarios.DataSource = listaFiltrada;
            rpUsuarios.DataBind();
        }

        protected string GetTipoUsuarioText(object tipoUsuario)
        {
            int tipo = Convert.ToInt32(tipoUsuario);
            return tipo == 2 ? "Administrador" : "Usuario";
        }

        protected void btnAdvertencia_Click(object sender, ImageClickEventArgs e)
        {
            int Id_Usuario = Convert.ToInt32(((ImageButton)sender).CommandArgument);
            Advertencias_Negocio advertencias_Negocio = new Advertencias_Negocio();

            try
            {
                int ContadordeAdvertencias = 0;
                foreach (Advertencia advertencia in advertencias_Negocio.ListarAdvertencias())
                {
                    if (advertencia.ID_Usuario == Id_Usuario)
                    {
                        ContadordeAdvertencias++;
                    }
                }


                if (ContadordeAdvertencias > 2)
                {
                    Suspensiones_Negocio suspensiones = new Suspensiones_Negocio();
                    int contadorSuspensionesActivas = 0;
                    foreach (Suspension suspension in suspensiones.ListarSuspensiones())
                    {
                        if (suspension.ID_Usuario == Id_Usuario && DateTime.Today <= suspension.Fecha_Fin)
                        {
                            contadorSuspensionesActivas++;
                        }
                    }

                    if (contadorSuspensionesActivas == 0)
                    {
                        suspensiones.InsertarSuspension(Id_Usuario);
                    }



                    string script = "ShowUsuarioSuspendido();";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "showalert", script, true);
                }
                else
                {
                    advertencias_Negocio.InsertarAdvertencia(Id_Usuario);
                    string script = "ShowEnviarAdvertencia();";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "showalert", script, true);
                }

            }
            catch (SqlException)
            {
                Session.Add("Error", $"Error al colocar una advertencia al usuario ID° = {Id_Usuario.ToString()}");
                Response.Redirect("viewError.aspx", false);
            }

        }

        protected void btnPublicacionVerAdm_Click(object sender, EventArgs e)
        {
            
            string idUsuario = ((Button)sender).CommandArgument;

            Session.Remove("idUsuario_Publications");
            Session.Add("idUsuario_Publications", idUsuario);


            Response.Redirect("viewAdmin_Publicaciones.aspx", false);
        }
    }
}