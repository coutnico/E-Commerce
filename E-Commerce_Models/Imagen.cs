using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Commerce_Models
{
    public class Imagen
    {
        public int Id { get; set; }
        public int IdArticulo { get; set; }
        public string URL { get; set; }
    }
}