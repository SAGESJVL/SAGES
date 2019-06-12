<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantenedorInsumos.aspx.cs" Inherits="SAGESWebApp.MantenedorInsumos" %>
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
            <h3>Mantenedor de Insumos</h3>
        </div>

    <div class="text">  

        <p>En esta sección podrá ver los insumos existentes en la Base de Datos, crear nuevos insumos, modificar sus datos y aumentar o disminuir la cantidad de estos.</p>
        <br />
        
    </div>

    <div class="tabla">

        <p id="text-inside">Existencias:</p>

        <asp:GridView ID="GridInsumos" runat="server">    
        </asp:GridView>

    </div>
    <br />
    <br />   
    <br /> 
      <div class="botones">

         <table id="opc">
             <tr>
                 <td>
                     <asp:Label runat="server" Width="300px">Seleccione una operación:</asp:Label>
                 </td>
                 <td>
                      <asp:DropDownList runat="server" ID="DropOpcionesView" Width="400px" OnSelectedIndexChanged="DropOpcionesView_SelectedIndexChanged" AutoPostBack="True">
                            <asp:ListItem Value="0">Seleccione una operación</asp:ListItem>
                            <asp:ListItem Value="1">CREAR INSUMO</asp:ListItem>
                            <asp:ListItem Value="2">MODIFICAR INSUMO</asp:ListItem>
                            <asp:ListItem Value="3">MODIFICAR CANTIDAD</asp:ListItem>
                        </asp:DropDownList>
                 </td>
             </tr>
         </table>
    
    </div>
    <br /> 

      
<div class="crear">
   
   <asp:MultiView ID="MultiView1" runat="server">
		<asp:View ID="Crear" runat="server">
		
			<table id="tablaCrear">
				<tr>
					<td>
					<asp:Label runat="server" Width="100px">Descripción:</asp:Label>
					</td>
					<td>
					<asp:TextBox runat="server" ID="TextBox1" TextMode ="MultiLine" MaxLength ="200" Wrap ="true"></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						<asp:Label runat="server" Width="100px">Tipo:</asp:Label>
					</td>
					<td>
						<asp:TextBox runat="server" ID="tipoInsumo" Width="300px" placeholder="Filamento, PVC, Tela, Vinilo" ></asp:TextBox>
					</td>
				</tr>
				<tr>
					<td>
						<asp:Label runat="server" Width="300px">Unidad de Medida:</asp:Label>
					</td>
					<td>
						<asp:DropDownList runat="server" ID="dropUnidadMedidaCrear" Width="305px" AutoPostBack="True">
						<asp:ListItem Value="0">Seleccione una unidad</asp:ListItem>
						<asp:ListItem Value="1">KILOGRAMO</asp:ListItem>
						<asp:ListItem Value="2">METRO</asp:ListItem>
						<asp:ListItem Value="3">UNIDAD</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>
                
            </table>
                    <asp:Button runat="server" ID="CreaInsumo" OnClick="CreaInsumo_Click" Text="Crear Insumo" />
        </asp:View>
 
  </asp:MultiView> 
			 
 </div>
     
  <div class="crear">

 <asp:MultiView ID="Opciones" runat="server">
        <asp:View ID="Modificar" runat="server">
		
		<table>
			<tr>
				<td>
					<asp:Label runat="server" Width="290px">Ingrese Id de Insumo a modificar:</asp:Label>
				</td>
				<td>
					<asp:TextBox runat="server" ID="idInsumo" Width="300px" OnTextChanged="idInsumo_TextChanged"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td style="height: 50px">
				   <asp:Label runat="server" Width="100px">Descripción:</asp:Label>
				</td>
				<td style="height: 50px">
				   <asp:TextBox runat="server" ID="TextBox2" TextMode="MultiLine" MaxLength="200" Height="20px" Width="300px" Wrap="true" ></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label runat="server" Width="100px">Tipo:</asp:Label>
				</td>
				<td>
					<asp:TextBox runat="server" ID="TextBox3" Width="300px" placeholder="Filamento, PVC, Tela, Vinilo" ></asp:TextBox>
				</td>
            </tr>
            <tr>
				<td>
					<asp:Label runat="server" Width="300px">Unidad de Medida:</asp:Label>
				</td>
				<td>
					<asp:DropDownList runat="server" ID="dropUnidadMedidaModificar" Width="300px" AutoPostBack="True">
                    <asp:ListItem Value="0">Seleccione una unidad</asp:ListItem>
                    <asp:ListItem Value="1">KILOGRAMO</asp:ListItem>
                    <asp:ListItem Value="2">METRO</asp:ListItem>
                    <asp:ListItem Value="3">UNIDAD</asp:ListItem>
                    </asp:DropDownList>
				</td>
			</tr>
		</table>
		
            <asp:Button runat="server" ID="ModificaInsumo" OnClick="ModificaInsumo_Click" Text="Modificar Datos"/>
		</asp:View>   
	</asp:MultiView> 
</div>

<div class="crear">
	<asp:MultiView ID="MultiView2" runat="server">
		<asp:View ID="Cantidad" runat="server">
		
		<table>
			<tr>
				<td>
					<asp:Label runat="server" Width="290px">Ingrese Id de Insumo:</asp:Label>
				</td>
				<td>
					<asp:TextBox runat="server" ID="IdInsumoCantidad" OnTextChanged="idInsumo_TextChanged" Width="300px"></asp:TextBox>
				</td>
			</tr>
			<tr>
				<td>
					<asp:Label runat="server" Width="100px">Cantidad:</asp:Label>
				</td>
				<td>
					<asp:TextBox runat="server" ID="valorCantidad" Width="300px" ></asp:TextBox>
				</td>
            </tr>
			<tr>
				<td>
					<asp:Label runat="server" Width="100px">Operación:</asp:Label>
				</td>
				<td>
					<asp:DropDownList runat="server" ID="DropCantidad" Width="300px" AutoPostBack="True">
						<asp:ListItem Value="0">Seleccione una operacion</asp:ListItem>
						<asp:ListItem Value="1">AUMENTAR</asp:ListItem>
						<asp:ListItem Value="2">DISMINUIR</asp:ListItem>     
					 </asp:DropDownList>
				</td>
			</tr>
		</table>
            <asp:Button runat="server" ID="ActualizaCantidad" OnClick="ActualizaCantidad_Click" Text="Actualizar Cantidad"/>
        </asp:View>
      </asp:MultiView>   
            
</div>
       
   </div>
    
</asp:Content>
