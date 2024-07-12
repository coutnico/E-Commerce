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
                <div class="form-container shadow-lg border border-2 border-black" style="margin-left: 4rem !important; background: rgb(255,251,243); background: linear-gradient(0deg, rgba(255,251,243,1) 0%, rgba(34,175,195,1) 100%);">
                    <h2 class="text-center fs-Segoe text-shadow mb-3 fw-bolder fs-3 text-light bg-success bg-opacity-75 p-2 rounded-3 w-50 rounded-4" id="titulo" style="margin-left: 7rem !important;">Mis datos</h2>

                    <div class="d-flex">
                        <asp:TextBox ID="username" runat="server" CssClass="form-control rounded-4" required="" Enabled="false" type="text" placeholder="Nombre de usuario" />
                        <img src="https://img.icons8.com/color/480/lock--v1.png" alt="Alternate Text" style="width: 30px; height: 30px" />
                    </div>

                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control rounded-4" required="" type="text" placeholder="Apellido" />

                    <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control rounded-4" required="" type="text" placeholder="Nombres" />

                    <div class="d-flex">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control rounded-4" required="" type="email" placeholder="Correo electrónico" Enabled="false" />
                        <img src="https://img.icons8.com/color/480/lock--v1.png" alt="Alternate Text" style="width: 30px; height: 30px" />

                    </div>

                    <asp:TextBox ID="txtDocumento" runat="server" CssClass="form-control rounded-4" required="" type="number" placeholder="Documento" />

                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control rounded-4" required="" type="number" placeholder="Teléfono" />

                    <asp:TextBox ID="txtTelefono2" runat="server" CssClass="form-control rounded-4" required="" type="number" placeholder="Teléfono alternativo" />

                    <asp:DropDownList ID="gender" runat="server" OnSelectedIndexChanged="gender_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control border border-3 rounded-4 border-white fs-6 fw-semibold text-center w-25" Style="background-color: lightslategrey; color: white">
                        <asp:ListItem Text="Genero" Value="" />
                        <asp:ListItem Text="Masculino" Value="Masculino" />
                        <asp:ListItem Text="Femenino" Value="Femenino" />
                        <asp:ListItem Text="Otro" Value="Otro" />
                    </asp:DropDownList>

                    <div class="d-flex justify-content-between align-items-center">
                        <asp:Button Text="Modificar datos" OnClick="btnModificarDatos_Click" CssClass="btnSignOut me-1" Width="125px" runat="server" ID="btnModificarDatos" Style="width: 200px" />
                        <a href="viewProfile.aspx" class="btnExit me-1" style="width:100px;width:125px; text-decoration:none">Volver</a>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>
        function ShowModificacionExitosa() {
            Swal.fire({
                title: "Procedimiento exitoso",
                timer: 1000,
                icon: "success",
            });

            window.location.href = 'viewProfile.aspx'
        }  

        function ShowError() {
            Swal.fire({
                title: "Datos incompletos",
                text: "Intentelo de nuevo....",
                timer: 1000,
                icon: "error",
            });
        }

    </script>
</asp:Content>
