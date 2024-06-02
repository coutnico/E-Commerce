<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewArticulos.aspx.cs" Inherits="tp_web_equipo_19.Views.viewArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .place-light {
        }

            .place-light::placeholder {
                color: white;
            }

        .text-shadow {
            text-shadow: 2px 2px 5px #ccc;
        }
    </style>
    <div class="d-flex align-items-center justify-content-center" style="margin-right: 2.1rem !important;">

        <div id="carouselExampleDark" class="carousel carousel-dark slide shadow-lg border border-2 border-light rounded-3" style="width: 80%" data-bs-ride="carousel" data-bs-interval="3000">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner rounded-3" style="height: 300px">
                <div class="carousel-item active">
                    <img src="..\Resources\BannerMovimiento.gif" class="img-fluid w-100" alt="..." style="max-height: 300px">
                    <div class="carousel-caption d-none d-md-block">
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="..\Resources\Banner3.jpg" class="img-fluid w-100" alt="..." style="max-height: 300px">
                    <div class="carousel-caption d-none d-md-block">
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://t4.ftcdn.net/jpg/04/95/28/65/360_F_495286577_rpsT2Shmr6g81hOhGXALhxWOfx1vOQBa.jpg" class="img-fluid w-100" alt="..." style="max-height: 300px">
                    <div class="carousel-caption d-none d-md-block">
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="row align-items-center justify-content-center mt-2 ms-3">
        <div class="col-md-2 mb-3 mb-sm-0">
            <div class="card border border-2 border-success shadow" style="max-width: 250px">
                <div class="card-title text-center mt-2">
                    <p class="fs-4">Ingresa a tu cuenta</p>
                </div>
                <div class="card-img text-center">
                    <img src="https://img.icons8.com/ios/500/40C057/user-male-circle--v1.png" class="img-fluid" style="height: 120px; width: 120px" alt="login-rounded-up" alt="Alternate Text" />
                </div>
                <div class="card-body text-center">
                    <p class="card-text">Disfruta de ofertas y compra sin limites</p>
                    <asp:Button Text="Ingresar a tu cuenta" runat="server" CssClass="btn btn-success fw-semibold" ID="btnLogin" OnClick="btnLogin_Click" />
                </div>
            </div>
        </div>
        <div class="col-md-2 mb-3 mb-sm-0">
            <div class="card border border-2 border-success shadow" style="max-width: 250px">
                <div class="card-title text-center mt-2">
                    <p class="fs-4">Medios de pago</p>
                </div>
                <div class="card-img text-center">
                    <img src="https://img.icons8.com/quill/500/40C057/wallet.png" class="img-fluid" style="height: 120px; width: 120px" alt="login-rounded-up" alt="Alternate Text" />
                </div>
                <div class="card-body text-center">
                    <p class="card-text">Paga tus compras de forma rapida y segura</p>
                    <asp:Button Text="Conocer medios de pago" runat="server" CssClass="btn btn-success fw-semibold" />
                </div>
            </div>
        </div>
        <div class="col-md-2 mb-3 mb-sm-0">
            <div class="card border border-2 border-success shadow" style="max-width: 250px">
                <div class="card-title text-center mt-2">
                    <p class="fs-4">Mas vendidos</p>
                </div>
                <div class="card-img text-center">
                    <img src="https://img.icons8.com/pulsar-line/480/40C057/total-sales-1.png" class="img-fluid" style="height: 120px; width: 120px" alt="login-rounded-up" alt="Alternate Text" />
                </div>
                <div class="card-body text-center">
                    <p class="card-text">Explora productos que son tendecias</p>
                    <asp:Button Text="Ir a Mas vendidos" runat="server" CssClass="btn btn-success fw-semibold" />
                </div>
            </div>
        </div>
        <div class="col-md-2 mb-3 mb-sm-0">
            <div class="card border border-2 border-success shadow" style="max-width: 250px">
                <div class="card-title text-center mt-2">
                    <p class="fs-4">Metodos de envio</p>
                </div>
                <div class="card-img text-center">
                    <img src="https://img.icons8.com/ios-filled/500/40C057/truck.png" class="img-fluid" style="height: 120px; width: 120px" alt="login-rounded-up" alt="Alternate Text" />
                </div>
                <div class="card-body text-center">
                    <p class="card-text">Selecciona el medio de envio que mas prefieras</p>
                    <asp:Button Text="Ir a Medios de envio" runat="server" CssClass="btn btn-success fw-semibold" />
                </div>
            </div>
        </div>
        <div class="col-md-2 mb-3 mb-sm-0">
            <div class="card border border-2 border-success shadow" style="max-width: 250px">
                <div class="card-title text-center mt-2">
                    <p class="fs-4">Menos de $20.0000</p>
                </div>
                <div class="card-img text-center">
                    <img src="https://img.icons8.com/ios-filled/500/40C057/shield-with-a-dollar-sign--v2.png" class="img-fluid" style="height: 120px; width: 120px" alt="login-rounded-up" alt="Alternate Text" />
                </div>
                <div class="card-body text-center">
                    <p class="card-text">Descubri productos con precios bajos</p>
                    <asp:Button Text="Mostrar productos" runat="server" CssClass="btn btn-success fw-semibold" />
                </div>
            </div>
        </div>




    </div>


    <div class="row  justify-content-center align-items-center mt-4">
        <div class="d-flex justify-content-start align-items-start mb-2 mt-3" style="margin-left: 355px">
            <asp:TextBox runat="server" ID="txtBuscador" OnTextChanged="txtBuscador_TextChanged" CssClass="form-control me-3 ms-3 bg-black bg-opacity-25 text-light fw-semibold place-light border border-2 border-light" type="search" placeholder="Buscar nombre de producto" aria-label="Search" Style="width: 300px"></asp:TextBox>
            <button class="btn text-light border border-2 border-light fw-semibold bg-success bg-opacity-50" type="submit">Buscar</button>
        </div>

        <div class="row  align-items-center justify-content-center">
            <asp:Repeater ID="reapeter_articulos" runat="server">
                <ItemTemplate>
                    <div class="col-md-3 me-1 py-3 ">
                        <div class="border border-4 border-dark border-opacity-100 rounded-3 h-100">
                            <div class="row g-0 h-100 bg-black bg-opacity-50 rounded-1">
                                <div class="col-md-6 text-center">
                                    <img class="img-fluid rounded-" id="imagenArticulo" src="<%# Eval("ImagenUrl") %>" onerror="this.src='https://i.ibb.co/SwxTQny/imagen.png'" alt="Foto" style="max-width: 100%; height: 200px;" />
                                </div>
                                <div class="col-md-6 d-flex flex-column">
                                    <div class="d-flex justify-content-between">
                                        <p runat="server" id="txtNombre" class="card-text fw-semibold fs-4 text-light ms-1 text-shadow"><%# Eval("Nombre") %></p>
                                        <asp:ImageButton ID="btnAgregarCarrito" ImageUrl="https://img.icons8.com/color/480/add-shopping-cart--v1.png" Width="40" Height="40" OnClick="btnAgregarCarrito_Click" CommandArgument='<%# Eval("ID") %>' CommandName="IDArticulo" Text="Agregar al carrito" runat="server" />
                                    </div>
                                    <div class=" flex-grow-1 position-relative d-flex align-items-start ">
                                    </div>
                                    <div class="card-footer text-body-secondary justify-content-between d-flex">
                                        <asp:Button runat="server" ID="BtnVerDetalle" OnClick="BtnVerDetalle_Click1" CommandArgument='<%# Eval("ID") %>' CommandName="IDArticulo" Text="Ver Detalle" CssClass="btn btn-dark shadow text-start fw-semibold" />
                                        <p class="card-text fs-4 fw-semibold text-shadow text-dark"><%# "$" + Eval("Precio") %></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>
</asp:Content>


