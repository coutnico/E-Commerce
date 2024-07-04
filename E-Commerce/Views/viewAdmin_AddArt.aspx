<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewAdmin_AddArt.aspx.cs" Inherits="tp_web_equipo_19.Views.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Agregar Artículo</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-light">

    <form runat="server">

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="viewArticulos.aspx">Inicio</a>
                <a class="navbar-brand" href="viewAdmin_ModifyArt.aspx">Modificar Artículo</a>
                <div class="mx-auto">
                    <h2 class="text-white">AGREGAR ARTÍCULO</h2>
                </div>
            </div>
        </nav>

        <div class="container mt-4">
            <div class="card p-4">
                <div class="mb-3 row">
                    <label for="txtCodigo" class="col-sm-2 col-form-label">Código:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" placeholder="Ingrese el Código del Artículo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCodigo" runat="server" ControlToValidate="txtCodigo"
                            ErrorMessage="El código es obligatorio" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="txtArticulo" class="col-sm-2 col-form-label">Nombre:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtArticulo" runat="server" CssClass="form-control" placeholder="Ingrese el Nombre del Artículo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvArticulo" runat="server" ControlToValidate="txtArticulo"
                            ErrorMessage="El nombre es obligatorio" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="txtDescripcion" class="col-sm-2 col-form-label">Descripción:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" placeholder="Ingrese la Descripción del Artículo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion"
                            ErrorMessage="La descripción es obligatoria" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="listCat" class="col-sm-2 col-form-label">Categoría:</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="listCat" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Seleccionar..." Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvListaCat" runat="server" ControlToValidate="listCat"
                            ErrorMessage="La categoría es obligatoria" InitialValue="" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <a href="viewAdmin_AddCat.aspx" class="btn btn-outline-secondary mt-2">Agregar Categoría</a>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="listMarca" class="col-sm-2 col-form-label">Marca:</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="listMarca" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Seleccionar..." Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvListaMarca" runat="server" ControlToValidate="listMarca"
                            ErrorMessage="La marca es obligatoria" InitialValue="" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <a href="viewAdmin_AddMarca.aspx" class="btn btn-outline-secondary mt-2">Agregar Marca</a>
                    </div>
                </div>

                <div class="mb-3 row">
                    <label for="txtImagenUrl" class="col-sm-2 col-form-label">URL Imagen:</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control" placeholder="Ingrese la URL de la Imagen del Artículo"></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
                        <asp:ImageButton ID="addImage" ImageUrl="\image\addimage.jpg" runat="server" CssClass="mt-2" Style="width: 50px; height: 50px;" OnClick="addImage_Click" CausesValidation="false" />
                        <% if (Convert.ToInt32(lbl_Cantidad_imagenes_agregadas.Text) > 0) { %>
                            <asp:ImageButton ID="deleteImage" ImageUrl="\image\deleteimage.png" runat="server" CssClass="mt-2" Style="width: 50px; height: 50px;" OnClick="deleteImage_Click" CausesValidation="false" />
                        <% } %>
                        <asp:Label ID="lbl_Cantidad_imagenes_agregadas" runat="server" Text=""></asp:Label>
                    </div>
                    <asp:PlaceHolder ID="txtImagenUrl_Dinamico" runat="server"></asp:PlaceHolder>
                </div>

                <div class="mb-3 row">
                    <label for="txtPrecio" class="col-sm-2 col-form-label">Precio (Decimales con Coma):</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" placeholder="Ingrese el Precio del Artículo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecio"
                            ErrorMessage="El precio es obligatorio" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="text-center">
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar Artículo" OnClick="btnAgregar_Click" CssClass="btn btn-success" />
                </div>
            </div>
        </div>

    </form>

</body>
</html>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewAdmin_AddArt.aspx.cs" Inherits="tp_web_equipo_19.Views.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Agregar Artículo</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.bundle.min.js"></script>
    <style>
        /* Custom styles */
        body {
            background-color: #f8f9fa; /* Light gray background */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .card {
            background-color: #ffffff; /* White card background */
            border: none;
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
        }
        .form-control {
            border-radius: 10px;
            border: 1px solid #ced4da;
        }
        .form-control:focus {
            border-color: #80bdff; /* Blue focus border color */
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }
        .btn-success {
            background-color: #28a745; /* Green success button */
            border-color: #28a745;
        }
        .btn-success:hover {
            background-color: #218838; /* Darker green on hover */
            border-color: #1e7e34;
        }
        .navbar {
            background-color: #343a40 !important; /* Dark navbar */
        }
        .navbar-brand {
            font-size: 1.5rem; /* Larger font size for navbar brand */
        }
    </style>
</head>
<body>

    <form runat="server">

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="viewArticulos.aspx">Inicio</a>
                <a class="navbar-brand" href="viewAdmin_ModifyArt.aspx">Modificar Artículo</a>
                <div class="mx-auto">
                    <h2 class="text-white">AGREGAR ARTÍCULO</h2>
                </div>
            </div>
        </nav>

        <!-- Formulario -->
        <div class="container mt-4">
            <div class="card p-4">
                <!-- Código -->
                <div class="mb-3 row">
                    <label for="txtCodigo" class="col-sm-2 col-form-label">Código:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" placeholder="Ingrese el Código del Artículo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCodigo" runat="server" ControlToValidate="txtCodigo"
                            ErrorMessage="El código es obligatorio" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <!-- Nombre -->
                <div class="mb-3 row">
                    <label for="txtArticulo" class="col-sm-2 col-form-label">Nombre:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtArticulo" runat="server" CssClass="form-control" placeholder="Ingrese el Nombre del Artículo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvArticulo" runat="server" ControlToValidate="txtArticulo"
                            ErrorMessage="El nombre es obligatorio" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <!-- Descripción -->
                <div class="mb-3 row">
                    <label for="txtDescripcion" class="col-sm-2 col-form-label">Descripción:</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" placeholder="Ingrese la Descripción del Artículo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion"
                            ErrorMessage="La descripción es obligatoria" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <!-- Categoría -->
                <div class="mb-3 row">
                    <label for="listCat" class="col-sm-2 col-form-label">Categoría:</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="listCat" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Seleccionar..." Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvListaCat" runat="server" ControlToValidate="listCat"
                            ErrorMessage="La categoría es obligatoria" InitialValue="" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <a href="viewAdmin_AddCat.aspx" class="btn btn-outline-secondary mt-2">Agregar Categoría</a>
                    </div>
                </div>

                <!-- Marca -->
                <div class="mb-3 row">
                    <label for="listMarca" class="col-sm-2 col-form-label">Marca:</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="listMarca" runat="server" CssClass="form-control">
                            <asp:ListItem Text="Seleccionar..." Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvListaMarca" runat="server" ControlToValidate="listMarca"
                            ErrorMessage="La marca es obligatoria" InitialValue="" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        <a href="viewAdmin_AddMarca.aspx" class="btn btn-outline-secondary mt-2">Agregar Marca</a>
                    </div>
                </div>

                <!-- URL Imagen -->
      
                 <div class="mb-3 row">

     <label for="txtImagenUrl" class="col-sm-2 col-form-label">URL Imagen:</label>
     <div class="col-sm-10">
         <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control" placeholder="Ingrese la URL de la Imagen del Artículo"></asp:TextBox>
     </div>
     <div class="col-sm-2">
         <asp:ImageButton ID="addImage" ImageUrl="\image\addimage.jpg" runat="server" CssClass="mt-2" Style="width: 50px; height: 50px;" OnClick="addImage_Click" CausesValidation="false" />
         <% if (Convert.ToInt32(lbl_Cantidad_imagenes_agregadas.Text) > 0) { %>
             <asp:ImageButton ID="deleteImage" ImageUrl="\image\deleteimage.png" runat="server" CssClass="mt-2 form-control" Style="width: 50px; height: 50px;" OnClick="deleteImage_Click" CausesValidation="false" />
         <% } %>
         <asp:Label ID="lbl_Cantidad_imagenes_agregadas" runat="server" Text=""></asp:Label>
     </div>
     <asp:PlaceHolder ID="txtImagenUrl_Dinamico" runat="server"></asp:PlaceHolder>
 </div>
                <!-- Botones de Imagen -->
                <div class="mb-3 row">
                    <div class="offset-sm-2 col-sm-10">
                        <asp:ImageButton ID="addImage" ImageUrl="\image\addimage.jpg" runat="server" CssClass="mt-2 mr-2" Style="width: 50px; height: 50px;" OnClick="addImage_Click" CausesValidation="false" />
                        <% if (Convert.ToInt32(lbl_Cantidad_imagenes_agregadas.Text) > 0) { %>
                            <asp:ImageButton ID="deleteImage" ImageUrl="\image\deleteimage.png" runat="server" CssClass="mt-2" Style="width: 50px; height: 50px;" OnClick="deleteImage_Click" CausesValidation="false" />
                        <% } %>
                        <asp:Label ID="lbl_Cantidad_imagenes_agregadas" runat="server" Text=""></asp:Label>
                    </div>
                </div>

                <!-- Precio -->
                <div class="mb-3 row">
                    <label for="txtPrecio" class="col-sm-2 col-form-label">Precio (Decimales con Coma):</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" placeholder="Ingrese el Precio del Artículo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecio"
                            ErrorMessage="El precio es obligatorio" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <!-- Botón Agregar -->
                <div class="text-center">
                    <asp:Button ID="btnAgregar" runat="server" Text="Agregar Artículo" OnClick="btnAgregar_Click" CssClass="btn btn-success btn-lg px-5 mt-4" />
                </div>
            </div>
        </div>

    </form>

</body>
</html>



