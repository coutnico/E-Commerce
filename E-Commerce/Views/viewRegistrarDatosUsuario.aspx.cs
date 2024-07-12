using E_Commerce_Models;
using E_Commerce_Negocio;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_web_equipo_19.Views
{
    public partial class viewRegistrarDatosUsuario : System.Web.UI.Page
    {
        public Usuarios Usuario { get; set; }
        private Datos_Personales_Negocio managerDB = new Datos_Personales_Negocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario = (Usuarios)Session["usuario"];

            if (!IsPostBack)
            {

                foreach (Datos_Personales datos in managerDB.ListarDatosPersonales())
                {
                    if (datos.ID_Usuario == Usuario.Id)
                    {
                        username.Text = Usuario.User;
                        txtApellido.Text = datos.Apellidos;
                        txtNombres.Text = datos.Nombres;
                        txtEmail.Text = Usuario.Email;
                        txtDocumento.Text = datos.Documento.ToString() == string.Empty ? "0" : datos.Documento.ToString();
                        txtTelefono.Text = datos.Telefono.ToString() == string.Empty ? "0" : datos.Telefono.ToString();
                        txtTelefono2.Text = datos.TelefonoAux.ToString() == string.Empty ? "0" : datos.TelefonoAux.ToString();
                        gender.SelectedValue = datos.Genero;
                    }
                }
            }
        }

        protected void btnRegistar_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtApellido.Text) && !string.IsNullOrEmpty(txtNombres.Text) && !string.IsNullOrEmpty(username.Text) && !string.IsNullOrEmpty(txtDocumento.Text) && !string.IsNullOrEmpty(txtEmail.Text)
                && !string.IsNullOrEmpty(txtTelefono.Text))
            {

            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Response.Redirect("viewProfile.aspx");
        }

        protected void gender_SelectedIndexChanged(object sender, EventArgs e)
        {
            string seleccion = ((DropDownList)sender).SelectedItem.ToString();


            switch (seleccion)
            {
                case "Genero":
                    gender.Style.Clear();
                    gender.Style.Add("background", "lightslategrey");
                    gender.Style.Add("color", "white");
                    break;
                case "Masculino":
                    gender.Style.Clear();
                    gender.Style.Add("background", "skyblue");
                    gender.Style.Add("color", "white");
                    break;
                case "Femenino":
                    gender.Style.Clear();
                    gender.Style.Add("background", "lightpink");
                    gender.Style.Add("color", "white");
                    break;
                case "Otro":
                    gender.Style.Clear();
                    gender.Style.Add("background", "linear-gradient(180deg, #FF0000 0%, #FF8C00 20%, #FFFF00 40%, #008000 60%, #0000FF 80%, #8B00FF 100%)");
                    gender.Style.Add("color", "dark");
                    break;
            }
        }

        protected void gender_TextChanged(object sender, EventArgs e)
        {
            string seleccion = ((DropDownList)sender).SelectedItem.ToString();


            switch (seleccion)
            {
                case "Genero":
                    gender.Style.Add("background-image", "url('..\\Resources\\banner femenino.jpeg')");
                    gender.Style.Add("background-size", "cover"); // Ajusta la imagen al tamaño del DropDownList
                    gender.Style.Add("background-repeat", "no-repeat"); // No repite la imagen
                    break;
                case "Masculino":

                    break;
                case "Femenino":

                    break;
                case "Otro":

                    break;
            }
        }

        protected void btnModificarDatos_Click(object sender, EventArgs e)
        {
            try
            {
                if (gender.SelectedItem.ToString() != "Genero")
                {

                    Datos_Personales datosAmodificar = new Datos_Personales();

                    datosAmodificar.ID_Usuario = Usuario.Id;
                    datosAmodificar.Nombres = txtNombres.Text;
                    datosAmodificar.Apellidos = txtApellido.Text;
                    datosAmodificar.Genero = gender.SelectedItem.Text;
                    datosAmodificar.Telefono = Convert.ToInt32(txtTelefono.Text);
                    if (!string.IsNullOrEmpty(txtTelefono2.Text))
                        datosAmodificar.TelefonoAux = Convert.ToInt32(txtTelefono2.Text);
                    else
                        datosAmodificar.TelefonoAux = 0;

                    datosAmodificar.Documento = Convert.ToInt32(txtDocumento.Text);

                    managerDB.ModificarDatos_Personales(datosAmodificar);

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