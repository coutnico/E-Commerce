using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.AspNet.SignalR;


namespace E_Commerce_Models
{
    public class ChatHub : Hub
    {
        public void Send(string name, string message)
        {
            // Call the addNewMessageToPage method to update clients.
            Clients.All.addNewMessageToPage(name, message);
        }

        public async Task SendMessage(string user, string message)
        {
          await Clients.All.SendAsync("ReceiveMessage", user, message);
            //Clients.User("kaskas").SendAsync(user, message);     Ejemplo
        }
      
    }
}