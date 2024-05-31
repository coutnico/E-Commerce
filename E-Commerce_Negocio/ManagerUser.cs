using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Commerce_Negocio
{
    public enum TipoUsuario
    {
        ADMIN = 1,
        USUARIO = 0
    }


    public class ManagerUser
    {
        public int IdUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Email { get; set; }
        public TipoUsuario tipoUsuario { get; set; }

    }
}