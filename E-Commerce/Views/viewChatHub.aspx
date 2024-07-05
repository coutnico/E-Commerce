<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewChatHub.aspx.cs" Inherits="tp_web_equipo_19.Views.viewChatHub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src=""></script>

 <script src="Scripts/jquery-3.6.0.min.js"></script>
    <script src="https://localhost:44380/wwwroot/js/signalr/dist/browser/signalr.js"></script>
    <style>
        /* Estilos opcionales para el chat */
        #messages {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }
        #messages li {
            padding: 8px 16px;
            background-color: #f1f1f1;
            margin-bottom: 8px;
            border-radius: 4px;
        }
    </style>po


        <div>
            <asp:TextBox ID="txtName" runat="server" placeholder="Your Name"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtMessage" runat="server" placeholder="Your Message"></asp:TextBox>
            <br />
            <asp:Button ID="sendButton" runat="server" Text="Send" OnClick="sendButton_Click" />
            <hr />
            <ul id="messages"></ul>
        </div>



</asp:Content>

