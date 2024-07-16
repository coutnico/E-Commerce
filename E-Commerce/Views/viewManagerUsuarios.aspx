<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewManagerUsuarios.aspx.cs" Inherits="tp_web_equipo_19.Views.viewManagerUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .rounded-table {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

            .rounded-table th {
                background-color: #343a40; /* Color gris oscuro para el encabezado */
                color: white; /* Texto blanco para el encabezado */
                border: none; /* Sin borde */
                padding: 10px;
                text-align: center; /* Alinear texto al centro */
                vertical-align: middle; /* Alinear verticalmente al centro */
            }

            .rounded-table td {
                background-color: #212529; /* Color oscuro para el resto de las columnas */
                color: white; /* Texto blanco para las celdas */
                border: none; /* Sin borde */
                padding: 10px;
                text-align: center; /* Alinear texto al centro */
                vertical-align: middle; /* Alinear verticalmente al centro */
            }

                .rounded-table th:first-child,
                .rounded-table td:first-child {
                    border-left: none;
                }

                .rounded-table th:last-child,
                .rounded-table td:last-child {
                    border-right: none;
                }
    </style>

    <div class="container-md">

        <div class="mb-2 mt-1" style="">
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

        <table class="table rounded-table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th></th>
                    <th>Nombre</th>
                    <th>Rango</th>
                    <th>Advertencia</th>
                    <th>Perfil</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rpUsuarios" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <img src="https://img.icons8.com/fluency/240/user-male-circle--v1.png" alt="Alternate Text" style="height: 60px; width: 60px" />
                            </td>
                            <td class="text-light fs-6 fw-semibold"><%# Eval("User") %></td>
                            <td class="">
                                <asp:Label Text='<%# Eval("tipoUsuario", this.GetTipoUsuarioText(Eval("tipoUsuario"))) %>' runat="server" ID="lblRango" />
                                <asp:ImageButton ImageUrl="https://img.icons8.com/pulsar-gradient/48/change.png" runat="server" Style="height: 30px; width: 30px" />
                            </td>

                            <td> 
                                <%# this.CargarCantidadAdvertencias(Convert.ToInt32(Eval("Id")))%>

                                <asp:Label Text="<%# this.CantidadAdvertencias %>" ID="lblCantidad" CssClass="fw-semibold text-light" runat="server" />
                                <asp:ImageButton ImageUrl="..\Resources\icons8-advertencia.gif" runat="server" ID="btnAdvertencia" OnClick="btnAdvertencia_Click" ClientIDMode="AutoID" CommandArgument='<%#Eval("Id")%>' CommandName="ID_Usuario" />
                            </td>
                            <td>
                                <img src="https://img.icons8.com/pulsar-gradient/420/web-account.png" alt="Alternate Text" style="width: 50px;" onclick='<%# "openModal(\"exampleModal_" + Container.ItemIndex + "\")" %>' />

                                <div class="modal fade" id='<%# "exampleModal_" + Container.ItemIndex %>' tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" style="left: 100px">
                                        <div class="cardUsuario shadow-lg">
                                            <div class="cardUsuario__img">
                                                <img src="..\Resources\bannerUsuario.png" alt="Alternate Text" class="rounded-4" style="height: 193px; width: 295px" />
                                            </div>
                                            <div class="cardUsuario__avatar">
                                                <img src="https://img.icons8.com/fluency/96/user-male-circle--v1.png" alt="Alternate Text" style="height: 120px; width: 120px" />
                                            </div>
                                            <div class="cardUsuario__title"><%# Eval("User") %></div>
                                            <div class="cardUsuario__subtitle"><%# Convert.ToInt32(Eval("tipoUsuario")) == 2 ? "Administrador" : "Usuario" %></div>
                                            <div class="cardUsuario__wrapper">  
                                       
                                              <%--  <asp:Button ID="btnPublicacionVerAdm"  OnClick="btnPublicacionVerAdm_Click" CommandArgument='<%#Eval("Id")%>' CommandName="ID_Usuario_to_Publi" class="cardUsuario__btn cardUsuario__btn-solid w-auto"  runat="server" Text="Publicaciones" />--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                  <asp:Button ID="btnPublicacionVerAdm"  OnClick="btnPublicacionVerAdm_Click" CommandArgument='<%#Eval("Id")%>' CommandName="ID_Usuario_to_Publi" class="cardUsuario__btn cardUsuario__btn-solid w-auto"  runat="server" Text="Publicaciones" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>

        <script >
            function openModal(modalId) {
                $('#' + modalId).modal('show');
            }

            function ShowEnviarAdvertencia() {
                Swal.fire({
                    title: "Advertencia cargada con exito",
                    text: "Mail Enviado",
                    icon: "info",
                    confirmButtonColor: "#3085d6"
                });
            }    

            function ShowUsuarioSuspendido() {
                Swal.fire({
                    title: "Usuario suspendido",
                    text: "<%DateTime.Today.ToString("dd/MM/yyyy"); %>",
                    icon: "warning",
                    confirmButtonColor: "#3085d6"
                });
            }  
        </script>
    </div>
</asp:Content>
