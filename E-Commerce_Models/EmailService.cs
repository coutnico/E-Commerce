using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace E_Commerce_Models
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;

        public EmailService() // constructor. coloco credenciales x def.
        {
            server = new SmtpClient();
            server.UseDefaultCredentials = false;
            server.Credentials = new NetworkCredential("marianoutnprogramacion@gmail.com", "sayj eqkg ebyw adrk"); // ver de generar archivo de configuracion.
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";
        }

        public void armarCorreo(string emailDestino, string asunto, string cuerpo)
        {
            email = new MailMessage();
            email.From = new MailAddress("marianoutnprogramacion@gmail.com"); //new MailAddress("noresponder@ecommerceprogramacioniii.com");
            email.To.Add(emailDestino);
            email.Subject = asunto;
            email.IsBodyHtml = true; // puedo escribar html en el body.
            email.Body = "<h1> CUERPO DEL CORREO </H1> </BR> continua aca..";
            //email.Body= cuerpo;
        }

        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch(Exception ex)
            {
                throw ex; // send error out
            }
        }

    }
}