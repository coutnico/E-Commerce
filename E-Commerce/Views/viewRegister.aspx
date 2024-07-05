<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewRegister.aspx.cs" Inherits="tp_web_equipo_19.Views.viewRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .form {
            display: flex;
            flex-direction: column;
            gap: 10px;
            max-width: 350px;
            background-color: #fff;
            padding: 20px;
            border-radius: 20px;
            position: relative;
        }

        .title {
            font-size: 28px;
            color: green;
            font-weight: 600;
            letter-spacing: -1px;
            position: relative;
            display: flex;
            align-items: center;
            padding-left: 30px;
        }

            .title::before, .title::after {
                position: absolute;
                content: "";
                height: 16px;
                width: 16px;
                border-radius: 50%;
                left: 0px;
                background-color: forestgreen;
            }

            .title::before {
                width: 18px;
                height: 18px;
                background-color: forestgreen;
            }

            .title::after {
                width: 18px;
                height: 18px;
                animation: pulse 1s linear infinite;
            }

        .message, .signin {
            color: rgba(88, 87, 87, 0.822);
            font-size: 18x;
        }

        .signin {
            text-align: center;
        }

            .signin a {
                color: royalblue;
            }

                .signin a:hover {
                    text-decoration: underline royalblue;
                }

        .flex {
            display: flex;
            width: 100%;
            gap: 6px;
        }

        .form label {
            position: relative;
        }

            .form label .texto {
                width: 100%;
                padding: 10px 10px 20px 10px;
                outline: 0;
                border: 1px solid rgba(105, 105, 105, 0.397);
                border-radius: 10px;
            }

                .form label .texto + span {
                    position: absolute;
                    left: 10px;
                    top: 15px;
                    color: grey;
                    font-size: 0.9em;
                    cursor: text;
                    transition: 0.3s ease;
                }

                .form label .texto:placeholder-shown + span {
                    top: 15px;
                    font-size: 0.9em;
                }

                .form label .texto:focus + span, .form label .texto:valid + span {
                    top: 0px;
                    font-size: 0.7em;
                    font-weight: 600;
                }

                .form label .texto:valid + span {
                    color: green;
                }

        .submit {
            border: none;
            outline: none;
            background-color: forestgreen;
            padding: 10px;
            border-radius: 10px;
            color: #fff;
            font-size: 16px;
            transform: .3s ease;
        }

            .submit:hover {
                background-color: rgb(56, 90, 194);
                cursor: pointer;
            }

        @keyframes pulse {
            from {
                transform: scale(0.9);
                opacity: 1;
            }

            to {
                transform: scale(1.8);
                opacity: 0;
            }
        }
    </style>
    <div class="container w-100 h-100 py-5">

        <div class="form shadow-lg" style="left: 37%">
            <p class="title">Registrarse </p>
            <p class="message">Compra y vende solamente iniciando sesion</p>

            <label>
                <asp:TextBox runat="server" CssClass="texto" type="text" placeholder="" required="" ID="txtNombreUsuario" />
                <span>Nombre de Usuario</span>
            </label>
            <label>
                <asp:TextBox runat="server" CssClass="texto" type="text" placeholder="" required="" ID="txtEmail" />
                <span>Email</span>
            </label>

            <label>
                <asp:TextBox runat="server" CssClass="texto" type="text" placeholder="" required="" ID="txtContraseña" />
                <span>Contraseña</span>
            </label>
            <label>
                <asp:TextBox runat="server" CssClass="texto" type="text" placeholder="" required="" ID="txtConContraseña"/>
                <span>Confirmar contraseña</span>
            </label>
            <asp:Button Text="Registrarse" runat="server" CssClass="submit fs-5 fw-semibold" ID="btnRegistarse" OnClick="btnRegistarse_Click" />
        </div>
    </div>


    <script>
        function ShowUsuarioRegistrado() {
            Swal.fire({
                title: "Usuario creado exitosamente",
                text: "Mail de confirmacion enviado",
                icon: "success",
                confirmButtonColor: "#3085d6"
            });
        }    

        function ShowError() {
            Swal.fire({
                title: "OPSs....Intentelo de nuevo mas tarde",
                text: "Se a registrado un error",
                icon: "error",
                confirmButtonColor: "#3085d6"
            });
        } 

        function ShowContraseñaNoIgual() {
            Swal.fire({
                title: "No coincide la confirmacion de la contraseña",
                text: "Intementelo de nuevo",
                icon: "info",
                confirmButtonColor: "#3085d6"
            });
        } 
    </script>

</asp:Content>
