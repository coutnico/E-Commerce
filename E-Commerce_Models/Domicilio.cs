using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Commerce_Models
{
    public class Domicilio
    {
        public int ID { get; set; }
        public int ID_Usuario { get; set; }
        public string Calle { get; set; }
        public int Altura { get; set; }
        public int ID_Localidad { get; set; }
        public string Observacion { get; set; }
    }
}