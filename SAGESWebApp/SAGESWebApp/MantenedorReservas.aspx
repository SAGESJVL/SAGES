<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantenedorReservas.aspx.cs" Inherits="SAGESWebApp.MantenedorReservas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="GridReservaUserPendiente" runat="server" AutoGenerateColumns="false" DataKeyNames="idSolicitud" OnPageIndexChanging="GridInsumos_PageIndexChanging" OnRowCancelingEdit="GridInsumos_RowCancelingEdit" OnRowEditing="GridReservaUserPendiente_RowEditing" OnRowUpdating="GridReservaUserPendiente_RowUpdating">  
                    <Columns>  
                        <asp:BoundField DataField="descripcionInsumos" HeaderText="Descripción" ControlStyle-Width="100%" />  
                        <asp:BoundField DataField="tipo" HeaderText="Tipo" ControlStyle-Width="100%"/>  
                        <asp:BoundField DataField="cantidad" HeaderText="Cantidad" ControlStyle-Width="100%"/>  
                        <asp:BoundField DataField="unidadMedida" HeaderText="U. Medida" ControlStyle-Width="100%"/>                       
                        <asp:CommandField ShowEditButton="true" ButtonType="Image" HeaderText="Editar" EditImageUrl="~/img/Edit.png" UpdateImageUrl="~/img/Confirmar.png" CancelImageUrl="~/img/Cancelar.png" ControlStyle-Height="25px"/>                     
                        <asp:CommandField ShowDeleteButton="true" ButtonType="Image" HeaderText="Eliminar" DeleteImageUrl="~/img/Delete.png" ControlStyle-Height="25px"/>
                    </Columns>  
                </asp:GridView> 

    <asp:GridView ID="GridReservaUserAceptada" runat="server" AutoGenerateColumns="false" DataKeyNames="idSolicitud" OnPageIndexChanging="GridInsumos_PageIndexChanging">  
                    <Columns>  
                        <asp:BoundField DataField="descripcionInsumos" HeaderText="Descripción" ControlStyle-Width="100%" />  
                        <asp:BoundField DataField="tipo" HeaderText="Tipo" ControlStyle-Width="100%"/>  
                        <asp:BoundField DataField="cantidad" HeaderText="Cantidad" ControlStyle-Width="100%"/>  
                        <asp:BoundField DataField="unidadMedida" HeaderText="U. Medida" ControlStyle-Width="100%"/>                       
                        <asp:CommandField ShowEditButton="true" ButtonType="Image" HeaderText="Editar" EditImageUrl="~/img/Edit.png" UpdateImageUrl="~/img/Confirmar.png" CancelImageUrl="~/img/Cancelar.png" ControlStyle-Height="25px"/>                     
                        <asp:CommandField ShowDeleteButton="true" ButtonType="Image" HeaderText="Eliminar" DeleteImageUrl="~/img/Delete.png" ControlStyle-Height="25px"/>
                    </Columns>  
                </asp:GridView> 

    
    <asp:Label runat="server" Width="300px">Seleccione estado de reserva:</asp:Label><asp:DropDownList runat="server" ID="DropTipoInsumo" Width="400px" OnSelectedIndexChanged="DropTipoInsumo_SelectedIndexChanged" AutoPostBack="True">                                                                   
                                                                     </asp:DropDownList>
    <asp:GridView ID="GridReservaAdmin" runat="server" AutoGenerateColumns="false" DataKeyNames="idInsumo" OnPageIndexChanging="GridInsumos_PageIndexChanging" OnRowCancelingEdit="GridInsumos_RowCancelingEdit" OnRowDeleting="GridInsumos_RowDeleting" OnRowEditing="GridInsumos_RowEditing" OnRowUpdating="GridInsumos_RowUpdating">  
                    <Columns>  
                        <asp:BoundField DataField="descripcionInsumos" HeaderText="Descripción" ControlStyle-Width="100%" />  
                        <asp:BoundField DataField="tipo" HeaderText="Tipo" ControlStyle-Width="100%"/>  
                        <asp:BoundField DataField="cantidad" HeaderText="Cantidad" ControlStyle-Width="100%"/>  
                        <asp:BoundField DataField="unidadMedida" HeaderText="U. Medida" ControlStyle-Width="100%"/>                       
                        <asp:CommandField ShowEditButton="true" ButtonType="Image" HeaderText="Editar" EditImageUrl="~/img/Edit.png" UpdateImageUrl="~/img/Confirmar.png" CancelImageUrl="~/img/Cancelar.png" ControlStyle-Height="25px"/>                     
                        <asp:CommandField ShowDeleteButton="true" ButtonType="Image" HeaderText="Eliminar" DeleteImageUrl="~/img/Delete.png" ControlStyle-Height="25px"/>
                    </Columns>  
                </asp:GridView> 
    <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>
</asp:Content>
