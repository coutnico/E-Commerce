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
        private Localidad_Negocio localidades = new Localidad_Negocio();


        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioLogueado = (Usuarios)Session["usuario"];


            foreach (Localidad localidad in localidades.ListarLocalidades())
            {
                ddlLocalidad.Items.Add(localidad.Nombre);
            }

        }

        protected void btnAgregarDomicilio_Click(object sender, EventArgs e)
        {
            try
            {
                if (ddlLocalidad.SelectedItem.Text != "Localidad")
                {


                    Domicilio domicilio = new Domicilio();

                    domicilio.ID_Usuario = UsuarioLogueado.Id;
                    domicilio.Calle = txtCalle.Text;
                    domicilio.Altura = Convert.ToInt32(txtAltura.Text);


                    foreach (Localidad localidad in localidades.ListarLocalidades())
                    {
                        if (localidad.Nombre == ddlLocalidad.SelectedItem.Text)
                        {
                            domicilio.ID_Localidad = localidad.ID;
                        }
                    }

                    domicilio.Observacion = txtObservacion.Text;

                    domicilios.AgregarDomicilio(domicilio);
                    string script = "ShowModificacionExitosa();";
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