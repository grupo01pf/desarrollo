<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EncuentroPublico.aspx.cs" Inherits="CapaPresentacion.EncuentroPublico" %>

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

        .scroll-container {
            display: block;
            height = 500px;
            overflow-y: scroll;
        }

         #myMap {
         
            width: 100%;
            padding-top: 56.25%;
        }

        
        #div_latlng {
            width: 100%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <h1 class="titulo">Encuentro</h1>
    <%--</div>--%>

    <%--<div class="jumbotron text-center" style="background-color: black">--%>
    <div class="container text-center">
        <div class="row">
            <div class="col-sm-4">
                <div class="well">
                    <%--DATOS--%>
                    <legend>Datos del Encuentro</legend>
                    <div class="row">
                        <div class="col-sm-4 alinearIzquiera">
                            <span class="glyphicon glyphicon-calendar tamanoLetra"></span>
                            <strong>
                                <asp:Label ID="cld_Fecha" CssClass="tamanoLetra" runat="server" Text=""></asp:Label></strong>
                        </div>
                        <div class="col-sm-8 alinearIzquiera">
                            <strong>
                                <asp:Label ID="lbl_Deporte" CssClass="tamanoLetra" Style="color: #11398a" runat="server" Text=""></asp:Label></strong>
                            <br />
                            <asp:Label ID="Label1" Style="color: #808080" runat="server" Text="Público &#183; Organizado por "></asp:Label>
                            <strong>
                                <asp:Label ID="txt_Organizador" runat="server" Text=""></asp:Label></strong>
                        </div>
                    </div>
                    <hr class="colorLineaHorizontal" />
                    <div class="alinearIzquiera elPadding">
                        <span class="glyphicon glyphicon-time"></span>
                        <asp:Label ID="Label2" Style="color: black" runat="server" Text="De: "></asp:Label>
                        <strong>
                            <asp:Label ID="txt_HoraInicio" runat="server" Text=""></asp:Label></strong>
                        <asp:Label ID="Label3" runat="server" Text=" a "></asp:Label>
                        <strong>
                            <asp:Label ID="txt_HoraFin" runat="server" Text="Hora Fin"></asp:Label></strong>
                    </div>
                    <div class="alinearIzquiera elPadding">
                        <span class="glyphicon glyphicon-map-marker"></span>
                        <asp:Label ID="txt_NombreLugar" runat="server" Text="Lugar"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text=" &#183; "></asp:Label>
                        <asp:Label ID="txt_Direccion" runat="server" Text="Direccion"></asp:Label>
                    </div>
                    <div class="alinearIzquiera elPadding">
                        <i class="fa fa-male"></i>
                        <i class="fa fa-male"></i>
                        <i class="fa fa-male"></i>
                        <asp:Label ID="Label6" runat="server" Text="Cantidad de Participantes:"></asp:Label>
                        <strong>
                            <asp:Label ID="lbl_Cantidad" runat="server" Text=""></asp:Label>
                        </strong>
                    </div>
                    <asp:Button ID="btn_CancelarEncuentro" runat="server" Text="Cancelar Encuentro" OnClick="btn_CancelarEncuentro_Click" class="btn btn-danger"></asp:Button>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="well">
                    <%--GRILLA DE JUGADORES UNIDOS--%>
                    <legend>Lista de Participantes</legend>
                    <div class="panel panel-primary">
                        <div class="panel-heading">Nombre de usuario</div>


                        <%-- Lista Jugadores --%>


                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:Timer ID="Timer2" runat="server" OnTick="Timer1_Tick" Interval="2000"></asp:Timer>

                                <div class="scroll-container">





                                    <div class="panel-body">
                                        <asp:GridView ID="gdv_UsuariosUnidos" ShowHeader="false" EmptyDataText="Sin participantes aún..." BorderWidth="0" Font-Size="Large" runat="server" AutoGenerateColumns="false">
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


                    <%--BOTONES --%>
                    <div>
                        <asp:Button ID="btn_Unirse" runat="server" Text="Unirse" OnClick="btn_Unirse_Click" class="btn btn-success" Width="30%" />
                        <br />
                        <asp:Button ID="btn_Salir" runat="server" Text="Salir" OnClick="btn_Salir_Click" class="btn btn-danger" Width="30%" />
                        <br />


                    </div>
                </div>
            </div>
            <div class="col-sm-5">
                <div class="well">



                    <%--CHAT--%>
                    <legend>Chat</legend>

                    <%--AJAX--%>


                    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="2000"></asp:Timer>


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

                    <br />



                    <%-- BOTONES CHAT--%>
                    <div class="form-group alinearIzquiera">
                        <label for="comment">Mensaje:</label>
                        <asp:Panel ID="pnl_PanelChat" runat="server" DefaultButton="btn_Enviar">
                            <asp:TextBox ID="txt_Mensaje" runat="server" Text="" placeholder="Escriba un mensaje" Class="form-control" MaxLength="50"></asp:TextBox><br />
                            <asp:Button ID="btn_Enviar" runat="server" Text="Enviar" OnClick="btn_Enviar_Click" CssClass="btn btn-primary btn-block" />





                        </asp:Panel>
                    </div>
                </div>
                <br />

                <%--</div>--%>
            </div>



        </div>

        <div class="row">

            <%-- BUSQUEDA --%>

            <div class="col-sm-4">
                <div class="well">

                    <div class="form-group">
                        <asp:Label ID="lbl_BuscarJugadores" Text="Buscar Jugadores" runat="server"></asp:Label>

                    </div>

                    <asp:Panel ID="pnl_Busqueda" runat="server" Visible="true">
                        <div class="well">
                            <div class="form-group">
                                <asp:RadioButton ID="rdb_PorAmigos" Text="Por Amigos" runat="server" OnCheckedChanged="rdb_PorAmigos_CheckedChanged"
                                    AutoPostBack="true" GroupName="busqueda" value="0" Checked="false" />
                            </div>
                            <div class="form-group">
                                <asp:RadioButton ID="rdb_PorNombre" Text="Por Nombre" runat="server" OnCheckedChanged="rdb_PorNombre_CheckedChanged"
                                    AutoPostBack="true" GroupName="busqueda" value="1" Checked="false" />
                            </div>
                            <asp:Panel ID="pnl_PorJugador" runat="server" Visible="false">
                                <div class="well">
                                    <div class="form-group">
                                        <%--<asp:Label ID="lbl_PorJugador" Text="Por Jugador" runat="server"></asp:Label>--%>
                                        <%--<asp:TextBox ID="txt_NombreJugador" Text="" runat="server" placeholder="Nombre Jugador"></asp:TextBox>--%>
                                        <asp:DropDownList ID="cmb_Jugadores" runat="server" CssClass="form-control" AppendDataBoundItems
                                            OnSelectedIndexChanged="cmb_Jugadores_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button ID="btn_CancelarBusqueda" Text="Cancelar" runat="server" OnClick="btn_CancelarBusqueda_Click" />
                                        <asp:Button ID="btn_InvitarJugador" Text="Invitar" runat="server" OnClick="btn_InvitarJugador_Click" />
                                        <asp:Button ID="btn_SolicitudJugador" Text="Solicitud" runat="server" OnClick="btn_SolicitudJugador_Click" />

                                    </div>

                                </div>
                            </asp:Panel>

                            <div class="form-group">
                                <asp:RadioButton ID="rdb_MasOpciones" Text="Más Opciones" runat="server" OnCheckedChanged="rdb_MasOpciones_CheckedChanged"
                                    AutoPostBack="true" GroupName="busqueda" value="2" Checked="false" />
                            </div>
                            <asp:Panel ID="pnl_Opciones" runat="server" Visible="false">
                                <div class="well">

                                   <div class="form-group">
                                            <asp:label ID="lbl_PorDeporte" runat="server" Text="Por Deporte"  />
                                            <div class="dropdown">
                                                <asp:DropDownList ID="cmb_Deporte" runat="server" CssClass="form-control" AppendDataBoundItems
                                                    OnSelectedIndexChanged="cmb_Deporte_SelectedIndexChanged" AutoPostBack="true">
                                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                    <asp:Panel ID="pnl_Lugar" runat="server" Visible="false">

                                        <div class="form-group">
                                            <%--<asp:RadioButton ID="rdb_PorZona" runat="server" Text=" Por Zona " GroupName="tipoLocalizacion" value="0" OnCheckedChanged="rdb_PorZona_CheckedChanged" AutoPostBack="true" />--%>
                                            <asp:CheckBox ID="rdb_PorZona" runat="server" Text="Por Zona" CssClass="checkbox"
                                                OnCheckedChanged="rdb_PorZona_CheckedChanged" AutoPostBack="true"
                                                GroupName="tipoLocalizacion" value="0" />
                                            <div class="form-group">
                                                <%--<asp:Label ID="lbl_Zona" runat="server" CssClass="alinearIzq" Text="Zona"></asp:Label>--%>
                                                <div class="dropdown">
                                                    <asp:DropDownList ID="cmb_Zona" runat="server" CssClass="form-control" AppendDataBoundItems
                                                        OnSelectedIndexChanged="cmb_Zona_SelectedIndexChanged" AutoPostBack="true">
                                                        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <%--<asp:RadioButton ID="rdb_PorBarrio" runat="server" Text=" Por Barrio" GroupName="tipoLocalizacion" value="1" OnCheckedChanged="rdb_PorBarrio_CheckedChanged" AutoPostBack="true" />--%>
                                            <asp:CheckBox ID="rdb_PorBarrio" runat="server" Text="Por Barrio" CssClass="checkbox"
                                                OnCheckedChanged="rdb_PorBarrio_CheckedChanged" AutoPostBack="true"
                                                GroupName="tipoLocalizacion" value="1" />
                                            <div class="form-group">
                                                <%--<asp:Label ID="lbl_Barrio" runat="server" CssClass="alinearIzq" Text="Barrio"></asp:Label>--%>
                                                <div class="dropdown">
                                                    <asp:DropDownList ID="cmb_Barrio" runat="server" CssClass="form-control" AppendDataBoundItems
                                                        OnSelectedIndexChanged="cmb_Barrio_SelectedIndexChanged" AutoPostBack="true">
                                                        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>


                                    </asp:Panel>

                                </div>
                            </asp:Panel>


                            <button type="button" id="btn_Buscar" runat="server" class="btn btn-primary"
                                data-toggle="modal" data-target="#exampleModalScrollable" visible="false">
                                Buscar
                            </button>

                            <asp:Label ID="lbl_ResultadosBusqueda" Text="" runat="server" Visible="false"></asp:Label>

                        </div>


                    </asp:Panel>



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


                                    <%-- RESULTADOS --%>
                                    <center>
                                               <asp:GridView ID="gdv_Invitar" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                                                    HeaderStyle-CssClass="header" RowStyle-CssClass="rows"
                                                    visible ="true" EmptyDataText="Sin Resultados">
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <%--<asp:CheckBox ID="chk_InvitarTodos" runat="server" Text=" Seleccionar Todos" OnCheckedChanged="chk_Invitar_CheckedChanged" />--%>
                                                           <asp:Label id="lbl_Seleccionar" runat="server" Text="Seleccionar"></asp:Label>
                                                                 </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <center>
                                                                <asp:CheckBox ID="chk_Invitar" runat="server"
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
                                            <asp:Button ID="btn_EnviarInvitacion" runat="server" Text="Invitación" OnClick="btn_EnviarInvitacion_Click" />
                                            <asp:Button ID="btn_Solicitud" runat="server" Text="Solicitud" OnClick="btn_Solicitud_Click" Visible="false" />
                                        </center>
                                </div>
                            </div>


                        </div>
                    </div>

                    <%--FIN MODAL--%>
                </div>
            </div>


            <%-- ****MAPA**** --%>
            <div class="col-sm-8">
                <div class="well">
                    <div class="form-group">
                        <div id="myMap"></div>

                    </div>
                    <div class="well" id="div_latlng">
                        <div id="LatLng">
                            <label for="lbl_Latitud">Latitud</label>
                            <asp:TextBox ID="txt_Latitud" Text="" MaxLength="500" runat="server" Visible="true"></asp:TextBox>
                            <br />
                            <label for="lbl_Longitud">Longitud</label>
                            <asp:TextBox ID="txt_Longitud" Text="" MaxLength="500" runat="server" Visible="true"></asp:TextBox>
                        </div>
                    </div>

                </div>

            </div>


            <div class="col-me-2"></div>


        </div>

        </div>


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

                myMap.setView([latitude, longitude], 12)

            }

            if (latitude == -31.4166 && longitude == -64.1835) {

                layerGroup.clearLayers();

                myMap = L.map('myMap').setView([-31.416563, -64.183533], 18)
                
            }



            // CREAR UN MARCADOR
            // let marker = L.marker([-31.416563, -64.183533]).addTo(myMap)

            // DESACTIVAR ZOOM CON DOBLE CLICK
            myMap.doubleClickZoom.disable()

            // var layerGroup = L.layerGroup().addTo(myMap)

            // PONER UN MARCADOR CON EL EVENTO DOBLECLICK


        </script>
</asp:Content>
