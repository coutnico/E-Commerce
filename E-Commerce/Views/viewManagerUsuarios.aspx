<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewManagerUsuarios.aspx.cs" Inherits="tp_web_equipo_19.Views.viewManagerUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row m-3">
            <div class="col-12 text-center mb-4">
                <h2 class="mb-2 text-light fw-bolder bg-dark rounded-2">Usuarios</h2>
            </div>
            <asp:Repeater ID="rpUsuarios" runat="server">
                <ItemTemplate>
                    <div class="col-md-2 mt-2">
                        <div class="cardUsuario shadow-lg">
                            <div class="cardUsuario__img">
                                <img src="..\Resources\bannerUsuario.png" alt="Alternate Text" class="rounded-4" style="height: 193px; width: 295px" />
                            </div>
                            <div class="cardUsuario__avatar">
                                <img src="https://img.icons8.com/fluency/96/user-male-circle--v1.png" alt="Alternate Text" style="height: 120px; width: 120px" />
                            </div>
                            <div class="cardUsuario__title"><%# Eval("User") %></div>
                            <div class="cardUsuario__subtitle"><%# Convert.ToInt32(Eval("tipoUsuario")) == 2 ? "Administrador" : "Usuario" %></div>
                            <div class="cardUsuario__wrapper">
                                <button class="cardUsuario__btn w-auto">Publicaciones</button>
                                <asp:Button Text="Modificar" CssClass="cardUsuario__btn cardUsuario__btn-solid" ID="btnModificar" OnClick="btnModificar_Click" CommandArgument='<%# Eval("Id") %>' CommandName="IdUsuario" runat="server" />
                                <asp:Button Text="Eliminar" CssClass="cardUsuario__btn cardUsuario__btn-solid" ID="btnEliminar" OnClick="btnEliminar_Click" CommandArgument='<%# Eval("Id") %>' CommandName="IdUsuario" runat="server" />                      
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
