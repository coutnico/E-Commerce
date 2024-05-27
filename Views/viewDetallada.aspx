<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewDetallada.aspx.cs" Inherits="tp_web_equipo_19.Views.viewDetallada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div class="product-container d-flex justify-content-center align-items-center pb-5">
            <div class="product-image">
                <img runat="server" id="ImagenPrincipalArticulo" src="#" alt="Alternate Text" class="img-thumbnail" onerror="this.src='https://i.ibb.co/SwxTQny/imagen.png'" style="width: 500px; height: 500px;" />
            </div>
            <div class="product-details d-flex flex-column p-3">
                <h2 id="NombreProducto" class="mb-3 fw-bolder text-success" runat="server"></h2>
                <asp:Label ID="PrecioProducto" CssClass="text-dark text-opacity-75 rounded rounded-3 bg-success bg-opacity-50 fs-4 text-center" runat="server" Text=""></asp:Label>
                <asp:Label ID="DescripcionArticulo" CssClass="text-break pt-2" runat="server" placeholder="Descripción del producto"></asp:Label>
                <asp:Label ID="lblCategoria" CssClass="fw-semibold text-dark text-opacity-75 pt-2" runat="server" Text=""></asp:Label>
                <asp:Label ID="lblMarca" CssClass="fw-semibold text-dark text-opacity-75 pt-2" runat="server" Text=""></asp:Label>
                <div class="py-5 gap-1">
                    <p runat="server" id="CantidadImagenes" class ="fw-semibold"></p>
                    <asp:Button ID="Atras" OnClick="Atras_Click" CssClass="btn btn-outline-secondary me-2" runat="server" Text="Atras" />
                    <asp:Button ID="Siguiente" OnClick="Siguiente_Click" CssClass="btn btn-outline-primary" runat="server" Text="Siguiente" />
                </div>
                <div class="button-group">
                    <asp:Button ID="btnComprarAhora" CssClass="btn btn-primary btn-lg" Style="margin-bottom: 10px; width: 300px; height: 60px" runat="server" Text="Comprar Ahora" />
                    <br />
                    <asp:Button ID="btnAgregarAlCarrito" OnClick="btnAgregarAlCarrito_Click" CssClass="btn btn-secondary btn-lg" Style="margin-top: 10px; width: 300px; height: 60px" runat="server" Text="Agregar al carrito" />
                </div>
            </div>
        </div>
    </section>

</asp:Content>
