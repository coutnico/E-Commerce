using E_Commerce_Models;
using E_Commerce_Negocio;
using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Management;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;



namespace tp_web_equipo_19.Views
{
    public partial class viewChatHub : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*  // Registra el hub de SignalR
              ScriptManager.RegisterStartupScript(this, GetType(), "signalr",
                  "<script src='https://localhost:44380/wwwroot/js/signalr/dist/browser/signalr.js'></script>", false);

              // Lógica para manejar el envío de mensajes desde el servidor
              if (!IsPostBack)
              {
                  //
              }*/

            Chat chat = new Chat();
            ChatNegocio chatNegocio = new ChatNegocio();
            List<Chat> listaChats;

            if (!IsPostBack)
            {

                listaChats = chatNegocio.ListarChats();

             
                List<Chat> listaChatsAMostrar = new List<Chat>();
                foreach (Chat chats_aux in listaChats)
                {
                    //***** Colocar IDCompra para filtro a la seleccionada por SESION cuando entren al link de la compra! MODIFICAR, AHORA ESTA HARDCODE
                    if (chats_aux.IdCompra == 1)
                    {
                        listaChatsAMostrar.Add(chats_aux);
                    }

                }

                reapeterChats.DataSource = listaChatsAMostrar;
                reapeterChats.DataBind();


            }
        }


        protected void btnEnviarMensaje_Click(object sender, EventArgs e)
        {
            Chat chat = new Chat();
            ChatNegocio chatNegocio = new ChatNegocio();

            //  int remitente = Convert.ToInt32(((Button)sender).CommandArgument);
            int remitente = 1; // TEMPORAL!

            chat.IdCompra = 1; //  //***** colocar dinamico cuando este la clase
            chat.Remitente = remitente; // Debe traer el valor por sesion 1 comprador 2 vendedor
            chat.Mensaje = txtMensajeNuevo.Text;

            try
            {
                chatNegocio.agregarChat(chat);
                Response.Redirect("viewChatHub.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error_chat", ex);
                Response.Redirect("viewError.aspx", false);
            }
        }
    }
}
