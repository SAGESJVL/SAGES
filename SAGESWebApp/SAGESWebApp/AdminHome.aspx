<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="SAGESWebApp.AdminHome" %>
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
            <h3><b>Portal Administrador</b></h3>
        </div>

     <div class="text">
                <h5>Bienvenido al portal, ¿Qué desea hacer hoy?</h5>
        </div>


            <div class="gallery3">
                <asp:ImageButton runat="server" AlternateText="CALENDARIO" ImageUrl="~/img/Calendario.png" ID="CALENDARIO" Height="80px" Width="80px" OnClick="Redireccionar"/>
                <div class="desc"><h5>CALENDARIO</h5></div>
            </div>
            <div class="gallery3">
                <asp:ImageButton runat="server" AlternateText="USUARIOS" ImageUrl="~/img/Usuarios.png" ID="USUARIOS" Height="80px" Width="80px" OnClick="Redireccionar"/>
                <div class="desc"><h5>USUARIOS</h5></div>
            </div>
            <div class="gallery3">
                <asp:ImageButton runat="server" AlternateText="SALAS" ImageUrl="~/img/Salas.png" ID="SALAS" Height="80px" Width="80px" OnClick="Redireccionar"/>
                <div class="desc"><h5>SALAS</h5></div>
            </div>
            <div class="gallery3">
                <asp:ImageButton runat="server" AlternateText="REPORTES" ImageUrl="~/img/Reportes.png" ID="REPORTES" Height="80px" Width="80px" OnClick="Redireccionar"/>
                <div class="desc"><h5>REPORTES</h5></div>
            </div>
            <div class="gallery3">
                <asp:ImageButton runat="server" AlternateText="AGENDA" ImageUrl="~/img/Agenda.png" ID="AGENDA" Height="80px" Width="80px" OnClick="Redireccionar"/>
                <div class="desc"><h5>AGENDA</h5></div>
            </div>
            <div class="gallery3">
                <asp:ImageButton runat="server" AlternateText="INSUMOS" ImageUrl="~/img/Insumos.png" ID="INSUMOS" Height="80px" Width="80px" OnClick="Redireccionar"/>
                <div class="desc"><h5>INSUMOS</h5></div>
            </div>
            <div class="gallery3">
                <asp:ImageButton runat="server" AlternateText="MAQUINARIA" ImageUrl="~/img/Maquinaria.png" ID="MAQUINARIA" Height="80px" Width="80px" OnClick="Redireccionar"/>
                <div class="desc"><h5>MAQUINARIA</h5></div>
            </div>
             <div class="gallery3">
                <asp:ImageButton runat="server" AlternateText="CPASS" ImageUrl="~/img/Contraseña.png" ID="CPASS" Height="80px" Width="80px" OnClick="Redireccionar"/>
                <div class="desc"><h5>CAMBIO DE CONTRASEÑA</h5></div>
             </div>
            <div class="gallery3">
                <asp:ImageButton runat="server" AlternateText="SALIR" ImageUrl="~/img/Salir.png" ID="SALIR" Height="80px" Width="80px" OnClick="Redireccionar"/>
                <div class="desc"><h5>SALIR</h5></div>
            </div>           
        </div>
    
</asp:Content>