using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using E_Commerce_Models;
using E_Commerce_Controller;
using System.Data.SqlClient;

namespace E_Commerce_Negocio
{
    public class Usuario_Negocio
    {
        public bool loguear (Usuario usuario)
        {
            ConexionDB conexionDB = new ConexionDB ();
            SqlDataReader reader = null;

            try
            {
                //conexionDB.EjecutarComando(" Select Id, Usuario, Pass, TipoUser FROM USUARIOS Where usuario = @user and Pass = @pass");
                conexionDB.AgregarParametro("@user", usuario.User);
                conexionDB.AgregarParametro("@pass", usuario.Pass);
                reader = conexionDB.LeerDatos("Select Id, Usuario, Pass, TipoUser FROM USUARIOS Where Usuario = @user and Pass = @pass");

                while(reader.Read())
                {
                    usuario.Id = Convert.ToInt32(reader["Id"]);
                    usuario.tipoUsuario = Convert.ToInt32(reader["TipoUser"]) == 1 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;

                    return true;
                }

                return false;
                

            }


            catch (Exception ex) 
            {

                throw ex;
                return false;
            }
            finally { }

        }


    }
}