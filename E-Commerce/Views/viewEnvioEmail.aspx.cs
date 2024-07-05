using E_Commerce_Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_web_equipo_19.Views
{
    public partial class viewEnvioEmail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void enviarEmail_Click(object sender, EventArgs e)
        {
            EmailService emailService = new EmailService();

            emailService.armarCorreo(txtEmail.Text, txtAsuntoEmail.Text, txtMensajeEmail.Text);
            try
            {
                emailService.enviarEmail();
                txtEmail.Text = "";
                txtAsuntoEmail.Text = "";
                txtMensajeEmail.Text = "";

            } 
            catch (Exception ex) { // received error frm class
                Session.Add("ErrorEnvioEmail", ex); 
            }


        }
    }
}