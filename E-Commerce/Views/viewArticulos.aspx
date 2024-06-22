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
    <div class="d-flex align-items-center justify-content-center" style="margin-right: 0.5rem !important;">

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

    <div class="row align-items-center justify-content-center mt-2" style="margin-left: 2.0rem !important;">
        <div class="col-md-2 mb-3 mb-sm-0">
            <div class="card border border-2 border-success shadow" style="max-width: 230px; max-height: 300px">
                <div class="card-title text-center mt-2">
                    <p class="fs-4">Ingresa a tu cuenta</p>
                </div>
                <div class="card-img text-center">
                    <img src="https://img.icons8.com/ios/500/40C057/user-male-circle--v1.png" class="img-fluid" style="height: 100px; width: 100px" alt="login-rounded-up" alt="Alternate Text" />
                </div>
                <div class="card-body text-center">
                    <p class="card-text">Disfruta de ofertas y compra sin limites</p>
                    <asp:Button Text="Ingresar a tu cuenta" runat="server" CssClass="btn btn-success fw-semibold" ID="btnLogin" OnClick="btnLogin_Click" />
                </div>
            </div>
        </div>
        <div class="col-md-2 mb-3 mb-sm-0">
            <div class="card border border-2 border-success shadow" style="max-width: 230px; max-height: 300px">
                <div class="card-title text-center mt-2">
                    <p class="fs-4">Medios de pago</p>
                </div>
                <div class="card-img text-center">
                    <img src="https://img.icons8.com/quill/500/40C057/wallet.png" class="img-fluid" style="height: 100px; width: 100px" alt="login-rounded-up" alt="Alternate Text" />
                </div>
                <div class="card-body text-center">
                    <p class="card-text">Paga tus compras de forma rapida y segura</p>
                    <asp:Button Text="Conocer medios de pago" runat="server" CssClass="btn btn-success fw-semibold" />
                </div>
            </div>
        </div>
        <div class="col-md-2 mb-3 mb-sm-0">
            <div class="card border border-2 border-success shadow" style="max-width: 230px; max-height: 300px">
                <div class="card-title text-center mt-2">
                    <p class="fs-4">Mas vendidos</p>
                </div>
                <div class="card-img text-center">
                    <img src="https://img.icons8.com/pulsar-line/480/40C057/total-sales-1.png" class="img-fluid" style="height: 100px; width: 100px" alt="login-rounded-up" alt="Alternate Text" />
                </div>
                <div class="card-body text-center">
                    <p class="card-text">Explora productos que son tendecias</p>
                    <asp:Button Text="Ir a Mas vendidos" runat="server" CssClass="btn btn-success fw-semibold" />
                </div>
            </div>
        </div>
        <div class="col-md-2 mb-3 mb-sm-0">
            <div class="card border border-2 border-success shadow" style="max-width: 230px; max-height: 300px">
                <div class="card-title text-center mt-2">
                    <p class="fs-4">Metodos de envio</p>
                </div>
                <div class="card-img text-center">
                    <img src="https://img.icons8.com/ios-filled/500/40C057/truck.png" class="img-fluid" style="height: 100px; width: 100px" alt="login-rounded-up" alt="Alternate Text" />
                </div>
                <div class="card-body text-center">
                    <p class="card-text">Selecciona el medio de envio que mas prefieras</p>
                    <asp:Button Text="Ir a Medios de envio" runat="server" CssClass="btn btn-success fw-semibold" />
                </div>
            </div>
        </div>
        <div class="col-md-2 mb-3 mb-sm-0">
            <div class="card border border-2 border-success shadow" style="max-width: 230px; max-height: 300px">
                <div class="card-title text-center mt-2">
                    <p class="fs-4">Menos de $20.0000</p>
                </div>
                <div class="card-img text-center">
                    <img src="https://img.icons8.com/ios-filled/500/40C057/shield-with-a-dollar-sign--v2.png" class="img-fluid" style="height: 100px; width: 100px" alt="login-rounded-up" alt="Alternate Text" />
                </div>
                <div class="card-body text-center">
                    <p class="card-text">Descubri productos con precios bajos</p>
                    <asp:Button Text="Mostrar productos" runat="server" CssClass="btn btn-success fw-semibold" />
                </div>
            </div>
        </div>
    </div>


    <div class="row justify-content-center align-items-center mt-5">
        <p class="fs-4 text-shadow fw-bold text-light text-center rounded-2" style="background-color: #212529; max-width: 1480px">PUBLICACIONES</p>
        <div class="d-flex justify-content-start align-items-start mb-2 mt-1" style="margin-left: 400px">
            <div class="searchBox">
                <asp:TextBox runat="server" ID="txtBuscador" OnTextChanged="txtBuscador_TextChanged" CssClass="searchInput" type="text" placeholder="Buscar nombre de producto" aria-label="Search" Style="width: 300px"></asp:TextBox>
                <button class="searchButton" href="#">

                    <svg xmlns="http://www.w3.org/2000/svg" width="29" height="29" viewBox="0 0 29 29" fill="none">
                        <g clip-path="url(#clip0_2_17)">
                            <g filter="url(#filter0_d_2_17)">
                                <path d="M23.7953 23.9182L19.0585 19.1814M19.0585 19.1814C19.8188 18.4211 20.4219 17.5185 20.8333 16.5251C21.2448 15.5318 21.4566 14.4671 21.4566 13.3919C21.4566 12.3167 21.2448 11.252 20.8333 10.2587C20.4219 9.2653 19.8188 8.36271 19.0585 7.60242C18.2982 6.84214 17.3956 6.23905 16.4022 5.82759C15.4089 5.41612 14.3442 5.20435 13.269 5.20435C12.1938 5.20435 11.1291 5.41612 10.1358 5.82759C9.1424 6.23905 8.23981 6.84214 7.47953 7.60242C5.94407 9.13789 5.08145 11.2204 5.08145 13.3919C5.08145 15.5634 5.94407 17.6459 7.47953 19.1814C9.01499 20.7168 11.0975 21.5794 13.269 21.5794C15.4405 21.5794 17.523 20.7168 19.0585 19.1814Z" stroke="white" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" shape-rendering="crispEdges"></path>
                            </g>
                        </g>
                        <defs>
                            <filter id="filter0_d_2_17" x="-0.418549" y="3.70435" width="29.7139" height="29.7139" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
                                <feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
                                <feColorMatrix in="SourceAlpha" type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0" result="hardAlpha"></feColorMatrix>
                                <feOffset dy="4"></feOffset>
                                <feGaussianBlur stdDeviation="2"></feGaussianBlur>
                                <feComposite in2="hardAlpha" operator="out"></feComposite>
                                <feColorMatrix type="matrix" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"></feColorMatrix>
                                <feBlend mode="normal" in2="BackgroundImageFix" result="effect1_dropShadow_2_17"></feBlend>
                                <feBlend mode="normal" in="SourceGraphic" in2="effect1_dropShadow_2_17" result="shape"></feBlend>
                            </filter>
                            <clipPath id="clip0_2_17">
                                <rect width="28.0702" height="28.0702" fill="white" transform="translate(0.403503 0.526367)"></rect>
                            </clipPath>
                        </defs>
                    </svg>


                </button>
            </div>
        </div>

        <div class="row  align-items-center justify-content-center">
            <asp:Repeater ID="reapeter_articulos" runat="server">
                <ItemTemplate>
                    <div class="col-md-3 me-1 py-3">
                        <div class="border border-4 border-dark border-opacity-100 rounded-3 h-100">
                            <div class="row g-0 h-100 bg-black bg-opacity-50 rounded-1">
                                <div class="col-md-6 text-center">
                                    <img class="img-fluid w-100" id="imagenArticulo" src="<%# Eval("ImagenUrl") %>" onerror="this.src='https://i.ibb.co/SwxTQny/imagen.png'" alt="Foto" style="max-width: 100%; height: 200px;" />
                                    <asp:Button runat="server" ID="BtnVerDetalle" OnClick="BtnVerDetalle_Click1" CommandArgument='<%# Eval("ID") %>' CommandName="IDArticulo" Text="Ver Detalle" CssClass="btn btn-dark shadow rounded-0 fw-semibold w-100 text-center" />
                                </div>
                                <div class="col-md-6 d-flex flex-column">
                                    <div class="d-flex justify-content-between">
                                        <p runat="server" id="txtNombre" class="card-text fw-semibold fs-4 text-light ms-1 text-shadow"><%# Eval("Nombre") %></p>
                                        <asp:ImageButton ID="btnAgregarCarrito" ImageUrl="https://img.icons8.com/color/480/add-shopping-cart--v1.png" Width="40" Height="40" OnClick="btnAgregarCarrito_Click" CommandArgument='<%# Eval("ID") %>' CommandName="IDArticulo" Text="Agregar al carrito" runat="server" />
                                    </div>
                                    <div class=" flex-grow-1 position-relative d-flex align-items-start ">
                                    </div>
                                    <div class="card-footer text-body-secondary">
                                        <p class="card-text fs-4 fw-semibold text-shadow text-dark text-end"><%# "$" + Eval("Precio") %></p>
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


