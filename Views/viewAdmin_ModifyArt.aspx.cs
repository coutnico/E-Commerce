using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using tp_web_equipo_19.Models;
using System.Globalization; // Necesito para poder convertir el punto en coma.

namespace tp_web_equipo_19.Views
{
    public partial class viewAdmin_ModifyArt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Articulo articulo = new Articulo();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();


            //Cargo lista cat y marca
            Marca marca = new Marca();
            MarcaNegocio marcaNegocio = new MarcaNegocio();

            List<Marca> marca_list = marcaNegocio.ListarMarcas();

            if (!IsPostBack)
            {
               //lblposback.Text = "PRIMER POSBACK";
                try
                {
                    listMarca.DataSource = marca_list;
                    listMarca.DataTextField = "Descripcion"; // Nombre del campo que se mostrará
                    listMarca.DataValueField = "Id";   // Nombre del campo que se utilizará como valor
                    listMarca.DataBind();
                }
                catch (Exception ex)
                {

                }
            }// else { lblposback.Text = "SEGUNDO POSBACK"; }


            Categoria categoria = new Categoria();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

            List<Categoria> categoria_list = categoriaNegocio.ListarCategorias();

            if (!IsPostBack)
            {
                try
                {

                    listCat.DataSource = categoria_list;
                    listCat.DataTextField = "Descripcion"; // Nombre del campo que se mostrará
                    listCat.DataValueField = "Id";   // Nombre del campo que se utilizará como valor
                    listCat.DataBind();
                }
                catch (Exception ex)
                {

                }
            }
        }

      
        protected void txtIDarticuloBuscado_TextChanged(object sender, EventArgs e)
        {

            //string mensaje;
            Articulo articulo = new Articulo();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            Imagen imagen = new Imagen();
            ImagenNegocio imagenNegocio = new ImagenNegocio();

            lblposback.Text = "";

            string mensaje;

            try
            {

                // articulo.ID =  Convert.ToInt32(txtIDarticuloBuscado.Text);
                articulo = articuloNegocio.Buscar_Articulo_por_ID(Convert.ToInt32(txtIDarticuloBuscado.Text));

                imagen = imagenNegocio.Buscar_Imagen_por_ID_articulo(Convert.ToInt32(txtIDarticuloBuscado.Text));

                // Muestro datos actuales, los cuales se podrian modificar
                // txtIDarticuloBuscado.Text = Convert.ToString(articulo.ID) ;
                txtArticulo.Text = articulo.Nombre;
                txtCodigo.Text = articulo.Codigo;
                txtDescripcion.Text = articulo.Descripcion;
                txtPrecio.Text = Convert.ToString(articulo.Precio);
                //txtPrecio.Text = articulo.Precio.ToString(CultureInfo.InvariantCulture); //  para convertir el valor decimal a una cadena que utiliza un punto como separador decimal, independientemente de la configuración regional del servidor.
                listMarca.SelectedValue = Convert.ToString(articulo.IDMarca);
                listCat.SelectedValue = Convert.ToString(articulo.IDCategoria);
                txtImagenUrl.Text = imagen.URL;
            }
            catch (Exception ex)
            {
                // mensaje = "Error al leer registro. Ingrese un ID distinto. " + ex.Message;
                //// Registra el script para mostrar una alerta al usuario en el navegador
                //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "');", true);

                lblposback.Text = "ERROR AL LEER ! ";
            }

        }
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            Articulo articulo = new Articulo();
           

            Imagen imagen = new Imagen();
            ImagenNegocio imagenNegocio = new ImagenNegocio();

            string mensaje;
            try
            {

                articulo.Nombre = txtArticulo.Text;
                articulo.Codigo = txtCodigo.Text;
                articulo.Descripcion = txtDescripcion.Text;
                articulo.IDMarca = Convert.ToInt32(listMarca.SelectedValue);
                articulo.IDCategoria = Convert.ToInt32(listCat.SelectedValue);


                articulo.Precio = Convert.ToDecimal(txtPrecio.Text);
               // articulo.Precio = Convert.ToDecimal(txtPrecio.Text.ToString(CultureInfo.InvariantCulture));
                articulo.ID = Convert.ToInt32(txtIDarticuloBuscado.Text);

                imagen.URL = txtImagenUrl.Text;

                articuloNegocio.modificarArticulo(articulo, Convert.ToInt32(txtIDarticuloBuscado.Text));
                imagenNegocio.ModificarImagen(articulo.ID, imagen.URL); // 


                mensaje = "Articulo ID " + articulo.ID + " se ha modificado Correctamente ";
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
            lblposback.Text = "";
            Articulo articulo = new Articulo();     
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            Imagen imagen   = new Imagen(); 
            ImagenNegocio imagenNegocio = new ImagenNegocio();

            

            try {
                
            articuloNegocio.eliminarArticulo(Convert.ToInt32(txtIDarticuloBuscado.Text));

            imagenNegocio.EliminarImagen(Convert.ToInt32(txtIDarticuloBuscado.Text));

            articulo.ID = (Convert.ToInt32(txtIDarticuloBuscado.Text));

            string mensaje = "Articulo ID " + articulo.ID + " se ha eliminado Correctamente ";
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "');", true);

            }
            catch
            {
                lblposback.Text = "ERROR AL ELIMINAR. refresque la pagina ! ";
            }


        }
    }
}