﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E_Commerce_Models;
using E_Commerce_Negocio;

namespace tp_web_equipo_19.Views
{
    public partial class viewArticulos : System.Web.UI.Page
    {
        private SiteMaster master;
        private List<Articulo> lista_articulos;

        private List<Publicaciones> listapublicaciones;

        private List<Publicaciones> listapublicaciones_nopausadas = new List<Publicaciones>();

        protected void Page_Load(object sender, EventArgs e)
        {
            master = (SiteMaster)this.Master;
            master.Contador = Carrito.ContadorArticulos.ToString();

            //Articulo articulo = new Articulo();

            //ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            //lista_articulos = articuloNegocio.ListarArticulos();


            //if (!IsPostBack)
            //{
            //    reapeter_articulos.DataSource = lista_articulos;
            //    reapeter_articulos.DataBind(); // VINCULA LOS DATOS
            //}


            Publicaciones_Negocio publicaciones_Negocio = new Publicaciones_Negocio();

            listapublicaciones = publicaciones_Negocio.ListarPublicaciones();

            foreach (Publicaciones publicaciones in listapublicaciones)
            {
                if ((publicaciones.Pausada == false) && (publicaciones.Baja_Logica == false))
                {
                    listapublicaciones_nopausadas.Add(publicaciones);
                }
            }

            reapeter_articulos.DataSource = listapublicaciones_nopausadas;
            reapeter_articulos.DataBind(); // VINCULA LOS DATOS

        }

        protected void btnAgregarCarrito_Click(object sender, EventArgs e)
        {

            master = (SiteMaster)this.Master;

            Carrito.ContadorArticulos++;

            master.Contador = Carrito.ContadorArticulos.ToString();

            string valor = ((ImageButton)sender).CommandArgument;



            foreach (var publicaciones in listapublicaciones_nopausadas)
            {
                if (publicaciones.IdPublicacion == Convert.ToInt32(valor))
                {
                    var articulo = publicaciones.articulo;
                    Carrito.AgregarArticulo(articulo);
                    // Carrito.ListaArticulosFiltrados(); // AGREGADO
                    break;
                }
            }

        }

        protected void BtnVerDetalle_Click1(object sender, EventArgs e)
        {
            string id = ((Button)sender).CommandArgument;

            //Session.Clear();
            //Session.Remove("IDArticulo"); // para que no me deslogue y borre resto de variables guardadas en sesion.
            //Session.Add("IdArticulo", id);

            Session.Remove("IDPublicacion"); // para que no me deslogue y borre resto de variables guardadas en sesion.
            Session.Add("IDPublicacion", id);

            Response.Redirect("viewDetallada.aspx");

        }

        protected void txtBuscador_TextChanged(object sender, EventArgs e)
        {
            string textoFiltardo = ((TextBox)sender).Text.ToUpper();

            List<Articulo> listaFiltrada = new List<Articulo>() { };

            List<Publicaciones> listaFiltradaPublicaciones = new List<Publicaciones>() { };


            //foreach (Articulo articulo in lista_articulos)
            //{
            //    if (articulo.Nombre.ToUpper().Contains(textoFiltardo))
            //    {
            //        listaFiltrada.Add(articulo);
            //    }
            //}

            //reapeter_articulos.DataSource = listaFiltrada;
            //reapeter_articulos.DataBind();

            foreach (Publicaciones publicaciones in listapublicaciones)
            {
                if (publicaciones.articulo.Nombre.ToUpper().Contains(textoFiltardo))
                {
                    listaFiltradaPublicaciones.Add(publicaciones);
                }
            }

            reapeter_articulos.DataSource = listaFiltradaPublicaciones;
            reapeter_articulos.DataBind();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewLogin.aspx");
        }
    }
}