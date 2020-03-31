<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EncuentroPublico.aspx.cs" Inherits="CapaPresentacion.EncuentroPublico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .alinearIzquiera{
        text-align:left;
    }
    .tamanoLetra{
        font-size:15px;

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
        .scroll-container {

            display: block;
            height = 500px;
            overflow-y: scroll;
        }

         #myMap {
            height: 300px;
            width: 400px;
            /*width: 100%;
            padding-top: 56.25%;*/
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
                                <strong><asp:Label ID="cld_Fecha" CssClass="tamanoLetra" runat="server" Text=""></asp:Label></strong>
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
                       <strong> <asp:Label ID="txt_HoraInicio" runat="server" Text=""></asp:Label></strong>
                        <asp:Label ID="Label3" runat="server" Text=" a "></asp:Label>
                        <strong><asp:Label ID="txt_HoraFin" runat="server" Text="Hora Fin"></asp:Label></strong>
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
                         <asp:Label ID="Label6"   runat="server" Text="Cantidad de Participantes:"></asp:Label>
                       <strong> <asp:Label ID="lbl_Cantidad"  runat="server" Text=""></asp:Label>   </strong>
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
                            <asp:Timer ID="Timer2" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>

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
                        <asp:Button ID="btn_Unirse" runat="server" Text="Unirse" OnClick="btn_Unirse_Click" class="btn btn-success" Width="30%"/>
                        <br />
                        <asp:Button ID="btn_Salir" runat="server" Text="Salir" OnClick="btn_Salir_Click" class="btn btn-danger" Width="30%"/>
                        <br />




                         <%--<asp:Button ID="btn_Invitar" runat="server" Text="Invitar" OnClick="btn_Invitar_Click" class="btn btn-info" Width="30%"/>--%>



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
                                                    HeaderStyle-CssClass="header" RowStyle-CssClass="rows" >
                                                    <Columns>
                                                        <asp:TemplateField>
                                                            <HeaderTemplate>
                                                                <%--<asp:CheckBox ID="chk_InvitarTodos" runat="server" Text=" Seleccionar Todos" OnCheckedChanged="chk_Invitar_CheckedChanged" />--%>
                                                                <asp:Label id="lbl_Seleccionar" runat="server" Text="Seleccionar"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="chk_Invitar" runat="server" OnCheckedChanged="chk_Invitar_CheckedChanged" />
                                                                 </ItemTemplate>

                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="id" HeaderText="idUsuario" Visible="false" />
                                                        <asp:BoundField DataField="nombre" HeaderText="Usuario" Visible="true" />

                                                    </Columns>
                                                </asp:GridView>
                                              <%--  </center>--%>
                                    </div>
                                    <div class="modal-footer">
                                        <center>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                        <button type="button" class="btn btn-primary">Invitar</button>
                                        </center>
                                    </div>
                                </div>


                            </div>
                        </div>

                        <%--FIN MODAL--%>
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
                            <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>


                            <div class="scroll-container">

                            <asp:GridView ID="gdv_Pantalla" runat="server" AutoGenerateColumns="false" BackColor="#e8e8e8" HeaderStyle-BackColor="#0066ff"
                                HeaderStyle-ForeColor="White"  BorderColor="Black" ForeColor="Black" BorderStyle="Groove"
                                EmptyDataText="Sin participantes aún..." BorderWidth="0" Font-Size="Large"  >
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
                            <asp:TextBox ID="txt_Mensaje" runat="server" Text="" placeholder="Escriba un mensaje" Class="form-control" MaxLength="50"  ></asp:TextBox><br />
                            <asp:Button ID="btn_Enviar" runat="server" Text="Enviar" OnClick="btn_Enviar_Click" CssClass="btn btn-primary btn-block" />

                          



                        </asp:Panel>
                    </div>
                    </div>
                    <br />

                <%--</div>--%>
            </div>

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

       

    </script>





</asp:Content>
