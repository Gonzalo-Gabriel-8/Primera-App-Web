<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Loguin.aspx.cs" Inherits="Pokedex.Views.Loguin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label class="form-label">Email</label>                
                <asp:TextBox Placeholder="User Name" ID="txtEmail" REQUIRED="True" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ErrorMessage="El email es requerido" ControlToValidate="txtEmail" runat="server" />
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>                    
                <asp:TextBox ID="txtPass" TextMode="Password" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ErrorMessage="La contraseña es requerida" ControlToValidate="txtPass" runat="server" />
            </div>
            <div class="mb-3">               
                <asp:Button Text="Ingresar" CssClass="btn btn-primary" ID="btnIngresar" OnClick="btnIngresar_Click" runat="server" />
            </div>
        </div>
        <div class="col-6">
        </div>
    </div>
</div>
</asp:Content>
