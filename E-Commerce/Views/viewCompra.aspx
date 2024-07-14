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
                        <div class="row justify-content-center align-items-center">
                            <asp:Button Text="Agregar Domicilio" runat="server" CssClass="btn w-50 mb-3 text-light fw-bolder" Style="background-color: #212529" ID="btnAgregarDomicilio" OnClick="btnAgregarDomicilio_Click" />
                            <asp:DropDownList runat="server" ID="dgvDomicilios" CssClass="btn btn-danger fs-5 fw-semibold w-75">
                                <asp:ListItem Text="Desplegar domicilios" Value="" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <a class="btn btn-dark w-100 fs-4 border-2 border-dark shadow-lg fw-semibold mt-2" data-bs-toggle="collapse" href="#collapseMetodoPago" role="button" aria-expanded="false" aria-controls="collapseExample">Elegir metodo de pago</a>
                <div class="collapse mt-2" id="collapseMetodoPago">
                    <div class="card card-body">
                        <div class="row justify-content-center align-items-center text-center">
                            <img src="https://img.icons8.com/external-flatart-icons-flat-flatarticons/512/external-bank-taxes-flatart-icons-flat-flatarticons.png" alt="Alternate Text" style="width: 130px; height: 130px" />
                            <p class="fw-semibold text-success">Momentaneamente solo contamos con transferencia bancaria</p>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col">
                <div class="fixedDiv shadow-lg">
                    <div class="text-center">
                        <p class="text-dark border fs-3 shadow">RESUMEN DE COMPRA </p>
                    </div>
                    <%E_Commerce_Models.Carrito.GetCantidadTotalArticulos();
                        E_Commerce_Models.Carrito.CargarTotalActual();
                        this.CargarLabelArticulos();

                    %>
                    <asp:Label runat="server" ID="lblCantProductos" CssClass="text-dark fw-semibold mt-3"></asp:Label>
                    <asp:Label runat="server" ID="lblSubtotal" CssClass="text-dark fw-semibold mt-3"></asp:Label>
                    <p class=" text-success fw-semibold">Envio Gratis</p>
                    <div class=" border border-3 rounded-3 mx-3 mb-2 bg-black shadow mt-auto">
                        <% E_Commerce_Models.Carrito.Total = 0;

                            E_Commerce_Models.Carrito.CargarTotalActual();
                            this.CargarLabel();

                        %>
                        <asp:Label Text="0" runat="server" CssClass="fs-5 fw-semibold text-light ms-2" ID="lblTotal" />
                    </div>
                    <div class="text-center">
                        <asp:Button Text="Confirmar compra" ID="btnConfirmarCompra" OnClick="btnConfirmarCompra_Click" CssClass="btn btn-success" Width="300px" Height="50px" runat="server" />
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        function ShowCompraExitosa() {
            Swal.fire({
                title: "Compra realizada exitosamente",
                timer: 1000,
                icon: "success",
            }).then((result) => {
                if (result.dismiss === Swal.DismissReason.timer) {
                    window.location.href = 'viewArticulos.aspx'
                }
            });

        }

        function ShowError() {
            Swal.fire({
                title: "Datos incompletos",
                text: "Intentelo de nuevo....",
                timer: 1000,
                icon: "error",
            });
        }

    </script>
</asp:Content>
