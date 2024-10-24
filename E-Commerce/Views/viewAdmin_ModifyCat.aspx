﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewAdmin_ModifyCat.aspx.cs" Inherits="tp_web_equipo_19.Views.viewAdmin_ModifyCat" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Content/bootstrap.rtl.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <title>Modificar/Eliminar Articulo</title>
</head>
<body class="bg-success p-2 text-dark bg-opacity-10">
    <%-- Form. necesito el formulario para poder utilizar los controles se servidor aspnet. --%>
    <form runat="server">

        <%-- Navegacion --%>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="viewArticulos.aspx">Inicio</a>
                <a class="navbar-brand" href="viewAdmin_AddCat.aspx">Agregar Categoria</a>
                <div class="mx-auto text-center">
                    <h2 class=" text-white ">MODIFICAR / ELIMINAR CATEGORIA </h2>
                </div>
            </div>
        </nav>

        <%-- Modificar Categoria --%>

        <div class="container-fluid w-50 ">
            <div class="input-group mb-3 mt-3 ">
                <h1 style="color: red;">
                    <asp:Label ID="lblposback" runat="server" Text=" "></asp:Label>
                </h1>
                <%--PARA INDICAR SI HAY ERROR DE LECTURA--%>
                <span class="input-group-text">INGRESE EL ID DE LA CATEGORIA: </span>
                <asp:TextBox ID="txtIDCatBuscado" runat="server" type="numeric" OnTextChanged="txtIDCatBuscado_TextChanged" AutoPostBack="true" CssClass="form-control m-lg-1 rounded">  </asp:TextBox>
                <%--Habilito el autopostback, para que no me obligue a poner un boton de confirmacion para text changed--%>
                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCodigo"
     ErrorMessage="El codigo es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>
            </div>


            <div class="input-group mb-3 mt-3 ">
                <span class="input-group-text">Descripcion: </span>
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control m-lg-1 rounded">  </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescripcion"
                    ErrorMessage="La descripcion es obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>
                <%--Campo obligatorio--%>
            </div>



            <div class="container-fluid">

                <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" class="btn btn-outline-success" type="submit" />

                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" class="btn btn-outline-danger" type="submit" Style="margin-left: 10px;" />

            </div>



            <script> </script>

        </div>



    </form>

</body>
</html>
