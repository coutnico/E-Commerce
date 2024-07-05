<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewLogin.aspx.cs" Inherits="tp_web_equipo_19.Views.viewLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .bg-dark-subtle::placeholder {
            color: darkgray;
            font-family: 'Segoe UI Emoji';
        }

        .fs-Segoe {
            font-family: "Segoe UI Emoji";
        }

        .text-shadow {
            text-shadow: 1px 1px 3px #ccc;
        }
    </style>

    <script>        
        function validarEmailAndPass() {
            const txtUser = document.getElementById("txtUser");
            const txtPass = document.getElementById("txtPass");
            if (txtUser.value == "" || txtPass.value == "") {
                txtUser.classList.add("is-invalid");
                txtPass.classList.add("is-invalid");
                return false;
            }
            else {
                return true;
            }

        }


    </script>

    <div class="container" style="margin-top: 60px">
        <div class="position-relative top-50 start-50 translate-middle-x rounded-4 border border-5 border-success shadow-lg " style="width: 400px; height: 500px; background: rgb(128,240,146); background: linear-gradient(90deg, rgba(128,240,146,1) 14%, rgba(78,194,228,1) 44%, rgba(78,194,228,1) 60%, rgba(128,240,146,1) 86%);">
            <div class="row align-items-center justify-content-center" style="height: 90%">
                <div class="col-md-8 text-center">
                    <img src="https://img.icons8.com/glassmorphism/480/shop.png" class="mt-3" alt="Login" width="180" height="180" />
                    <asp:TextBox runat="server" ID="txtUser" ClientIDMode="Static" placeholder="Correo electronico" CssClass="form-control bg-dark-subtle mt-3 mb-3 border border-3 border-white text-dark fs-6 fw-semibold text-center" Style="margin: auto;" />
                    <asp:TextBox runat="server" ID="txtPass" ClientIDMode="Static" placeholder="Contraseña" CssClass="form-control bg-dark-subtle mt-1 mb-3 border border-3 border-white text-dark fs-6 fw-semibold text-center" Style="margin: auto;" />
                    <div>
                        <asp:Button Text="Ingresar" class="btn btn-dark rounded-3 mt-5 border border-2 border-white text-light fs-6 fw-semibold fs-Segoe text-shadow" Width="200px" runat="server" ID="BtnLogin" OnClientClick="return validarEmailAndPass()" OnClick="BtnLogin_Click" />
                        <br />
                        <asp:Button Text="Registrarme" runat="server" class="btn btn-dark mt-2 rounded-3 border border-2 border-white text-light fs-5 fw-semibold fs-Segoe text-shadow"  Width="250px" ID="BtnRegistarme"  OnClick="BtnRegistarme_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
