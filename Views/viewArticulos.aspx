<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewArticulos.aspx.cs" Inherits="tp_web_equipo_19.Views.viewArticulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row  justify-content-center align-items-center">
        <div class="d-flex justify-content-center align-items-center mb-2">
            <asp:TextBox runat="server" ID="txtBuscador" OnTextChanged="txtBuscador_TextChanged" CssClass="form-control me-3 bg-success bg-opacity-50 text-light fw-bolder" type="search" placeholder="     Buscar nombre de producto" aria-label="Search" Style="width: 300px"></asp:TextBox>
            <button class="btn btn-outline-success" type="submit">Buscar</button>
        </div>

        <asp:Repeater ID="reapeter_articulos" runat="server">
            <ItemTemplate>
                <div class="col-lg-3 col-md-4 col-sm-6 me-1 py-3 d-flex">
                    <div class="card border border-3 border-dark border-opacity-100 rounded-4" style="width: 400px">
                        <div class="card-header text-center">
                            <%-- <img class="img-fluid rounded-3" src="https://imgs.search.brave.com/-RLSD-VwfrdvJlQIn9ZKhe3lFwfnVzOxXCOV2UQZke8/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9wbHVz/LnVuc3BsYXNoLmNv/bS9wcmVtaXVtX3Bo/b3RvLTE2ODA5ODU1/NTEwMDktMDUxMDdj/ZDI3NTJjP3E9ODAm/dz0xMDAwJmF1dG89/Zm9ybWF0JmZpdD1j/cm9wJml4bGliPXJi/LTQuMC4zJml4aWQ9/TTN3eE1qQTNmREI4/TUh4elpXRnlZMmg4/T1h4OGRHVnNKVU16/SlVFNVptOXVieVV5/TUcwbFF6TWxRak4y/YVd4OFpXNThNSHg4/TUh4OGZEQT0" alt="Foto" style="width: 340px; height: 250px;" />--%>
                            <img class="img-fluid rounded-3" id="imagenArticulo" src=" <%# Eval("ImagenUrl")  %> " onerror="this.src='https://i.ibb.co/SwxTQny/imagen.png'" alt="Foto" style="width: 300px; height: 250px;" />
                        </div>
                        <div class="card-body text-center">
                            <%-- <p class="card-text fw-semibold fs-4">Nombre</p>--%>
                            <b runat="server" id="txtNombre" class="card-text fw-semibold fs-4"><%# Eval("Nombre") %>  </b><%-- NUEVO--%>
                        </div>
                        <div class="card-body text-center pe-2">
                            <%--class="card-body text-start"--%>
                            <p class="card-title badge text-bg-dark text-light text-wrap fs-5 "><%# Eval("Marca") %>  </p>
                            <p class="card-title badge text-bg-dark  text-light text-wrap fs-5 "><%# Eval("Categoria") != null ? Eval("Categoria") : "Categoria" %></p>
                        </div>
                        <div class="list-group list-group-flush text-center justify-content-center align-items-center">
                            <asp:Button runat="server" ID="BtnVerDetalle" OnClick="BtnVerDetalle_Click1" CommandArgument='<%#Eval("ID")%>' CommandName="IDArticulo" Text="Ver Detalle"  CssClass=" mt-1 rounded-3 border border-2 border-dark w-100 fs-4 fw-bolder" />
                            <asp:Button ID="btnAgregarCarrito" OnClick="btnAgregarCarrito_Click" CommandArgument='<%#Eval("ID")%>' CommandName="IDArticulo" Text="Agregar al carrito" runat="server" CssClass="mt-2 mb-1 list-group-item rounded-3  border border-2 border-primary w-100 fs-5 fw-bolder" />
                        </div>
                        <div class="card-footer text-body-secondary text-end bg-success bg-opacity-50">
                            <%--<p class="card-text fs-4 fw-semibold text-white">Precio</p>--%>
                            <p class="card-text fs-4 fw-semibold text-white"><%# "$" + Eval("Precio") %></p>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>


