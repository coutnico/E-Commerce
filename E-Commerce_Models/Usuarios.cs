using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Commerce_Models
{

    public enum TipoUsuario{    // esto hace referenica que es enumerado (es como crear un tipo de dato) -- es como especie de clase (se evita usar strings, y es escalable)
        NORMAL = 1,
        ADMIN = 2
    }

    public class Usuario
    {
      
        public int Id {  get; set; }    

        public string User { get; set; }    

        public string Pass { get; set; }    

        public TipoUsuario tipoUsuario { get; set; }   


        //creo consctructor

        public Usuario (string user, string pass, bool admin) {
            User = user;
            Pass = pass;    
            tipoUsuario = admin ? TipoUsuario.ADMIN : TipoUsuario.NORMAL; // Con el bool hago un op ternario. Si es 1, asino el valor de admin (2) si no (1)

    }   
}