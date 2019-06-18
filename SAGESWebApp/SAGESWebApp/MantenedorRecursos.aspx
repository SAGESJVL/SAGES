<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantenedorRecursos.aspx.cs" Inherits="SAGESWebApp.MantenedorRecursos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<h1>Mantenedor de Recursos</h1> 
    <p>En esta sección podrá ver los recursos existentes, modificar sus datos y crear nuevos recursos.
    <br />
    <asp:Label runat="server" Width="300px">Seleccione un tipo de recurso:</asp:Label><asp:DropDownList runat="server" ID="DropTipoRecurso" Width="400px" OnSelectedIndexChanged="DropTipoRecurso_SelectedIndexChanged" AutoPostBack="True">                                                                   
                                                                     </asp:DropDownList>
    <asp:GridView ID="GridRecursos" runat="server" AutoGenerateColumns="false" DataKeyNames="Descripcion" OnPageIndexChanging="GridRecursos_PageIndexChanging" OnRowCancelingEdit="GridRecursos_RowCancelingEdit" OnRowDeleting="GridRecursos_RowDeleting" OnRowEditing="GridRecursos_RowEditing" OnRowUpdating="GridRecursos_RowUpdating" onrowdatabound="GridRecursos_RowDataBound">  
                    <Columns>  
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripción" ControlStyle-Width="100%" ReadOnly="true"/>  
                        <asp:BoundField DataField="Fecha Compra" HeaderText="Fecha Compra" ControlStyle-Width="100%" ReadOnly="true"/>  
                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" ControlStyle-Width="100%"/>  
                        <asp:BoundField DataField="Marca" HeaderText="Marca" ControlStyle-Width="100%"/>  
                        <asp:TemplateField HeaderText="Tipo">  
                            <EditItemTemplate>  
                                <asp:DropDownList ID="DropTipoRecursoGrid" runat="server"></asp:DropDownList>  
                            </EditItemTemplate>  
                            <ItemTemplate>  
                                <asp:DropDownList ID="DropTipoRecursoGrid" runat="server"  AppendDataBoundItems = "true">  
                                </asp:DropDownList>  
                            </ItemTemplate>  
                        </asp:TemplateField>
                        <%--<asp:BoundField DataField="tipo" HeaderText="Tipo" ControlStyle-Width="100%"/>                       --%>
                        <asp:CommandField ShowEditButton="true" ButtonType="Image" HeaderText="Editar" EditImageUrl="~/img/Edit.png" UpdateImageUrl="~/img/Confirmar.png" CancelImageUrl="~/img/Cancelar.png" ControlStyle-Height="25px"/>                     
                        <%--<asp:CommandField ShowDeleteButton="true" ButtonType="Image" HeaderText="Eliminar" DeleteImageUrl="~/img/Delete.png" ControlStyle-Height="25px"/>--%>
                    </Columns>  
                </asp:GridView> 
    <br />
    <br />   
    <br /> 
    <asp:Button runat="server" ID="Crea" Text="Nuevo Recurso" OnClick="Crea_Click" />
    <br />   
    <br />
    <asp:MultiView ID="Opciones" runat="server">
        <asp:View ID="Crear" runat="server">
            <asp:Label runat="server" Width="300px">Descripción:</asp:Label><asp:TextBox runat="server" ID="crea_descripcion" TextMode="MultiLine" MaxLength="200" Height="50px" Width="400px" Wrap="true" ></asp:TextBox>
            <br />
            <br />
            <asp:Label runat="server" Width="300px">Marca:</asp:Label><asp:TextBox runat="server" ID="crea_marca" Width="400px" ></asp:TextBox>
            <br />
            <br />
            <asp:Label runat="server" Width="300px">Cantidad:</asp:Label><asp:TextBox runat="server" ID="crea_cantidad" TextMode="Number" min="0" Width="400px" ></asp:TextBox>
            <br />
            <br />
            <asp:Label runat="server" Width="300px">Tipo:</asp:Label><asp:DropDownList runat="server" ID="dropTipoCrear" Width="400px" AutoPostBack="True">                                                                        
                                                                     </asp:DropDownList>
            <br />
            <br />
            <asp:Button runat="server" ID="CreaRecurso" OnClick="CreaRecurso_Click" Text="Grabar" />
        </asp:View>        
    </asp:MultiView>   
</asp:Content>