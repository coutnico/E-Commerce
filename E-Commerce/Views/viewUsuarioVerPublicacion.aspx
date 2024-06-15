<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewUsuarioVerPublicacion.aspx.cs" Inherits="tp_web_equipo_19.Views.viewUsuarioVerPublicacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section>
    <div class="product-container d-flex justify-content-center align-items-center pb-5">
        <div class="product-image">
            <img runat="server" id="ImagenPrincipalArticulo" src="#" alt="Alternate Text" class="img-thumbnail" onerror="this.src='https://i.ibb.co/SwxTQny/imagen.png'" style="width: 500px; height: 500px;" />
        </div>
        <div class="product-details d-flex flex-column p-3">
            <h2 id="NombreProducto" class="mb-3 fw-bolder text-success" runat="server"></h2>
            <asp:TextBox ID="PrecioProducto" CssClass="text-dark text-opacity-75 rounded rounded-3 bg-success bg-opacity-50 fs-4 text-center mb-3" runat="server" TextMode="SingleLine"></asp:TextBox>
            <asp:TextBox ID="DescripcionArticulo" CssClass="text-break pt-2 mb-3" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>


  


                  <asp:DropDownList ID="listCat" runat="server" CssClass="form-select  m-lg-1  rounded"></asp:DropDownList>
               <asp:RequiredFieldValidator ID="rfvListaCat" runat="server" ControlToValidate="listCat"
ErrorMessage="Lista obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>


                  <asp:DropDownList ID="listMarca" runat="server" CssClass="form-select  m-lg-1  rounded"></asp:DropDownList>
                           <asp:RequiredFieldValidator ID="rfvListaMarca" runat="server" ControlToValidate="listMarca"
ErrorMessage="Lista obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>  <%--Campo obligatorio--%>


       <%--     <asp:TextBox ID="txtCategoria" CssClass="fw-semibold text-dark text-opacity-75 pt-2 mb-3" runat="server" TextMode="SingleLine" Text="Categoria: "></asp:TextBox>
            <asp:TextBox ID="txtMarca" CssClass="fw-semibold text-dark text-opacity-75 pt-2 mb-3" runat="server" TextMode="SingleLine" Text="Marca: "></asp:TextBox>--%>

            <div class="py-5 gap-1">
                <p runat="server" id="CantidadImagenes" class ="fw-semibold"></p>
                <asp:Button ID="Atras" OnClick="Atras_Click" CssClass="btn btn-outline-secondary me-2" runat="server" Text="Atras" />
                <asp:Button ID="Siguiente" OnClick="Siguiente_Click" CssClass="btn btn-outline-primary" runat="server" Text="Siguiente" />
            </div>
            <div class="button-group">
                <asp:Button ID="btnModificarPublicacion" OnClick="btnModificarPublicacion_Click" CssClass="btn btn-success btn-lg" Style="margin-bottom: 10px; width: 300px; height: 60px" runat="server" Text="Modificar" />
                <br />
                <asp:Button ID="btnEliminarPublicacion" OnClick="btnEliminarPublicacion_Click" CssClass="btn btn-danger btn-lg" Style="margin-top: 10px; width: 300px; height: 60px" runat="server" Text="Eliminar" />
            </div>
        </div>
    </div>
</section>




</asp:Content>
