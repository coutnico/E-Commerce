using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_web_equipo_19
{
    public partial class SiteMaster : MasterPage
    {
        public string Contador
        {
            get { return lblContadorCarrito.Text; }
            set { lblContadorCarrito.Text = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }

}
