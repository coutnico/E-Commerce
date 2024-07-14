<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewComprasUsuario.aspx.cs" Inherits="tp_web_equipo_19.Views.viewComprasUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <asp:Button runat="server" ID="btnChat" OnClick="btnChat_Click" CommandArgument= 2  CommandName="IdPublicacion" Text="Chat" CssClass="btn btn-dark shadow rounded-0 fw-semibold w-100 text-center" />

     <%--CommandArgument='<%# Eval("IdCompra") %>'--%>
</asp:Content>


