<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantenedorReservas.aspx.cs" Inherits="SAGESWebApp.MantenedorReservas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <br />
    <br />
    <asp:Label runat="server">En esta sección se mostrará una grilla para todos los usuarios, las reservas realizadas por él y que están pendientes de aprobación. Podrá modificar algunos datos mientras se encuentre en ese estado</asp:Label>
    <br />
    <br />
    <br />
    <br />
    <asp:GridView ID="GridReservaUserPendiente" runat="server" AutoGenerateColumns="false" DataKeyNames="idSolicitud" OnPageIndexChanging="GridReservaUserPendiente_PageIndexChanging" OnRowCancelingEdit="GridReservaUserPendiente_RowCancelingEdit" OnRowEditing="GridReservaUserPendiente_RowEditing" OnRowUpdating="GridReservaUserPendiente_RowUpdating">  
                    <Columns>  
                        <asp:BoundField DataField="idSolicitud" HeaderText="Id Solicitud" ControlStyle-Width="100%" ReadOnly="true" />  
                        <asp:BoundField DataField="fechaInicio" HeaderText="Fecha Inicio" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="horaInicio" HeaderText="Hora Inicio" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="fechaTermino" HeaderText="Fecha Término" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="horaTermino" HeaderText="Fecha Término" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="modalidad" HeaderText="Modalidad" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="tipoActividad" HeaderText="Tipo Actividad" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="sala" HeaderText="Sala" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="estado" HeaderText="Estado Solicitud" ControlStyle-Width="100%"/>                                                                    
                        <asp:CommandField ShowEditButton="true" ButtonType="Image" HeaderText="Editar" EditImageUrl="~/img/Edit.png" UpdateImageUrl="~/img/Confirmar.png" CancelImageUrl="~/img/Cancelar.png" ControlStyle-Height="25px"/>                     
                        
                    </Columns>  
                </asp:GridView> 
    <asp:Label runat="server">En esta sección se mostrará una grilla para todos los usuarios, las reservas realizadas por él y que están aprobadas o rechazadas. No se podrá modificar información de esta grilla.</asp:Label>
    <br />
    <br />
    <br />
    <br />
    <asp:GridView ID="GridReservaUserAceptada" runat="server" AutoGenerateColumns="false" DataKeyNames="idSolicitud" OnPageIndexChanging="GridReservaUserAceptada_PageIndexChanging">  
                    <Columns>  
                        <asp:BoundField DataField="idSolicitud" HeaderText="Id Solicitud" ControlStyle-Width="100%" ReadOnly="true" />  
                        <asp:BoundField DataField="fechaInicio" HeaderText="Fecha Inicio" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="horaInicio" HeaderText="Hora Inicio" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="fechaTermino" HeaderText="Fecha Término" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="horaTermino" HeaderText="Fecha Término" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="modalidad" HeaderText="Modalidad" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="tipoActividad" HeaderText="Tipo Actividad" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="sala" HeaderText="Sala" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="estado" HeaderText="Estado Solicitud" ControlStyle-Width="100%"/>                       
                        <asp:BoundField DataField="usuarioAprobador" HeaderText="Aprobado/Rechazado por" ControlStyle-Width="100%"/>                         
                    </Columns>  
                </asp:GridView> 
    
    <asp:Button runat="server" ID="CreaReserva" Text="Nueva Reserva" OnClick="CreaReserva_Click" />
    <br />   
    <br />
    <asp:MultiView ID="Opciones" runat="server">
        <asp:View ID="Crear" runat="server">
            <br />
            <asp:label runat="server" Width="300px">Fecha Inicio:</asp:label><asp:TextBox ID="FInicio" runat="server" TextMode="Date" Width="500px"></asp:TextBox>
            <br />
            <br />
            <asp:label runat="server" Width="300px">Hora Inicio:</asp:label><asp:TextBox ID="HInicio" runat="server" TextMode="Time" Width="500px"></asp:TextBox>
            <br />
            <br />
            <asp:label runat="server" Width="300px">Fecha Término:</asp:label><asp:TextBox ID="FTermino" runat="server" TextMode="Date" Width="500px"></asp:TextBox>
            <br />
            <br />
            <asp:label runat="server" Width="300px">Hora Término:</asp:label><asp:TextBox ID="HTermino" runat="server" TextMode="Time" Width="500px"></asp:TextBox>
            <br />
            <br />
            <asp:label runat="server" Width="300px">Modalidad:</asp:label><asp:DropDownList ID="DropModalidad" runat="server" AppendDataBoundItems="false" Width="500px">
                                                                                <asp:ListItem Value="0">Seleccione...</asp:ListItem>
                                                                                <asp:ListItem Value="1">DIURNA</asp:ListItem>
                                                                                <asp:ListItem Value="2">VESPERTINA</asp:ListItem>
                                                                                </asp:DropDownList>
            <br />
            <br />
            <asp:label runat="server" Width="300px">Tipo Actividad:</asp:label><asp:TextBox ID="tipoActividad" placeholder="Clase, Actividad Extraprogramática, Taller, etc." runat="server" Width="500px"></asp:TextBox>
            <br />
            <br />
            <asp:label runat="server" Width="300px">Comentarios:</asp:label><asp:TextBox ID="comentarios" TextMode="MultiLine" MaxLength="200" Height="50px" runat="server" Width="500px"></asp:TextBox>           
            <br />
            <br />
            <asp:label runat="server" Width="300px">Elija recursos necesarios:</asp:label><asp:CheckBoxList ID="CheckRecursos" runat="server"></asp:CheckBoxList>
            <asp:Button runat="server" OnClick="SolicitarReserva_Click" Text="Solicitar Reserva" ID="SolicitarReserva"/>
        </asp:View>        
    </asp:MultiView>   
    
    <asp:Label runat="server">----------------------------------------------------------</asp:Label> 
    <asp:Label runat="server">En esta sección se mostrará una grilla para administradores, aquí podrá aprobar o rechazar cualquier solicitud de reserva, aunque ya haya sido rechazada.</asp:Label>
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="labelReservaAdmin" runat="server" Width="300px">Seleccione estado de reserva:</asp:Label><asp:DropDownList runat="server" ID="DropEstadoReserva" Width="400px" OnSelectedIndexChanged="DropEstadoReserva_SelectedIndexChanged" AutoPostBack="True">                                                                   
                                                                     </asp:DropDownList>
    <asp:GridView ID="GridReservaAdmin" runat="server" AutoGenerateColumns="false" DataKeyNames="idInsumo" OnPageIndexChanging="GridReservaAdmin_PageIndexChanging" OnRowCancelingEdit="GridReservaAdmin_RowCancelingEdit" OnRowEditing="GridReservaAdmin_RowEditing" OnRowUpdating="GridReservaAdmin_RowUpdating">  
                    <Columns>  
                        <asp:BoundField DataField="idSolicitud" HeaderText="Id Solicitud" ControlStyle-Width="100%" ReadOnly="true" />  
                        <asp:BoundField DataField="fechaInicio" HeaderText="Fecha Inicio" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="horaInicio" HeaderText="Hora Inicio" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="fechaTermino" HeaderText="Fecha Término" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="horaTermino" HeaderText="Fecha Término" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="modalidad" HeaderText="Modalidad" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="tipoActividad" HeaderText="Tipo Actividad" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="sala" HeaderText="Sala" ControlStyle-Width="100%"/>
                        <asp:BoundField DataField="estado" HeaderText="Estado Solicitud" ControlStyle-Width="100%"/>                       
                        <asp:BoundField DataField="responsable" HeaderText="Solicitado por" ControlStyle-Width="100%"/>
                    </Columns>  
                </asp:GridView> 
    
</asp:Content>
