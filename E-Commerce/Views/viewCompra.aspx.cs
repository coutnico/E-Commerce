using E_Commerce_Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_web_equipo_19.Views
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void CargarLabel()
        {
            lblTotal.Text = "Total: $" + Carrito.Total.ToString();
        }

        public void CargarLabelArticulos()
        {
            lblCantProductos.Text = $"Productos ({Carrito.CantidadTotal})";
            lblSubtotal.Text = $"Subtotal: ${Carrito.Total}";

        }
    }
}