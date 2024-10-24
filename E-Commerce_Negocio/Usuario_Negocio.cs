﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using E_Commerce_Models;
using E_Commerce_Controller;
using System.Data.SqlClient;
using System.Collections;
using System.Text.RegularExpressions;

namespace E_Commerce_Negocio
{



    public class Usuario_Negocio
    {
        ConexionDB conexionDB = new ConexionDB();
        SqlDataReader reader = null;
        public (bool Existe, bool Suspendido) loguear(Usuarios usuario)
        {


            try
            {
                //conexionDB.EjecutarComando(" Select Id, Usuario, Pass, TipoUser FROM USUARIOS Where usuario = @user and Pass = @pass");
                //conexionDB.AgregarParametro("@user", usuario.User);
                //conexionDB.AgregarParametro("@pass", usuario.Pass);

                //reader = conexionDB.LeerDatos("Select Id, Usuario, Pass, TipoUser FROM USUARIOS Where Usuario = @user and Pass = @pass");
                reader = conexionDB.LeerDatos("Select Id, Usuario, Pass, TipoUser, EMAIL FROM USUARIOS Where Usuario = '" + usuario.User + "' and Pass = '" + usuario.Pass + "'");


                while (reader.Read())
                {
                    Suspensiones_Negocio suspensiones = new Suspensiones_Negocio();

                    usuario.Id = Convert.ToInt32(reader["Id"]);
                    usuario.tipoUsuario = Convert.ToInt32(reader["TipoUser"]) == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
                    bool UsuarioSuspendido = false;

                    foreach (Suspension suspension in suspensiones.ListarSuspensiones())
                    {
                        if (usuario.Id == suspension.ID_Usuario && DateTime.Today <= suspension.Fecha_Fin)
                        {
                            UsuarioSuspendido = true;
                            break;
                        }
                    }


                    return (true, UsuarioSuspendido);
                }
                return (false, false);
            }
            catch (Exception ex)
            {
                throw ex;

            }
            finally
            {
                conexionDB.CerrarConexion();
            }

        }

        public List<Usuarios> ListarUsuarios()
        {
            List<Usuarios> listausuarios = new List<Usuarios>();

            try
            {
                //conexion.Open();
                string query = "Select Id, Usuario, Pass, TipoUser, EMAIL From Usuarios";
                //cmd = new SqlCommand(query, conexion);
                //reader = cmd.ExecuteReader();
                reader = conexionDB.LeerDatos(query);


                while (reader.Read())
                {

                    Usuarios usuario = new Usuarios();

                    usuario.Id = Convert.ToInt32(reader["Id"]);
                    usuario.User = reader["Usuario"].ToString();
                    usuario.Pass = reader["Pass"].ToString();
                    usuario.Email = reader["EMAIL"].ToString();
                    usuario.tipoUsuario = Convert.ToInt32(reader["TipoUser"]) == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;

                    listausuarios.Add(usuario);

                }

                return listausuarios;
            }

            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB.CerrarConexion(); }
        }

        public void EliminarUsaurioPorID(int id)
        {
            try
            {
                conexionDB.EjecutarComando("DELETE FROM USUARIOS WHERE Id = " + id.ToString());
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                conexionDB.CerrarConexion();
            }
        }

        public bool CrearUsuario(string nombreUsuario, string contraseña, string email)
        {
            try
            {
                conexionDB.EjecutarComando($"INSERT INTO USUARIOS (Usuario, Pass, TipoUser, EMAIL) VALUES ('{nombreUsuario}', '{contraseña}', 1, '{email}')");
                return true;
            }
            catch (Exception)
            {
                return false;
                throw;
            }
            finally
            {
                conexionDB.CerrarConexion();
            }
        }

        public Usuarios Buscar_Usuario_por_Nombre(string buscar_por_nombre_usuario)

        {

            string usuario_aux ="";
            try
            {
                // conexionDB_obj.AbrirConexion();
                string query = "Select Id, Usuario, Pass, TipoUser, EMAIL From Usuarios";
                //cmd = new SqlCommand(query, conexion);

                Usuarios usuario = new Usuarios();

                reader = conexionDB.LeerDatos(query); //reader = cmd.ExecuteReader();


                while (reader.Read())
                {

                    usuario_aux = reader["Usuario"].ToString();

                    if (usuario_aux.ToLower() == buscar_por_nombre_usuario.ToLower())
                    {

                        usuario.Id = Convert.ToInt32(reader["Id"]);
                        usuario.User = reader["Usuario"].ToString();
                        usuario.Pass = reader["Pass"].ToString();
                        usuario.Email = reader["EMAIL"].ToString();
                        usuario.tipoUsuario = Convert.ToInt32(reader["TipoUser"]) == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;

                    }
                }
                return usuario;

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB.CerrarConexion(); }


        }

        public Usuarios Buscar_Usuario_por_IDUsuario(int buscar_por_IDUsuario)

        {

            int IdUsuario_aux = 0;
            try
            {
                // conexionDB_obj.AbrirConexion();
                string query = "Select Id, Usuario, Pass, TipoUser, EMAIL From Usuarios";
                //cmd = new SqlCommand(query, conexion);

                Usuarios usuario = new Usuarios();

                reader = conexionDB.LeerDatos(query); //reader = cmd.ExecuteReader();


                while (reader.Read())
                {

                    IdUsuario_aux = Convert.ToInt32(reader["Id"]);

                    if (IdUsuario_aux == buscar_por_IDUsuario)
                    {

                        usuario.Id = Convert.ToInt32(reader["Id"]);
                        usuario.User = reader["Usuario"].ToString();
                        usuario.Pass = reader["Pass"].ToString();
                        usuario.Email = reader["EMAIL"].ToString();
                        usuario.tipoUsuario = Convert.ToInt32(reader["TipoUser"]) == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;

                    }
                }
                return usuario;

            }
            catch (SqlException ex)
            {
                throw ex;
            }
            finally { conexionDB.CerrarConexion(); }


        }


    }
}