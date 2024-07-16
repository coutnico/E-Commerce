using E_Commerce_Controller;
using E_Commerce_Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace E_Commerce_Negocio
{
    public class ComprasNegocio
    {

        ConexionDB conexionDB_obj = new ConexionDB();

        SqlDataReader reader = null;


        public List<Compras> ListarCompras()
        {
            List<Compras> lista = new List<Compras>();

            try
            {

                string query = "SELECT IdCompra, IdUsuario, IdPublicacion, QComprada, Cancelada, PrecioUnitarioCompra, Estado FROM COMPRAS";
                reader = conexionDB_obj.LeerDatos(query);  //cmd.ExecuteReader();

                while (reader.Read())
                {
                    Compras compra = new Compras();
                    compra.IdCompra = Convert.ToInt32(reader["IdCompra"]);
                    compra.IdUsuario = Convert.ToInt32(reader["IdUsuario"]);
                    compra.IdPublicacion = Convert.ToInt32(reader["IdPublicacion"]);
                    compra.QComprada = Convert.ToInt32(reader["QComprada"]);
                    compra.Cancelada = Convert.ToBoolean(reader["Cancelada"]);
                    compra.PrecioUnitarioCompra = Convert.ToSingle(reader["PrecioUnitarioCompra"]); // Leer PrecioUnitarioCompra
                    compra.Estado = Convert.ToInt32(reader["Estado"]);

                    lista.Add(compra);

                }

                return lista;

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }


        }

       
        public void AgregarCompra(Compras compra)
        {
            try
            {
                string query = "INSERT INTO COMPRAS (IdUsuario, IdPublicacion, QComprada, Cancelada, PrecioUnitarioCompra, Estado) VALUES (" + compra.IdUsuario + "," + compra.IdPublicacion + "," + compra.QComprada + "," + compra.Cancelada  + "," + compra.PrecioUnitarioCompra + compra.Estado + ")";
                conexionDB_obj.EjecutarComando(query);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void EliminarCompra(int id_delete)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();

            try
            {
                // Eliminar la compra según el ID especificado
                conexionDB_Obj.EjecutarComando("DELETE FROM COMPRAS WHERE IdCompra = " + id_delete);

                string txt_Compra_eliminada = "Compra eliminada";
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void ModificarCompra(Compras compra_obj, int ID_a_modificar)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();

            try
            {
                // Actualizar la información de la compra en la base de datos
                conexionDB_Obj.EjecutarComando("UPDATE COMPRAS SET IdUsuario = " + compra_obj.IdUsuario +
                    ", IdPublicacion = " + compra_obj.IdPublicacion +
                    ", QComprada = " + compra_obj.QComprada +
                    ", Cancelada = " + (compra_obj.Cancelada ? 1 : 0) +
                    ", Estado = " + (compra_obj.Estado) +
                    " WHERE IdCompra = " + ID_a_modificar);

                string txt_compra_actualizada = "Compra Actualizada";
            }
            catch (Exception)
            {
                throw;
            }
        }



        public void CancelarCompra(int id_cancelar)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();

            try
            {
                // Cancelar la compra cambiando el estado 'Cancelada' a true (1)
                conexionDB_Obj.EjecutarComando("UPDATE COMPRAS SET Cancelada = 1 WHERE IdCompra = " + id_cancelar);

                string txt_compra_cancelada = "Compra Cancelada";
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Compras BuscarCompraPorId(int id_buscado)
        {
            try
            {
                string query = "SELECT IdCompra, IdUsuario, IdPublicacion, QComprada, Cancelada, PrecioUnitarioCompra, Estado FROM COMPRAS WHERE IdCompra = " + id_buscado;
                reader = conexionDB_obj.LeerDatos(query);

                    if (reader.Read())
                    {
                        Compras compra = new Compras();
                        compra.IdCompra = Convert.ToInt32(reader["IdCompra"]);
                        compra.IdUsuario = Convert.ToInt32(reader["IdUsuario"]);
                        compra.IdPublicacion = Convert.ToInt32(reader["IdPublicacion"]);
                        compra.QComprada = Convert.ToInt32(reader["QComprada"]);
                        compra.Cancelada = Convert.ToBoolean(reader["Cancelada"]);
                        compra.PrecioUnitarioCompra = Convert.ToSingle(reader["PrecioUnitarioCompra"]);
                        compra.Estado = Convert.ToInt32(reader["Estado"]);

                    return compra;
                    }
                    else
                    {
                        return null; // Retorna null si no se encuentra ninguna compra con el IdCompra proporcionado
                    }
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
