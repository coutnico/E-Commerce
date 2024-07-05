<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewRegistrarUsuario.aspx.cs" Inherits="tp_web_equipo_19.Views.viewRegistrarUsuario" %>

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
        }

        .input-group {
            position: relative;
            margin-bottom: 1rem;
        }

        .input {
            width: 100%;
            border: solid 2px #2a8614;
            background: none;
            padding: 1rem;
            font-size: 1rem;
            color: #495057;
            transition: border 150ms cubic-bezier(0.4, 0, 0.2, 1);
        }

        .user-label {
            position: absolute;
            left: 15px;
            color: #6c757d;
            pointer-events: none;
            transform: translateY(1rem);
            transition: 150ms cubic-bezier(0.4, 0, 0.2, 1);
        }

        .input:focus, .input:valid {
            outline: none;
            border: 1.5px solid #1a73e8;
        }

            .input:focus ~ .user-label, .input:valid ~ .user-label {
                transform: translateY(-50%) scale(0.8);
                background-color: #fff;
                padding: 0 .2em;
                color: #2196f3;
            }

        .form-control {
            margin-bottom: 1rem;
            position: absolute;
            align-items: center;
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
                <div class="form-container shadow-lg">
                    <h2 class="text-center fs-Segoe text-shadow mb-3 fw-bolder">Registrarse</h2>

                    <div class="input-group">
                        <asp:TextBox ID="username" runat="server" CssClass="input" required="" type="text" name="text" autocomplete="" />
                        <label class="user-label">Usuario</label>
                    </div>

                    <div class="input-group">
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="input" required="" type="text" name="text" autocomplete="" />
                        <label class="user-label">Apellido</label>
                    </div>

                    <div class="input-group">
                        <asp:TextBox ID="txtNombres" runat="server" CssClass="input" required="" type="text" name="text" autocomplete="" />
                        <label class="user-label">Nombres</label>
                    </div>

                    <div class="input-group">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="input" required="" type="email" name="text" autocomplete="" />
                        <label class="user-label">Email</label>
                    </div>

                    <div class="input-group">
                        <asp:TextBox ID="txtDocumento" runat="server" CssClass="input" required="" type="text" name="text" autocomplete="" />
                        <label class="user-label">N°DNI</label>
                    </div>

                    <div class="input-group">
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="input" required="" type="text" name="text" autocomplete="" />
                        <label class="user-label">Teléfono</label>
                    </div>

                    <div class="input-group">
                        <asp:TextBox ID="txtTelefono2" runat="server" CssClass="input" required="" type="text" name="text" autocomplete="" />
                        <label class="user-label">Teléfono Auxiliar</label>
                    </div>

                    <div class="input-group">
                        <asp:DropDownList ID="gender" runat="server" CssClass="form-control bg-dark-subtle border border-3 border-white text-dark fs-6 fw-semibold text-center">
                            <asp:ListItem Text="Seleccionar género" Value="" />
                            <asp:ListItem Text="Masculino" Value="Masculino" />
                            <asp:ListItem Text="Femenino" Value="Femenino" />
                            <asp:ListItem Text="Otro" Value="Otro" />
                        </asp:DropDownList>
                    </div>

                    <div class="text-center">
                        <asp:Button Text="Registrarme" OnClick="btnRegistar_Click" class="btnSignOut me-1" Width="125px" runat="server" ID="btnRegistar" Style="width: 200px" />
                        <asp:Button Text="Salir" OnClick="btnSalir_Click" class="btnExit ms-1" Width="125px" runat="server" ID="btnSalir" Style="width: 100px" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
