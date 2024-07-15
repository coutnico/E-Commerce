using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing; // VER SI USAMOS ESTA LIBRERIA U OTRA (COMO ImageSharp (ImageSharp))
using System.Data.SqlClient;
using System.Globalization;
using E_Commerce_Models;
using E_Commerce_Controller;

namespace E_Commerce_Negocio
{
    public class ArticuloNegocio
{


    ConexionDB conexionDB_obj = new ConexionDB();
    SqlDataReader reader = null;


    public List<Articulo> ListarArticulos()

    {
        Marca marca = new Marca();
        MarcaNegocio marcaNegocio = new MarcaNegocio();
        Categoria categoria = new Categoria();
        CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

        Imagen imagen = new Imagen();
        ImagenNegocio imagenNegocio = new ImagenNegocio();

        List<Articulo> lista = new List<Articulo>();

        try
        {
            //conexion.Open();
            string query = "Select Id, Codigo, Nombre, Descripcion, IdMarca, IdCategoria, Precio from ARTICULOS";
            //cmd = new SqlCommand(query, conexion);
            //reader = cmd.ExecuteReader();
            reader = conexionDB_obj.LeerDatos(query);


            while (reader.Read())
            {

                Articulo articulo = new Articulo();

                articulo.ID = Convert.ToInt32(reader["Id"]);
                articulo.Codigo = reader["Codigo"].ToString();
                articulo.Nombre = reader["Nombre"].ToString();
                articulo.Descripcion = reader["Descripcion"].ToString();
                articulo.IDMarca = Convert.ToInt32(reader["IdMarca"]);
                articulo.IDCategoria = Convert.ToInt32(reader["IdCategoria"]);
                articulo.Precio = Convert.ToDecimal(reader["Precio"]);

                marca = marcaNegocio.Buscar_Marca_por_ID(articulo.IDMarca);
                categoria = categoriaNegocio.Buscar_Categoria_por_ID(articulo.IDCategoria);
                imagen = imagenNegocio.Buscar_Imagen_por_ID_articulo(articulo.ID);

                articulo.Marca = marca.Descripcion;
                articulo.Categoria = categoria.Descripcion;
                articulo.ImagenURl = imagen.URL;


                lista.Add(articulo);

            }

            return lista;
        }

        catch (SqlException ex)
        {
            throw ex;
        }
        finally { conexionDB_obj.CerrarConexion(); }


    }

    public void agregarArticulo(Articulo articulo_obj)
    {
        ConexionDB conexionDB_Obj = new ConexionDB();


        try
        {

            // SQL usa ' para el query. y c# com dobles para separar cadenas
            conexionDB_Obj.EjecutarComando("Insert into ARTICULOS (Codigo, Nombre, Descripcion, IdMarca, IdCategoria, Precio) Values (" + " '" + articulo_obj.Codigo + "' , '" + articulo_obj.Nombre + "' , ' " + articulo_obj.Descripcion + " ' , " + articulo_obj.IDMarca + " , " + articulo_obj.IDCategoria + " , " + articulo_obj.Precio.ToString(CultureInfo.InvariantCulture) + " ) ");
            string txt_articulo_agregado = "Articulo agregado exitosamente";
            //return 1;
        }
        catch (Exception)
        {
            //return 0;
            throw;

        }

    }

    public void eliminarArticulo(int id_delete)
    {
        ConexionDB conexionDB_Obj = new ConexionDB();

        try
        {
            // SQL usa ' para el query. y c# com dobles para separar cadenas
            conexionDB_Obj.EjecutarComando("Delete from ARTICULOS where Id = " + id_delete);

            string txt_articulo_eliminado = "Articulo eliminado";
        }
        catch (Exception)
        {

            throw;
        }
    }

    public void modificarArticulo(Articulo articulo_obj, int ID_a_modificar)
    {
        ConexionDB conexionDB_Obj = new ConexionDB();

        try
        {
            //   strin articulo_obj.Precio // SI SE LLEGA A QUERER USAR DECIMALES HAY QUE CONVERTIR LA , EN . . EJEMPLO 
            //decimal valorDecimal = 3.14m; // Ejemplo de valor decimal
            //string valorFormateado = valorDecimal.ToString(CultureInfo.InvariantCulture);

            // SQL usa ' para el query. y c# com dobles para separar cadenas
            //     UPDATE ARTICULOS SET Codigo = ' " + NO220 + "', Nombre = '" + nanbaa + "', Descripcion = '" + desce + "', IdMarca =" + 2 +", IdCategoria =" + 3 + ", Precio =" + 10.2 + "where Id =" + 1
            conexionDB_Obj.EjecutarComando("UPDATE ARTICULOS SET Codigo = '" + articulo_obj.Codigo + "', Nombre = '" + articulo_obj.Nombre + "', Descripcion = '" + articulo_obj.Descripcion + "', IdMarca = " + articulo_obj.IDMarca + ", IdCategoria = " + articulo_obj.IDCategoria + ", Precio =" + articulo_obj.Precio.ToString(CultureInfo.InvariantCulture) + "where Id = " + ID_a_modificar);
            //  conexionDB_Obj.EjecutarComando("UPDATE ARTICULOS SET Codigo = '" + articulo_obj.Codigo + "', Nombre = '" + articulo_obj.Nombre + "', Descripcion = '" + articulo_obj.Descripcion + "', IdMarca = " + articulo_obj.IDMarca + ", IdCategoria = " + articulo_obj.IDCategoria + ", Precio = " + articulo_obj.Precio + " WHERE Id = " + ID_a_modificar);

            string txt_articulo_actualizado = "Acticulo Actualizado";
        }
        catch (Exception)
        {

            throw;
        }


    }

    public Articulo Buscar_Articulo_por_ID(int id_buscado)

    {
            
            int articulo_aux = 0;
            try
        {
            // conexionDB_obj.AbrirConexion();
            string query = "Select Id, Codigo, Nombre, Descripcion, IdMarca, IdCategoria, Precio from ARTICULOS";
                //cmd = new SqlCommand(query, conexion);

                Articulo articulo = new Articulo();

                reader = conexionDB_obj.LeerDatos(query); //reader = cmd.ExecuteReader();

            
            while (reader.Read())
            {

                articulo_aux = Convert.ToInt32(reader["Id"]);

                if (articulo_aux == id_buscado)
                {

                    articulo.ID = id_buscado;
                    articulo.Codigo = reader["Codigo"].ToString();
                    articulo.Nombre = reader["Nombre"].ToString();
                    articulo.Descripcion = reader["Descripcion"].ToString();
                    articulo.IDMarca = Convert.ToInt32(reader["IdMarca"]);
                    articulo.IDCategoria = Convert.ToInt32(reader["IdCategoria"]);
                    articulo.Precio = Convert.ToDecimal(reader["Precio"]);

                }
            }
            return articulo;

        }
        catch (SqlException ex)
        {
            throw ex;
        }
        finally { conexionDB_obj.CerrarConexion(); }


    }

}
}