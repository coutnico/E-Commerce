<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeBehind="viewAdmin_ModifyArt.aspx.cs" Inherits="tp_web_equipo_19.Views.viewAdmin_ModifyArt" %>

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
    <a class="navbar-brand" href="viewAdmin_AddArt.aspx">Agregar Articulo</a>
      <div class="mx-auto text-center">
     <h2 class=" text-white "> MODIFICAR / ELIMINAR ARTICULO </h2>
     </div>
  </div>
</nav>

<%-- Modificar articulo --%>

       <div class="container-fluid w-50 ">

    <div class="input-group mb-3 mt-3 ">
        <span class="input-group-text">INGRESE EL ID DEL ARTICULO: </span>
          <h1 style=" color:red;"> <asp:Label ID="lblposback" runat="server" Text=" "></asp:Label> </h1><%--PARA INDICAR SI HAY ERROR DE LECTURA--%>
         <asp:TextBox ID="txtIDarticuloBuscado" runat="server" type="numeric" OnTextChanged="txtIDarticuloBuscado_TextChanged" AutoPostBack="true"  CssClass="form-control m-lg-1 rounded">  </asp:TextBox>
             <%--Habilito el autopostback, para que no me obligue a poner un boton de confirmacion para text changed--%>
   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCodigo"
        ErrorMessage="El codigo es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>
    </div>



    <div class="input-group mb-3 mt-3 ">
        <span class="input-group-text"> Codigo: </span>
              <asp:TextBox ID="txtCodigo" runat="server" type="nonull" CssClass="form-control m-lg-1 rounded">  </asp:TextBox> 
     <asp:RequiredFieldValidator ID="rfvCodigo" runat="server" ControlToValidate="txtCodigo"
         ErrorMessage="El codigo es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>
    </div>

  <div class="input-group mb-3 mt-3 ">
      <span class="input-group-text"> Nombre: </span>
            <asp:TextBox ID="txtArticulo" runat="server" CssClass="form-control m-lg-1 rounded">  </asp:TextBox> 
        <asp:RequiredFieldValidator ID="rfvArticulo" runat="server" ControlToValidate="txtArticulo"
ErrorMessage="El nombre es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>
  </div>

     
  <div class="input-group mb-3 mt-3 ">
      <span class="input-group-text"> Descripcion: </span>
                  <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control m-lg-1 rounded">  </asp:TextBox> 
              <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion"
ErrorMessage="La descripcion es obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>
  </div>
        


          <div class="input-group mb-3">
      <span class="input-group-text">Categoria:</span>
                  <asp:DropDownList ID="listCat" runat="server" CssClass="form-select  m-lg-1  rounded"></asp:DropDownList>
               <asp:RequiredFieldValidator ID="rfvListaCat" runat="server" ControlToValidate="listCat"
ErrorMessage="Lista obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>

  </div>

  <div class="input-group mb-3">
      <span class="input-group-text">Marca:</span>
                  <asp:DropDownList ID="listMarca" runat="server" CssClass="form-select  m-lg-1  rounded"></asp:DropDownList>
                           <asp:RequiredFieldValidator ID="rfvListaMarca" runat="server" ControlToValidate="listMarca"
ErrorMessage="Lista obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>

  </div>


 
      <div class="input-group mb-3">
    <span class="input-group-text">URL Imagen:</span>
             <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control m-lg-1 rounded" Style="max-width: 500px;" placeholder="Escriba la URL de la imagen del Articulo..."    ></asp:TextBox>
             <asp:ImageButton ID="addImage" ImageUrl="\image\addimage.jpg" runat="server" Style="height: 45px; align-content: center;" OnClick="addImage_Click" CausesValidation="false" />
      
              <%--CausesValidation="false" hace que no verifique los campos obligatorios--%>

  <% //if (Convert.ToInt32(lbl_Cantidad_imagenes_agregadas.Text) > 0)
      {  %>
  <asp:ImageButton ID="deleteImage" ImageUrl="\image\deleteimage.png" runat="server" Style="height: 30px; align-content: center;" OnClick="deleteImage_Click" CausesValidation="false" />
  <%--CausesValidation="false" hace que no verifique los campos obligatorios--%>
  <% } %>
  <asp:Label ID="lbl_Cantidad_imagenes_agregadas" runat="server" Text=""></asp:Label>
        </div>
           <asp:PlaceHolder ID="txtImagenUrl_Dinamico" runat="server"></asp:PlaceHolder>


   
          <div class="input-group mb-3">
    <span class="input-group-text">Precio (Decimales con Coma!): </span>

             <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control m-lg-1 rounded" Style="max-width: 500px;" placeholder="Escriba el precio del Articulo..."  ></asp:TextBox>  <%--//type="number" Step="any"  no usado por que necesita punto --%>
                      <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecio"
ErrorMessage="El precio es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>

        </div>
         

    
          <div class="container-fluid">

                 <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click"  class="btn btn-outline-success" type="submit"  />  
               
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" OnClick="btnEliminar_Click" class="btn btn-outline-danger" type="submit" style="margin-left: 10px;"   />
            
         </div>
     </div>


     <script> </script>
        
</div>

</form>
   
</body>
</html>