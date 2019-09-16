<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EncuentroPublico.aspx.cs" Inherits="CapaPresentacion.EncuentroPublico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .fecha {
  border: 2px solid black;
  outline: #4CAF50 solid 10px;
  margin: auto;  
  padding: 20px;
  text-align: center;
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">   
    <h1 style="text-align: center">Encuentro</h1>
    <div class="jumbotron text-center" style="background-color:black">
        <div class="row">
            <div class="col-sm-4">
                <div class="well">
                    <%--DATOS--%>
                    <legend>Datos del Encuentro</legend>
                    <div class="row">
                        <div class="col-md-5"> 
                            <div class="alert alert-info">
                                <h5><strong><asp:Label ID="cld_Fecha" runat="server" Text=""></asp:Label></strong></h5>
                            </div>                                                  
                        </div>
                        <div class="col-md-7">
                            
                                <div class="alert alert-success">
                                <h4><strong><asp:Label ID="lbl_Deporte" runat="server" Text="Fútbol"></asp:Label></strong></h4>
                                </div>                    
                            
                        </div>
                    </div>
                                                          
                    <asp:Label ID="lbl_Clave" runat="server" Text="Clave"></asp:Label>                                                                                             
                    
                                                             
                    <%--<asp:TextBox ID="cld_Fecha" runat="server" ></asp:TextBox> --%>                             
                    <asp:DropDownList ID="cmb_Deporte" runat="server" AppendDataBoundItems>
                        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                    </asp:DropDownList>                    
                                                
                                                            
                    <asp:Label ID="lbl_HoraInicio" runat="server" Text="Hora Inicio"></asp:Label>                                                    
                    <asp:TextBox ID="txt_HoraInicio" runat="server" placeholder="00:00" Columns="5" MaxLength="5"></asp:TextBox>                                                                                
                    <asp:Label ID="lbl_HoraFin" runat="server" Text="Hora Fin"></asp:Label>                                                     
                    <asp:TextBox ID="txt_HoraFin" runat="server" placeholder="00:00" Columns="5" MaxLength="5"></asp:TextBox>                                          
                    <asp:Label ID="lbl_NombreLugar" runat="server" Text="Lugar"></asp:Label>                       
                    <asp:TextBox ID="txt_NombreLugar" runat="server" placeHolder="Lugar" Columns="50" MaxLength="40"></asp:TextBox>  
                    <asp:Label ID="lbl_Direccion" runat="server" Text="Direccion"></asp:Label>                      
                    <asp:TextBox ID="txt_Direccion" runat="server" placeHolder="direccion" Columns="50" MaxLength="40"></asp:TextBox>                                                                       
                    <asp:Label ID="lbl_Organizador" runat="server" Text="Organizador"></asp:Label>                       
                    <asp:TextBox ID="txt_Organizador" runat="server" placeHolder="Organizador" Columns="50" MaxLength="40"></asp:TextBox>                                            
                    <asp:Button ID="btn_CancelarEncuentro" runat="server" Text="Cancelar Encuentro" OnClick="btn_CancelarEncuentro_Click" BackColor="Gray" ForeColor="Black"></asp:Button>
              
                </div>
            </div>
            <div class="col-sm-4">
                <div class="well">
                    <%--GRILLA DE JUGADORES UNIDOS--%>                
                    <legend>Lista</legend>
                    <div style="width: 80%; height: 400px; overflow: scroll">
                        <asp:GridView ID="gdv_UsuariosUnidos" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                            <Columns>                              
                                <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" />
                            </Columns>
                        </asp:GridView>
                    </div>    
                             <%--BOTONES --%>                 
                    <asp:Button ID="btn_Salir" runat="server" Text="Salir" OnClick="btn_Salir_Click" BackColor="Red" ForeColor="White" />
                    <asp:Button ID="btn_Unirse" runat="server" Text="Unirse" OnClick="btn_Unirse_Click" BackColor="Green" ForeColor="White" />
                    <asp:Button ID="btn_Invitar" runat="server" Text="Invitar" OnClick="btn_Invitar_Click" BackColor="White" ForeColor="Black" />
                </div>
            </div>
            <div class="col-sm-4">
                <div class="well">
                    <%--CHAT--%>
                    <legend>Chat</legend>            
                    <div style="width: 100%; height: 300px; overflow: scroll">
                        <asp:GridView ID="gdv_Pantalla" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                            <Columns>                             
                                <asp:BoundField DataField="fechaHoraMensaje" HeaderText="Fecha y Hora" Visible="true" HeaderStyle-Width="10%" />
                                <asp:BoundField DataField="nombreUsuario" HeaderText="Usuario" Visible="true" HeaderStyle-Width="20%"/>
                                <asp:BoundField DataField="textoMensaje" HeaderText="Mensaje" Visible="true" HeaderStyle-Width="70%"/>
                            </Columns>
                        </asp:GridView>
                    </div>
                        <%--BOTONES CHAT--%>                 
                    <asp:TextBox ID="txt_Mensaje" runat="server" Text="" placeholder="Escriba un mensaje" MaxLength="50" ></asp:TextBox>
                    <asp:Button ID="btn_Enviar" runat="server" Text="Enviar" OnClick="btn_Enviar_Click" CssClass="bg-info"/>                                      
                </div>
            </div>
        </div>                                      
</div>
</asp:Content>

