<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewUsuarioAgregarPublicacion_2.aspx.cs" Inherits="tp_web_equipo_19.Views.viewUsuarioAgregarPublicacion_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="text-end">
        <button type="button" class="btn-close" aria-label="Close" style="font-size: 30px" onclick="window.location.href = 'viewUsuarioPublicaciones.aspx';"></button>
    </div>

    <div class="container-fluid w-50 ">

        <%--   <div class="input-group mb-3 mt-3 ">
            
            <span class="input-group-text">IdPublicacion</span>
            <asp:Label ID="lblIdPublicacion" runat="server" Text="IdPublicacion"></asp:Label>
          
            <span class="input-group-text">IdUsuario</span>
            <asp:Label ID="lblIdUsuario" runat="server" Text="IdUsuario"></asp:Label>

        </div>--%>


   <div class="input-group mb-3 d-flex align-items-center justify-content-center">
    <h4 class="mb-0 mr-2" style="margin-right: 5%;">Categoria:</h4>
    <asp:Label CssClass="display-6 mb-0" Font-Italic="true" Font-Bold="true"  ID="lblCategoriaSeleccionada" runat="server" Text="Categoria"></asp:Label>
</div>



        <div class="input-group mb-3 mt-3 ">
            <span class="input-group-text">Codigo</span>
            <asp:TextBox ID="txtCodigo" runat="server" type="nonull" CssClass="form-control m-lg-1 rounded" Style="max-width: 500px;" placeholder="Escriba el Codigo del Articulo...">  </asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCodigo" runat="server" ControlToValidate="txtCodigo"
                ErrorMessage="El codigo es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>
            <%--Campo obligatorio--%>
        </div>

        <div class="input-group mb-3">
            <span class="input-group-text">Nombre: </span>
            <asp:TextBox ID="txtArticulo" runat="server" CssClass="form-control m-lg-1 rounded" Style="max-width: 500px;" placeholder="Escriba el Nombre del Articulo...">  </asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvArticulo" runat="server" ControlToValidate="txtArticulo"
                ErrorMessage="El nombre es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>
            <%--Campo obligatorio--%>
        </div>


        <div class="input-group mb-3">
            <span class="input-group-text">Descripcion</span>
            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control m-lg-1 rounded" Style="max-width: 500px;" placeholder="Escriba la Descripcion del Articulo...">  </asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion"
                ErrorMessage="La descripcion es obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>
            <%--Campo obligatorio--%>
        </div>

    

        <div class="input-group mb-3">
            <span class="input-group-text">Marca:</span>
            <asp:DropDownList ID="listMarca" runat="server" CssClass="form-select  m-lg-1  rounded" Style="max-width: 500px;"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvListaMarca" runat="server" ControlToValidate="listMarca"
                ErrorMessage="Lista obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>
            <%--Campo obligatorio--%>
            <a class="navbar-brand" href="viewAdmin_AddMarca.aspx" style="margin-left: 10px;">
                <img src="\image\agregar.png" alt="Agregar Marca" style="height: 45px; align-content: center;">
            </a>


        </div>

        <div class="input-group mb-3">
            <span class="input-group-text">URL Imagen:</span>
            <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control m-lg-1 rounded" Style="max-width: 500px;" placeholder="Escriba la URL de la imagen del Articulo..."></asp:TextBox>

            <asp:ImageButton ID="addImage" ImageUrl="\image\addimage.jpg" runat="server" Style="height: 45px; align-content: center;" OnClick="addImage_Click " CausesValidation="false" />
            <%--CausesValidation="false" hace que no verifique los campos obligatorios--%>

            <% if (Convert.ToInt32(lbl_Cantidad_imagenes_agregadas.Text) > 0)
                {  %>
            <asp:ImageButton ID="deleteImage" ImageUrl="\image\deleteimage.png" runat="server" Style="height: 30px; align-content: center;" OnClick="deleteImage_Click " CausesValidation="false" />
            <%--CausesValidation="false" hace que no verifique los campos obligatorios--%>
            <% } %>
            <asp:Label ID="lbl_Cantidad_imagenes_agregadas" runat="server" Text=""></asp:Label>
        </div>
        <asp:PlaceHolder ID="txtImagenUrl_Dinamico" runat="server"></asp:PlaceHolder>

        <div class="input-group mb-3">
            <span class="input-group-text">Precio (Decimales con Coma!): </span>
            <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control m-lg-1 rounded" Style="max-width: 500px;" placeholder="Escriba el precio del Articulo..."></asp:TextBox>
            <%--type="number"--%>
            <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecio"
                ErrorMessage="El precio es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>
            <%--Campo obligatorio--%>
        </div>


        <div class="input-group mb-3 mt-3 ">
            <span class="input-group-text">Stock</span>
            <asp:TextBox ID="txtStock" runat="server" type="nonull" CssClass="form-control m-lg-1 rounded" Style="max-width: 500px;" placeholder="Escriba el Stock disponible..." TextMode="number">  </asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCodigo"
                ErrorMessage="El codigo es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>
            <%--Campo obligatorio--%>
        </div>





        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" class="btn btn-outline-success" type="submit" />



        <script> </script>

    </div>


</asp:Content>
