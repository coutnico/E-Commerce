using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Commerce_Models
{
    public class Suspension
    {

        public int ID_Suspension { get; set; }
        public int ID_Usuario { get; set; }
        public DateTime Fecha_Inicio { get; set; }
        public DateTime Fecha_Fin { get; set; }
    }
}