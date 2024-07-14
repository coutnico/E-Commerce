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

            if (!IsPostBack)
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

        protected void btnConfirmarCompra_Click(object sender, EventArgs e)
        {
            try
            {

                if (dgvDomicilios.SelectedItem.Text != "Desplegar domicilios")
                {


                    EmailService emailService = new EmailService();


                    string cuerpo = "<p>¡NOS ALEGRAMOS POR TU COMPRA!!<br>DESCRIPCION DE PRODUCTOS:";

                    foreach (ArticuloCarrito articulo in Carrito.ArticulosFiltrados)
                    {
                        cuerpo += $"<br> {articulo.Nombre} CANTIDAD: {articulo.Cantidad} PRECIO UNITARIO: ${articulo.Precio}<br>";
                    }


                    cuerpo += $"<br>TOTAL: {Carrito.Total} $<br><br>NOTA: ACTUALMENTE LA PAGINA ES LA QUE SE HACE CARGO DE LA TRANSFERENCIA A LOS DIFERENTES USUARIOS, USTEDES SOLAMENTE TIENEN QUE ABONAR EL TOTAL Y NOSOTROS HAREMOS EL RESTO. MUCHISIMAS GRACIAS POR SU COMPRA.<br><br>CLOSE MARKET<br>CBU:00012301231415432342<br></p>";



                    emailService.armarCorreo(UsuarioLogueado.Email, "CONFIRMACION DE COMPRA", cuerpo);

                    emailService.enviarEmail();

                    string script = "ShowCompraExitosa();";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "showalert", script, true);
                }
                else
                {
                    string script = "ShowError();";
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "showalert", script, true);
                }

            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}