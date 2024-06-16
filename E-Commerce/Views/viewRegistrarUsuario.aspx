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
                    <h2 class="text-center">Registro</h2>
                    <div>
                        <div class="form-group">
                            <label for="username">Nombre de Usuario</label>
                            <input type="text" class="form-control" id="username" placeholder="Ingrese su nombre de usuario">
                        </div>
                        <div class="form-group">
                            <label for="lastName">Apellido</label>
                            <input type="text" class="form-control" id="lastName" placeholder="Ingrese su apellido">
                        </div>
                        <div class="form-group">
                            <label for="firstName">Nombres</label>
                            <input type="text" class="form-control" id="firstName" placeholder="Ingrese sus nombres">
                        </div>
                        <div class="form-group">
                            <label for="address">Domicilio</label>
                            <select class="form-control" id="address">
                                <option value="domicilio1">Domicilio 1</option>
                                <option value="domicilio2">Domicilio 2</option>
                                <option value="domicilio3">Domicilio 3</option>
                            </select>
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
