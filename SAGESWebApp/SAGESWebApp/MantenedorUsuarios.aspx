<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantenedorUsuarios.aspx.cs" Inherits="SAGESWebApp.MantenedorUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="jumbotron">
        <h1>Sistema de Administración y Gestión</h1>
        <p class="lead">SAGES - DLab</p>
        <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>

    <asp:Label runat="server" Width="300px">Seleccione un tipo de usuario:</asp:Label><asp:DropDownList runat="server" ID="DropTipoUsuario" Width="400px" OnSelectedIndexChanged="DropTipoUsuario_SelectedIndexChanged" AutoPostBack="True">                                                                   
                                                                     </asp:DropDownList>
    <br />
    <br />
    <asp:GridView ID="GridUsuarios" runat="server" AutoGenerateColumns="false" DataKeyNames="rut" OnPageIndexChanging="GridUsuarios_PageIndexChanging" OnRowCancelingEdit="GridUsuarios_RowCancelingEdit" OnRowEditing="GridUsuarios_RowEditing" OnRowUpdating="GridUsuarios_RowUpdating" onrowdatabound="GridUsuarios_RowDataBound" OnSelectedIndexChanged="GridUsuarios_SelectedIndexChanged">  
                    <Columns>  
                        <asp:BoundField DataField="rut" HeaderText="Rut" ControlStyle-Width="100%" ReadOnly="TRUE"/>  
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" ControlStyle-Width="100%"/>  
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" ControlStyle-Width="100%"/>  
                        <asp:BoundField DataField="correoElectronico" HeaderText="Correo" ControlStyle-Width="100%"/> 
                        <asp:TemplateField HeaderText="Estado">  
                            <EditItemTemplate>  
                                <asp:DropDownList ID="DropEstadoUsuario" runat="server"></asp:DropDownList>  
                            </EditItemTemplate>  
                            <ItemTemplate>  
                                <asp:DropDownList ID="DropEstadoUsuario" runat="server"  AppendDataBoundItems = "true">  
                                </asp:DropDownList>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <%--<asp:BoundField DataField="estado" HeaderText="Estado" ControlStyle-Width="100%" />  --%>
                        <asp:TemplateField HeaderText="Tipo Usuario">  
                            <EditItemTemplate>  
                                <asp:DropDownList ID="DropTipoUsuarioGrid" runat="server"></asp:DropDownList>  
                            </EditItemTemplate>  
                            <ItemTemplate>  
                                <asp:DropDownList ID="DropTipoUsuarioGrid" runat="server"  AppendDataBoundItems = "true">  
                                </asp:DropDownList>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <%--<asp:BoundField DataField="tipoPerfil" HeaderText="Tipo Perfil" ControlStyle-Width="100%" />--%>
                        <asp:CommandField ShowEditButton="true" ButtonType="Image" HeaderText="Editar" EditImageUrl="~/img/Edit.png" UpdateImageUrl="~/img/Confirmar.png" CancelImageUrl="~/img/Cancelar.png" ControlStyle-Height="25px"/>                     
<%--                        <asp:CommandField ShowDeleteButton="true" ButtonType="Image" HeaderText="Deshabilitar" DeleteImageUrl="~/img/DeshabilitarUsuario.png" ControlStyle-Height="25px"/>
                        <asp:CommandField ShowCancelButton="true" ButtonType="Image" HeaderText="Bloquear" CancelImageUrl="~/img/BloquearUsuario.png"/>
                        <asp:CommandField ShowSelectButton="true" ButtonType="Image" HeaderText="Activar" SelectImageUrl="~/img/ActivarUsuario.png"/>--%>
                    </Columns>  
                </asp:GridView> 
    <br />
    <br />   
    <br /> 
    <asp:Button runat="server" ID="Crea" Text="Nuevo Usuario" OnClick="Crea_Click" />
    <br />   
    <br />
    <asp:MultiView ID="Opciones" runat="server">
        <asp:View ID="Crear" runat="server">
            <br />
            <asp:label runat="server" Width="300px">Rut:</asp:label><asp:TextBox ID="Rut_Usuario" runat="server" OnTextChanged="Rut_Usuario_TextChanged" Width="500px"></asp:TextBox>
            <br />
            <br />
            <asp:label runat="server" Width="1000px" ID="existeUsuario"></asp:label>
            <br />
            <br />
            <asp:label runat="server" Width="300px">Correo Usuario:</asp:label><asp:TextBox ID="Correo_Usuario" runat="server" Width="500px"></asp:TextBox>
            <br />
            <br />
            <asp:label runat="server" Width="300px">Nombre:</asp:label><asp:TextBox ID="Nombre_Usuario" runat="server" Width="500px"></asp:TextBox>
            <br />
            <br />
            <asp:label runat="server" Width="300px">Apellido:</asp:label><asp:TextBox ID="Apellido_Usuario" runat="server" Width="500px"></asp:TextBox>
            <br />
            <br />
            <asp:label runat="server" Width="300px">Tipo de Perfil:</asp:label><asp:DropDownList ID="Perfil_Usuario" runat="server" AppendDataBoundItems="false" Width="500px">
                                                                                <asp:ListItem Value="0">Seleccione...</asp:ListItem>
                                                                                <asp:ListItem Value="1">DOCENTE</asp:ListItem>
                                                                                <asp:ListItem Value="2">DOCENTE-ADMINISTRADOR</asp:ListItem>
                                                                                <asp:ListItem Value="3">ADMINISTRADOR</asp:ListItem>
                                                                               </asp:DropDownList>           
            <%--<asp:label runat="server" Width="300px">Estado:</asp:label><asp:DropDownList ID="Estado_Usuario" runat="server" AppendDataBoundItems="false" Width="500px">
                                                                                <asp:ListItem Value="0">Seleccione...</asp:ListItem>
                                                                                <asp:ListItem Value="1">ACTIVO</asp:ListItem>
                                                                                <asp:ListItem Value="2">BLOQUEADO</asp:ListItem>
                                                                                <asp:ListItem Value="3">DESHABILITADO</asp:ListItem>
                                                                               </asp:DropDownList>--%>
            <br />
            <br />
            <asp:Button runat="server" OnClick="CreaUsuario_Click" Text="Crear Usuario" ID="CreaUsuario"/>
        </asp:View>        
    </asp:MultiView>   
    <%--<asp:label runat="server" Width="300px" ID="AdminCambioClave"></asp:label>
    <br />--%>
</asp:Content>