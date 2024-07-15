<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewComprasUsuario.aspx.cs" Inherits="tp_web_equipo_19.Views.viewComprasUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


  


    
    <div class="d-flex justify-content-between align-items-center">
    <span style="margin-left:42%;" class="h2" >Mis Compras</span>
    <button type="button" class="btn btn-success btn-lg" onclick="window.location.href = 'viewUsuarioAgregarPublicacion_1.aspx';">Nueva</button>
</div>

    <asp:Label ID="cantidad_compras" runat="server" Text="" visible="false"></asp:Label>
    

    <% if (Convert.ToInt32(cantidad_compras.Text) == 0)
        { %>
     <p class="card-text fs-4 fw-semibold text-shadow text-dark text-end">NO EXISTEN COMPRAS</p>


     <% } else
         { %>
            

    <asp:Repeater ID="reapeterComprasUsuario" runat="server">
        <ItemTemplate>
            <div class="card mb-3 mx-auto  " style="max-width: 80%;">
                <div class="row g-0 ">
                    <div class="col-md-4">

                        <img class="img-fluid rounded-start" id="imgProductosUsuario" src="<%#  busquedaPublicacion(Convert.ToInt32(Eval("IdPublicacion"))).articulo.ImagenURl %>" onerror="this.src='https://i.ibb.co/SwxTQny/imagen.png'" alt="Imagen productos Usuario" style="max-width: 100%; height: 200px;" />
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <asp:Label ID="lblNombre" class="card-title h4" runat="server" Text=""> <%#  busquedaPublicacion(Convert.ToInt32(Eval("IdPublicacion"))).articulo.Nombre %> </asp:Label>

                            <div class="ms-auto d-flex align-items-center">
                                <asp:Label ID="lblCategoria" class="align-content-center h8" runat="server" Text=""><%#  busquedaPublicacion(Convert.ToInt32(Eval("IdPublicacion"))).articulo.Categoria %></asp:Label>
                            </div>

                            <p class="card-text fs-4 fw-semibold text-shadow text-dark text-end"> Precio Unitario: $ <%#  Eval("PrecioUnitarioCompra") %></p>
                            <p class="card-text fs-4 fw-semibold text-shadow text-dark text-end">Cantidad Comprada Disponible: <%# Eval("QComprada") %></p>

                            <%--    <p class="card-text"><small class="text-body-secondary">Last updated xxx mins ago</small></p>--%>
                        </div>

                          <asp:Button runat="server" ID="btnChat" OnClick="btnChat_Click" CommandArgument='<%# Eval("IdCompra") %>'  CommandName="IdPublicacion" Text="Chat" CssClass="btn btn-dark shadow rounded-0 fw-semibold w-100 text-center" />



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


