<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="Pokedex.Views.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <hr />
        <div class="row">
            <div class="col-6">
                <h1>Crea tu perfil Trainee</h1>
                <div class="mb-3">
                    <label class="form-label" id="lblEmail">Email</label>
                    <asp:TextBox Placeholder="Email" ID="txtEmail" TextMode="Email" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="Debes ingresar un correo!" ControlToValidate="txtEmail" runat="server" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <asp:TextBox ID="txtPass" TextMode="Password" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="Debes ingresar una contraseña!" ControlToValidate="txtPass" runat="server" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="Debes ingresar un Nombre!" ControlToValidate="txtNombre" runat="server" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Apellido</label>
                    <asp:TextBox ID="txtApellido" CssClass="form-control" runat="server" />
                    <asp:RequiredFieldValidator ErrorMessage="Debes ingresar un Apellido!" ControlToValidate="txtApellido" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:Button Text="Registrarse" CssClass="btn btn-primary" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" runat="server" />
                    <a href="Default.aspx" class="btn btn-secondary">Cancelar</a>
                </div>
            </div>
            <div class="col-6">
            </div>
        </div>
    </div>
</asp:Content>
