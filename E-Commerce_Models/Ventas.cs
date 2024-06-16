﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace E_Commerce_Models
{
    public class Ventas
    {
       public int IdVentas { get; set; }
       public int IdUsuario { get; set; }
       public int IdPublicacion { get; set; }
       public int QComprada { get; set; }
       
       public bool Cancelada { get; set; }

        public Ventas(int idComprador, int IdPublicacion_aux , int Qcomprada_aux)
        {
            IdUsuario = idComprador;
            IdPublicacion = IdPublicacion_aux;
            QComprada = Qcomprada_aux;
        }
    }
}