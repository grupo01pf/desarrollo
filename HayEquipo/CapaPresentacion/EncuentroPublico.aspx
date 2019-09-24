<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EncuentroPublico.aspx.cs" Inherits="CapaPresentacion.EncuentroPublico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .alinearIzquiera{
        text-align:left;
    }
    .tamanoLetra{
        font-size:20px;
        
    }
    .titulo{
        text-align: center;
        color: #ffffff;
    }
    .colorLineaHorizontal{
        color: #808080
    }
    .elPadding {
  padding: 8px; 
}
        .Estilotable {
            border-collapse: collapse;
            
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    <h1 class="titulo">Encuentro</h1>
    <%--<div class="jumbotron text-center" style="background-color:black">--%>
    <div class="container text-center""> 
        <div class="row">
            <div class="col-sm-4">
                <div class="well">
                    <%--DATOS--%>
                    <legend>Datos del Encuentro</legend>
                    <div class="row">
                        <div class="col-sm-4 alinearIzquiera">                          
                                <strong><asp:Label ID="cld_Fecha" CssClass="tamanoLetra" runat="server" Text=""></asp:Label></strong>                                                                           
                        </div>
                        <div class="col-sm-8 alinearIzquiera">                                                          
                               <strong><asp:Label ID="lbl_Deporte" CssClass="tamanoLetra" style="color:#11398a" runat="server" Text=""></asp:Label></strong><br />
                               <asp:Label ID="Label1" style="color:#808080" runat="server" Text="Público &#183; Organizado por "></asp:Label>
                               <strong><asp:Label ID="txt_Organizador" runat="server" Text=""></asp:Label></strong>                                                                            
                        </div>
                    </div> 
                    <hr class="colorLineaHorizontal" />
                    <div class="alinearIzquiera elPadding">
                        <span class="glyphicon glyphicon-time"></span>
                        <asp:Label ID="Label2" style="color:black" runat="server" Text="De: "></asp:Label>
                        <asp:Label ID="txt_HoraInicio" runat="server" Text=""></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text=" a "></asp:Label>
                        <asp:Label ID="txt_HoraFin" runat="server" Text="Hora Fin"></asp:Label>
                    </div>
                    <div class="alinearIzquiera elPadding">                     
                            <span class="glyphicon glyphicon-map-marker"></span>
                            <asp:Label ID="txt_NombreLugar" runat="server" Text="Lugar"></asp:Label>                                             
                            <asp:Label ID="Label4" runat="server" Text=" &#183; "></asp:Label>
                            <asp:Label ID="txt_Direccion" runat="server" Text="Direccion"></asp:Label>                      
                    </div>  
                    <br />                                                                     
                    <asp:Button ID="btn_CancelarEncuentro" runat="server" Text="Cancelar Encuentro" OnClick="btn_CancelarEncuentro_Click" class="btn btn-danger"></asp:Button>           
                </div>
            </div>
            <div class="col-sm-3">
                <div class="well">
                    <%--GRILLA DE JUGADORES UNIDOS--%>                
                    <legend>Lista de Participantes</legend>
                        <div class="panel panel-primary">
                            <div class="panel-heading">Nombre de usuario</div>
                            <div class="panel-body">                             
                                    <asp:GridView ID="gdv_UsuariosUnidos" ShowHeader="false" EmptyDataText="Sin participantes aún..." BorderWidth="0" Font-Size="Large" runat="server" AutoGenerateColumns="false">
                                        <Columns>                              
                                            <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                            <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" />
                                        </Columns>
                                    </asp:GridView>                             
                            </div>
                            </div>
                        
                       
                             <%--BOTONES --%>   
                    <div>
                        <asp:Button ID="btn_Unirse" runat="server" Text="Unirse" OnClick="btn_Unirse_Click" class="btn btn-success" /> 
                        <br />
                        <asp:Button ID="btn_Salir" runat="server" Text="Salir" OnClick="btn_Salir_Click" class="btn btn-danger" />
                        <br />     
                        <asp:Button ID="btn_Invitar" runat="server" Text="Invitar" OnClick="btn_Invitar_Click" class="btn btn-info" />  
                   </div>                               
                </div>
            </div>
            <div class="col-sm-5">
                <div class="well">
                    <%--CHAT--%>
                    <legend>Chat</legend>            
                    
                        <asp:GridView ID="gdv_Pantalla" runat="server" AutoGenerateColumns="false" BackColor="#e8e8e8" HeaderStyle-BackColor="#0066ff" HeaderStyle-ForeColor="White" hea BorderColor="Black" ForeColor="Black" BorderStyle="Groove"> 
                            <Columns>                             
                                <asp:BoundField DataField="fechaHoraMensaje" HeaderText="Fecha y Hora" Visible="true" HeaderStyle-Width="10%" />
                                <asp:BoundField DataField="nombreUsuario" HeaderText="Usuario" Visible="true" HeaderStyle-Width="20%"/>
                                <asp:BoundField DataField="textoMensaje" HeaderText="Mensaje" Visible="true" HeaderStyle-Width="70%"/>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <%--BOTONES CHAT--%>
                        <div class="form-group alinearIzquiera">
                            <label for="comment">Mensaje:</label>
                             <asp:TextBox ID="txt_Mensaje" runat="server" Text="" placeholder="Escriba un mensaje" Class="form-control" ></asp:TextBox><br />
                             <asp:Button ID="btn_Enviar" runat="server" Text="Enviar" OnClick="btn_Enviar_Click" CssClass="btn btn-primary btn-block"/>                                      
                        </div>                                                     
                </div>
            </div>
        </div>                                      
</div>
</asp:Content>

