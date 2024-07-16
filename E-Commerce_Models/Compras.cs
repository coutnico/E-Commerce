using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Commerce_Models
{
    public class Compras
    {
       public int IdCompra { get; set; }
       public int IdUsuario { get; set; }
       public int IdPublicacion { get; set; }
       public int QComprada { get; set; }
       public bool Cancelada { get; set; }
       public int Estado { get; set; } // 0: NA  1:Pendiente Aprobacion 2:Aprobada 

      // public int CompraNumeroRegistro { get; set; } // Ya que en una misma compra, puede venir dadas de varias publicaciones.

       public decimal PrecioUnitarioCompra {  get; set; } 


        public Compras(int idComprador, int IdPublicacion_aux , int Qcomprada_aux)
        {
            IdUsuario = idComprador;
            IdPublicacion = IdPublicacion_aux;
            QComprada = Qcomprada_aux;
        }

        public Compras() { }
    }
}