<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantenedorInsumos.aspx.cs" Inherits="SAGESWebApp.MantenedorInsumos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <h1>Mantenedor de Insumos</h1> 
    <p>En esta sección podrá ver los insumos existentes, modificar sus datos y crear nuevos insumos.
    <br />
    <asp:Label runat="server" Width="300px">Seleccione un tipo de insumo:</asp:Label><asp:DropDownList runat="server" ID="DropTipoInsumo" Width="400px" OnSelectedIndexChanged="DropTipoInsumo_SelectedIndexChanged" AutoPostBack="True">                                                                   
                                                                     </asp:DropDownList>
    <asp:GridView ID="GridInsumos" runat="server" AutoGenerateColumns="false" DataKeyNames="idInsumo" OnPageIndexChanging="GridInsumos_PageIndexChanging" OnRowCancelingEdit="GridInsumos_RowCancelingEdit" OnRowDeleting="GridInsumos_RowDeleting" OnRowEditing="GridInsumos_RowEditing" OnRowUpdating="GridInsumos_RowUpdating">  
                    <Columns>  
                        <asp:BoundField DataField="descripcionInsumos" HeaderText="Descripción" ControlStyle-Width="100%" />  
                        <asp:BoundField DataField="tipo" HeaderText="Tipo" ControlStyle-Width="100%"/>  
                        <asp:BoundField DataField="cantidad" HeaderText="Cantidad" ControlStyle-Width="100%"/>  
                        <asp:BoundField DataField="unidadMedida" HeaderText="U. Medida" ControlStyle-Width="100%"/>                       
                        <asp:CommandField ShowEditButton="true" ButtonType="Image" HeaderText="Editar" EditImageUrl="~/img/Edit.png" UpdateImageUrl="~/img/Confirmar.png" CancelImageUrl="~/img/Cancelar.png" ControlStyle-Height="25px"/>                     
                        <asp:CommandField ShowDeleteButton="true" ButtonType="Image" HeaderText="Eliminar" DeleteImageUrl="~/img/Delete.png" ControlStyle-Height="25px"/>
                    </Columns>  
                </asp:GridView> 
    <br />
    <br />   
    <br /> 
    <asp:Button runat="server" ID="Crea" Text="Nuevo Insumo" OnClick="Crea_Click" />
    <br />   
    <br />
    <asp:MultiView ID="Opciones" runat="server">
        <asp:View ID="Crear" runat="server">
            <asp:Label runat="server" Width="300px">Descripción:</asp:Label><asp:TextBox runat="server" ID="crea_descripcion" TextMode="MultiLine" MaxLength="200" Height="50px" Width="400px" Wrap="true" ></asp:TextBox>
            <br />
            <br />
            <asp:Label runat="server" Width="300px">Tipo:</asp:Label><asp:TextBox runat="server" ID="crea_tipo" Width="400px" placeholder="Filamento, PVC, Tela, Vinilo" ></asp:TextBox>
            <br />
            <br />
            <asp:Label runat="server" Width="300px">Cantidad:</asp:Label><asp:TextBox runat="server" ID="crea_cantidad" TextMode="Number" min="0" Width="400px" ></asp:TextBox>
            <br />
            <br />
            <asp:Label runat="server" Width="300px">Unidad de Medida:</asp:Label><asp:DropDownList runat="server" ID="dropUnidadMedidaCrear" Width="400px" AutoPostBack="True">
                                                                        <asp:ListItem Value="0">Seleccione una unidad</asp:ListItem>
                                                                        <asp:ListItem Value="1">KILOGRAMO</asp:ListItem>
                                                                        <asp:ListItem Value="2">METRO</asp:ListItem>
                                                                        <asp:ListItem Value="3">UNIDAD</asp:ListItem>
                                                                     </asp:DropDownList>
            <br />
            <br />
            <asp:Button runat="server" ID="CreaInsumo" OnClick="CreaInsumo_Click" Text="Grabar" />
        </asp:View>        
    </asp:MultiView>   
</asp:Content>
