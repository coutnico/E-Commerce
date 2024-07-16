<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewVentasUsuario.aspx.cs" Inherits="tp_web_equipo_19.Views.viewVentasUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    
    <div class="d-flex justify-content-between align-items-center">
        <span style="margin-left: 42%;" class="h2">Mis Ventas</span>
    </div>

    <asp:Label ID="cantidad_ventas" runat="server" Text="" Visible="false"></asp:Label>
    <%-- Solo para condicionar if --%>
    <asp:Label ID="lblPagoAproado" runat="server" Text="" Visible="false"></asp:Label>

    <% if (Convert.ToInt32(cantidad_ventas.Text) == 0)
        { %>
    <p class="card-text fs-4 fw-semibold text-shadow text-dark text-end">NO EXISTEN VENTAS</p>
    <% }
        else
        { %> 


    <asp:Repeater ID="reapeterVentasUsuario" runat="server">
        <ItemTemplate>
            <div class="card mb-3 mx-auto  " style="max-width: 80%;">
                <div class="row g-0 ">
                      <asp:Label ID="lblEstadoVenta" CssClass="h6 fst-italic" runat="server" Text=""> <%# Eval("Estado").ToString() == "1" ? "Pendiente Aprobación" : (Eval("Estado").ToString() == "2" ? "Aprobada" : "Estado Desconocido") %></asp:Label>
                    
                     <asp:Button ID="btnConfirmarPago" OnClick="btnConfirmarPago_Click" CommandArgument='<%#  Eval("IdCompra") %>' runat="server" CssClass="alert-success" Text="Confirmar Pago Recibido" Visible='<%# Eval("Estado").ToString() == "1" %>'/>
                    
                    <div class="col-md-4">
                        <img class="img-fluid rounded-start" id="imgProductosUsuario" src="<%# busquedaPublicacion(Convert.ToInt32(Eval("IdPublicacion"))).articulo.ImagenURl %>" onerror="this.src='https://i.ibb.co/SwxTQny/imagen.png'" alt="Imagen productos Usuario" style="max-width: 100%; height: 200px;" />
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <asp:Label ID="lblNombre" class="card-title h4" runat="server" Text=""> <%#  busquedaPublicacion(Convert.ToInt32(Eval("IdPublicacion"))).articulo.Nombre %> </asp:Label>

                            <div class="ms-auto d-flex align-items-center">
                                <asp:Label ID="lblCategoria" class="align-content-center h8" runat="server" Text=""><%#  busquedaPublicacion(Convert.ToInt32(Eval("IdPublicacion"))).articulo.Categoria %></asp:Label>
                            </div>

                            <%--<p class="card-text fs-4 fw-semibold text-shadow text-dark text-end"> Precio Unitario: $ <%#  Eval("PrecioUnitarioCompra") %></p>--%>
                            <p class="card-text fs-4 fw-semibold text-shadow text-dark text-end">Cantidad Comprada: <%# Eval("QComprada") %></p>
                            <p class="card-text fs-4 fw-semibold text-shadow text-dark text-end">Valor total: $ <%# totalCompra(Convert.ToInt32(Eval("QComprada")),Convert.ToInt32(Eval("PrecioUnitarioCompra"))) %></p>

                        </div>

                        <asp:Button runat="server" ID="btnChat" OnClick="btnChat_Click" CommandArgument='<%#  Eval("IdCompra") %>' CommandName="IdPublicacion" Text="Chat" CssClass="btn btn-dark shadow rounded-0 fw-semibold w-100 text-center" />



                        <%--  <div class="text-end">
                            <asp:Button runat="server" ID="BtnVerPublicacion" OnClick="BtnVerPublicacion_Click" CommandArgument='<%# Eval("IdPublicacion") %>' CommandName="IdPublicacion" Text="Ver Publicacion" CssClass="btn btn-dark shadow rounded-0 fw-semibold w-100 text-center" />
                        </div>--%>
                    </div>
                </div>
            </div>

        </ItemTemplate>
    </asp:Repeater>
    <% }%>




</asp:Content>
