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
    public partial class viewAdmin_AddCat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Categoria categoria = new Categoria();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            List<Categoria> categorias = new List<Categoria>();
            int ID_Nuevo = 0, x = 0;


            categorias = categoriaNegocio.ListarCategorias();

            //txtDescripcion.Text = "";

            for (x = 0; x < categorias.Count; x++) // hago esto por que puede ser que hayan eliminado un id y no serviria solo el count  + 1
            {
                categoria = categorias[x];
            }
            ID_Nuevo = categoria.Id + 1;    // Muestro cual será el nuevo ID

            lblID_Nuevo.Text = Convert.ToString(ID_Nuevo);


        }

        protected void btnAgregarCat_Click(object sender, EventArgs e)
        {
            Categoria categoria = new Categoria();  
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
      

            categoria.Descripcion = txtDescripcion.Text;
            string mensaje;
            try { 
            categoriaNegocio.agregarCategoria(categoria);

            mensaje = "Cargado Correctamente ";
            // Registra el script para mostrar una alerta al usuario en el navegador
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "');", true);

            } catch(Exception ex){
                mensaje = "Se produjo una excepción: " + ex.Message;
                // Registra el script para mostrar una alerta al usuario en el navegador
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "');", true);
            }

        }
    }
}