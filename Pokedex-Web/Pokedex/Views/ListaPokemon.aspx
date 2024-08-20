<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaPokemon.aspx.cs" Inherits="Pokedex.Views.ListaPokemon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container mt-1">
     <h2>Lista de Pokemons</h2>
     <div class="row">
         <div class="col-6">
             <div class="mb-3">
                 <asp:Label runat="server" Text="Filtrar"></asp:Label>
                 <asp:TextBox runat="server" ID="txtFiltro" AutoPostBack="true" OnTextChanged="filtro_TextChanged" CssClass="form-control" />
             </div>
         </div>
     </div>
     <%--Inicio Filtro Avanzado--%>
     <div class="col-6" style="display: flex; flex-direction: column; justify-content: flex-end;">
         <div class="mb-3">
             <asp:CheckBox Text="Filtro Avanzado" CssClass="" ID="chkAvanzado" AutoPostBack="true" OnCheckedChanged="chkAvanzado_CheckedChanged" runat="server" />
         </div>
     </div>
     <%if (chkAvanzado.Checked)
         {%>
     <div class="row">
         <div class="col-3">
             <div class="mb-3">
                 <asp:Label Text="Campo" ID="ddlCampo" runat="server"></asp:Label>
                 <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" ID="ddlCampos" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged">
                     <asp:ListItem Text="Nombre" />
                     <asp:ListItem Text="Tipo" />
                     <asp:ListItem Text="Numero" />
                 </asp:DropDownList>
             </div>
         </div>
         <div class="col-3">
             <div class="mb-3">
                 <asp:Label ID="Label1" runat="server" Text="Criterio"></asp:Label>
                 <asp:DropDownList runat="server" ID="ddlCriterio" CssClass="form-control"></asp:DropDownList>
             </div>
         </div>
         <div class="col-3">
             <div class="mb-3">
                 <asp:Label ID="Label2" runat="server" Text="Filtro"></asp:Label>
                 <asp:TextBox runat="server" ID="txtFiltroAvanzado" CssClass="form-control" />
             </div>
         </div>
         <div class="col-3">
             <div class="mb-3">
                 <asp:Label ID="Label3" runat="server" Text="Estado"></asp:Label>
                 <asp:DropDownList runat="server" ID="ddlEstado" CssClass="form-control">
                     <asp:ListItem Text="Todos" />
                     <asp:ListItem Text="Activo" />
                     <asp:ListItem Text="Inactivo" />
                 </asp:DropDownList>
             </div>
         </div>
     </div>
     <div class="row">
         <div class="col-3">
             <div class="mb-3">
                 <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" ID="btnBuscar" OnClick="btnBuscar_Click" />
             </div>
         </div>
     </div>
     <% }  %>
     <%-- Fin filtro avanzado--%>
     <asp:GridView ID="dgvPokemon" CssClass="table" runat="server" AutoGenerateColumns="false" DataKeyNames="Id"
         OnSelectedIndexChanged="dgvPokemon_SelectedIndexChanged"
         OnPageIndexChanging="dgvPokemon_PageIndexChanging"
         AllowPaging="true" PageSize="10">
         <Columns>
             <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
             <asp:BoundField HeaderText="Tipo" DataField="Tipo.Descripcion" />
             <asp:BoundField HeaderText="Numero" DataField="Numero" />
             <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
             <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="✍️" />
         </Columns>
     </asp:GridView>
     <a href="../Views/Formulario.aspx" class="btn btn-primary">Agregar</a>
 </div>

</asp:Content>
