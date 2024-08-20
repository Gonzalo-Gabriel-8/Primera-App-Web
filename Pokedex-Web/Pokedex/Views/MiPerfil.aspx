<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="Pokedex.Views.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>  

        function Validar() {
            //capturar el control 
            const txtApellido = document.getElementById("txtApellido");
            if (txtApellido.value == "") {
                alert("Debes cargar el apellido..");
                txtApellido.classList.add("is-invalid");
                txtApellido.classList.remove("is-valid");
                return false
            }
            txtApellido.classList.remove("is-invalid");
            txtApellido.classList.remove("is-valid");
            return true;
        }
    </script>
    <div class="container mt-4">
        <h1>Mi Perfil</h1>
        <div class="row">
            <div class="col-md-4">
                <div class="mb-3">
                    <label class="form-label" id="lblUser">Email</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Nombre</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtNombre" />
                    <asp:RequiredFieldValidator ErrorMessage="Debes ingresar un nombre " ControlToValidate="txtNombre" runat="server" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Apellido</label>
                    <asp:TextBox runat="server" CssClass="form-control" ClientIDMode="Static" ID="txtApellido" />
                    <asp:RequiredFieldValidator ErrorMessage="Debes ingresar un apellido " ControlToValidate="txtApellido" runat="server" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Fecha de Nacimiento</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtFechaNaciemiento" TextMode="Date" />

                </div>
            </div>
            <div class="col-md-4">
                <div class="mb-3">
                    <label class="form-label">Imagen Perfil</label>
                    <input type="file" id="txtImagen" runat="server" class="form-control" />
                </div>
                <asp:Image ID="imgNuevoPerfil" runat="server" CssClass="img-fluid mb-3" />
            </div>
        </div>
    </div>
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-4">
                <asp:Button runat="server" Text="Guardar" CssClass="btn btn-primary" ID="btnGuardar" OnClientClick="return Validar()" OnClick="btnGuardar_Click" />
                <a href="../Views/Default.aspx" class="btn btn-secondary">Regresar</a>
            </div>
        </div>
        <div class="row">
            <div class="col-12" style="text-align: right">
                <asp:Button ID="btnSalir" runat="server" CssClass="btn btn-outline-dark" Text="    Salir      " OnClick="btnSalir_Click" />
            </div>
        </div>
    </div>
</asp:Content>
