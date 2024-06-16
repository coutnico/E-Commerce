using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Commerce_Models
{
    public class Publicaciones
    {
        public int IdPublicacion {  get; set; } 
        public int IdUsuario { get; set; }
        public Articulo articulo { get; set; }
        public int Stock { get; set; }

        public Publicaciones()
        {
            articulo = new Articulo();
            
        }
        // Constructor para inicializar la clase
        //public Publicaciones(int idVendedor, Articulo articulo_aux, int stock_aux)
        //{
        //    IdUsuario = idVendedor;
        //    articulo = articulo_aux;
        //    Stock = stock_aux;
        //}
    }
}