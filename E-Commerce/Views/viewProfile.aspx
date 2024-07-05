<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewProfile.aspx.cs" Inherits="tp_web_equipo_19.Views.viewProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .bg-dark-subtle::placeholder {
            color: darkgray;
            font-family: 'Segoe UI Emoji';
        }

        .fs-Segoe {
            font-family: "Segoe UI Emoji";
        }
    </style>


    <%if (!IsPostBack)
        {  %>
    <div class="offcanvas offcanvas-end show text-bg-dark" tabindex="-1" id="offcanvas" aria-labelledby="offcanvasLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasLabel">Activa la verificacion de 2 pasos</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <img src="https://img.icons8.com/color/480/verified-account--v1.png" style="background-color: transparent; width: 200px; height: 200px; margin-left: 82px" alt="Alternate Text" />
            <p>
                ¡Protege tu cuenta en solo unos minutos! Activar la verificación en dos pasos es fácil y te brinda una capa extra de seguridad.<br>
                <br>
                <strong>Ventajas:</strong><br>
                - <strong>Mayor Seguridad:</strong> Protege tu cuenta incluso si alguien obtiene tu contraseña.<br>
                - <strong>Tranquilidad:</strong> Sabes que tu información personal está más segura.<br>
                <br>
                ¡No esperes más! Activa la verificación en dos pasos y mantén tu cuenta segura.
            </p>
            <div class="text-center mt-4">
                <button class="btn btn-light fw-bolder">Ir a verificacion</button>
            </div>
        </div>
    </div>

    <%} %>
    <div class="text-end">

        <asp:Button Text="Sign out" OnClick="btnCerrarSesion_Click" class="btnSignOut" Width="125px" runat="server" ID="btnCerrarSesion" />

    </div>
    <div class="container" style="margin-top: 60px">
        <div class="position-relative top-50 start-50 translate-middle-x rounded-4 border border-5 border-info-subtle shadow-lg " style="width: 400px; height: 500px; background: rgb(128,240,146); background: linear-gradient(90deg, rgba(128,240,146,1) 14%, rgba(78,194,228,1) 44%, rgba(78,194,228,1) 60%, rgba(128,240,146,1) 86%);">
            <div class="row align-items-center justify-content-center" style="height: 90%">
                <div class="col-md-10 text-center">
                    <img src="https://img.icons8.com/fluency/240/user-male-circle--v1.png" class="mt-3" alt="Login" width="180" height="180" style="margin-left: 2.5rem" />
                    <asp:ImageButton ImageUrl="https://img.icons8.com/fluency/240/camera.png" ID="btnFotoPerfil" runat="server" CssClass="position-relative" Width="40" Height="40" OnClick="btnFotoPerfil_Click" />
                   <%-- <asp:Label ID="lblUsuario" Text="" runat="server" CssClass="fs-4 text-light border border-2 rounded-3 fw-bolder" />--%>
                    <br />
                    <asp:Label ID="lblCorreoElectronico" Text="" runat="server" CssClass="fs-6 text-secondary fst-italic " />

                    <div class="mt-3">
                        <% if (tipoUser_profile())
                            {  %>
                        <h6>Sos Administrador, puedes ingresar a los ajustes avanzados mediante el siguiente boton: </h6>
                        <asp:Button Text="Editar Datos" class="btn-dark bg-primary fst-italic bg-opacity-25 rounded-3 mt-5 border border-2 border-white text-light fs-5 fw-semibold fs-Segoe" Width="125px" runat="server" ID="btnEditarDatosAdmin" OnClick="btnEditarDatosAdmin_Click" />
                        <asp:Button Text="Usuarios" class="btn-dark bg-primary fst-italic bg-opacity-25 rounded-3 mt-2 border border-2 border-white text-light fs-5 fw-semibold fs-Segoe" Width="125px" runat="server" ID="btnABMUsuarios" OnClick="btnABMUsuarios_Click" />
                        <asp:Button Text="ABM (Admin)" class="btn-dark bg-primary fst-italic bg-opacity-25 rounded-3 mt-2 border border-2 border-white text-light fs-5 fw-semibold fs-Segoe" Width="125px" runat="server" ID="btnABMAdmin" OnClick="btnABMAdmin_Click" Visible="false" />
                        <% }
                            else
                            {  %>
                        <div>
                            <asp:Button Text="Editar Datos" class="btn-dark bg-primary fst-italic bg-opacity-25 rounded-3 mt-5 border border-2 border-white text-light fs-5 fw-semibold fs-Segoe" Width="125px" runat="server" ID="btnEditarDatos" />
                            <asp:Button Text="Mis compras" runat="server" class="btn-dark bg-primary fst-italic bg-opacity-50 mt-2 rounded-3 border border-2 border-white text-light fs-5 fw-semibold fs-Segoe" Width="125px" ID="btnMisCompras" />
                            <asp:Button Text="Mis ventas" runat="server" class="btn-dark bg-primary fst-italic bg-opacity-50 mt-2 rounded-3 border border-2 border-white text-light fs-5 fw-semibold fs-Segoe" Width="125px" ID="btnMisVentas" OnClick="btnMisVentas_Click" />
                        </div>
                        <h4>Sos Usuario </h4>

                        <% } %>
                    </div>


                </div>
            </div>
        </div>
    </div>


</asp:Content>
