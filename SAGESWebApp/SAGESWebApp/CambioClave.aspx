<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CambioClave.aspx.cs" Inherits="SAGESWebApp.CambioClave" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Sistema de Administración y Gestión</h1>
        <p class="lead">SAGES - DLab</p>
        <%--<p><a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a></p>--%>
    </div>

    <div class="row">
        
            <asp:label runat="server" Width="300px">Ingrese su contraseña actual:</asp:label><asp:TextBox textmode="Password" ID="PassActual" runat="server"></asp:TextBox>
            <br />
            <asp:label runat="server" Width="300px">Ingrese su nueva contraseña:</asp:label><asp:TextBox textmode="Password" ID="PassNueva" runat="server"></asp:TextBox>
            <br />
            <asp:label runat="server" Width="300px">Reingrese su nueva contraseña:</asp:label><asp:TextBox textmode="Password" ID="PassNueva2" runat="server"></asp:TextBox>
            <br /><br />
            <asp:Button runat="server" text="Cambiar contraseña" OnClick="ValidarContraseña"/>
        
    </div>

    </div>

</asp:Content>
