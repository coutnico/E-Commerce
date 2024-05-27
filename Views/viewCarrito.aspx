<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewCarrito.aspx.cs" Inherits="tp_web_equipo_19.Views.viewCarrito" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container ">


        <%if (tp_web_equipo_19.Models.Carrito.ArticulosFiltrados.Count == 0)
            {  %>
        <div class="row mt-3 shadow">
            <div class="text-center">
                <h2 class="text-success fw-bold">No se agrego ninguna articulo al carrito</h2>
            </div>
        </div>





        <%}
            else
            { %>
        <asp:Repeater runat="server" ID="RptArticulos">
            <ItemTemplate>
                <div class="row border border-3 border-success mt-3 shadow">
                    <div class="col-md-3">
                        <img src="<%# Eval("ImagenUrl") %>" onerror="this.src = 'https://i.ibb.co/SwxTQny/imagen.png'" alt="Alternate Text" class="border border-2 border-black border-opacity-75 m-2" style="width: 180px; height: 160px" />
                        <asp:ImageButton runat="server" ID="ibEliminar" OnClick="ibEliminar_Click" CommandArgument='<%# Eval("ID")%>' CommandName="IDArticulo" ImageUrl="https://i.ibb.co/dcwWddg/basura.png" AlternateText="Eliminar" Style="width: 30px; height: 30px; margin-bottom: 53px; margin-right: 3px" />
                        <asp:Label ID="lblCantidad" CssClass=" ms-2 fw-semibold bg-black bg-opacity-75 rounded rounded-1 text-light border border-1 border-light fs-5" Text="" runat="server" >Cantidad: <%# Eval("Cantidad") %></asp:Label>
                    </div>
                    <div class="col-md-2 mt-5 text-center">
                        <asp:Label runat="server" ID="lblNombre" CssClass="fs-5 text-success text-opacity-75 fw-bolder "><%# Eval("Nombre") %></asp:Label>
                    </div>
                    <div class="col-md-2 mt-5 text-center">
                        <asp:Label runat="server" ID="lblCategoria" CssClass="fs-5 text-primary text-opacity-50 fw-bolder"><%# Eval("Categoria") != null ? Eval("Categoria") : "Categoria" %></asp:Label>
                    </div>
                    <div class="col-md-2 mt-5 text-center">
                        <asp:Label runat="server" ID="lblMarca" CssClass="fs-5 text-primary text-opacity-50 fw-bolder"><%# Eval("Marca") %>  </asp:Label>
                    </div>
                    <div class="col-md-2 d-flex justify-content-end align-items-end me-5">
                        <asp:Label runat="server" CssClass="text-end fs-5 text-black text-opacity-75 fw-bolder  " ID="lblPrecio"><%# "$" + ((decimal)Eval("Precio") * (int)Eval("Cantidad")).ToString() %></asp:Label>
                    </div>
                </div>
            </ItemTemplate>

        </asp:Repeater>


        <div class="text-end border border-3 m-3 bg-black shadow">
            <% tp_web_equipo_19.Models.Carrito.Total = 0;
                tp_web_equipo_19.Models.Carrito.CargarTotalActual();
                this.CargarLabel();

            %>
            <asp:Label Text="0" runat="server" CssClass="fs-5 fw-semibold text-light me-3" ID="lblTotal" />
        </div>

        <%} %>
    </div>
</asp:Content>
