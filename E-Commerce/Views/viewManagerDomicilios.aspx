<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewManagerDomicilios.aspx.cs" Inherits="tp_web_equipo_19.Views.viewManagerDomicilios" %>

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
                    <h2 class="text-center fs-Segoe text-shadow mb-3 fw-bolder fs-3 text-light bg-success bg-opacity-75 p-2 rounded-3 w-auto rounded-4" id="titulo" >Agregar Domicilio</h2>

                    <asp:TextBox ID="txtCalle" runat="server" CssClass="form-control rounded-4" required="" type="text" placeholder="Calle" />

                    <asp:TextBox ID="txtAltura" runat="server" CssClass="form-control rounded-4" required="" type="number" placeholder="Altura" />

                    <asp:TextBox ID="txtObservacion" runat="server" CssClass="form-control rounded-4 py-3" required="" type="text" placeholder="Observacion (opcional)" />
                    
                    <asp:DropDownList ID="ddlLocalidad" runat="server" AutoPostBack="true" CssClass="form-control border border-3 rounded-4 border-white fs-6 fw-semibold text-center w-25" Style="background-color: dimgray; color: white">
                        <asp:ListItem Text="Localidad" Value="" />
                    </asp:DropDownList>

                    <div class="d-flex justify-content-between align-items-center">
                        <asp:Button Text="Agregar Domicilio" CssClass="btnSignOut me-1" Width="200px" runat="server" ID="btnAgregarDomicilio" OnClick="btnAgregarDomicilio_Click"/>
                        <a href="viewProfile.aspx" class="btnExit me-1" style="text-decoration: none">Volver</a>
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
            }).then((result) => {
                if (result.dismiss === Swal.DismissReason.timer) {
                    window.location.href = 'viewCompra.aspx'
                }
            });
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
