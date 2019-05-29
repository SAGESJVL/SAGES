<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SeleccionPerfil.aspx.cs" Inherits="SAGESWebApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Sistema de Administración y Gestión</h1>
        <p class="lead">SAGES - DLab</p>
        <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>

    <div class="row">
        <div class="col-md-4">        
            <asp:label runat="server" ID="lblLogin">Selección de Perfil</asp:label><br />
            <asp:ImageButton runat="server" AlternateText="ADMIN" ImageUrl="~/img/Administrador.jpg" ID="ADMIN" Height="300px" Width="300px" OnClick="SeleccionPerfil"/><asp:ImageButton runat="server" AlternateText="DOCENTE" ImageUrl="~/img/Docente.png" ID="DOCENTE" Height="300px" Width="300px" OnClick="SeleccionPerfil" />
        </div>
    </div>

</asp:Content>
