<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EncuentroPrivado.aspx.cs" Inherits="CapaPresentacion.EncuentroPrivado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .alinearIzquiera {
            text-align: left;
        }

        .tamanoLetra {
            font-size: 15px;
        }

        .titulo {
            text-align: center;
            color: #ffffff;
        }

        .colorLineaHorizontal {
            color: #808080;
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
      

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


      <h1 class="titulo">Encuentro</h1>
    <div class="container text-center">
        <div class="row">
            <div class="col-sm-4">
                <div class="well">
                    <legend>Datos del Encuentro</legend>
                    <div class="row">
                        <div class="col-sm-4 alinearIzquiera">
                            <span class="glyphicon glyphicon-calendar tamanoLetra"></span>
                            <strong><asp:Label ID="cld_Fecha" CssClass="tamanoLetra" runat="server" Text=""></asp:Label></strong>
                        </div>
                        <div class="col-sm-8 alinearIzquiera">
                               <strong><asp:Label ID="lbl_Deporte" CssClass="tamanoLetra" style="color:#11398a" runat="server" Text=""></asp:Label></strong><br />
                               <asp:Label ID="Label2" style="color:#808080" runat="server" Text="Privado &#183; Organizado por "></asp:Label>
                               <strong><asp:Label ID="txt_Organizador" runat="server" Text=""></asp:Label></strong>
                        </div>
                    </div>
                    <hr class="colorLineaHorizontal" />
                    <div class="alinearIzquiera elPadding">
                        <span class="glyphicon glyphicon-time"></span>
                        <asp:Label ID="Label3" style="color:black" runat="server" Text="Inicio: "></asp:Label>
                        <asp:Label ID="txt_HoraInicio" runat="server" Text="0"></asp:Label>
                        <%--<asp:Label ID="Label4" runat="server" Text=" a "></asp:Label>--%>
                        <%--<asp:Label ID="txt_HoraFin" runat="server" Text="0"></asp:Label>--%>
                    </div>
                    <div class="alinearIzquiera elPadding">
                            <span class="glyphicon glyphicon-map-marker"></span>
                            <asp:Label ID="lbl_Complejo" runat="server" Text="Lugar"></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text=" &#183; "></asp:Label>
                            <asp:Label ID="txt_calle" runat="server" Text="Calle"></asp:Label>
                            <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                            <asp:Label ID="txt_nroCalle" runat="server" Text="Nro Calle"></asp:Label>

                    </div>
                    <div class="alinearIzquiera elPadding">
                        <%--<span class="glyphicon glyphicon-search"></span>--%>
                        <%--<asp:LinkButton ID="LinkButton1" runat="server">Ver Info del Complejo</asp:LinkButton>--%>
                        <%--Al darle click al linkbutton debería mostrar un modal con los datos del complejo: mapa, reputación, servicios, etc.--%>
                        
                          <%--MODAL COMPLEJO--%>

                        
                                <button type="button" id="btn_VerComplejo" runat="server" class="btn btn-primary"
                                    data-toggle="modal" data-target="#exampleModalScrollable2"
                                     visible="true"  >
                                    Ver Complejo
                                </button>


                        <div class="modal fade" id="exampleModalScrollable2" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle2"
                            aria-hidden="false">
                            <%--data-backdrop="static" data-keyboard="false">--%>
                            <div class="modal-dialog modal-dialog-scrollable" role="document">



                                <div class="modal-content">
                                    <div class="modal-header">

                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                        <h5 class="modal-title" id="exampleModalScrollableTitle2">
                                            <strong>
                                              <center>   <asp:Label ID="lbl_ComplejoTitulo" runat="server" Text="Lugar"></asp:Label>
                                                  </center>
                                            </strong></h5>
                                    </div>
                                    <div class="modal-body">

                                        <%-- BODY --%>

                                        <div class="form-group">
                                            <asp:Label ID="lblValoracion" runat="server"></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lblDeportes" runat="server"></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lblDescripcion" runat="server"></asp:Label>
                                        </div>
                                        <%-- <div class="form-group">
                        <asp:Label ID="lblServicios" text="Servicios: " runat="server"></asp:Label>
                        <asp:ListBox ID="listServicios" Enabled="false" runat="server"></asp:ListBox>
                    </div>--%>

                                        <div class="form-group">
                                            <asp:Label ID="lblDireccion" runat="server"></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lblBarrio" runat="server"></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lblZona" runat="server"></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <asp:Label ID="lblTelefono" runat="server"></asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                                <!-- Indicators -->
                                                <ol class="carousel-indicators">
                                                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                                    <li data-target="#myCarousel" data-slide-to="1"></li>
                                                    <li data-target="#myCarousel" data-slide-to="2"></li>
                                                </ol>

                                                <!-- Wrapper for slides -->
                                                <div class="carousel-inner">
                                                    <div class="item active">
                                                        <img id="img1" width="1000" height="1500" runat="server">
                                                    </div>

                                                    <div class="item">
                                                        <img id="img2" width="1000" height="1500" runat="server">
                                                    </div>

                                                    <div class="item">
                                                        <img id="img3" width="1000" height="1500" runat="server">
                                                    </div>
                                                </div>

                                                <!-- Left and right controls -->
                                                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                                    <span class="glyphicon glyphicon-chevron-left"></span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                                    <span class="glyphicon glyphicon-chevron-right"></span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </div>
                                            
                                            </div>
                                                                                 
                                           </div>

                                      <%-- ****MAPA**** --%>
        <div id="contenedorDelMapa" runat="server" class="embed-responsive embed-responsive-16by9">
            <iframe class="embed-responsive-item" id="frm_map" runat="server" src="" allowfullscreen=""></iframe>
        </div>
        <%-- ****MAPA**** --%>
                                      <%-- FIN BODY --%>


                                    <div class="modal-footer">
                                        <center>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                       <%-- <button type="button" class="btn btn-primary" id="btn_EnviarInvitacion" runat="server"
                                            onserverclick="btn_EnviarInvitacion_Click">Invitar</button>--%>
                                            <%--<asp:Button ID="Button1" runat="server" Text="Enviar" OnClick="" />--%>
                                        </center>
                                    </div>
                                </div>


                            </div>
                        </div>



                           <%--FIN MODAL COMPLEJO  --%>


                    </div>



                    <div class="alinearIzquiera elPadding">
                            <span class="glyphicon glyphicon-earphone"></span>
                            <asp:Label ID="txt_Telefono" runat="server" Text="Telefono"></asp:Label>
                    </div>
                    <div class="alinearIzquiera elPadding">
                            <span class="glyphicon alert-info"></span>
                            <asp:Label ID="lbl_Cantidad" runat="server" Text="Cantidad"></asp:Label>
                            <asp:Label ID="lbl_CantidadTotal" runat="server" Text="0"></asp:Label>
                    </div>

                    <asp:Button ID="btn_CancelarEncuentro" runat="server" CssClass="btn btn-danger" Text="Cancelar Encuentro" OnClick="btn_CancelarEncuentro_Click"></asp:Button>
                     <%--<asp:Button ID="btn_CerrarEncuentro" runat="server" CssClass="btn btn-danger" Text="Cerrar Encuentro" OnClick="btn_CerrarEncuentro_Click"></asp:Button>--%>
                     <%--<asp:Button ID="btn_AbrirEncuentro" runat="server" CssClass="btn btn-success" Text="Abrir Encuentro" OnClick="btn_AbrirEncuentro_Click"></asp:Button>--%>
                </div>
                <div class="well">
                    <div class="form-group">
                        <span class="glyphicon glyphicon-eye-close"></span>
                        <asp:Label ID="lbl_Clave" runat="server" Text=" Clave"></asp:Label>
                        <asp:TextBox ID="txt_Clave" runat="server" CssClass="form-control" placeHolder="Ingrese Clave" TextMode="Password"></asp:TextBox><br />
                        <asp:Button ID="btn_Ingresar" runat="server" Text="Comprobar" CssClass="btn btn-default" OnClick="btn_Ingresar_Click" />
                    </div>
                </div>
            </div>
            <div class="col-sm-4"> <%--Union a Equipos--%>
                <div class="well">
                    <legend>Lista de Participantes</legend>
                    <div class="row">
                        <div class="col-sm-6">
                                <div class="panel panel-primary">

                            <div class="panel-heading">Equipo A
                                <asp:Label ID="lbl_CantidadEquipoA" runat="server" Text="0"></asp:Label>
                            </div>

                                <%-- ********* Equipo A *********** --%>

                                      
                   <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:Timer ID="Timer2" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
                        
                            <div class="scroll-container">



                                    <div class="panel-body">
                                        <%--Equipo A--%>
                                        <asp:GridView ID="gdv_Equipo_A" runat="server" AutoGenerateColumns="false" ShowHeader="false" EmptyDataText="Sin participantes aún..." BorderWidth="0" Font-Size="Large">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                            <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" />
                                        </Columns>
                                    </asp:GridView>
                                </div>



                                
                                  </div>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

                        </ContentTemplate>
                    </asp:UpdatePanel>




                                <%-- ************************************ --%>
                                    
                                    </div>


                            <asp:Button ID="btn_UnirseEquipoA" runat="server" Text="Unirse" OnClick="UnirseEquipoA_Click" class="btn btn-success" />
                        </div>
                        <div class="col-sm-6">
                             <div class="panel panel-primary">

                            <div class="panel-heading">Equipo B
                                <asp:Label ID="lbl_CantidadEquipoB" runat="server" Text="0"></asp:Label>
                            </div>

                                 <%-- ************** Equipo B ************* --%>

                                                       
                   <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:Timer ID="Timer3" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
                        
                            <div class="scroll-container">



                                    <div class="panel-body">
                                    <%--Equipo B --%>
                                    <asp:GridView ID="gdv_Equipo_B" runat="server" AutoGenerateColumns="false" ShowHeader="false" EmptyDataText="Sin participantes aún..." BorderWidth="0" Font-Size="Large">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                            <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" />
                                        </Columns>
                                    </asp:GridView>
                                </div>

                                
                                  </div>

                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>

                        </ContentTemplate>
                    </asp:UpdatePanel>



                                 <%-- ************************* --%>

                                
                                <%--    </div>--%>


                                 </div>

                            <asp:Button ID="btn_UnirseEquipoB" runat="server" Text="Unirse" OnClick="btn_UnirseEquipoB_Click" class="btn btn-success" />
                        </div>
                    </div>
                    <br />
                    <div class="form-group">
                    <%--<asp:Button ID="btn_Invitar" runat="server" Text="Invitar" OnClick="btn_Invitar_Click" class="btn btn-info" />--%>
                    <asp:Button ID="btn_Salir" runat="server" Text="Salir" OnClick="btn_Salir_Click" class="btn btn-danger"/>

                        
                        <button type="button" id="btn_inv" runat="server" class="btn btn-primary"
                            data-toggle="modal" data-target="#exampleModalScrollable"  visible="true">
                            Invitar
                        </button>
                        <%--MODAL--%>

                        <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle"
                            aria-hidden="false">
                            <%--data-backdrop="static" data-keyboard="false">--%>
                            <div class="modal-dialog modal-dialog-scrollable" role="document">



                                <div class="modal-content">
                                    <div class="modal-header">

                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                        <h5 class="modal-title" id="exampleModalScrollableTitle">
                                            <strong>
                                                <asp:Label ID="lbl_agendaFecha" runat="server"></asp:Label></strong></h5>
                                    </div>
                                    <div class="modal-body">

                                        <center>
                                               <asp:GridView ID="gdv_Invitar" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                                                    HeaderStyle-CssClass="header" RowStyle-CssClass="rows">
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <%--<asp:CheckBox ID="chk_InvitarTodos" runat="server" Text=" Seleccionar Todos" OnCheckedChanged="chk_Invitar_CheckedChanged" />--%>
                                                           <asp:Label id="lbl_Seleccionar" runat="server" Text="Seleccionar"></asp:Label>
                                                                 </HeaderTemplate>                                                        
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chk_Invitar" runat="server"  OnCheckedChanged="chk_Invitar_CheckedChanged" AutoPostBack="false"/>
                                                                 </ItemTemplate>                                                              
                                                             
                                                        </asp:TemplateField> 
                                                        <asp:BoundField DataField="id" HeaderText="" Visible="false" />
                                                        <asp:BoundField DataField="nombre" HeaderText="Usuario" Visible="true" />
                                                                                                                
                                                    </Columns>
                                                </asp:GridView>   
                                                </center>
                                    </div>
                                    <div class="modal-footer">
                                        <center>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                       <%-- <button type="button" class="btn btn-primary" id="btn_EnviarInvitacion" runat="server"
                                            onserverclick="btn_EnviarInvitacion_Click">Invitar</button>--%>
                                            <asp:Button ID="btn_EnviarInvitacion" runat="server" Text="Enviar" OnClick="btn_EnviarInvitacion_Click" />
                                        </center>
                                    </div>
                                </div>


                            </div>
                        </div>

                        <%--FIN MODAL--%>







                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="well">

                    
                    <%--CHAT--%>
                    <legend>Chat</legend>

                     <%--AJAX--%>


                    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>
                        
                            <div class="scroll-container">


                         <asp:GridView ID="gdv_Pantalla" runat="server" AutoGenerateColumns="false" BackColor="#e8e8e8" HeaderStyle-BackColor="#0066ff"
                                HeaderStyle-ForeColor="White"  BorderColor="Black" ForeColor="Black" BorderStyle="Groove"
                                EmptyDataText="Sin participantes aún..." BorderWidth="0" Font-Size="Large" >
                                <Columns>
                                <asp:BoundField DataField="fechaHoraMensaje" HeaderText="Fecha y Hora" Visible="true" HeaderStyle-Width="10%" />
                                <asp:BoundField DataField="nombreUsuario" HeaderText="Usuario" Visible="true" HeaderStyle-Width="20%" />
                                <asp:BoundField DataField="textoMensaje" HeaderText="Mensaje" Visible="true" HeaderStyle-Width="70%" />
                            </Columns>
                        </asp:GridView>
                    

                                  </div>

                            <asp:SqlDataSource ID="sqlData" runat="server"></asp:SqlDataSource>

                        </ContentTemplate>
                    </asp:UpdatePanel>


                    <%--BOTONES CHAT--%>
                        <div class="form-group alinearIzquiera">
                            <label for="comment">Mensaje:</label>
                             <asp:Panel ID="pnl_PanelChat" runat="server" DefaultButton="btn_Enviar">
                             <asp:TextBox ID="txt_Mensaje" runat="server" Text="" placeholder="Escriba un mensaje" Class="form-control" ></asp:TextBox><br />
                             <asp:Button ID="btn_Enviar" runat="server" Text="Enviar" OnClick="btn_Enviar_Click" CssClass="btn btn-primary btn-block"/>
                        </asp:Panel>
                                 </div>
                </div>
            </div>
            <div class="col-me-2"></div>

        </div>

       <%-- <div id="contenedorDelMapa" runat="server" class="embed-responsive embed-responsive-16by9">
            <iframe class="embed-responsive-item" id="frm_map" runat="server" src="" allowfullscreen=""></iframe>
        </div>--%>
    </div>
</asp:Content>



