
<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CrearEncuentro.aspx.cs" Inherits="CapaPresentacion.CrearEncuentro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h1 {
            text-align: center;
            color:white;
        }
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


                <div class="col-md-6 well">

                    <%--DATOS--%>
                    
                       
                            
                                <asp:Label ID="lbl_Deporte" runat="server" Text="Deporte"></asp:Label>
                            <br />
                            <div class="dropdown">
                                <asp:DropDownList ID="cmb_Deporte" runat="server" CssClass="form-control" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                        
                        <br />
                        <br />
                            
                            
                                <asp:Label ID="lbl_Fecha" runat="server" Text="Fecha"></asp:Label>
                            <br />
                            
                                <%--NO BORRAR--%>
                                <asp:Calendar ID="cld_Fecha" runat="server"></asp:Calendar>
                                <%--<asp:TextBox ID="txt_Fecha" runat="server" TextMode="Date"></asp:TextBox>--%>
                            

                        
                        <%--<br />--%>
                        
                            
                            
                                <%--NO BORRAR--%>
                                <%--<asp:Label ID="lbl_Zona" runat="server" Text="Zona"></asp:Label>--%>

                                <%--<asp:Label ID="lbl_Barrio" runat="server" Text="Barrio"></asp:Label>--%>
                            
                            
                                <%--NO BORRAR--%>
                                <%-- <asp:DropDownList ID="cmb_Zona" runat="server" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>--%>

                                <%--<asp:DropDownList ID="cmb_Barrio" runat="server" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>--%>
                           

                        
                        <br />
                        
                            
                            
                                <asp:CheckBox ID="chk_Accesibilidad" runat="server" Text=" Clave" />
                            
                            
                                <asp:TextBox ID="txt_Clave" runat="server" placeHolder="Ingrese Contraseña" TextMode="Password" Columns="20" MaxLength="20"></asp:TextBox>
                            
                        
                        
                    
                </div>



                <div class="col-md-6 well">
                    <div class="row">
                        <div class="col-md-6">
                    <%--  LUGAR PUBLICO--%>
                    
                        
                            <asp:RadioButton ID="rdb_Publico" runat="server" Text=" Lugar Público" GroupName="tipoEncuentro" value="0" OnCheckedChanged="rdb_Publico_CheckedChanged" AutoPostBack="true" />
                        
                        <%--<br />--%>
                        
                    <br />
                    <br />
                            
                                <asp:Label ID="lbl_HoraInicio" runat="server" Text="Hora Inicio"></asp:Label>
                            <br />
                            <br />
                                <asp:TextBox ID="txt_HoraInicio" runat="server" placeholder="00:00" Columns="5" MaxLength="5"></asp:TextBox>
                                 
                            <br />
                             <br />                                                             
                            
                            <%--<br />--%>
                            
                            <%--<div class="row">--%>
                            
                                <asp:Label ID="lbl_HoraFin" runat="server" Text="Hora Fin"></asp:Label>
                            <br />
                    <br />
                            
                                <asp:TextBox ID="txt_HoraFin" runat="server" placeholder="00:00" Columns="5" MaxLength="5"></asp:TextBox>
                            

                        
                        <br />

                        <%--<div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lbl_CantidadParticipantes" runat="server" Text="Cantidad de participantes"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txt_CapacidadParticipantes" runat="server" placeHolder="Ingrese un nurmero"></asp:TextBox>
                            </div>
                        </div>--%>

                        
                            <asp:Label ID="lbl_NombreLugar" runat="server" Text="Lugar"></asp:Label>
                        
                    <br />

                        
                            <asp:TextBox ID="txt_NombreLugar" runat="server" placeHolder="Lugar" Columns="50" MaxLength="40"></asp:TextBox>
                        

                        <br />
                        
                            <asp:Label ID="lbl_Direccion" runat="server" Text="Direccion"></asp:Label>
                        
                    <br />
                        
                            <asp:TextBox ID="txt_Direccion" runat="server" placeHolder="Ingrese una direccion" Columns="50" MaxLength="40"></asp:TextBox>
                        

                        <br />
                        <%-- <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lbl_Barrio" runat="server" Text="Barrio"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="cmb_Barrio" runat="server" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            
                        </div>--%>
                    
                    <br />

                    <br />
                    <%-- LUGAR PRIVADO --%>
                    </div>
                    <div class="col-md-6">
                        
                            <asp:RadioButton ID="rdb_Privado" runat="server" Text=" Lugar Privado" GroupName="tipoEncuentro" value="1" OnCheckedChanged="rdb_Privado_CheckedChanged" AutoPostBack="true" />
                        
                        <br />
                    <br />
                            
                                
                                    <asp:Label ID="lbl_Complejo" runat="server" Text="Complejos"></asp:Label>
                                <br />
                    <br />
                                <%--<br />--%>
                                
                                    <asp:DropDownList ID="cmb_Complejo" runat="server" AppendDataBoundItems>
                                        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                    </asp:DropDownList>
                                
                            <br />
                    <br />

                            
                                
                                    <%--<asp:Label ID="lbl_TipoCancha" runat="server" Text="Canchas"></asp:Label>--%>
                                
                                <br />
                                
                                    <%--<asp:DropDownList ID="cmb_TipoCancha" runat="server" AppendDataBoundItems>
                                        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                    </asp:DropDownList>--%>
                                

                            

                        
                        <br />

                        
                            <%--<asp:Button ID="btn_BuscarHorarios" runat="server" Text="Buscar Horarios" OnClick="btn_BuscarHorarios_Click" BackColor="Blue" ForeColor="White" />--%>
                        
                        

                            <%-- GRILLA HORARIOS DISPONIBLES --%>
                            
                                <%--<legend>Horarios</legend>--%>
                                

                                    <%--<div style="width: 180%; height: 400px; overflow: scroll">--%>
                                    <%--<asp:GridView ID="gdv_Horario" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                                        <Columns>
                                            <asp:CommandField HeaderText="Seleccionar" ShowSelectButton="true" />
                                            <asp:BoundField DataField="Hora" HeaderText="Hora" Visible="true" />
                                            <asp:BoundField DataField="Disponibilidad" HeaderText="Disponibilidad" Visible="true" />
                                        </Columns>
                                    </asp:GridView>--%>
                                </div>

                    
                            



                        
                    </div>
                    
                        <asp:Button ID="btn_Crear" runat="server" Text="Crear" OnClick="btn_Crear_Click" Type="button" Class="btn btn-success" />
                    <asp:Button ID="btn_Cancelar" runat="server" Text="Cancelar" OnClick="btn_Cancelar_Click" Type="button" Class="btn btn-danger" />
                </div>
            </div>
            <br />
           

       
        
        </div>

  

</asp:Content>