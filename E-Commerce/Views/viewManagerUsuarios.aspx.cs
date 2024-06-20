using E_Commerce_Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_web_equipo_19.Views
{
    public partial class viewManagerUsuarios : System.Web.UI.Page
    {
        private Usuario_Negocio usuario_Negocio = new Usuario_Negocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            rpUsuarios.DataSource = usuario_Negocio.ListarUsuarios();
            rpUsuarios.DataBind();
        }
    }
}