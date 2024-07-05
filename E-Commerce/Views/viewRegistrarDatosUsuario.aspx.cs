using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_web_equipo_19.Views
{
    public partial class viewRegistrarDatosUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        }
    }
}