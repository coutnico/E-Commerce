using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tp_web_equipo_19.Models;

namespace tp_web_equipo_19.Views
{
    public partial class viewAdmin_ModifyMarca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void txtIDMarcaBuscado_TextChanged(object sender, EventArgs e)
        {
            Marca Marca = new Marca();
            MarcaNegocio MarcaNegocio = new MarcaNegocio();


            Marca = MarcaNegocio.Buscar_Marca_por_ID(Convert.ToInt32(txtIDMarcaBuscado.Text));

            txtDescripcion.Text = Marca.Descripcion;

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Marca Marca = new Marca();
            MarcaNegocio MarcaNegocio = new MarcaNegocio();
            string mensaje;

            Marca.Descripcion = txtDescripcion.Text;

            Marca.Id = Convert.ToInt32(txtIDMarcaBuscado.Text);
            try
            {
                MarcaNegocio.modificarMarca(Marca, Convert.ToInt32(txtIDMarcaBuscado.Text));

                mensaje = "Marca ID " + Marca.Id + " se ha modificado Correctamente ";
                // Registra el script para mostrar una alerta al usuario en el navegador
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "');", true);
            }
            catch (Exception ex)
            {
                mensaje = "Se produjo una excepción: " + ex.Message;
                // Registra el script para mostrar una alerta al usuario en el navegador
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "');", true);
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            Marca Marca = new Marca();
            MarcaNegocio MarcaNegocio = new MarcaNegocio();
            string mensaje;

            Marca.Descripcion = txtDescripcion.Text;
            Marca.Id = Convert.ToInt32(txtIDMarcaBuscado.Text);

            try
            {
                MarcaNegocio.eliminarMarca(Convert.ToInt32(txtIDMarcaBuscado.Text));

                mensaje = "Marca ID " + Marca.Id + " se ha eliminado Correctamente ";
                // Registra el script para mostrar una alerta al usuario en el navegador
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "');", true);
            }
            catch (Exception ex)
            {
                lblposback.Text = "ERROR AL ELIMINAR. refresque la pagina ! ";

                //mensaje = "Se produjo una excepción: " + ex.Message;
                //// Registra el script para mostrar una alerta al usuario en el navegador
                //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "');", true);


            }
        }




    }
}