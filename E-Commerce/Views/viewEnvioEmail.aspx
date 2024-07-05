<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewEnvioEmail.aspx.cs" Inherits="tp_web_equipo_19.Views.viewEnvioEmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%--    // Solo para pruebas--%>



    <div>
        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email Destino"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtAsuntoEmail" runat="server" placeholder="Asunto"></asp:TextBox>
        <br />
        <asp:TextBox ID="txtMensajeEmail" runat="server" placeholder="Mensaje" TextMode="MultiLine"></asp:TextBox>
        <br />
        <asp:Button ID="enviarEmail" runat="server" Text="Enviar" OnClick="enviarEmail_Click" />

    </div>




</asp:Content>
