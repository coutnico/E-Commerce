using E_Commerce_Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_web_equipo_19.Views
{
    public partial class viewRegistrarDatosUsuario : System.Web.UI.Page
    {
        public Usuarios Usuario { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario = (Usuarios)Session["usuario"];
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

        }
    }
}