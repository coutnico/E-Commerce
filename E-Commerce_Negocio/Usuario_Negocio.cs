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
        public bool loguear(Usuarios usuario)
        {


            try
            {
                //conexionDB.EjecutarComando(" Select Id, Usuario, Pass, TipoUser FROM USUARIOS Where usuario = @user and Pass = @pass");
                //conexionDB.AgregarParametro("@user", usuario.User);
                //conexionDB.AgregarParametro("@pass", usuario.Pass);

                //reader = conexionDB.LeerDatos("Select Id, Usuario, Pass, TipoUser FROM USUARIOS Where Usuario = @user and Pass = @pass");
                reader = conexionDB.LeerDatos("Select Id, Usuario, Pass, TipoUser FROM USUARIOS Where Usuario = '" + usuario.User + "' and Pass = '" + usuario.Pass + "'");


                while (reader.Read())
                {
                    usuario.Id = Convert.ToInt32(reader["Id"]);
                    usuario.tipoUsuario = Convert.ToInt32(reader["TipoUser"]) == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;

                    return true;
                }


                return false;


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
                string query = "Select Id, Usuario, Pass, TipoUser From Usuarios";
                //cmd = new SqlCommand(query, conexion);
                //reader = cmd.ExecuteReader();
                reader = conexionDB.LeerDatos(query);


                while (reader.Read())
                {

                    Usuarios usuario = new Usuarios();

                    usuario.Id = Convert.ToInt32(reader["Id"]);
                    usuario.User = reader["Usuario"].ToString();
                    usuario.Pass = reader["Pass"].ToString();
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
    }
}