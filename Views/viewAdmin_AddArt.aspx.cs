using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using tp_web_equipo_19.Models;

namespace tp_web_equipo_19.Views
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Marca marca = new Marca();
            MarcaNegocio marcaNegocio = new MarcaNegocio();

            List<Marca> marca_list = marcaNegocio.ListarMarcas();


            if (!IsPostBack)
            {
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
            }


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

            if (!IsPostBack)
            {
                // Inicializa la lista de IDs de TextBox
                List<string> textBoxIds = new List<string>();
                Session["TextBoxIds"] = textBoxIds; //
                lbl_Cantidad_imagenes_agregadas.Text = "0";
            }
            else
            {
                // Recrea los TextBox en cada postback
                List<string> textBoxIds = (List<string>)Session["TextBoxIds"];
                foreach (string textBoxId in textBoxIds)
                {
                    TextBox newTextBox = new TextBox();
                    newTextBox.ID = textBoxId;
                    txtImagenUrl_Dinamico.Controls.Add(newTextBox);
                }
            }

        }

        public void btnAgregar_Click(object sender, EventArgs e)
        {
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            Articulo articulo = new Articulo();
            List<Articulo> articulosList = new List<Articulo>();

            Imagen imagen = new Imagen();
            ImagenNegocio imagenNegocio = new ImagenNegocio();

            int x = 0;
            string textBoxId= "0";

            string mensaje;
            try
            {

                articulo.Nombre = txtArticulo.Text;
                articulo.Codigo = txtCodigo.Text;
                articulo.Descripcion = txtDescripcion.Text;
                articulo.IDMarca = Convert.ToInt32(listMarca.SelectedValue);
                articulo.IDCategoria = Convert.ToInt32(listCat.SelectedValue);
               // imagen.URL = txtImagenUrl.Text;
                articulo.Precio = Convert.ToDecimal(txtPrecio.Text);

                articuloNegocio.agregarArticulo(articulo);
               
                articulosList = articuloNegocio.ListarArticulos();
                for (x = 0; x < articulosList.Count; x++)
                {
                    articulo = articulosList[x]; // cargo el ultimo articulo para obtener el ultimo ID
                }

                for (x = 0; x <= Convert.ToInt32(lbl_Cantidad_imagenes_agregadas.Text); x++)
                {
                    if (x < 1)
                    {
                        imagen.URL = txtImagenUrl.Text;
                        imagenNegocio.InsertarImagen(articulo.ID, imagen.URL);

                    }
                    else
                    {
                        textBoxId = "textBox_" + Convert.ToString(x);
                        TextBox textBoxToModify = (TextBox)txtImagenUrl_Dinamico.FindControl(textBoxId);
                        imagen.URL = textBoxToModify.Text;
                        imagenNegocio.InsertarImagen(articulo.ID, imagen.URL); // }
                    }
                }

                mensaje = "Cargado Correctamente ";
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

        protected void addImage_Click(object sender, ImageClickEventArgs e)
        {

            // Incremento el contador y obtiene el nuevo ID
            int cantidad_img = Convert.ToInt32(lbl_Cantidad_imagenes_agregadas.Text) + 1;
            lbl_Cantidad_imagenes_agregadas.Text = cantidad_img.ToString();
            string textBoxId = "textBox_" + cantidad_img;

            // Guardo el ID en la lista
            List<string> textBoxIds = (List<string>)Session["TextBoxIds"];
            textBoxIds.Add(textBoxId);

            // Creo y agrego el nuevo TextBox
            TextBox newTextBox = new TextBox();
            newTextBox.ID = textBoxId;
            // txtImagenUrl_Dinamico.Controls.Add(newTextBox);

            HtmlGenericControl div = new HtmlGenericControl("div");
            div.Style.Add("display", "block"); // Mostrar en línea vertical
            div.Controls.Add(newTextBox);
            txtImagenUrl_Dinamico.Controls.Add(div);

            // Actualizo la lista en la sesión
            Session["TextBoxIds"] = textBoxIds;

        }
        
        protected void deleteImage_Click(object sender, ImageClickEventArgs e)
        {
            // ID's
            int cantidad_img = Convert.ToInt32(lbl_Cantidad_imagenes_agregadas.Text);
            lbl_Cantidad_imagenes_agregadas.Text = cantidad_img.ToString();
            string textBoxId = "textBox_" + cantidad_img;

            if (cantidad_img > 0) { 
            // Guardo el ID en la lista
            List<string> textBoxIds = (List<string>)Session["TextBoxIds"];
            textBoxIds.Remove(textBoxId);
             // Actualizo la lista en la sesión
             Session["TextBoxIds"] = textBoxIds;

                // // Creo y agrego el nuevo TextBox
                // TextBox newTextBox = new TextBox();
                //newTextBox.ID = textBoxId;


                // Obtengo el control TextBox y su contenedor div
                TextBox textBoxToRemove = (TextBox)txtImagenUrl_Dinamico.FindControl(textBoxId);
                PlaceHolder placeHolderToRemove = (PlaceHolder)textBoxToRemove.Parent;

                //    HtmlGenericControl div = new HtmlGenericControl("div");
                //div.Controls.Remove(newTextBox);
                //txtImagenUrl_Dinamico.Controls.Remove(div);
                placeHolderToRemove.Controls.Remove(textBoxToRemove);
                placeHolderToRemove.Controls.Remove(placeHolderToRemove);

                cantidad_img = cantidad_img - 1;
            lbl_Cantidad_imagenes_agregadas.Text = cantidad_img.ToString();
            }
        }

    }
}