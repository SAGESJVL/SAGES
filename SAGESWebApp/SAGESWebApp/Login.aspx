<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SAGESWebApp.Login" %>
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
      


    <div class="header">
            
        </div>
<div id="signup">
        <div class="Minsu">
            <h3>Bienvenido a D-Lab INACAP Apoquindo</h3>
            <h6><b>Ingrese su usuario y contraseña para continuar:</b></h6>
        </div>
        <div class="inputs">
            <asp:Login ID="Login_" runat="server" OnAuthenticate="Login_Authenticate"
                LoginButtonText= "Ingresar"
                PasswordLabelText="Contraseña:" RememberMeText="Recordarme la próxima vez."
                UserNameLabelText="Usuario:">
            </asp:Login>
        </div>
    </div>
</div>
 

</asp:Content>