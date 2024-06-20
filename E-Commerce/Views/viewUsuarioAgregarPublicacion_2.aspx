<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewUsuarioAgregarPublicacion_2.aspx.cs" Inherits="tp_web_equipo_19.Views.viewUsuarioAgregarPublicacion_2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-lg rounded border-0">
                    <div class="card-header bg-primary text-white text-center">
                        <div class="text-end">
                            <button type="button" class="btn-close" aria-label="Close" style="font-size: 30px" onclick="window.location.href = 'viewUsuarioPublicaciones.aspx';"></button>
                        </div>
                        <h2>Nueva Publicacion</h2>
                        <p class="lead">Ahora te pedimos que cargues la información de tu producto</p>
                    </div>
                    <div class="card-body">
                        <!-- Categoría -->
                        <div class="mb-3">
                            <div class="input-group">
                                <h4 class="mb-0 me-3">Categoría:</h4>
                                <asp:Label ID="lblCategoriaSeleccionada" runat="server" CssClass="form-control-plaintext fw-bold" Text="Categoría"></asp:Label>
                            </div>
                        </div>

                        <!-- Código -->
                        <div class="mb-3">
                            <label class="form-label">Código:</label>
                            <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" Style="max-width: 50%;" placeholder="Escriba el Código del Artículo..."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCodigo" runat="server" ControlToValidate="txtCodigo"
                                ErrorMessage="El código es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Nombre -->
                        <div class="mb-3">
                            <label class="form-label">Nombre:</label>
                            <asp:TextBox ID="txtArticulo" runat="server" CssClass="form-control" Style="max-width: 50%;" placeholder="Escriba el Nombre del Artículo..."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvArticulo" runat="server" ControlToValidate="txtArticulo"
                                ErrorMessage="El nombre es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Descripción -->
                        <div class="mb-3">
                            <label class="form-label">Descripción:</label>
                            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" Style="max-width: 50%;" placeholder="Escriba la Descripción del Artículo..."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion"
                                ErrorMessage="La descripción es obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Marca -->
                        <div class="mb-3">
                            <label class="form-label">Marca:</label>
                            <div class="input-group">
                                <asp:DropDownList ID="listMarca" runat="server" CssClass="form-select" Style="max-width: 50%;"></asp:DropDownList>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvListaMarca" runat="server" ControlToValidate="listMarca"
                                ErrorMessage="Marca obligatoria" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- URL Imagen -->
                        <div class="mb-3">
                            <label class="form-label d-block">URL Imagen:</label>
                            <div class="d-flex align-items-center">
                                <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control flex-grow-1 me-2" Style="max-width: 50%;" placeholder="Escriba la URL de la imagen del Artículo..."></asp:TextBox>
                                <asp:ImageButton ID="addImage" ImageUrl="\image\addimage.jpg" runat="server" CssClass="align-self-center" Style="height: 45px;" OnClick="addImage_Click" CausesValidation="false" />
                                <%-- CausesValidation="false" hace que no verifique los campos obligatorios --%>
                            </div>
                        </div>


                        <!-- Imágenes Agregadas  // AUN NO FUNCION CORRECTAMENTE. REVISAR! -->  
                        <% if (Convert.ToInt32(lbl_Cantidad_imagenes_agregadas.Text) > 0)
                            { %>
                        <div class="mb-3">
                            <label class="form-label">Imágenes Agregadas:</label>
                            <asp:ImageButton ID="deleteImage" ImageUrl="\image\deleteimage.png" runat="server" CssClass="mb-2 ms-2" Style="height: 30px;" OnClick="deleteImage_Click" CausesValidation="false" />
                            <%--CausesValidation="false" hace que no verifique los campos obligatorios--%>
                            <% } %>

                            <asp:Label Visible="false" ID="lbl_Cantidad_imagenes_agregadas" runat="server" Text=""></asp:Label>

                             <asp:PlaceHolder ID="txtImagenUrl_Dinamico" runat="server"></asp:PlaceHolder>
                        </div>

                      
                        <!-- Precio -->
                        <div class="mb-3">
                            <label class="form-label">Precio (Decimales con Coma):</label>
                            <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" Style="max-width: 50%;" placeholder="Escriba el Precio del Artículo..."></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecio"
                                ErrorMessage="El precio es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Stock -->
                        <div class="mb-3">
                            <label class="form-label">Stock:</label>
                            <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" Style="max-width: 50%;" placeholder="Escriba el Stock Disponible..." TextMode="number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStock"
                                ErrorMessage="El stock es obligatorio" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Botón Agregar -->
                        <div class="d-grid">
                            <asp:Button ID="btnAgregar" runat="server" Text="Agregar" OnClick="btnAgregar_Click" CssClass="btn btn-success" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
