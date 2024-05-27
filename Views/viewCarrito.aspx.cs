using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tp_web_equipo_19.Models;

namespace tp_web_equipo_19.Views
{
    public partial class viewCarrito : System.Web.UI.Page
    {
        private SiteMaster master;
        protected void Page_Load(object sender, EventArgs e)
        {
            master = (SiteMaster)this.Master;

            master.Contador = Carrito.ContadorArticulos.ToString();

            // Carrito.ListaArticulosFiltrados();  // AGREGADO
            RptArticulos.DataSource = Carrito.ArticulosFiltrados;
            // RptArticulos.DataSource = Carrito.ArticulosFiltrados; // AGREGADO
            RptArticulos.DataBind();

        }

        public void CargarLabel()
        {
            lblTotal.Text = "Total: $" + Carrito.Total.ToString();
        }

        protected void ibEliminar_Click(object sender, ImageClickEventArgs e)
        {
            string seleccion = ((ImageButton)sender).CommandArgument;
            int idEliminar = -1;
            foreach (var articulo in Carrito.ArticulosAgregados)
            {
                if (articulo.ID == Convert.ToInt32(seleccion))
                {
                    idEliminar = articulo.ID;
                }

            }
            if (idEliminar != -1)
            {
                Carrito.EliminarArticuloXID(idEliminar);
                Carrito.ContadorArticulos--;
                master.Contador = Carrito.ContadorArticulos.ToString();

                RptArticulos.DataSource = Carrito.ArticulosFiltrados;
                RptArticulos.DataBind();
            }
        }
    }
}