<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="viewAdmin_ModifyArt.aspx.cs" Inherits="tp_web_equipo_19.Views.viewAdmin_ModifyArt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="../Content/bootstrap.rtl.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.min.js"></script>
    <title>Modificar/Eliminar Articulo</title>
</head>
<body>
    <%-- Form. necesito el formulario para poder utilizar los controles se servidor aspnet. --%>
   <form runat="server">

<%-- Navegacion --%>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="viewArticulos.aspx">Inicio</a>
    <a class="navbar-brand" href="viewAdmin_AddArt.aspx">Agregar Articulo</a>
      <div class="mx-auto text-center">
     <h2 class=" text-white "> MODIFICAR / ELIMINAR ARTICULO </h2>
     </div>
  </div>
</nav>

<%-- Modificar articulo --%>


<div style="margin-top: 1%"  > 
    <h1 style=" color:red;"> <asp:Label ID="lblposback" runat="server" Text=" "></asp:Label> </h1><%--PARA INDICAR SI HAY ERROR DE LECTURA--%>
    <div  style="display: flex; margin-top: 1%;"> 
     <p class="fs-5" > INGRESE EL ID DEL ARTICULO: </p>
     <asp:TextBox ID="txtIDarticuloBuscado" runat="server" type="numeric" OnTextChanged="txtIDarticuloBuscado_TextChanged" AutoPostBack="true" >  </asp:TextBox> <%--Habilito el autopostback, para que no me obligue a poner un boton de confirmacion para text changed--%>
   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCodigo"
        ErrorMessage="El codigo es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>
    </div>


        <div  style="display: flex; margin-top: 1%;"> 
             <p class="fs-5" > Codigo: </p>
             <asp:TextBox ID="txtCodigo" runat="server" type="nonull">  </asp:TextBox> 
            <asp:RequiredFieldValidator ID="rfvCodigo" runat="server" ControlToValidate="txtCodigo"
                ErrorMessage="El codigo es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>

        </div>

        <div  style="display: flex; margin-top: 1%;"> 
             <p class="fs-5" > Nombre: </p>
             <asp:TextBox ID="txtArticulo" runat="server">  </asp:TextBox> 
            <asp:RequiredFieldValidator ID="rfvArticulo" runat="server" ControlToValidate="txtArticulo"
    ErrorMessage="El nombre es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>
        </div>

        <div  style="display: flex; margin-top: 1%;"> 
             <p class="fs-5" > Descripcion: </p>
             <asp:TextBox ID="txtDescripcion" runat="server">  </asp:TextBox> 
              <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion"
ErrorMessage="La descripcion es obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>

        </div>

        <div style="display: flex; margin-top: 1%;"> 
             <p class="fs-5"> Categoria: </p>
             <asp:DropDownList ID="listCat" runat="server"></asp:DropDownList>
               <asp:RequiredFieldValidator ID="rfvListaCat" runat="server" ControlToValidate="listCat"
ErrorMessage="Lista obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>
     
        </div>
        <div style="display: flex; margin-top: 1%;"> 
             <p class="fs-5"> Marca: </p>
             <asp:DropDownList ID="listMarca" runat="server"></asp:DropDownList>
                           <asp:RequiredFieldValidator ID="rfvListaMarca" runat="server" ControlToValidate="listMarca"
ErrorMessage="Lista obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>
            
        </div>

        <div style="display: flex; margin-top: 1%;"> 
             <p class="fs-5""> URL Imagen: </p>
             <asp:TextBox ID="txtImagenUrl" runat="server"></asp:TextBox>

        </div>

        <div style="display: flex; margin-top: 1%;"> 
             <p class="fs-5"> Precio (Decimales con Coma!): </p>
             <asp:TextBox ID="txtPrecio" runat="server"  ></asp:TextBox>  <%--//type="number" Step="any"  no usado por que necesita punto --%>
                      <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecio"
ErrorMessage="El precio es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>

        </div>
         
    
          <div class="container-fluid">

                 <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click"   />  
               
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click"  style="margin-left: 10px;"   />
            
         </div>
     

     <script> </script>
        
</div>

</form>
   
</body>
</html>