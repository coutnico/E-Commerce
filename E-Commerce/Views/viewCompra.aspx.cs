using E_Commerce_Models;
using E_Commerce_Negocio;
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
        private Domicilios_Negocio domicilios = new Domicilios_Negocio();
        public Usuarios UsuarioLogueado { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioLogueado = (Usuarios)Session["usuario"];

            if (UsuarioLogueado == null) // 
            {
                Session.Add("error", "Debes loguearte para ingresar");
                Response.Redirect("viewLogin.aspx", false);

            }
            else
            {
                foreach (Domicilio domicilio in domicilios.ListarDomicilios())
                {
                    if (domicilio.ID_Usuario == UsuarioLogueado.Id)
                    {
                        dgvDomicilios.Items.Add(domicilio.Calle + " " + domicilio.Altura.ToString());
                    }
                }

            }


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

        protected void btnAgregarDomicilio_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewManagerDomicilios.aspx");
        }
    }
}