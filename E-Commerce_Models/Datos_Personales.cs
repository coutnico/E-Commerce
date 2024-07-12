using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Commerce_Models
{
    public class Datos_Personales
    {
        public int ID { get; set; }
        public int ID_Usuario { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Genero { get; set; }
        public int Telefono { get; set; }
        public int TelefonoAux { get; set; }
        public int Documento { get; set; }
    }
}