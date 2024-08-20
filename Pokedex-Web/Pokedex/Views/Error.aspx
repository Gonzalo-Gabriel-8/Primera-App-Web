<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Pokedex.Views.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container mt-4">
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <h3>Hubo un Error</h3>                
                <asp:Label Text="text" ID="lblMensaje" runat="server" />               
            </div>
        </div>
    </div>
</div>
</asp:Content>
