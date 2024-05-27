using Antlr.Runtime.Tree;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.DynamicData;

namespace tp_web_equipo_19.Models
{
    public class ArticuloCarrito
    {
        public Int32 ID { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string Marca { get; set; }
        public string Categoria { get; set; }
        public decimal Precio { get; set; }
        public string ImagenURl { get; set; }
        public int Cantidad { get; set; }
    }
    public static class Carrito
    {
        public static int ContadorArticulos { get; set; }
        public static List<Articulo> ArticulosAgregados { get; set; }
        public static List<ArticuloCarrito> ArticulosFiltrados { get; set; }
        public static List<int> ArticulosFiltradosCantidad { get; set; }
        public static decimal Total { get; set; }

        static Carrito()
        {
            ContadorArticulos = 0;
            ArticulosAgregados = new List<Articulo> { };
            ArticulosFiltrados = new List<ArticuloCarrito> { };
            Total = 0;
        }

        public static void EliminarArticuloXID(int id)
        {
            for (int i = 0; i < ArticulosAgregados.Count; i++)
            {
                Articulo articulo = ArticulosAgregados[i];
                if (articulo.ID == id)
                {
                    ArticulosAgregados.Remove(articulo);
                    break;
                }
            }

            for (int i = 0; i < ArticulosFiltrados.Count; i++)
            {
              
                ArticuloCarrito articulo = ArticulosFiltrados[i];
                if (articulo.ID == id)
                {
                    if (articulo.Cantidad > 1)
                    {
                        ArticulosFiltrados[i].Cantidad--;
                    }
                    else
                    {
                        ArticulosFiltrados.Remove(articulo);
                    }
                    break;
                }
            }


        }

        public static void CargarTotalActual()
        {
            foreach (Articulo articulo in ArticulosAgregados)
            {
                Total += articulo.Precio;
            }

        }


        public static void AgregarArticulo(Articulo articulo)
        {

            bool estaRepetido = false;
            int indice = -1;

            ArticulosAgregados.Add(articulo);

            try
            {

                for (int i = 0; i < ArticulosFiltrados.Count; i++)
                {

                    ArticuloCarrito art = ArticulosFiltrados[i];

                    if (art.ID == articulo.ID)
                    {
                        indice = i;
                        estaRepetido = true;
                        break;
                    }
                }

                if (!estaRepetido)
                {
                    ArticuloCarrito articuloCarrito = new ArticuloCarrito();
                    articuloCarrito.ID = articulo.ID;
                    articuloCarrito.Codigo = articulo.Codigo;
                    articuloCarrito.Nombre = articulo.Nombre;
                    articuloCarrito.Descripcion = articulo.Descripcion;
                    articuloCarrito.Marca = articulo.Marca;
                    articuloCarrito.Categoria = articulo.Categoria;
                    articuloCarrito.Precio = articulo.Precio;
                    articuloCarrito.ImagenURl = articulo.ImagenURl;
                    articuloCarrito.Cantidad = 1;

                    ArticulosFiltrados.Add(articuloCarrito);
                }
                else
                {
                    ArticulosFiltrados[indice].Cantidad++;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        //public static void ListaArticulosFiltrados() // A CONFIRMAR 
        //{
        //    ArticulosFiltrados = new List<ArticuloCarrito> { };

        //   // List<Articulo> ListaArticulosOrdenados_aux = new List<Articulo> ();

        //    ArticulosFiltradosCantidad = new List<int> { };

        //    Articulo articulo_aux = new Articulo();    

        //    int x = 0, y=0;

        //    // Ordenar lista articulo agregados
        //    List<Articulo> articulosOrdenados = ArticulosAgregados.OrderBy(a => a.ID).ToList(); // A es una expresion lambda que dice de donde se utilizara para ordenar la lista.

        //   for (x=0; x<articulosOrdenados.Count; x++)
        //    {
        //        foreach (Articulo articulo in articulosOrdenados)
        //        {
        //            y = 0;

        //            if (articulo.ID == x+1)
        //            {
        //                y++;
        //                articulo_aux = articulo;
        //            }
        //        }
        //        ArticulosFiltradosCantidad.Add(y);
        //        ArticulosFiltrados.Add(articulo_aux);
        //    }

        //}


    }
}