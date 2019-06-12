<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SeleccionPerfil.aspx.cs" Inherits="SAGESWebApp.SeleccionPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div class="container2">

      <header>
          <div class="logo">
                <img src="img/sages.JPG" />
          </div>
          
           <div class="contenedor">
                <h3>SAGES - Sistema de Administración y Gestión</h3>
        </div>
         
    </header>  

    <div class="header">
            <h3><b>Selección de Perfil</b></h3>
        </div>

         <div class="gallery2">
            <asp:ImageButton runat="server" AlternateText="ADMIN" ImageUrl="~/img/Administrador.jpg" ID="ADMIN" Height="300px" Width="300px" OnClick="SeleccionarPerfil"/>
              <div class="desc"><h5>ADMINISTRADOR</h5></div>
          </div>   
            
          <div class="gallery2"> 
            <asp:ImageButton runat="server" AlternateText="DOCENTE" ImageUrl="~/img/Docente.png" ID="DOCENTE" Height="300px" Width="300px" OnClick="SeleccionarPerfil" />
              <div class="desc"><h5>DOCENTE</h5></div>
           </div>

</asp:Content>
