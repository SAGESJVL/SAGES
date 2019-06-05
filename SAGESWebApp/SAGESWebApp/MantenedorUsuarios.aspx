﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantenedorUsuarios.aspx.cs" Inherits="SAGESWebApp.MantenedorUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container"> <%--Contenedor ppal --%>

      <header>
          <div class="logo">
                <img src="img/sages.JPG" />
          </div>
          
           <div class="contenedor">
                <h3>SAGES - Sistema de Administración y Gestión</h3>
        </div>
    </header>  

<div class="text">
    Para comenzar, ingrese RUT de Usuario.
  </div> 

    <div id="usuarios">
            <asp:label runat="server" Width="300px">Rut:</asp:label><asp:TextBox ID="Rut_Usuario" runat="server" OnTextChanged="Rut_Usuario_TextChanged" Width="500px"></asp:TextBox>
            <br />
            <asp:label runat="server" Width="1000px" ID="existeUsuario"></asp:label>
            <br />
            <asp:label runat="server" Width="300px">Correo Usuario:</asp:label><asp:TextBox ID="Correo_Usuario" runat="server" Width="500px"></asp:TextBox>
            <br />
            <asp:label runat="server" Width="300px">Nombre:</asp:label><asp:TextBox ID="Nombre_Usuario" runat="server" Width="500px"></asp:TextBox>
            <br />
            <asp:label runat="server" Width="300px">Apellido:</asp:label><asp:TextBox ID="Apellido_Usuario" runat="server" Width="500px"></asp:TextBox>
            <br />
            <asp:label runat="server" Width="300px">Tipo de Perfil:</asp:label><asp:DropDownList ID="Perfil_Usuario" runat="server" AppendDataBoundItems="false" Width="500px">
                                                                                <asp:ListItem Value="0">Seleccione...</asp:ListItem>
                                                                                <asp:ListItem Value="1">DOCENTE</asp:ListItem>
                                                                                <asp:ListItem Value="2">DOCENTE-ADMINISTRADOR</asp:ListItem>
                                                                                <asp:ListItem Value="3">ADMINISTRADOR</asp:ListItem>
                                                                               </asp:DropDownList>
            <br />
            <asp:label runat="server" Width="300px">Estado:</asp:label><asp:DropDownList ID="Estado_Usuario" runat="server" AppendDataBoundItems="false" Width="500px">
                                                                                <asp:ListItem Value="0">Seleccione...</asp:ListItem>
                                                                                <asp:ListItem Value="1">ACTIVO</asp:ListItem>
                                                                                <asp:ListItem Value="2">BLOQUEADO</asp:ListItem>
                                                                                <asp:ListItem Value="3">DESHABILITADO</asp:ListItem>
                                                                               </asp:DropDownList>
            <br />
            <br />

        <div class="boton">    
            <asp:Button runat="server" OnClick="CreaUsuario_Click" Text="Crear Usuario" ID="CreaUsuario"/>
        </div>

        <div class="boton"> 
             <asp:Button runat="server" OnClick="ModificaUsuario_Click" Text="Modificar Datos" ID="ModificaUsuario"/>
        </div>
        </div>
    </div>
</asp:Content>