<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewUsuarioPublicaciones.aspx.cs" Inherits="tp_web_equipo_19.Views.viewUsuarioPublicaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <asp:Repeater ID="reapeterProductosUsuario" runat="server">
        <ItemTemplate>
            <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                    <div class="col-md-4">
                        <asp:Image ID="imgProductosUsuario" class="img-fluid rounded-start" runat="server"  src="<%# Eval("ImagenUrl") %>" onerror="this.src='https://i.ibb.co/SwxTQny/imagen.png'" alt="Imagen productos Usuario" />
                    <asp:Button runat="server" ID="BtnVerDetallePublicacion" OnClick="BtnVerDetallePublicacion" CommandArgument='<%# Eval("ID") %>' CommandName="IDPublicacion" Text="Ver Detalle" CssClass="btn btn-dark shadow rounded-0 fw-semibold w-100 text-center" />
                        </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <asp:Label ID="Label1"  class="card-title" runat="server" Text="lblNombre"> <%# Eval("Nombre") %> </asp:Label>
                            <p class="card-text fs-4 fw-semibold text-shadow text-dark text-end"><%# "$" + Eval("Precio") %></p>
        
                            <p class="card-text"><small class="text-body-secondary">Last updated xxx mins ago</small></p>
                        </div>
                    </div>
                </div>
            </div>

        </ItemTemplate>
    </asp:Repeater>






</asp:Content>
