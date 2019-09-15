
<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CrearEncuentro.aspx.cs" Inherits="CapaPresentacion.CrearEncuentro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h1 {
            text-align: center;
            color:white;
        }
        .alinearCentro { text-align: center; }
        .fondoPalJumbotron{
            background-color:#000000
        }
        
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <h1>
                <asp:Label ID="lbl_Titulo" runat="server" Text="Crear Encuentro"></asp:Label>
            </h1>                 
    <div class="jumbotron text-center fondoPalJumbotron">
         <div class="row">
            <div class="col-md-6">
                <div class="well">
                <div class="form-group">
                     <asp:Label ID="lbl_Deporte" runat="server" CssClass="alinearIzq" Text="Deporte"></asp:Label>
                     <div class="dropdown">
                                <asp:DropDownList ID="cmb_Deporte" runat="server" CssClass="form-control" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>
                     </div>
                </div>
                    <div class="well" style="width:310px; margin: 0 auto;">                           
                        <div class="form-group">                                                         
                                <asp:Label ID="lbl_Fecha" runat="server" Text="Fecha"></asp:Label>
                                <asp:Calendar ID="cld_Fecha" runat="server" Width="270px" OnSelectionChanged="cld_Fecha_SelectionChanged"></asp:Calendar>                              
                        </div> 
                    </div>  
                     <div class="form-group">
                                <asp:CheckBox ID="chk_Accesibilidad" CssClass="checkbox" runat="server" Text=" Clave" />                           
                                <asp:TextBox ID="txt_Clave" CssClass="form-control" runat="server" placeHolder="Ingrese Contraseña" TextMode="Password" Columns="20" MaxLength="20"></asp:TextBox>
                     </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="well">
                    <div class="row">
                         <%--  LUGAR PUBLICO--%>
                        <div class="col-md-6">                              
                            <div class="form-group">
                                <asp:RadioButton ID="rdb_Publico" runat="server" Text=" Lugar Público" GroupName="tipoEncuentro" value="0" OnCheckedChanged="rdb_Publico_CheckedChanged" AutoPostBack="true" />
                            </div>                               
                            <div class="form-group">
                                <asp:Label ID="lbl_HoraInicio" runat="server" Text="Hora Inicio"></asp:Label>                           
                                <asp:TextBox ID="txt_HoraInicio" CssClass="form-control" runat="server" placeholder="00:00" Columns="5" MaxLength="5"></asp:TextBox>
                            </div>                                                                                                               
                            <div class="form-group">                           
                                <asp:Label ID="lbl_HoraFin" runat="server" Text="Hora Fin"></asp:Label>
                                <asp:TextBox ID="txt_HoraFin" CssClass="form-control" runat="server" placeholder="00:00" Columns="5" MaxLength="5"></asp:TextBox>
                            </div>      
                           <div class="form-group">
                                <asp:Label ID="lbl_NombreLugar" runat="server" Text="Lugar"></asp:Label>                             
                                <asp:TextBox ID="txt_NombreLugar" CssClass="form-control" runat="server" placeHolder="Lugar" Columns="50" MaxLength="40"></asp:TextBox>
                           </div>
                           <div class="form-group">
                                <asp:Label ID="lbl_Direccion" runat="server" Text="Direccion"></asp:Label>                      
                                <asp:TextBox ID="txt_Direccion" CssClass="form-control" runat="server" placeHolder="Ingrese una direccion" Columns="50" MaxLength="40"></asp:TextBox>
                           </div>
                       </div>
                        <%-- LUGAR PRIVADO --%>
                       <div class="col-md-6">                        
                            <div class="form-group">
                                <asp:RadioButton ID="rdb_Privado" runat="server" Text=" Lugar Privado" GroupName="tipoEncuentro" value="1" OnCheckedChanged="rdb_Privado_CheckedChanged" AutoPostBack="true" />
                            </div>                      
                            <div class="form-group">
                                <asp:Label ID="lbl_Complejo" runat="server" Text="Complejos"></asp:Label>                                                                                      
                                    <asp:DropDownList ID="cmb_Complejo" CssClass="form-control" runat="server" AutoPostBack="true" AppendDataBoundItems="true">
                                        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                    </asp:DropDownList>
                            </div>                  
                       </div>                  
                  </div>                
                                <asp:Button ID="btn_Crear" runat="server" Text="Crear" OnClick="btn_Crear_Click" Type="button" Class="btn btn-success" />
                                <asp:Button ID="btn_Cancelar" runat="server" Text="Cancelar" OnClick="btn_Cancelar_Click" Type="button" Class="btn btn-danger" />
                </div>
            </div>
         </div>
        <%-- ****MAPA**** --%>
            <div id="contenedorDelMapa" runat="server" class="embed-responsive embed-responsive-16by9">            
                    <iframe class="embed-responsive-item" id="frm_map" runat="server" src="" allowfullscreen=""></iframe>                                
            </div>
         <%-- ****MAPA**** --%> 
<%--         <iframe id="Iframe1" runat="server" src="" width="550" height="400" frameborder="0" style="border:0;" allowfullscreen=""></iframe>--%>
    </div>
</asp:Content>