<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="SAGESWebApp.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="jumbotron">
        <h1>Sistema de Administración y Gestión</h1>
        <p class="lead">SAGES - DLab</p>
        <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h4>Bienvenido al portal administrativo, ¿Qué desea hacer hoy?</h4>
            <div class="box1">
                <asp:ImageButton runat="server" AlternateText="CALENDARIO" ImageUrl="~/img/Calendario.png" ID="CALENDARIO" Height="300px" Width="300px" OnClick="Redireccionar"/>
            </div>
            <div class="box2">
                <asp:ImageButton runat="server" AlternateText="USUARIOS" ImageUrl="~/img/Usuarios.png" ID="USUARIOS" Height="300px" Width="300px" OnClick="Redireccionar"/>
            </div>
            <div class="box3">
                <asp:ImageButton runat="server" AlternateText="SALAS" ImageUrl="~/img/Salas.png" ID="SALAS" Height="300px" Width="300px" OnClick="Redireccionar"/>
            </div>
            <div class="box4">
                <asp:ImageButton runat="server" AlternateText="REPORTES" ImageUrl="~/img/Reportes.png" ID="REPORTES" Height="300px" Width="300px" OnClick="Redireccionar"/>
            </div>
            <div class="box5">
                <asp:ImageButton runat="server" AlternateText="AGENDA" ImageUrl="~/img/Angeda.png" ID="AGENDA" Height="300px" Width="300px" OnClick="Redireccionar"/>
            </div>
            <div class="box6">
                <asp:ImageButton runat="server" AlternateText="INSUMOS" ImageUrl="~/img/Insumos.png" ID="INSUMOS" Height="300px" Width="300px" OnClick="Redireccionar"/>
            </div>
            <div class="box7">
                <asp:ImageButton runat="server" AlternateText="MAQUINARIA" ImageUrl="~/img/Maquinaria.png" ID="MAQUINARIA" Height="300px" Width="300px" OnClick="Redireccionar"/>
            </div>
             <div class="box9">
                <asp:ImageButton runat="server" AlternateText="CPASS" ImageUrl="~/img/Contraseña.png" ID="CPASS" Height="300px" Width="300px" OnClick="Redireccionar"/>
            </div>
            <div class="box8">
                <asp:ImageButton runat="server" AlternateText="SALIR" ImageUrl="~/img/Salir.png" ID="SALIR" Height="300px" Width="300px" OnClick="Redireccionar"/>
            </div>           
        </div>
    </div>

</asp:Content>