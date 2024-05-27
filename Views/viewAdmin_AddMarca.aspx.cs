using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using tp_web_equipo_19.Models;

namespace tp_web_equipo_19.Views
{
    public partial class viewAdmin_AddMarca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Marca Marca = new Marca();
            MarcaNegocio marcanegocio = new MarcaNegocio();
            List<Marca> Marcas = new List<Marca>();
            int ID_Nuevo = 0, x = 0;


            Marcas = marcanegocio.ListarMarcas();

            //txtDescripcion.Text = "";

            for (x = 0; x < Marcas.Count; x++) // hago esto por que puede ser que hayan eliminado un id y no serviria solo el count  + 1
            {
                Marca = Marcas[x];
            }
            ID_Nuevo = Marca.Id + 1;    // Muestro cual será el nuevo ID

            lblID_Nuevo.Text = Convert.ToString(ID_Nuevo);

        }

        protected void btnAgregarMarca_Click(object sender, EventArgs e)
        {
            Marca Marca = new Marca();
            MarcaNegocio MarcaNegocio = new MarcaNegocio();


            Marca.Descripcion = txtDescripcion.Text;
            string mensaje;
            try
            {
                MarcaNegocio.agregarMarca(Marca);

                mensaje = "Cargado Correctamente ";
                // Registra el script para mostrar una alerta al usuario en el navegador
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "');", true);

             
            }
            catch (Exception ex)
            {
                mensaje = "Se produjo una excepción: " + ex.Message;
                // Registra el script para mostrar una alerta al usuario en el navegador
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "'); window.location.href = 'viewArticulos.aspx' ; ", true);
            }

        }


    }
}