using E_Commerce_Controller;
using E_Commerce_Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

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
                string query = "SELECT IdCompra, IdUsuario, IdPublicacion, QComprada, Cancelada FROM COMPRAS";

                using (SqlDataReader reader = conexionDB_obj.LeerDatos(query))
                {
                    while (reader.Read())
                    {
                        Compras compra = new Compras();
                        compra.IdCompra = Convert.ToInt32(reader["IdCompra"]);
                        compra.IdUsuario = Convert.ToInt32(reader["IdUsuario"]);
                        compra.IdPublicacion = Convert.ToInt32(reader["IdPublicacion"]);
                        compra.QComprada = Convert.ToInt32(reader["QComprada"]);                        
                        compra.Cancelada = Convert.ToBoolean(reader["Cancelada"]);

                        lista.Add(compra);
                    }
                }

                return lista;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally
            {
                conexionDB_obj.CerrarConexion();
                
            }
        }
        public void AgregarCompra(Compras compra)
        {
            try
            {
                string query = $"INSERT INTO COMPRAS (IdUsuario, IdPublicacion, QComprada, Cancelada) " +
                               $"VALUES ({compra.IdUsuario}, {compra.IdPublicacion}, {compra.QComprada}, 0)";
                conexionDB_obj.EjecutarComando(query);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }











    }
}