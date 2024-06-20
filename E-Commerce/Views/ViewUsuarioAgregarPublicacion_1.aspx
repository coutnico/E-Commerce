<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewUsuarioAgregarPublicacion_1.aspx.cs" Inherits="tp_web_equipo_19.Views.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="text-end">
        <button type="button" class="btn-close" aria-label="Close" style="font-size: 30px" onclick="window.location.href = 'viewUsuarioPublicaciones.aspx';"></button>
    </div>

    <div>
        <h2>¡Hola! Antes que nada contanos,
            <br />
            ¿qué vas a publicar? </h2>
    </div>

    <div class="row mx-auto " style="max-width: 80%; margin-top: 10%">
        <asp:Repeater ID="reapeterAgregarPublicacion" runat="server">
            <ItemTemplate>
                <div class="col-md-3 mb-3">
                    <div class="card h-100 d-flex flex-column justify-content-between">
                        <div class="card-body d-flex flex-column align-items-center">
                            <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("Descripcion") %>' CssClass="card-title" />
                            <div class="text-end mt-3">
                                <asp:Button runat="server" ID="btnSeleccionarCategoria" OnClick="btnSeleccionarCategoria_Click" CommandArgument='<%# Eval("Id") %>' CommandName="IdCategoria" Text="Seleccionar" CssClass="btn btn-dark shadow rounded-0 fw-semibold w-100 text-center" />
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>




</asp:Content>
