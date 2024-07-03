<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewUsuarioVerPublicacion.aspx.cs" Inherits="tp_web_equipo_19.Views.viewUsuarioVerPublicacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section>

        <div class="text-end">
            <button type="button" class="btn-close" aria-label="Close" style="font-size: 30px" onclick="window.location.href = 'viewUsuarioPublicaciones.aspx';"></button>
        </div>
        <div class="product-container d-flex justify-content-center align-items-center pb-5">
            <div class="product-image">
                <img runat="server" id="ImagenPrincipalArticulo" src="#" alt="Alternate Text" class="img-thumbnail" onerror="this.src='https://i.ibb.co/SwxTQny/imagen.png'" style="width: 500px; height: 500px;" />
            </div>
            <div class="product-details d-flex flex-column p-3">


                <asp:Label ID="lblPublicacionPausada" CssClass="h4" runat="server" Text="PublicacionPausada"></asp:Label>

      <%--          <asp:Label ID="lblIdPubli" runat="server" Text="IDPubli"></asp:Label><%-- temporal para ver idpubli--%>
                <asp:TextBox ID="txtNombre" class="mb-3 fw-bolder text-success" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtCodigo" class="mb-3 fw-bolder text-bg-info" runat="server"></asp:TextBox>

                <asp:TextBox ID="txtPrecio" CssClass="text-dark text-opacity-75 rounded rounded-3 bg-success bg-opacity-50 fs-4 text-center mb-3" runat="server" TextMode="SingleLine"> $</asp:TextBox>
                <asp:TextBox ID="txtDescripcion" CssClass="text-break pt-2 mb-3" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>

                <asp:DropDownList ID="listCat" runat="server" CssClass="form-select  m-lg-1  rounded" OnTextChanged="listCat_TextChanged" AutoPostBack="True"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvListaCat" runat="server" ControlToValidate="listCat"
                    ErrorMessage="Lista obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>
                <%--Campo obligatorio--%>


                <asp:DropDownList ID="listMarca" runat="server" CssClass="form-select  m-lg-1  rounded"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvListaMarca" runat="server" ControlToValidate="listMarca"
                    ErrorMessage="Lista obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>
                <%--Campo obligatorio--%>

                <p runat="server" id="imgNumber" class="fw-semibold"></p>
                <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control m-lg-1 rounded" Style="max-width: 500px;" placeholder="Escriba la URL de la imagen del Articulo..."> </asp:TextBox>


                <div class="py-5 gap-1">
                    <p runat="server" id="CantidadImagenes" class="fw-semibold"></p>
                    <asp:Button ID="Atras" OnClick="Atras_Click" CssClass="btn btn-outline-secondary me-2" runat="server" Text="Atras"  />
                    <asp:Button ID="Siguiente" OnClick="Siguiente_Click" CssClass="btn btn-outline-primary" runat="server" Text="Siguiente"/>
                </div>

                <asp:TextBox ID="txtStock" class="mb-3 fw-bolder text-success" runat="server" TextMode="Number"></asp:TextBox>


                <div class="button-group">
                    <asp:Button ID="btnModificarPublicacion" OnClick="btnModificarPublicacion_Click" CssClass="btn btn-success btn-lg" Style="margin-bottom: 10px; width: 300px; height: 60px" runat="server" Text="Modificar" />
                    <br />
                    <asp:Button ID="btnEliminarPublicacion" OnClick="btnEliminarPublicacion_Click" CssClass="btn btn-danger btn-lg" Style="margin-top: 10px; width: 300px; height: 60px" runat="server" Text="Eliminar" Visible="false" />
                     <asp:Button ID="btnBajaLogicaPublicacion" OnClick="btnBajaLogicaPublicacion_Click" CssClass="btn btn-danger btn-lg" Style="margin-top: 10px; width: 300px; height: 60px" runat="server" Text="Eliminar" />
                    <br />
                     <% if (lblPublicacionPausada.Text != "Pausada") {   %>
                    <asp:Button ID="btnPausarPublicacion" OnClick="btnPausarPublicacion_Click" CssClass="btn btn-warning btn-lg" Style="margin-top: 10px; width: 300px; height: 60px" runat="server" Text="Pausar" />
                    
                    <% } else {  %>

                     <asp:Button ID="btnRestablecerPublicacion" OnClick="btnRestablecerPublicacion_Click" CssClass="btn btn-success btn-lg" Style="margin-top: 10px; width: 300px; height: 60px" runat="server" Text="Activar" />
                    
                    <%} %>
 
                </div>
            </div>
        </div>
    </section>




</asp:Content>
