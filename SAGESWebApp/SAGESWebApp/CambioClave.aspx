<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CambioClave.aspx.cs" Inherits="SAGESWebApp.CambioClave" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 
     <div class ="container2">

      <header>
          <div class="logo">
                <img src="img/sages.JPG" />
          </div>
          
           <div class="contenedor">
                <h3>SAGES - Sistema de Administración y Gestión</h3>
        </div>
    </header>  

      <div class="header">
            <h3>Cambio de Contraseña</h3>
        </div>
    <div class="contra">    
 <table>
	<tr>
		<td style="height: 50px">
			<asp:label runat="server" Width="300px">Ingrese su contraseña actual:</asp:label>
		</td>
		<td style="height: 50px">
			<asp:TextBox textmode="Password" ID="PassActual" runat="server"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<td>
		    <asp:label runat="server" Width="300px">Ingrese su nueva contraseña:</asp:label>
		</td>
		<td>
			<asp:TextBox textmode="Password" ID="PassNueva" runat="server"></asp:TextBox>
		</td>
	</tr>
     <tr>
		<td>
            <asp:label runat="server" Width="300px">Reingrese su nueva contraseña:</asp:label>
		</td>
		<td>
			<asp:TextBox textmode="Password" ID="PassNueva2" runat="server"></asp:TextBox>
		</td>
     </tr>	
</table>
	
            <asp:Button runat="server" id="CambioContra" text="Cambiar contraseña" OnClick="ValidarContraseña"/>
        
</div>
    </div>

 

</asp:Content>
