<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DocenteHome.aspx.cs" Inherits="SAGESWebApp.DocenteHome" %>
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
            <h3><b>Portal Docente</b></h3>
        </div>

     <div class="text">
                <h5>Bienvenido al portal, ¿Qué desea hacer hoy?</h5>
        </div>

     <div class="gallery">
         <asp:ImageButton runat="server" AlternateText="AGENDA" ImageUrl="~/img/Agenda.png" ID="AGENDA" OnClick="Redireccionar"/>
          <div class="desc"><h5>AGENDA</h5></div>
        </div>

        <div class="gallery">
            <asp:ImageButton runat="server" AlternateText="CALENDARIO" ImageUrl="~/img/Calendario.png" ID="ImageButton1"  OnClick="Redireccionar"/>
          <div class="desc"><h5>CALENDARIO</h5></div>
        </div>

       
        <div class="gallery">
         <asp:ImageButton runat="server" AlternateText="CPASS" ImageUrl="~/img/Contraseña.png" ID="CPASS" OnClick="Redireccionar"/>
          <div class="desc"><h5>CAMBIAR CONTRASEÑA</h5></div>
        </div>

        <div class="gallery">
          <asp:ImageButton runat="server" AlternateText="SALIR" ImageUrl="~/img/salir.png" ID="SALIR"  OnClick="Redireccionar"/>
          <div class="desc"><h5>SALIR</h5></div>
        </div>

 </div>


</asp:Content>