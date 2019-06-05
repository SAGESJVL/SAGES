<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantenedorInsumos.aspx.cs" Inherits="SAGESWebApp.MantenedorInsumos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <h1>Mantenedor de Insumos</h1> 
    <p>En esta sección podrá ver los insumos existentes en la Base de Datos, crear nuevos insumos, modificar sus datos y aumentar o disminuir la cantidad de estos.</p>
    <br />
    <p>Existencias:</p>
    <asp:GridView ID="GridInsumos" runat="server">    
    </asp:GridView>
    <br />
    <br />   
    <br /> 
    <asp:Label runat="server" Width="300px">Seleccione una operación:</asp:Label><asp:DropDownList runat="server" ID="DropOpcionesView" Width="400px" OnSelectedIndexChanged="DropOpcionesView_SelectedIndexChanged" AutoPostBack="True">
                                                                        <asp:ListItem Value="0">Seleccione una operación</asp:ListItem>
                                                                        <asp:ListItem Value="1">CREAR INSUMO</asp:ListItem>
                                                                        <asp:ListItem Value="2">MODIFICAR INSUMO</asp:ListItem>
                                                                        <asp:ListItem Value="3">MODIFICAR CANTIDAD</asp:ListItem>
                                                                     </asp:DropDownList>
    <br /> 
    <asp:MultiView ID="Opciones" runat="server">
        <asp:View ID="Crear" runat="server">
            <asp:Label runat="server" Width="300px">Descripción:</asp:Label><asp:TextBox runat="server" ID="TextBox1" TextMode="MultiLine" MaxLength="200" Height="100px" Width="400px" Wrap="true" ></asp:TextBox>
            <br />
            <asp:Label runat="server" Width="300px">Tipo:</asp:Label><asp:TextBox runat="server" ID="tipoInsumo" Width="400px" placeholder="Filamento, PVC, Tela, Vinilo" ></asp:TextBox>
            <br />
            <asp:Label runat="server" Width="300px">Unidad de Medida:</asp:Label><asp:DropDownList runat="server" ID="dropUnidadMedidaCrear" Width="400px" AutoPostBack="True">
                                                                        <asp:ListItem Value="0">Seleccione una unidad</asp:ListItem>
                                                                        <asp:ListItem Value="1">KILOGRAMO</asp:ListItem>
                                                                        <asp:ListItem Value="2">METRO</asp:ListItem>
                                                                        <asp:ListItem Value="3">UNIDAD</asp:ListItem>
                                                                     </asp:DropDownList>
            <br />
            <asp:Button runat="server" ID="CreaInsumo" OnClick="CreaInsumo_Click" Text="Crear Insumo" />
        </asp:View>
        <asp:View ID="Modificar" runat="server">
            <asp:Label runat="server" Width="300px">Ingrese Id de Insumo a modificar:</asp:Label><asp:TextBox runat="server" ID="idInsumo" OnTextChanged="idInsumo_TextChanged"></asp:TextBox>
            <br />
            <asp:Label runat="server" Width="300px">Descripción:</asp:Label><asp:TextBox runat="server" ID="TextBox2" TextMode="MultiLine" MaxLength="200" Height="100px" Width="400px" Wrap="true" ></asp:TextBox>
            <br />
            <asp:Label runat="server" Width="300px">Tipo:</asp:Label><asp:TextBox runat="server" ID="TextBox3" Width="400px" placeholder="Filamento, PVC, Tela, Vinilo" ></asp:TextBox>
            <br />
            <asp:Label runat="server" Width="300px">Unidad de Medida:</asp:Label><asp:DropDownList runat="server" ID="dropUnidadMedidaModificar" Width="400px" AutoPostBack="True">
                                                                        <asp:ListItem Value="0">Seleccione una unidad</asp:ListItem>
                                                                        <asp:ListItem Value="1">KILOGRAMO</asp:ListItem>
                                                                        <asp:ListItem Value="2">METRO</asp:ListItem>
                                                                        <asp:ListItem Value="3">UNIDAD</asp:ListItem>
                                                                     </asp:DropDownList>
            <br />
            <asp:Button runat="server" ID="ModificaInsumo" OnClick="ModificaInsumo_Click" Text="Modificar Datos"/>
        </asp:View>        
        <asp:View ID="Cantidad" runat="server">
            <asp:Label runat="server" Width="300px">Ingrese Id de Insumo:</asp:Label><asp:TextBox runat="server" ID="IdInsumoCantidad" OnTextChanged="idInsumo_TextChanged"></asp:TextBox>
            <br />
            <asp:Label runat="server" Width="300px">Cantidad:</asp:Label><asp:TextBox runat="server" ID="valorCantidad" Width="400px" ></asp:TextBox>
            <br />
            <asp:Label runat="server" Width="300px">Operación:</asp:Label><asp:DropDownList runat="server" ID="DropCantidad" Width="400px" AutoPostBack="True">
                                                                        <asp:ListItem Value="0">Seleccione una operacion</asp:ListItem>
                                                                        <asp:ListItem Value="1">AUMENTAR</asp:ListItem>
                                                                        <asp:ListItem Value="2">DISMINUIR</asp:ListItem>                                                                        
                                                                     </asp:DropDownList>
            <br />
            <asp:Button runat="server" ID="ActualizaCantidad" OnClick="ActualizaCantidad_Click" Text="Actualizar Cantidad"/>
        </asp:View>
    </asp:MultiView>      
       
   
</asp:Content>
