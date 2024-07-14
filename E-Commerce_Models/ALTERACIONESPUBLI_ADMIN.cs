using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Commerce_Models
{
    public class ALTERACIONESPUBLI_ADMIN
    {

        public int Id { get; set; }
        public int IdPublicacion { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int TipoModificacion { get; set; } // 1: Agregar , 2: Modificar, 3:Eliminar.
        public int IdAdministrador { get; set; } 


    }
}