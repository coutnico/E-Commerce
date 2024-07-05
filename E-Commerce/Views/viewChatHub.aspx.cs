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
            // Registra el hub de SignalR
            ScriptManager.RegisterStartupScript(this, GetType(), "signalr",
                "<script src='https://localhost:44380/wwwroot/js/signalr/dist/browser/signalr.js'></script>", false);

            // Lógica para manejar el envío de mensajes desde el servidor
            if (!IsPostBack)
            {
                // Nada específico para hacer en la carga inicial, puedes manejar eventos aquí si es necesario
            }
        }

        protected void sendButton_Click(object sender, EventArgs e)
        {
            // Obtener el nombre y el mensaje desde los controles ASP.NET
            string name = txtName.Text.Trim();
            string message = txtMessage.Text.Trim();

            // Llamar al método Send del hub de SignalR para enviar el mensaje
            var hubContext = GlobalHost.ConnectionManager.GetHubContext<ChatHub>();
            hubContext.Clients.All.addNewMessageToPage(name, message);

            // Limpiar el campo de mensaje después de enviar
            txtMessage.Text = "";
        }
    }
}