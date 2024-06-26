﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewAdmin_AddMarca.aspx.cs" Inherits="tp_web_equipo_19.Views.viewAdmin_AddMarca" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Content/bootstrap.rtl.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <title>Agregar Marca</title>
</head>
<body class="bg-success p-2 text-dark bg-opacity-10">
    <%-- Form. necesito el formulario para poder utilizar los controles se servidor aspnet. --%>
    <form runat="server">

        <%-- Navegacion --%>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="viewArticulos.aspx">Inicio</a>
                <a class="navbar-brand" href="viewAdmin_ModifyMarca.aspx">Modificar Marca</a>
                <div class="mx-auto text-center">


                    <h2 class=" text-white ">AGREGAR MARCA </h2>
        </nav>

        <%-- Agregar Marca --%>

        <div class="container-fluid w-50 ">
            <div class="input-group mb-3 mt-3 ">
                <span class="input-group-text">ID (Nuevo):</span>
                <asp:Label ID="lblID_Nuevo" runat="server" CssClass="form-control m-lg-1 rounded" Text=""> </asp:Label>
            </div>

            <div class="input-group mb-3 mt-3 ">
                <span class="input-group-text">Descripcion:</span>
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control m-lg-1 rounded">  </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescripcion"
                    ErrorMessage="La descripcion es obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>
                <%--Campo obligatorio--%>
            </div>

            <div class="input-group mb-3 mt-3 ">
                <span class="input-group-text">ID Categoria:</span>
                <asp:TextBox ID="txtIdCategoria" runat="server" CssClass="form-control m-lg-1 rounded">  </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtIdCategoria"
                    ErrorMessage="El ID de la Categoria es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                <%--Campo obligatorio--%>
            </div>



            <asp:Button ID="btnAgregarMarca" runat="server" Text="Agregar" OnClick="btnAgregarMarca_Click" class="btn btn-outline-success" type="submit" />
        </div>




        <script> </script>

    </form>

</body>
</html>
