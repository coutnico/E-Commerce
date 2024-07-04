using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Commerce_Models
{
    public class Mensaje
    {
        public int Id { get; set; }
        public int ConversacionId { get; set; }
        public string EmisorId { get; set; } // Id del usuario que envía el mensaje
        public string ReceptorId { get; set; } // Id del usuario que recibe el mensaje
        public string Contenido { get; set; }
        public DateTime FechaEnvio { get; set; }

        //public virtual Conversacion Conversacion { get; set; }
        //public virtual ApplicationUser Emisor { get; set; }
        //public virtual ApplicationUser Receptor { get; set; }
    }
}