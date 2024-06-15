<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewCarrito.aspx.cs" Inherits="tp_web_equipo_19.Views.viewCarrito" %>



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
            margin-top:15px;
            margin-left:40px;
        }
    </style>

    <div class="container-lg w-100 align-items-start">


        <%if (E_Commerce_Models.Carrito.ArticulosFiltrados.Count == 0)
            {  %>
        <div class="row mt-3 shadow">
            <div class="text-center">
                <h2 class="text-success fw-bold">No se agrego ninguna articulo al carrito</h2>
            </div>
        </div>
        <%}
            else
            { %>

        <div class="row">
            <div class="col-md-7 pb-4">

                <asp:Repeater runat="server" ID="RptArticulos">
                    <ItemTemplate>
                        <div class="border border-1 border-light rounded-3 mt-3 shadow-lg d-flex justify-content-between align-items-center p-2" style="max-width: 800px;background-color:#212529">
                            <div class="d-flex align-items-center">
                                <img src="<%# Eval("ImagenUrl") %>" onerror="this.src = 'https://i.ibb.co/SwxTQny/imagen.png'" alt="Alternate Text" class="border border-2 border-black border-opacity-75" style="width: 70px; height: 70px; margin-right: 10px;" />
                                <asp:ImageButton runat="server" ID="ibEliminar" OnClick="ibEliminar_Click" CommandArgument='<%# Eval("ID")%>' CommandName="IDArticulo" ImageUrl="https://i.ibb.co/dcwWddg/basura.png" AlternateText="Eliminar" Style="width: 25px; height: 25px; margin-right: 10px;" />
                            </div>
                            <asp:Label runat="server" ID="lblNombre" CssClass="fs-6 text-light  fw-bolder mx-2"><%# Eval("Nombre") %></asp:Label>
                            <asp:Label runat="server" ID="lblCategoria" CssClass="fs-6 text-light  fw-bolder mx-2"><%# Eval("Categoria") != null ? Eval("Categoria").ToString() : "Categoria" %></asp:Label>
                            <asp:Label runat="server" ID="lblMarca" CssClass="fs-6 text-light  fw-bolder mx-2"><%# Eval("Marca") %></asp:Label>
                            <asp:Label runat="server" CssClass="fs-6 text-light  fw-bolder mx-2" ID="lblPrecio"><%# "$" + ((decimal)Eval("Precio") * (int)Eval("Cantidad")).ToString() %></asp:Label>
                            <asp:Label ID="lblCantidad" CssClass="fw-semibold bg-black bg-opacity-75 rounded text-light border border-1 border-light fs-6 p-1" Text='<%# "Cantidad: " + Eval("Cantidad") %>' runat="server"></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div class="col">
                <div class="fixedDiv shadow-lg">
                    <div class="text-center">
                        <p class="text-dark border fs-3 shadow">RESUMEN DE COMPRA </p>
                    </div>
                    <asp:Label Text="Productos (<% %>)" runat="server" />
                    <div class=" border border-3 rounded-3 m-3 bg-black shadow mt-auto">
                        <% E_Commerce_Models.Carrito.Total = 0;

                            E_Commerce_Models.Carrito.CargarTotalActual();
                            this.CargarLabel();

                        %>
                        <asp:Label Text="0" runat="server" CssClass="fs-5 fw-semibold text-light ms-2" ID="lblTotal" />
                    </div>

                </div>
            </div>
        </div>






        <%} %>
    </div>
</asp:Content>
