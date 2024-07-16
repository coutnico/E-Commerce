<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewDetallada.aspx.cs" Inherits="tp_web_equipo_19.Views.viewDetallada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div class="product-container d-flex justify-content-center align-items-center py-5">
            <div class="product-image border border-2 border-opacity-75 border-dark rounded-start">
                <img runat="server" id="ImagenPrincipalArticulo" src="#" alt="Alternate Text" class="img-thumbnail" onerror="this.src='https://i.ibb.co/SwxTQny/imagen.png'" style="width: 500px; height: 500px;" />
            </div>
            <div class="product-details d-flex flex-column p-3 bg-black bg-opacity-25 rounded-end" >
                <h2 id="NombreProducto" class="mb-3 fw-bolder text-light" runat="server"></h2>
                <asp:Label ID="PrecioProducto" CssClass="text-dark text-opacity-75 rounded rounded-3 fw-semibold fs-4 text-center" runat="server" Text=""></asp:Label>
                <asp:Label ID="DescripcionArticulo" CssClass="text-break pt-2" runat="server" placeholder="Descripción del producto"></asp:Label>
                <asp:Label ID="lblCategoria" CssClass="fw-semibold text-dark text-opacity-75 pt-2" runat="server" Text=""></asp:Label>
                <asp:Label ID="lblMarca" CssClass="fw-semibold text-dark text-opacity-75 pt-2" runat="server" Text=""></asp:Label>
                <div class="py-5 gap-1">
                    <p runat="server" id="CantidadImagenes" class ="fw-semibold"></p>
                    <asp:Button ID="Atras" OnClick="Atras_Click" CssClass="btn bg-dark bg-opacity-25 border border-1 border-dark border-opacity-75 btn fw-semibold me-2" runat="server" Text="Atras" />
                    <asp:Button ID="Siguiente" OnClick="Siguiente_Click" CssClass="btn bg-warning bg-opacity-50 border border-1 border-dark border-opacity-75 btn fw-semibold" runat="server" Text="Siguiente" />
                </div>
                <div class="button-group">
                    <asp:Button ID="btnComprarAhora" CssClass="btn bg-primary bg-opacity-75 border border-1 border-dark border-opacity-75 btn-lg fw-semibold" Style="margin-bottom: 5px; width: 400px; height: 50px" runat="server" Text="Comprar Ahora" />
                    <br />
                    <asp:Button ID="btnAgregarAlCarrito" OnClick="btnAgregarAlCarrito_Click" CssClass="btn bg-success bg-opacity-100 border border-1 border-dark border-opacity-75 btn-lg fw-semibold" Style="margin-top: 5px; width: 400px; height: 50px" runat="server" Text="Agregar al carrito" />
                </div>
            </div>
        </div>
    </section>

</asp:Content>
