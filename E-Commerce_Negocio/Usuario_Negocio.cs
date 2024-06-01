using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using E_Commerce_Models;
using E_Commerce_Controller;

namespace E_Commerce_Negocio
{
    public class Usuario_Negocio
    {
        public bool loguear (Usuario usuario)
        {
            ConexionDB conexionDB = new ConexionDB ();
            

            try
            {


                return true;

            }


            catch (Exception ex) 
            {

                throw ex;
            }
            finally { }

        }


    }
}