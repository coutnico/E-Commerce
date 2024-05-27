using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using tp_web_equipo_19.Models;

namespace tp_web_equipo_19.Views
{
    public partial class viewAdmin_ModifyCat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtIDCatBuscado_TextChanged(object sender, EventArgs e)
        {
            Categoria categoria = new Categoria();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();


            categoria = categoriaNegocio.Buscar_Categoria_por_ID(Convert.ToInt32(txtIDCatBuscado.Text));

            txtDescripcion.Text = categoria.Descripcion;

        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Categoria categoria = new Categoria();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            string mensaje;

            categoria.Descripcion = txtDescripcion.Text;

            categoria.Id = Convert.ToInt32(txtIDCatBuscado.Text);
            try
            {
                categoriaNegocio.modificarCategoria(categoria, Convert.ToInt32(txtIDCatBuscado.Text));

                mensaje = "Categoria ID " + categoria.Id + " se ha modificado Correctamente ";
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
            Categoria categoria = new Categoria();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            string mensaje;

            categoria.Descripcion = txtDescripcion.Text;
            categoria.Id = Convert.ToInt32(txtIDCatBuscado.Text);

            try
            {
                categoriaNegocio.eliminarCategoria(Convert.ToInt32(txtIDCatBuscado.Text));

                mensaje = "Categoria ID " + categoria.Id + " se ha eliminado Correctamente ";
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
