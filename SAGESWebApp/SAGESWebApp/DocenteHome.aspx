<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DocenteHome.aspx.cs" Inherits="SAGESWebApp.DocenteHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="jumbotron">
        <h1>Sistema de Administración y Gestión</h1>
        <p class="lead">SAGES - DLab</p>
        <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>

    <div class="row">
        <div class="box1">
            <asp:ImageButton runat="server" AlternateText="CALENDARIO" ImageUrl="~/img/Calendario.png" ID="CALENDARIO" Height="300px" Width="300px" OnClick="Redireccionar"/>
        </div>
        <div class="box2">    
            <asp:ImageButton runat="server" AlternateText="AGENDA" ImageUrl="~/img/Angeda.png" ID="AGENDA" Height="300px" Width="300px" OnClick="Redireccionar"/>
        </div>
        <div class="box3">
            <asp:ImageButton runat="server" AlternateText="CPASS" ImageUrl="~/img/Contraseña.png" ID="CPASS" Height="300px" Width="300px" OnClick="Redireccionar"/>
        </div>
        <div class="box4">
            <asp:ImageButton runat="server" AlternateText="SALIR" ImageUrl="~/img/Salir.png" ID="SALIR" Height="300px" Width="300px" OnClick="Redireccionar"/>
        </div>           
    </div>

</asp:Content>