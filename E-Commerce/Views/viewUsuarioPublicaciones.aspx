<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewUsuarioPublicaciones.aspx.cs" Inherits="tp_web_equipo_19.Views.viewUsuarioPublicaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

            

    <div class="d-flex justify-content-between align-items-center">
    <span style="margin-left:42%;" class="h2" >Mis publicaciones</span>
    <button type="button" class="btn btn-success btn-lg" onclick="window.location.href = 'viewUsuarioAgregarPublicacion_1.aspx';">Nueva</button>
</div>


    <asp:Repeater ID="reapeterProductosUsuario" runat="server">
        <ItemTemplate>
            <div class="card mb-3 mx-auto  " style="max-width: 80%;">
                <div class="col-md-auto text-end">
                    <asp:Label ID="lblPausada" Style="font-size: smaller; font-style: italic" runat="server" Text=""> Publicacion <%# Eval("Pausada_String") %> </asp:Label>
                </div>
                <div class="row g-0 ">
                    <div class="col-md-4">
                        <img class="img-fluid rounded-start" id="imgProductosUsuario" src="<%# Eval("articulo.ImagenURl") %>" onerror="this.src='https://i.ibb.co/SwxTQny/imagen.png'" alt="Imagen productos Usuario" style="max-width: 100%; height: 200px;" />
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <asp:Label ID="lblNombre" class="card-title h4" runat="server" Text=""> <%# Eval("articulo.Nombre") %> </asp:Label>

                            <div class="ms-auto d-flex align-items-center">
                                <asp:Label ID="lblCategoria" class="align-content-center h8" runat="server" Text=""> <%# Eval("articulo.Categoria") %> </asp:Label>
                            </div>

                            <p class="card-text fs-4 fw-semibold text-shadow text-dark text-end"><%# "$" + Eval("articulo.Precio") %></p>
                            <p class="card-text fs-4 fw-semibold text-shadow text-dark text-end"><%# "Stock Disponible: " + Eval("Stock") %></p>
                            <%--    <p class="card-text"><small class="text-body-secondary">Last updated xxx mins ago</small></p>--%>
                        </div>



                        <div class="text-end">
                            <asp:Button runat="server" ID="BtnVerPublicacion" OnClick="BtnVerPublicacion_Click" CommandArgument='<%# Eval("IdPublicacion") %>' CommandName="IdPublicacion" Text="Ver Publicacion" CssClass="btn btn-dark shadow rounded-0 fw-semibold w-100 text-center" />
                        </div>
                    </div>
                </div>
            </div>

        </ItemTemplate>
    </asp:Repeater>


</asp:Content>
