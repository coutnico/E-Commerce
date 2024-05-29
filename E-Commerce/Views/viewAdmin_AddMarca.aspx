<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewAdmin_AddMarca.aspx.cs" Inherits="tp_web_equipo_19.Views.viewAdmin_AddMarca" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Content/bootstrap.rtl.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <title>Agregar Marca</title>
</head>
<body>
    <%-- Form. necesito el formulario para poder utilizar los controles se servidor aspnet. --%>
   <form runat="server">

<%-- Navegacion --%>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="viewArticulos.aspx">Inicio</a>
    <a class="navbar-brand" href="viewAdmin_ModifyMarca.aspx">Modificar Marca</a>
      <div class="mx-auto text-center">


     <h2 class=" text-white "> AGREGAR MARCA </h2>
</nav>

<%-- Agregar Marca --%>


<div style="margin-top: 1%"  > 

        <div  style="display: flex; margin-top: 1%;"> 
             <p class="fs-5" > ID (Nuevo): </p>
           <p class="fs-5" style="margin-left:10px">  <asp:Label ID="lblID_Nuevo" runat="server" Text=""> </asp:Label>  </p>  
        </div>
        <div  style="display: flex; margin-top: 1%;"> 
             <p class="fs-5" > Descripcion: </p>
             <asp:TextBox ID="txtDescripcion" runat="server">  </asp:TextBox> 
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescripcion"
               ErrorMessage="La descripcion es obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>
        </div>        
</div>

             
     <asp:Button ID="btnAgregarMarca" runat="server" Text="Agregar" OnClick="btnAgregarMarca_Click" />

     <script> </script>

</form>
   
</body>
</html>
