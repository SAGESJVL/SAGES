<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantenedorUsuarios.aspx.cs" Inherits="SAGESWebApp.MantenedorUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container">
    <header>
        <div class="logo">
            <img src="img/sages.JPG" />
        </div>
        <div class="contenedor">
            <h3>SAGES - Sistema de Administración y Gestión</h3>
        </div>
    </header> 

<div class="Usuarios">
    <div class="Minsu">
    <asp:Label runat="server" Width="280px">Seleccione un tipo de usuario:</asp:Label>
        <asp:DropDownList runat="server" ID="DropTipoUsuario" Width="250px" OnSelectedIndexChanged="DropTipoUsuario_SelectedIndexChanged" AutoPostBack="True">                                                                   
        </asp:DropDownList>
    </div>
    <br />
    <br />
    <asp:GridView ID="GridUsuarios" runat="server" AutoGenerateColumns="false" DataKeyNames="rut, correoElectronico" CssClass="mydatagrid" PagerStyle-CssClass="pager"
 HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True" OnPageIndexChanging="GridUsuarios_PageIndexChanging" OnRowCancelingEdit="GridUsuarios_RowCancelingEdit" OnRowDeleting="GridUsuarios_RowDeleting" OnRowEditing="GridUsuarios_RowEditing" OnRowUpdating="GridUsuarios_RowUpdating">  
                    <Columns>  
                        <asp:BoundField DataField="rut" HeaderText="Rut" ControlStyle-Width="100%" ReadOnly="TRUE"/>  
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" ControlStyle-Width="100%"/>  
                        <asp:BoundField DataField="apellido" HeaderText="Apellido" ControlStyle-Width="100%"/>  
                        <asp:BoundField DataField="correoElectronico" HeaderText="Correo" ControlStyle-Width="100%"/>                       
                        <asp:BoundField DataField="estado" HeaderText="Estado" ControlStyle-Width="100%" />  
                        <asp:BoundField DataField="tipoPerfil" HeaderText="Tipo Perfil" ControlStyle-Width="100%" />
                        <asp:CommandField ShowEditButton="true" ButtonType="Image" HeaderText="Editar" EditImageUrl="~/img/Edit.jpg" UpdateImageUrl="~/img/Confirmar.jpg" CancelImageUrl="~/img/Cancelar.jpg" ControlStyle-Height="25px"/>                     
<%--                        <asp:CommandField ShowDeleteButton="true" ButtonType="Image" HeaderText="Deshabilitar" DeleteImageUrl="~/img/DeshabilitarUsuario.png" ControlStyle-Height="25px"/>
                        <asp:CommandField ShowCancelButton="true" ButtonType="Image" HeaderText="Bloquear" CancelImageUrl="~/img/BloquearUsuario.png"/>
                        <asp:CommandField ShowSelectButton="true" ButtonType="Image" HeaderText="Activar" SelectImageUrl="~/img/ActivarUsuario.png"/>--%>
                    </Columns>  
                </asp:GridView> 
    <br />
    <div class="but">
        <asp:Button runat="server" ID="Crea" Text="Nuevo Usuario" Width="133px"  Height="24px" CssClass="btGrisNegrita" OnClick="Crea_Click" />
    </div>
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
            <div class="but">
                <asp:Button runat="server" Width="133px"  Height="24px" CssClass="btGrisNegrita" OnClick="CreaUsuario_Click" Text="Crear Usuario" ID="CreaUsuario"/>
            </div>
                </asp:View>        
    </asp:MultiView>   
    <%--<asp:label runat="server" Width="300px" ID="AdminCambioClave"></asp:label>
    <br />--%>
    </div>
    </div>
</asp:Content>