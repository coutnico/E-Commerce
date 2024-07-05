using E_Commerce_Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using E_Commerce_Models;


namespace E_Commerce_Negocio
{
    public class ChatNegocio
    {
 
        ConexionDB conexionDB_obj = new ConexionDB();

        SqlDataReader reader = null;

        public List<Chat> ListarChats()

        {

            List<Chat> lista = new List<Chat>();

            try
            {
                string query = "Select ID, IDCompra, Remitente, Mensaje from CHATS";
                //cmd = new SqlCommand(query, conexion);
                //reader = cmd.ExecuteReader();
                reader = conexionDB_obj.LeerDatos(query);


                while (reader.Read())
                {

                    Chat chat = new Chat();
                    chat.Id = Convert.ToInt32(reader["id"]);
                    chat.IdCompra = Convert.ToInt32(reader["IDCompra"]);
                    chat.Remitente = Convert.ToInt32(reader["Remitente"]);
                    chat.Mensaje = Convert.ToString(reader["Mensaje"]);

                    lista.Add(chat);

                }

                return lista;
            }

            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }


        }

        public void agregarChat(Chat chat_obj)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();


            try
            {

                // SQL usa ' para el query. y c# com dobles para separar cadenas
                conexionDB_Obj.EjecutarComando("Insert into CHATS (IDCompra, Remitente, Mensaje) Values (" + chat_obj.IdCompra + "," + chat_obj.Remitente + ",'" + chat_obj.Mensaje + "')");
                string txt_articulo_agregado = "Chat agregado exitosamente";
                //return 1;
            }
            catch (Exception)
            {
                //return 0;
                throw;

            }

        }

        public void eliminarChat(int id_delete)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();

            try
            {
                // SQL usa ' para el query. y c# com dobles para separar cadenas
                conexionDB_Obj.EjecutarComando("Delete from CHATS where Id = " + id_delete);

                string txt_articulo_eliminado = "Chat eliminado";
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void modificarChat(Chat chat_obj, int ID_a_modificar)
        {
            ConexionDB conexionDB_Obj = new ConexionDB();

            try
            {
                conexionDB_Obj.EjecutarComando("UPDATE CHATS SET IDCompra =" + chat_obj.IdCompra + ", Remitente =" + chat_obj.Remitente + ", Mensaje= '" + chat_obj.Mensaje + "'" + "where Id = " + ID_a_modificar);
   
                string txt_articulo_actualizado = "Chat Actualizado";
            }
            catch (Exception)
            {

                throw;
            }


        }

        public  Chat Buscar_Chat_por_IDCompra(int idCompra_Chatbuscado)

        {

            int IDCompra_chatbuscado_aux = 0;
            try
            {
                string query = "Select ID, IDCompra, Remitente, Mensaje from CHATS";
       

                Chat chat = new Chat();

                reader = conexionDB_obj.LeerDatos(query); //reader = cmd.ExecuteReader();


                while (reader.Read())
                {

                    IDCompra_chatbuscado_aux = Convert.ToInt32(reader["IDCompra"]);

                    if (IDCompra_chatbuscado_aux == idCompra_Chatbuscado)
                    {

                        chat.Id = Convert.ToInt32(reader["id"]);
                        chat.IdCompra = Convert.ToInt32(reader["IDCompra"]);
                        chat.Remitente = Convert.ToInt32(reader["Remitente"]);
                        chat.Mensaje = Convert.ToString(reader["Mensaje"]);

                    }
                }
                return chat;

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB_obj.CerrarConexion(); }


        }


    }
}