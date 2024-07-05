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
    public partial class viewRegister : System.Web.UI.Page
    {
        public Usuario_Negocio usuario_Negocio { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            usuario_Negocio = new Usuario_Negocio();
        }

        protected void btnRegistarse_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtContraseña.Text == txtConContraseña.Text)
                {
                    usuario_Negocio.CrearUsuario(txtNombreUsuario.Text, txtContraseña.Text, txtEmail.Text);
                    string script = "ShowUsuarioRegistrado();";

                    EmailService emailService = new EmailService();

                    emailService.armarCorreo(txtEmail.Text, $"Bienvenido {txtNombreUsuario.Text} a Close Market", "Empieza a navegar librementa buscando esas ofertas imperdibles que ofrece neustro sitio");

                    emailService.enviarEmail();

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "showalert", script, true);
                }
                else
                {
                    string script = "ShowContraseñaNoIgual();";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "showalert", script, true);
                }
            }
            catch (Exception)
            {
                string script = "ShowError();";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "showalert", script, true);
                throw;
            }
        }
    }
}