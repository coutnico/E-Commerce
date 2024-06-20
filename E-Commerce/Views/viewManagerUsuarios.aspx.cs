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

        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                int ID = Convert.ToInt32(((Button)sender).CommandArgument);
                usuario_Negocio.EliminarUsaurioPorID(ID);

                // Recargar los datos y volver a enlazar el control Repeater
                rpUsuarios.DataSource = usuario_Negocio.ListarUsuarios();
                rpUsuarios.DataBind();

            }
            catch (Exception)
            {

                throw;
            }

        }
    }
}