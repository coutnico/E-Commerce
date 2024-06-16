<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewCompra.aspx.cs" Inherits="tp_web_equipo_19.Views.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .fixedDiv {
            background-color: whitesmoke;
            padding: 20px;
            border: 1px solid #212529;
            border-radius: 10px;
            color: white;
            width: 400px;
            height: 300px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            margin-top: 15px;
            margin-left: 40px;
        }
    </style>

    <div class="container-lg w-100 align-items-start">
        <div class="row">
            <div class="col-md-7 pb-4">
                <a class="btn btn-success w-100 fs-4 border-2 border-dark shadow-lg fw-semibold mt-3" data-bs-toggle="collapse" href="#collapseDomicilio" role="button" aria-expanded="false" aria-controls="collapseExample">Elegir el lugar de entrega </a>
                <div class="collapse mt-2" id="collapseDomicilio">
                    <div class="card card-body">
                        Domicilio
                    </div>
                </div>
                <a class="btn btn-dark w-100 fs-4 border-2 border-dark shadow-lg fw-semibold mt-2" data-bs-toggle="collapse" href="#collapseMetodoPago" role="button" aria-expanded="false" aria-controls="collapseExample">Elegir metodo de pago</a>
                <div class="collapse mt-2" id="collapseMetodoPago">
                    <div class="card card-body">
                        Metodo de pago
                    </div>
                </div>

            </div>
            <div class="col">
                <div class="fixedDiv shadow-lg">
                    <div class="text-center">
                        <p class="text-dark border fs-3 shadow">RESUMEN DE COMPRA </p>
                    </div>
                    <%E_Commerce_Models.Carrito.GetCantidadTotalArticulos();
                        this.CargarLabelArticulos();

                    %>
                    <asp:Label runat="server" ID="lblCantProductos" CssClass="text-dark fw-semibold mt-3"></asp:Label>
                    <p class=" text-success fw-semibold">Envio Gratis</p>
                    <div class=" border border-3 rounded-3 mx-3 mb-2 bg-black shadow mt-auto">
                        <% E_Commerce_Models.Carrito.Total = 0;

                            E_Commerce_Models.Carrito.CargarTotalActual();
                            this.CargarLabel();

                        %>
                        <asp:Label Text="0" runat="server" CssClass="fs-5 fw-semibold text-light ms-2" ID="lblTotal" />
                    </div>
                    <div class="text-center">
                        <asp:Button Text="Confirmar compra" CssClass="btn btn-success" Width="300px" Height="50px" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
