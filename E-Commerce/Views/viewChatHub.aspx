<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewChatHub.aspx.cs" Inherits="tp_web_equipo_19.Views.viewChatHub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%--    <script src=""></script>

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
        </div>--%>



    <%--    <div class="message-group">
        <asp:Repeater ID="reapeterChats" runat="server">
            <ItemTemplate>

                <div class="text-start">
                    <h4><%# (Eval("Remitente").ToString() == "1") ? "Comprador" : "Vendedor" %></h4>
                    </div>
                <div class="text-start">
                 <p>   <%# Eval("Mensaje") %> </p> 
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <asp:TextBox ID="txtMensajeNuevo" runat="server" TextMode="MultiLine" />

    <div class="text-end">
        <asp:Button runat="server" ID="btnEnviarMensaje" OnClick="btnEnviarMensaje_Click" Text="Enviar" CommandArgument='<%# Eval("Remitente") %>' CssClass="btn btn-dark shadow rounded-0 fw-semibold w-100 text-center" />
    </div>--%>

    <div class="message-group w-50 mx-auto">
        <asp:Repeater ID="reapeterChats" runat="server">
            <ItemTemplate>
                <div class="mb-3">
                    <%# (Eval("Remitente").ToString() == "1") ? 
                    "<div class='text-start'>" : 
                    "<div class='text-end'>" %>

                    <div class="border p-2 rounded bg-light">
                        <h6 class="text-muted">
                            <%# (Eval("Remitente").ToString() == "1") ? "Comprador" : "Vendedor" %>
                        </h6>
                        <p class="m-0">
                            <%# Eval("Mensaje") %>
                        </p>
                    </div>

                </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>



    <div class=" d-flex mx-auto">
        <asp:TextBox ID="txtMensajeNuevo" CssClass="form-control message-input w-75 mx-auto" runat="server" TextMode="MultiLine" />
        <div>
            <asp:Button runat="server" ID="btnEnviarMensaje" OnClick="btnEnviarMensaje_Click" Text="Enviar" CommandArgument='<%# Eval("Remitente") %>' CssClass="btn btn-dark shadow rounded-0 fw-semibold w-100" />
        </div>
    </div>

</asp:Content>

