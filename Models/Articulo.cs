using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing; // VER SI USAMOS ESTA LIBRERIA U OTRA (COMO ImageSharp (ImageSharp))

namespace tp_web_equipo_19.Models
{
    public class Articulo
    {
        /* •	Código de artículo.
       •	Nombre.
       •	Descripción.
       •	Marca(seleccionable de una lista desplegable).
       •	Categoría(seleccionable de una lista desplegable.
       •	Imagen.
       •	Precio.*/


        public Int32 ID { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public Int32 IDMarca { get; set; }
        public Int32 IDCategoria { get; set; }
        public decimal Precio { get; set; }
        public string ImagenURl { get; set; }

        //DatosCargados
        public Image ImagenCargada { get; set; }
        public string Marca { get; set; }
        public string Categoria { get; set; }

        //FUNCIONES

    }
}