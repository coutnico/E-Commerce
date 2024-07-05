<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewRegistrarDatosUsuario.aspx.cs" Inherits="tp_web_equipo_19.Views.viewRegistrarDatosUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #f8f9fa;
        }

        .form-container {
            margin-top: 50px;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
        }

        .input-container {
            margin-bottom: 20px;
        }

        .form-control {
            margin-bottom: 1rem;
        }

        .fs-Segoe {
            font-family: "Segoe UI Emoji";
        }

        .text-shadow {
            text-shadow: 1px 1px 3px #ccc;
        }

        .btnExit {
            --bg: #212529;
            --hover-bg: #ff90e8;
            --hover-text: #000;
            color: #fff;
            cursor: pointer;
            border: 1px solid var(--bg);
            border-radius: 10px;
            padding: 0.8em 2em;
            background: var(--bg);
            transition: 0.2s;
            font-family: 'Segoe UI';
            font-weight: bolder;
        }

        .btnExit:hover {
            color: var(--hover-text);
            transform: translate(-0.25rem, -0.25rem);
            background: rgb(195, 34, 34);
            background: linear-gradient(0deg, rgba(195, 34, 34, 1) 0%, rgba(255, 251, 243, 1) 100%);
            box-shadow: 0.25rem 0.25rem var(--bg);
        }

        .btnExit:active {
            transform: translate(0);
            box-shadow: none;
        }
    </style>
    <div class="container pb-4">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="form-container shadow-lg" style="margin-left: 4rem !important; background: rgb(255,251,243); background: linear-gradient(0deg, rgba(255,251,243,1) 0%, rgba(34,175,195,1) 100%);">
                    <h2 class="text-center fs-Segoe text-shadow mb-3 fw-bolder fs-3 text-light bg-success bg-opacity-75 p-2 rounded-3">Mis datos</h2>

                    <asp:TextBox ID="username" runat="server" CssClass="form-control" required="" type="text" placeholder="Nombre de usuario" />

                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" required="" type="text" placeholder="Apellido" />

                    <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control" required="" type="text" placeholder="Nombres" />

                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" required="" type="email" placeholder="Correo electrónico" />

                    <asp:TextBox ID="txtDocumento" runat="server" CssClass="form-control" required="" type="text" placeholder="Documento" />

                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" required="" type="number" placeholder="Teléfono" />

                    <asp:TextBox ID="txtTelefono2" runat="server" CssClass="form-control" required="" type="text" placeholder="Teléfono alternativo" />

                    <asp:DropDownList ID="gender" runat="server" CssClass="form-control bg-success-subtle border border-3 border-white text-dark fs-6 fw-semibold text-center">
                        <asp:ListItem Text="Genero" Value="" />
                        <asp:ListItem Text="Masculino" Value="Masculino" />
                        <asp:ListItem Text="Femenino" Value="Femenino" />
                        <asp:ListItem Text="Otro" Value="Otro" />
                    </asp:DropDownList>

                    <div class="text-center">
                        <asp:Button Text="Registrarme" OnClick="btnRegistar_Click" CssClass="btnSignOut me-1" Width="125px" runat="server" ID="btnRegistar" Style="width: 200px" />
                        <asp:Button Text="Salir" OnClick="btnSalir_Click" CssClass="btnExit ms-1" Width="125px" runat="server" ID="btnSalir" Style="width: 100px" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
