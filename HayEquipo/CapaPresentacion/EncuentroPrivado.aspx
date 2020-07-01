<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EncuentroPrivado.aspx.cs" Inherits="CapaPresentacion.EncuentroPrivado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <%--**** MAPA ****--%>

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
        integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
        crossorigin="" />

    <%--**** MAPA ****--%>


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

        #myMap {
            /*height: 300px;
            width: 400px;*/
            width: 100%;
            padding-top: 56.25%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <asp:Panel ID="pnl_Password" runat="server">
        <div class="well">
            <div class="form-group">
                <span class="glyphicon glyphicon-eye-close"></span>

                <asp:Label ID="lbl_Clave" runat="server" Text=" Clave"></asp:Label>
                <asp:TextBox ID="txt_Password" Text="" TextMode="Password" runat="server"></asp:TextBox>
                <asp:Button ID="btn_Entrar" Text="Entrar" runat="server" OnClick="btn_Entrar_Click" />

            </div>
        </div>
    </asp:Panel>



    <asp:Panel ID="pnl_MostrarContenido" runat="server">




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
                                <strong>
                                    <asp:Label ID="cld_Fecha" CssClass="tamanoLetra" runat="server" Text=""></asp:Label></strong>
                            </div>
                            <div class="col-sm-8 alinearIzquiera">
                                <strong>
                                    <asp:Label ID="lbl_Deporte" CssClass="tamanoLetra" Style="color: #11398a" runat="server" Text=""></asp:Label></strong><br />
                                <asp:Label ID="Label2" Style="color: #808080" runat="server" Text="Privado &#183; Organizado por "></asp:Label>
                                <strong>
                                    <asp:Label ID="txt_Organizador" runat="server" Text=""></asp:Label></strong>
                            </div>
                        </div>
                        <hr class="colorLineaHorizontal" />
                        <div class="alinearIzquiera elPadding">
                            <span class="glyphicon glyphicon-time"></span>
                            <asp:Label ID="Label3" Style="color: black" runat="server" Text="Inicio: "></asp:Label>
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


                            <%--MODAL COMPLEJO--%>

                            <button type="button" id="btn_VerComplejo" runat="server" class="btn btn-primary"
                                data-toggle="modal" data-target="#exampleModalScrollable2"
                                visible="true">
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
                                                <asp:Image ID="imgAvatar" ImageUrl="~/Imagenes/complejo_logo_default.png" runat="server" CssClass="img-circle" Height="100" Width="100" />
                                                <strong>
                                                    <center>   <asp:Label ID="lbl_ComplejoTitulo" runat="server" Text="Lugar"></asp:Label>
                                                  </center>
                                                </strong>
                                                <h5></h5>
                                                <h5></h5>
                                                <h5></h5>
                                            </h5>
                                        </div>
                                        <div class="modal-body">


                                            <div class="form-group">
                                                <asp:Label ID="lblValoracion" runat="server"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblDeportes" runat="server" ForeColor="#FF9900"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblDescripcion" runat="server"></asp:Label>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblServicios" Text="Servicios: " runat="server"></asp:Label>
                                            </div>
                                            <div class="form-group" id="divListServ" runat="server">
                                                <asp:ListBox ID="listServicios" Enabled="false" runat="server"></asp:ListBox>
                                            </div>
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
                                                <asp:Label ID="lblHorarios" runat="server"></asp:Label>
                                            </div>
                                            <div class="form-group">

                                                <div class="tamañoCarousel">
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
                                                                <img id="img1" runat="server" height="50" width="50">
                                                            </div>

                                                            <div class="item">
                                                                <img id="img2" runat="server" height="50" width="50">
                                                            </div>

                                                            <div class="item">
                                                                <img id="img3" runat="server" height="50" width="50">
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
                                        </div>


                                        <div class="modal-footer">
                                            <center>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                        </center>
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
                    </div>
                </div>
                <div class="col-sm-4">
                    <%--Union a Equipos--%>
                    <div class="well">
                        <legend>Lista de Participantes</legend>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="panel panel-primary">

                                    <div class="panel-heading">
                                        Equipo A
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

                                    <div class="panel-heading">
                                        Equipo B
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
                            <asp:Button ID="btn_Salir" runat="server" Text="Salir" OnClick="btn_Salir_Click" class="btn btn-danger" />


                            <button type="button" id="btn_inv" runat="server" class="btn btn-primary"
                                data-toggle="modal" data-target="#exampleModalScrollable" visible="true">
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
                                                                <center>
                                                                <asp:CheckBox ID="chk_Invitar" runat="server"  OnCheckedChanged="chk_Invitar_CheckedChanged" 
                                                                    AutoPostBack="false"/>
                                                                 </center>
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
                                        HeaderStyle-ForeColor="White" BorderColor="Black" ForeColor="Black" BorderStyle="Groove"
                                        EmptyDataText="Sin participantes aún..." BorderWidth="0" Font-Size="Large">
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
                                <asp:TextBox ID="txt_Mensaje" runat="server" Text="" placeholder="Escriba un mensaje" Class="form-control"></asp:TextBox><br />
                                <asp:Button ID="btn_Enviar" runat="server" Text="Enviar" OnClick="btn_Enviar_Click" CssClass="btn btn-primary btn-block" />
                            </asp:Panel>
                        </div>
                    </div>
                </div>
                <div class="col-me-2"></div>


            </div>

            <%-- <div id="contenedorDelMapa" runat="server" class="embed-responsive embed-responsive-16by9">
            <iframe class="embed-responsive-item" id="frm_map" runat="server" src="" allowfullscreen=""></iframe>
        </div>--%>





            <%-- ****MAPA**** --%>
            <div class="row">
                <div class="container">
                    <div class="form-group">
                        <div id="myMap"></div>
                    </div>

                    <div class="form-inline">
                        <div id="LatLng">
                            <label for="lbl_Latitud">Latitud</label>
                            <asp:TextBox ID="txt_Latitud" Text="" MaxLength="500" runat="server" Visible="true"></asp:TextBox>

                            <label for="lbl_Longitud">Longitud</label>
                            <asp:TextBox ID="txt_Longitud" Text="" MaxLength="500" runat="server" Visible="true"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
    </asp:Panel>


    <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
        integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
        crossorigin=""></script>

    <%--**** CONTROL DEL MAPA ****--%>
    <%--<script src="scripts/map.js" ></script>--%>


    <script type="text/javascript">


        const tilesProvider = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png '


        // CENTRAR LA VISTA DEL MAPA
        let myMap = L.map('myMap').setView([-31.416563, -64.183533], 12)

        L.tileLayer(tilesProvider, {
            maxzoom: 18,
        }).addTo(myMap)




        var layerGroup = L.layerGroup().addTo(myMap)

        // MOSTRAR UN COMPLEJO

        var latitude = document.getElementById('<%= txt_Latitud.ClientID %>').value;
            var longitude = document.getElementById('<%= txt_Longitud.ClientID %>').value;

        var marker = L.marker([latitude, longitude]).addTo(layerGroup)
        if (latitude != "" && longitude != "") {
            myMap.setView([latitude, longitude], 15)
        }



        // CREAR UN MARCADOR
        // let marker = L.marker([-31.416563, -64.183533]).addTo(myMap)

        // DESACTIVAR ZOOM CON DOBLE CLICK
        myMap.doubleClickZoom.disable()

        // var layerGroup = L.layerGroup().addTo(myMap)

        // PONER UN MARCADOR CON EL EVENTO DOBLECLICK


    </script>
</asp:Content>



