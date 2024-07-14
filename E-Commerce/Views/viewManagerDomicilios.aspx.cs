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
    public partial class viewManagerDomicilios : System.Web.UI.Page
    {
        public Usuarios UsuarioLogueado { get; set; }
        private Domicilios_Negocio domicilios = new Domicilios_Negocio(); 


        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioLogueado = (Usuarios)Session["usuario"];

        }

        protected void btnAgregarDomicilio_Click(object sender, EventArgs e)
        {
            try
            {
                Domicilio domicilio = new Domicilio();

                domicilio.ID_Usuario = UsuarioLogueado.Id;
                domicilio.Calle = txtCalle.Text;
                domicilio.Altura = Convert.ToInt32(txtAltura.Text);



               // domicilio.ID_Localidad = ddlLocalidad.SelectedItem.Text;



                domicilio.Observacion = txtObservacion.Text;





               // domicilios.AgregarDomicilio()
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}