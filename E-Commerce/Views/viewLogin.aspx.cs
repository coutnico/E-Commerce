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
    public partial class viewLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            Usuarios usuario;
            Usuario_Negocio usuario_Negocio = new Usuario_Negocio();    
            try
            {
                usuario = new Usuarios(txtUser.Text,txtPass.Text, false);
                
                if(usuario_Negocio.loguear(usuario).Existe && !usuario_Negocio.loguear(usuario).Suspendido)
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("viewProfile.aspx",false); // Para evitar que genere el th. ex.

                }
                else if (!usuario_Negocio.loguear(usuario).Existe && !usuario_Negocio.loguear(usuario).Suspendido)
                {
                    Session.Add("Error", "Usuario o Contraseña Incorrectos");
                    Response.Redirect("viewError.aspx",false);
                }
                else if(usuario_Negocio.loguear(usuario).Existe && usuario_Negocio.loguear(usuario).Suspendido)
                {
                    Session.Add("Error", "Usuario suspendido, ponerse en contacto con closeMarket@hotmail.com para renovar la membresia");
                    Response.Redirect("viewError.aspx", false);
                }
            }

            catch (Exception ex)
            {
                Session.Add("Error", "user o pass incorrecto");
                Response.Redirect("viewError.aspx", false);

            }

            finally
            {


            }

        }

        protected void BtnRegistarme_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewRegister.aspx");
        }
    }
}