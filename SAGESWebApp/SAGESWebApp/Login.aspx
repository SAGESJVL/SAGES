<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SAGESWebApp.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


<div class="jumbotron">

    <header>
           <div class="contenedor">
               <div>Icons made by <a href="https://www.flaticon.com/authors/roundicons" title="Roundicons">Roundicons</a> from <a href="https://www.flaticon.com/" 			    title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" 			    title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
                <h1 class="icon-venus">Sistema de Administración y Gestión</h1>
      
        </div>
        </header>
      
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Bienvenido a D-Lab INACAP Apoquindo</h2>
            <h4>Ingrese su usuario y contraseña para continuar:</h4>
            <asp:Login ID="Login_" runat="server" OnAuthenticate="Login_Authenticate"
                LoginButtonText= "Ingresar"
                PasswordLabelText="Contraseña:" RememberMeText="Recordarme la próxima vez."
                UserNameLabelText="Usuario:">
            </asp:Login>
        </div>
    </div>

</asp:Content>
