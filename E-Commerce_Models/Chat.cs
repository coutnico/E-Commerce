using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Commerce_Models
{
    public class Chat
    {
        public int Id { get; set; }
        public int IdCompra { get; set; } // Con esto ya obtengo IDComprador y Vendedor
        public int Remitente { get; set; } // 0: Admin 1:Comprador 2: Vendedor
        public string Mensaje { get; set; }

     /*   public Chat(int IdCompraaux)
        {
            //BUSCAR Quien lo envio en clase negocio Compra
           // Remitente = Remitente_buscado;
        }*/
 


    }
}