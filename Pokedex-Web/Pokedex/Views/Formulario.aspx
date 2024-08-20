<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Formulario.aspx.cs" Inherits="Pokedex.Views.Formulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <div class="container mt-4">
        <div class="row">
            <div class="col-6">
                <%-- Entrada de ID --%>
                <div class="mb-3">
                    <label for="txtId" class="form-label">Id</label>
                    <asp:TextBox runat="server" ID="txtId" CssClass="form-control" />
                </div>
                <%-- Entrada de nombre --%>
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre:</label>
                    <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" />
                    <asp:RegularExpressionValidator ErrorMessage="Hasta 50 carácteres" ValidationExpression="^.{1,50}$"
                        ControlToValidate="txtNombre" runat="server" />
                </div>
                <%-- Entrada de número --%>
                <div class="mb-3">
                    <label for="txtNumero" class="form-label">Número:</label>
                    <asp:TextBox runat="server" ID="txtNumero" CssClass="form-control" />
                </div>
                <%-- Desplegable de Tipo --%>
                <div class="mb-3">
                    <label for="ddlTipo" class="form-label">Tipo:</label>
                    <asp:DropDownList ID="ddlTipo" CssClass="form-select" runat="server"></asp:DropDownList>
                </div>
                <%-- Desplegable de debilidad --%>
                <div class="mb-3">
                    <label for="ddlDebilidad" class="form-label">Debilidad:</label>
                    <asp:DropDownList ID="ddlDebilidad" CssClass="form-select" runat="server"></asp:DropDownList>
                </div>
                <%-- Botón aceptar --%>
                <div class="mb-3">
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" />
                    <%-- Botón cancelar --%>
                    <a href="../Views/ListaPokemon.aspx" class="btn btn-secondary">Cancelar</a>
                    <%-- Botón Inactivar --%>
                    <asp:Button ID="btnInactivar" runat="server" Text="Inactivar" OnClick="Inactivar_Click" CssClass="btn btn-warning" />
                </div>
            </div>
            <%-- Entrada de descripción --%>
            <div class="col-6">
                <div class="mb-3">
                    <label for="txtDescripcion" class="form-label">Descripción:</label>
                    <asp:TextBox runat="server" ID="txtDescripcion" TextMode="MultiLine" CssClass="form-control" />
                    <asp:RegularExpressionValidator ErrorMessage="Hasta 50 carácteres" ValidationExpression="^.{1,50}$"
                        ControlToValidate="txtDescripcion" runat="server" />
                </div>
                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <label for="txtUrlImagen" class="form-label">URL Imagen:</label>
                            <asp:TextBox runat="server" ID="txtUrlImagen" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtUrlImagen_TextChanged" />
                            <asp:RegularExpressionValidator ErrorMessage="Hasta 50 carácteres" ValidationExpression="^.{1,50}$"
                                ControlToValidate="txtUrlImagen" runat="server" />
                        </div>
                        <asp:Image ID="imgPokemon" runat="server" Width="60%" ImageUrl="https://www.example.com/placeholder-image.jpg" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <%-- Botón Eliminar Fisico --%>
        <div class="row">
            <div class="col-6">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="mb-3">
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" />
                        </div>

                        <%if (ConfirmaEliminacion)
                            { %>
                        <div class="mb-3">
                            <asp:CheckBox ID="chkConfirmarEliminacion" Text="Confirmar Eliminacion" runat="server" />
                            <asp:Button ID="btnConfirmarEliminar" runat="server" Text="Eliminar" CssClass="btn btn-outline-danger" OnClick="btnConfirmarEliminar_Click" />
                        </div>
                        <% } %>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
