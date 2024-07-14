using E_Commerce_Models;
using E_Commerce_Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tp_web_equipo_19.Views
{
    public partial class viewUsuarioVerPublicacion : System.Web.UI.Page
    {
        private List<Imagen> imagenes = new List<Imagen>() { };
        private int IndiceImagen;


        EmailService emailService = new EmailService();

        string asuntoPublicacionNueva = "";

        string cuerpoPublicacionNueva = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            Publicaciones_Negocio publicacionesNegocio = new Publicaciones_Negocio();
            Publicaciones publicaciones = new Publicaciones();

            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            Articulo articulo = new Articulo();

            ImagenNegocio imagenNegocio = new ImagenNegocio();
            Imagen imagen_aux = new Imagen();

            ////////-------------- VERIFICO QUE ESTE LOGUEADO
            Usuarios usuario = (Usuarios)Session["usuario"]; // casteo explicito

            if (usuario == null) // Si no hay nadie logueado, que no permita ingresar a la pagina de perfil.
            {
                Session.Add("error", "Debes loguearte para ingresar");
                Response.Redirect("viewLogin.aspx", false);

            }
            ////////-------------- Genero lista por def.
            ///envio por session
            int IdPublicacion = Convert.ToInt32(Session["IdPublicacion"]);

            //lblIdPubli.Text = Convert.ToString(IdPublicacion);
            
            publicaciones = publicacionesNegocio.Buscar_Publicacion_por_ID(IdPublicacion);

            //Cargo lista cat y marca
            Marca marca = new Marca();
            MarcaNegocio marcaNegocio = new MarcaNegocio();

            List<Marca> marca_list = marcaNegocio.ListarMarcas();

            List<Marca> marcaListFiltradaIdCat = new List<Marca>();

            foreach (Marca marca_aux in marca_list)
            {
                if (publicaciones.articulo.IDCategoria == marca_aux.IdCategoria)
                {
                    marcaListFiltradaIdCat.Add(marca_aux);
                }
            }

            if (!IsPostBack)
            {
                //lblposback.Text = "PRIMER POSBACK";
                try
                {
                    //listMarca.DataSource = marca_list;
                    //listMarca.DataTextField = "Descripcion"; // Nombre del campo que se mostrará
                    //listMarca.DataValueField = "Id";   // Nombre del campo que se utilizará como valor
                    //listMarca.DataBind();
                    listMarca.DataSource = marcaListFiltradaIdCat;
                    listMarca.DataTextField = "Descripcion"; // Nombre del campo que se mostrará
                    listMarca.DataValueField = "Id";   // Nombre del campo que se utilizará como valor
                    listMarca.DataBind();

                }
                catch (Exception ex)
                {

                }
            } // else { lblposback.Text = "SEGUNDO POSBACK"; }


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

            ////////-------------- Valores por sesion 
            if (Convert.ToString(IdPublicacion) == null)
            {
                Session.Add("error", "Error publicacion");
                Response.Redirect("viewLogin.aspx", false);
            }

            if (!IsPostBack)
            {

                Session.Add("IndiceImagen", 0);
                IndiceImagen = 0;
                foreach (Imagen imagen in imagenNegocio.ListarImagen())
                {
                    if (imagen.IdArticulo == publicaciones.articulo.ID)
                    {
                        imagenes.Add(imagen);

                    }
                }

                imagen_aux = imagenes[0];

                txtStock.Text = Convert.ToString(publicaciones.Stock);
                lblPublicacionPausada.Text = "Publicacion " + publicaciones.Pausada_String;     
                txtNombre.Text = publicaciones.articulo.Nombre;
                txtCodigo.Text = publicaciones.articulo.Codigo;
                CantidadImagenes.InnerText = "Cantidad de imagenes: " + imagenes.Count.ToString();
                ImagenPrincipalArticulo.Src = imagenes[IndiceImagen].URL;
                listMarca.SelectedValue = Convert.ToString(publicaciones.articulo.IDMarca);
                listCat.SelectedValue = Convert.ToString(publicaciones.articulo.IDCategoria);
                txtDescripcion.Text = publicaciones.articulo.Descripcion;
                txtPrecio.Text = publicaciones.articulo.Precio.ToString();
                txtImagenUrl.Text = imagen_aux.URL;
           
                // txtImagenUrl.Text = publicaciones.articulo.ImagenURl;

            }
        }

        protected void btnEliminarPublicacion_Click(object sender, EventArgs e)
        {
            // lblposback.Text = "";
            Publicaciones publicaciones = new Publicaciones();
            Publicaciones_Negocio publicacionesNegocio = new Publicaciones_Negocio();
            Usuarios usuario = (Usuarios)Session["usuario"];

            Articulo articulo = new Articulo();
            ArticuloNegocio articuloNegocio = new ArticuloNegocio();

            //Imagen imagen = new Imagen();
            ImagenNegocio imagenNegocio = new ImagenNegocio();

            int IdPublicacion = Convert.ToInt32(Session["IdPublicacion"]);

            publicaciones = publicacionesNegocio.Buscar_Publicacion_por_ID(IdPublicacion);

            try
            {
                publicacionesNegocio.eliminarPublicacion(IdPublicacion);

                foreach (Imagen imagen in imagenNegocio.ListarImagen())
                {
                    if (imagen.IdArticulo == publicaciones.articulo.ID)
                    {
                        imagenNegocio.EliminarImagen(publicaciones.articulo.ID);
                    }
                }

                string mensaje = "Articulo ID " + publicaciones.articulo.ID + " se ha eliminado Correctamente ";
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "');", true);              

                Usuarios user_aux = new Usuarios();
                Usuario_Negocio userauxNegocio = new Usuario_Negocio();

                ALTERACIONESPUBLI_ADMIN alteracionespubli_admin = new ALTERACIONESPUBLI_ADMIN();
                ALTERACIONESPUBLI_ADMINNegocio alteracionespubli_adminNegocio = new ALTERACIONESPUBLI_ADMINNegocio();   

                user_aux = userauxNegocio.Buscar_Usuario_por_IDUsuario(publicaciones.IdUsuario);

                if (usuario.tipoUsuario == TipoUsuario.NORMAL)
                {
                    asuntoPublicacionNueva = "Has Eliminado una Publicacion";
                    cuerpoPublicacionNueva = " Hola " + usuario.User + " ! . Tu publicacion de " + publicaciones.articulo.Nombre + " se ha ELIMINADO satisfactoriamente.";
                    emailService.armarCorreo(usuario.Email, asuntoPublicacionNueva, cuerpoPublicacionNueva);
                    emailService.enviarEmail();
                }
                else
                {

                    asuntoPublicacionNueva = "Un Administrador ha Eliminado una de tus Publicaciones";
                    cuerpoPublicacionNueva = " Hola " + user_aux.User + " ! . Te avisamos que tu publicacion de " + publicaciones.articulo.Nombre + " ha sido ELIMINADA por un ADMINISTRADOR.";
                    emailService.armarCorreo(user_aux.Email, asuntoPublicacionNueva, cuerpoPublicacionNueva);
                    emailService.enviarEmail();

                    alteracionespubli_admin.IdPublicacion = publicaciones.IdPublicacion;
                    alteracionespubli_admin.FechaModificacion = DateTime.Now;
                    alteracionespubli_admin.TipoModificacion = 3; //  1: Agregar , 2: Modificar, 3:Eliminar, 4:Pausar, 5:Reestablecer.
                    alteracionespubli_admin.IdAdministrador = usuario.Id;
                    alteracionespubli_adminNegocio.agregarAlteracionAdmin(alteracionespubli_admin);     

                }


                if (usuario.tipoUsuario == TipoUsuario.NORMAL)
                {
                    Response.Redirect("viewUsuarioPublicaciones.aspx", false);
                }
                else
                {
                    Response.Redirect("viewAdmin_Publicaciones.aspx", false);
                }

            }
            catch
            {
                //  lblposback.Text = "ERROR AL ELIMINAR. refresque la pagina ! ";
            }

            Response.Redirect("viewUsuarioPublicaciones.aspx", false);
        }


        protected void btnModificarPublicacion_Click(object sender, EventArgs e)
        {
            Publicaciones publicaciones = new Publicaciones();
            Publicaciones_Negocio publicacionesNegocio = new Publicaciones_Negocio();

            ArticuloNegocio articuloNegocio = new ArticuloNegocio();
            Articulo articulo = new Articulo();
            Usuarios usuario = (Usuarios)Session["usuario"];
            int IdPublicacion = Convert.ToInt32(Session["IdPublicacion"]);

            Imagen imagen = new Imagen();
            ImagenNegocio imagenNegocio = new ImagenNegocio();


            publicaciones = publicacionesNegocio.Buscar_Publicacion_por_ID(IdPublicacion); // lo necesito para el ID del art y pub


            string mensaje;
            try
            {

              //  publicaciones.IdUsuario = //usuario.Id; Mantengo mismo ID, no lo piso. Ya que si lo hago desde x ejemplo Admin, me lo modificaria
                publicaciones.Stock = Convert.ToInt32(txtStock.Text);
                publicaciones.articulo.ID = publicaciones.articulo.ID;
                publicaciones.articulo.Nombre = txtNombre.Text;
                publicaciones.articulo.Codigo = txtCodigo.Text;
                publicaciones.articulo.Descripcion = txtDescripcion.Text;
                publicaciones.articulo.IDMarca = Convert.ToInt32(listMarca.SelectedValue);
                publicaciones.articulo.IDCategoria = Convert.ToInt32(listCat.SelectedValue);
                publicaciones.articulo.Precio = Convert.ToDecimal(txtPrecio.Text);
                imagen.URL = txtImagenUrl.Text;


                publicacionesNegocio.modificarPublicacion(publicaciones, publicaciones.IdPublicacion);
                imagenNegocio.ModificarImagen(publicaciones.articulo.ID, imagen.URL); // 

                mensaje = "Articulo ID " + publicaciones.articulo.ID + " se ha modificado Correctamente ";
                // Registra el script para mostrar una alerta al usuario en el navegador
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "');", true);

                Usuarios user_aux = new Usuarios();
                Usuario_Negocio userauxNegocio = new Usuario_Negocio();
                ALTERACIONESPUBLI_ADMIN alteracionespubli_admin = new ALTERACIONESPUBLI_ADMIN();
                ALTERACIONESPUBLI_ADMINNegocio alteracionespubli_adminNegocio = new ALTERACIONESPUBLI_ADMINNegocio();

                user_aux = userauxNegocio.Buscar_Usuario_por_IDUsuario(publicaciones.IdUsuario);

                if (usuario.tipoUsuario == TipoUsuario.NORMAL) { 
                asuntoPublicacionNueva = "Has Modificado una Publicacion";
                cuerpoPublicacionNueva = " Hola " + usuario.User + " ! . Tu publicacion de " + publicaciones.articulo.Nombre + " se ha MODIFICADO satisfactoriamente.";
                emailService.armarCorreo(usuario.Email, asuntoPublicacionNueva, cuerpoPublicacionNueva);
                emailService.enviarEmail();
                } else
                {

                asuntoPublicacionNueva = "Un Administrador ha Modificado una de tus Publicaciones";
                cuerpoPublicacionNueva = " Hola " + user_aux.User + " ! . Te avisamos que tu publicacion de " + publicaciones.articulo.Nombre + " ha sido MODIFICADA por un ADMINISTRADOR.";
                emailService.armarCorreo(user_aux.Email, asuntoPublicacionNueva, cuerpoPublicacionNueva);
                emailService.enviarEmail();

                    alteracionespubli_admin.IdPublicacion = publicaciones.IdPublicacion;
                    alteracionespubli_admin.FechaModificacion = DateTime.Now;
                    alteracionespubli_admin.TipoModificacion = 2; //  1: Agregar , 2: Modificar, 3:Eliminar, 4:Pausar, 5:Reestablecer.
                    alteracionespubli_admin.IdAdministrador = usuario.Id;
                    alteracionespubli_adminNegocio.agregarAlteracionAdmin(alteracionespubli_admin);
                }
                

            }
            catch (Exception ex)
            {
                mensaje = "Se produjo una excepción: " + ex.Message;
                // Registra el script para mostrar una alerta al usuario en el navegador
                ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + mensaje + "');", true);
            }
            if (usuario.tipoUsuario == TipoUsuario.NORMAL) { 
            Response.Redirect("viewUsuarioPublicaciones.aspx", false);
            }
            else
            {
                Response.Redirect("viewAdmin_Publicaciones.aspx", false);
            }
        }
        protected void Atras_Click(object sender, EventArgs e)
        {
            ImagenNegocio imagenNegocio = new ImagenNegocio();
            Publicaciones publicaciones = new Publicaciones();
            Publicaciones_Negocio publicacionesNegocio = new Publicaciones_Negocio();

            int IdPublicacion = Convert.ToInt32(Session["IdPublicacion"]);
            publicaciones = publicacionesNegocio.Buscar_Publicacion_por_ID(IdPublicacion);

            foreach (Imagen imagen in imagenNegocio.ListarImagen())
            {
                if (imagen.IdArticulo == publicaciones.articulo.ID)
                {
                    imagenes.Add(imagen);

                }
            }
            IndiceImagen = Convert.ToInt32(Session["IndiceImagen"]);          
            IndiceImagen--;
            if (IndiceImagen > -1)
            {            
                ImagenPrincipalArticulo.Src = imagenes[IndiceImagen].URL;
                imgNumber.InnerText = Convert.ToString(IndiceImagen);
                txtImagenUrl.Text = imagenes[IndiceImagen].URL;
                Session.Remove("IndiceImagen");
                Session.Add("IndiceImagen", IndiceImagen);
            }
        }

        protected void Siguiente_Click(object sender, EventArgs e)
        {
            ImagenNegocio imagenNegocio = new ImagenNegocio();
            Publicaciones publicaciones = new Publicaciones();
            Publicaciones_Negocio publicacionesNegocio = new Publicaciones_Negocio();

            int IdPublicacion = Convert.ToInt32(Session["IdPublicacion"]);
            publicaciones = publicacionesNegocio.Buscar_Publicacion_por_ID(IdPublicacion);

            foreach (Imagen imagen in imagenNegocio.ListarImagen())
            {
                if (imagen.IdArticulo == publicaciones.articulo.ID)
                {
                    imagenes.Add(imagen);

                }
            }

            IndiceImagen = Convert.ToInt32(Session["IndiceImagen"]);

            IndiceImagen++;
            if (IndiceImagen <= imagenes.Count - 1)
            {             
                ImagenPrincipalArticulo.Src = imagenes[IndiceImagen].URL;
                imgNumber.InnerText = Convert.ToString(IndiceImagen);
                txtImagenUrl.Text = imagenes[IndiceImagen].URL;
                Session.Remove("IndiceImagen");
                Session.Add("IndiceImagen", IndiceImagen);
            }
        }

        protected void listCat_TextChanged(object sender, EventArgs e)
        {
            Publicaciones publicaciones = new Publicaciones();

            Marca marca = new Marca();
            MarcaNegocio marcaNegocio = new MarcaNegocio();

            List<Marca> marca_list = marcaNegocio.ListarMarcas();
            List<Marca> marcaListFiltradaIdCat = new List<Marca>();

            publicaciones.articulo.IDCategoria = Convert.ToInt32(listCat.SelectedValue);


            foreach (Marca marca_aux in marca_list)
            {
                if (publicaciones.articulo.IDCategoria == marca_aux.IdCategoria)
                {
                    marcaListFiltradaIdCat.Add(marca_aux);
                }
            }

            listMarca.DataSource = marcaListFiltradaIdCat;
            listMarca.DataTextField = "Descripcion"; // Nombre del campo que se mostrará
            listMarca.DataValueField = "Id";   // Nombre del campo que se utilizará como valor
            listMarca.DataBind();

        }

        protected void btnPausarPublicacion_Click(object sender, EventArgs e) // Ver de agregar fecha, luego de esa fecha se eliminaria automaticamente publi.
        {
            int IdPublicacion = Convert.ToInt32(Session["IdPublicacion"]);
            Usuarios usuario = (Usuarios)Session["usuario"];
            Publicaciones_Negocio publicaciones_Negocio = new Publicaciones_Negocio();
            Publicaciones publicaciones = new Publicaciones();

            bool pausar = true;


            publicaciones = publicaciones_Negocio.Buscar_Publicacion_por_ID(IdPublicacion);
            publicaciones_Negocio.pausaroactivarPublicacion(pausar, IdPublicacion);

            Usuarios user_aux = new Usuarios();
            Usuario_Negocio userauxNegocio = new Usuario_Negocio();
            ALTERACIONESPUBLI_ADMIN alteracionespubli_admin = new ALTERACIONESPUBLI_ADMIN();
            ALTERACIONESPUBLI_ADMINNegocio alteracionespubli_adminNegocio = new ALTERACIONESPUBLI_ADMINNegocio();

            user_aux = userauxNegocio.Buscar_Usuario_por_IDUsuario(publicaciones.IdUsuario);

            if (usuario.tipoUsuario == TipoUsuario.NORMAL)
            {
                asuntoPublicacionNueva = "Has Pausado una Publicacion";
                cuerpoPublicacionNueva = " Hola " + usuario.User + " ! . Tu publicacion de " + publicaciones.articulo.Nombre + " se ha PAUSADO satisfactoriamente.";
                emailService.armarCorreo(usuario.Email, asuntoPublicacionNueva, cuerpoPublicacionNueva);
                emailService.enviarEmail();
            }
            else
            {

                asuntoPublicacionNueva = "Un Administrador ha Pausado una de tus Publicaciones";
                cuerpoPublicacionNueva = " Hola " + user_aux.User + " ! . Te avisamos que tu publicacion de " + publicaciones.articulo.Nombre + " ha sido PAUSADA por un ADMINISTRADOR.";
                emailService.armarCorreo(user_aux.Email, asuntoPublicacionNueva, cuerpoPublicacionNueva);
                emailService.enviarEmail();

                alteracionespubli_admin.IdPublicacion = publicaciones.IdPublicacion;
                alteracionespubli_admin.FechaModificacion = DateTime.Now;
                alteracionespubli_admin.TipoModificacion = 4; //  1: Agregar , 2: Modificar, 3:Eliminar, 4:Pausar, 5: Reestablecer.
                alteracionespubli_admin.IdAdministrador = usuario.Id;
                alteracionespubli_adminNegocio.agregarAlteracionAdmin(alteracionespubli_admin);

            }


            if (usuario.tipoUsuario == TipoUsuario.NORMAL)
            {
                Response.Redirect("viewUsuarioPublicaciones.aspx", false);
            }
            else
            {
                Response.Redirect("viewAdmin_Publicaciones.aspx", false);
            }
        }

        protected void btnRestablecerPublicacion_Click(object sender, EventArgs e)
        {
            int IdPublicacion = Convert.ToInt32(Session["IdPublicacion"]);
            Usuarios usuario = (Usuarios)Session["usuario"];
            Publicaciones_Negocio publicaciones_Negocio = new Publicaciones_Negocio();
            Publicaciones publicaciones = new Publicaciones();

            bool pausar = false;

            publicaciones = publicaciones_Negocio.Buscar_Publicacion_por_ID(IdPublicacion);
            publicaciones_Negocio.pausaroactivarPublicacion(pausar, IdPublicacion);

            Usuarios user_aux = new Usuarios();
            Usuario_Negocio userauxNegocio = new Usuario_Negocio();
            ALTERACIONESPUBLI_ADMIN alteracionespubli_admin = new ALTERACIONESPUBLI_ADMIN();
            ALTERACIONESPUBLI_ADMINNegocio alteracionespubli_adminNegocio = new ALTERACIONESPUBLI_ADMINNegocio();

            user_aux = userauxNegocio.Buscar_Usuario_por_IDUsuario(publicaciones.IdUsuario);

            if (usuario.tipoUsuario == TipoUsuario.NORMAL)
            {
                asuntoPublicacionNueva = "Has Restablecido una Publicacion";
                cuerpoPublicacionNueva = " Hola " + usuario.User + " ! . Tu publicacion de " + publicaciones.articulo.Nombre + " se ha REESTABLECIDA satisfactoriamente.";
                emailService.armarCorreo(usuario.Email, asuntoPublicacionNueva, cuerpoPublicacionNueva);
                emailService.enviarEmail();
            }
            else
            {

                asuntoPublicacionNueva = "Un Administrador ha Restablecido una de tus Publicaciones";
                cuerpoPublicacionNueva = " Hola " + user_aux.User + " ! . Te avisamos que tu publicacion de " + publicaciones.articulo.Nombre + " ha sido REESTABLECIDA por un ADMINISTRADOR.";
                emailService.armarCorreo(user_aux.Email, asuntoPublicacionNueva, cuerpoPublicacionNueva);
                emailService.enviarEmail();

                alteracionespubli_admin.IdPublicacion = publicaciones.IdPublicacion;
                alteracionespubli_admin.FechaModificacion = DateTime.Now;
                alteracionespubli_admin.TipoModificacion = 5; //  1: Agregar , 2: Modificar, 3:Eliminar, 4:Pausar, 5: Reestablecer.
                alteracionespubli_admin.IdAdministrador = usuario.Id;
                alteracionespubli_adminNegocio.agregarAlteracionAdmin(alteracionespubli_admin);
            }

            if (usuario.tipoUsuario == TipoUsuario.NORMAL)
            {
                Response.Redirect("viewUsuarioPublicaciones.aspx", false);
            }
            else
            {
                Response.Redirect("viewAdmin_Publicaciones.aspx", false);
            }
        }

        protected void btnBajaLogicaPublicacion_Click(object sender, EventArgs e)
        {
            int IdPublicacion = Convert.ToInt32(Session["IdPublicacion"]);
            Usuarios usuario = (Usuarios)Session["usuario"];
            bool Baja_Logica = true;
            Publicaciones publicaciones = new Publicaciones();
            Publicaciones_Negocio publicaciones_Negocio = new Publicaciones_Negocio();

            publicaciones = publicaciones_Negocio.Buscar_Publicacion_por_ID(IdPublicacion);
            publicaciones_Negocio.bajaLogicaPublicacion(Baja_Logica, IdPublicacion);

            Usuarios user_aux = new Usuarios();
            Usuario_Negocio userauxNegocio = new Usuario_Negocio();
            ALTERACIONESPUBLI_ADMIN alteracionespubli_admin = new ALTERACIONESPUBLI_ADMIN();
            ALTERACIONESPUBLI_ADMINNegocio alteracionespubli_adminNegocio = new ALTERACIONESPUBLI_ADMINNegocio();

            user_aux = userauxNegocio.Buscar_Usuario_por_IDUsuario(publicaciones.IdUsuario);

            if (usuario.tipoUsuario == TipoUsuario.NORMAL)
            {
                asuntoPublicacionNueva = "Has Eliminado una Publicacion";
                cuerpoPublicacionNueva = " Hola " + usuario.User + " ! . Tu publicacion de " + publicaciones.articulo.Nombre + " se ha ELIMINADO satisfactoriamente.";
                emailService.armarCorreo(usuario.Email, asuntoPublicacionNueva, cuerpoPublicacionNueva);
                emailService.enviarEmail();
            }
            else
            {

                asuntoPublicacionNueva = "Un Administrador ha Eliminado una de tus Publicaciones";
                cuerpoPublicacionNueva = " Hola " + user_aux.User + " ! . Te avisamos que tu publicacion de " + publicaciones.articulo.Nombre + " ha sido ELIMINADA por un ADMINISTRADOR.";
                emailService.armarCorreo(user_aux.Email, asuntoPublicacionNueva, cuerpoPublicacionNueva);
                emailService.enviarEmail();

                alteracionespubli_admin.IdPublicacion = publicaciones.IdPublicacion;
                alteracionespubli_admin.FechaModificacion = DateTime.Now;
                alteracionespubli_admin.TipoModificacion = 3; //  1: Agregar , 2: Modificar, 3:Eliminar, 4:Pausar, 5:Reestablecer.
                alteracionespubli_admin.IdAdministrador = usuario.Id;
                alteracionespubli_adminNegocio.agregarAlteracionAdmin(alteracionespubli_admin);
            }



            if (usuario.tipoUsuario == TipoUsuario.NORMAL)
            {
                Response.Redirect("viewUsuarioPublicaciones.aspx", false);
            }
            else
            {
                Response.Redirect("viewAdmin_Publicaciones.aspx", false);
            }

        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {

            Usuarios usuario = (Usuarios)Session["usuario"];

            if (usuario.tipoUsuario == TipoUsuario.NORMAL)
            {
                Response.Redirect("viewUsuarioPublicaciones.aspx", false);
            }
            else
            {
                Response.Redirect("viewAdmin_Publicaciones.aspx", false);
            }

        }
    }
}