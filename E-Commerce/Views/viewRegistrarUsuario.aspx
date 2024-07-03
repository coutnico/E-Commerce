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
    </style>
    <div class="container pb-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="form-container">
                    <h2 class="text-center">Registrarse</h2>
                    <div>
                        <div class="form-group">
                            <label for="username">Usuario</label>
                            <asp:TextBox runat="server" placeholder="Ingrese su nombre de usuario" CssClass="form-control bg-dark-subtle border border-3 border-white text-dark fs-6 fw-semibold text-center" />
                        </div>
                        <div class="form-group">
                            <label for="lastName">Apellido</label>
                            <asp:TextBox runat="server" placeholder="Ingrese su nombre de usuario" CssClass="form-control bg-dark-subtle border border-3 border-white text-dark fs-6 fw-semibold text-center" />

                        </div>
                        <div class="form-group">
                            <label for="firstName">Nombres</label>
                            <asp:TextBox runat="server" placeholder="Ingrese su nombre de usuario" CssClass="form-control bg-dark-subtle border border-3 border-white text-dark fs-6 fw-semibold text-center" />
                        </div>
                        <div class="form-group">
                            <div class="w-50 d-flex">
                                <label for="domiclio" class="text-dark fs-6 mt-2 fw-semibold">Domicilio asociados</label>
                                <asp:ImageButton ImageUrl="..\Resources\buscar-en-la-lista.gif" runat="server" />
                                <asp:ImageButton ImageUrl="..\Resources\MAs.gif" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="gender">Género</label>
                            <div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="male" value="male">
                                    <label class="form-check-label" for="male">Masculino</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                                    <label class="form-check-label" for="female">Femenino</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="gender" id="other" value="other">
                                    <label class="form-check-label" for="other">Otro</label>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Aceptar</button>
                        <button type="reset" class="btn btn-secondary">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
