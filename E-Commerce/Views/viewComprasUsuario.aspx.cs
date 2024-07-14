using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_web_equipo_19.Views
{
    public partial class viewComprasUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnChat_Click(object sender, EventArgs e)
        {

            int idCompra = Convert.ToInt32(((Button)sender).CommandArgument);

            Session.Remove("IdCompra");
            Session.Add("IdCompra", idCompra);
            Response.Redirect("viewChatHub.aspx",false);



        }
    }
}