<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CrearEncuentro.aspx.cs" Inherits="CapaPresentacion.CrearEncuentro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <%--**** MAPA ****--%>

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
        integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
        crossorigin="" />

    <%--**** MAPA ****--%>



    <style>
        h1 {
            text-align: center;
            color: white;
        }

        .alinearCentro {
            text-align: center;
        }

        .fondoPalJumbotron {
            background-color: #000000;
        }

        #myMap {
            /*height: 450px;
            width: 550px;*/
            width: 100%;
            padding-top: 56.25%;
        }


        #LatLng {
            position: absolute;
            z-index: -100;
        }

        .hiddencol {
            position: absolute;
            z-index: -100;
        }

        .imagen {
            background-image: url('../Imagenes/complejo_imagen_clara.jpg');
        }

        .colorsito {
            color: white;
        }
    </style>



</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        <asp:Label ID="lbl_Titulo" runat="server" Text="Crear Encuentro"></asp:Label>
    </h1>
    <div class="jumbotron text-center fondoPalJumbotron">
        <div class="row">
            <div class="col-md-3">
                <div class="well">
                    <div class="row">
                        <div class="form-group" class="well">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <asp:Label ID="lbl_Deporte" runat="server" CssClass="alinearIzq" Text="Deporte"></asp:Label>
                                    <div class="dropdown">
                                        <asp:DropDownList ID="cmb_Deporte" runat="server" CssClass="form-control" AppendDataBoundItems
                                            OnSelectedIndexChanged="cmb_Deporte_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            
                                <%--<div class="well" style="width: 310px; height:250px; margin: 0 auto;">--%>
                                    <div class="form-group" style="width: 310px; height:200px; margin: 0 auto;">

                                        <asp:Label ID="lbl_Fecha" runat="server" Text="Fecha"></asp:Label>
                                        <asp:Calendar ID="cld_Fecha" runat="server" Width="270px" height="100px" OnDayRender="cld_Fecha_DayRender" OnSelectionChanged="cld_Fecha_SelectionChanged"></asp:Calendar>

                                    </div>
                                <%--</div>--%>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

       
            <div class="col-md-9">
                <div class="well">
                    <div class="row">
                        <%--  LUGAR PUBLICO--%>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:RadioButton ID="rdb_Publico" runat="server" Text=" Lugar Público" GroupName="tipoEncuentro" value="0" OnCheckedChanged="rdb_Publico_CheckedChanged" AutoPostBack="true" />
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbl_HoraInicio" runat="server" Text="Hora Inicio (*)"></asp:Label>
                                <asp:TextBox ID="txt_HoraInicio" runat="server" Columns="5" MaxLength="5" TextMode="Time"></asp:TextBox>
                                <%--</div>
                            <div class="form-group">--%>
                                <asp:Label ID="lbl_HoraFin" runat="server" Text="Hora Fin"></asp:Label>
                                <asp:TextBox ID="txt_HoraFin" runat="server" Columns="5" MaxLength="5" TextMode="Time"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbl_Cantidad" runat="server" Text="Cantidad de Participantes (*)"></asp:Label>
                                <asp:TextBox ID="txt_Cantidad" CssClass="form-control" runat="server" placeHolder="Cantidad de Participantes" TextMode="Number"
                                    onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" min="2"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbl_NombreLugar" runat="server" Text="Lugar (*)"></asp:Label>
                                <asp:TextBox ID="txt_NombreLugar" CssClass="form-control" runat="server" placeHolder="Lugar" Columns="50" MaxLength="45"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbl_Direccion" runat="server" Text="Direccion (*)"></asp:Label>
                                <asp:TextBox ID="txt_Direccion" CssClass="form-control" runat="server" placeHolder="Ingrese una direccion" Columns="50" MaxLength="45"></asp:TextBox>

                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbl_ZonaPublico" runat="server" CssClass="alinearIzq" Text="Zona (*)"></asp:Label>
                                <div class="dropdown">
                                    <asp:DropDownList ID="cmb_ZonaPublico" runat="server" CssClass="form-control" AppendDataBoundItems
                                        OnSelectedIndexChanged="cmb_ZonaPublico_SelectedIndexChanged" AutoPostBack="false">
                                        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                    </asp:DropDownList>

                                    <br />
                                    <asp:Label ID="lbl_ConsejoMapa" runat="server" Visible="false"
                                        Text="Haz doble click en el mapa para seleccionar un lugar"></asp:Label>
                                </div>
                            </div>



                        </div>
                        <%-- LUGAR PRIVADO --%>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:RadioButton ID="rdb_Privado" runat="server" Text=" Lugar Privado" GroupName="tipoEncuentro" value="1" OnCheckedChanged="rdb_Privado_CheckedChanged" AutoPostBack="true" />
                            </div>

                            <%-- FILTRO BARRIO/ZONA --%>
                             <div class="row">
                                   <div class="well" style="height:100px;  padding-top: 5px">
                                   <%--<div class="form-group">--%>
                                       <%--<asp:RadioButton ID="rdb_PorZona" runat="server" Text=" Por Zona " GroupName="tipoLocalizacion" value="0" OnCheckedChanged="rdb_PorZona_CheckedChanged" AutoPostBack="true" />--%>

                                       <div class="col-md-6">
                                           <asp:CheckBox ID="rdb_PorZona" runat="server" Text="Por Zona" CssClass="checkbox"
                                               OnCheckedChanged="rdb_PorZona_CheckedChanged" AutoPostBack="true"
                                               GroupName="tipoLocalizacion" value="0" />
                                           <%-- <div class="form-group">--%>
                                           <%--<asp:Label ID="lbl_Zona" runat="server" CssClass="alinearIzq" Text="Zona"></asp:Label>--%>
                                           <div class="dropdown">
                                               <asp:DropDownList ID="cmb_Zona" runat="server" CssClass="form-control" AppendDataBoundItems
                                                   OnSelectedIndexChanged="cmb_Zona_SelectedIndexChanged" AutoPostBack="true">
                                                   <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                               </asp:DropDownList>
                                           </div>
                                       </div>
                                       <%--</div>--%>
                                       <%--<br />--%>
                                       <%--<asp:RadioButton ID="rdb_PorBarrio" runat="server" Text=" Por Barrio" GroupName="tipoLocalizacion" value="1" OnCheckedChanged="rdb_PorBarrio_CheckedChanged" AutoPostBack="true" />--%>

                                       <div class="col-md-6">
                                           <asp:CheckBox ID="rdb_PorBarrio" runat="server" Text="Por Barrio" CssClass="checkbox"
                                               OnCheckedChanged="rdb_PorBarrio_CheckedChanged" AutoPostBack="true"
                                               GroupName="tipoLocalizacion" value="1" />
                                           <%--<div class="form-group">--%>
                                           <%--<asp:Label ID="lbl_Barrio" runat="server" CssClass="alinearIzq" Text="Barrio"></asp:Label>--%>
                                           <div class="dropdown">
                                               <asp:DropDownList ID="cmb_Barrio" runat="server" CssClass="form-control" AppendDataBoundItems
                                                   OnSelectedIndexChanged="cmb_Barrio_SelectedIndexChanged" AutoPostBack="true">
                                                   <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                               </asp:DropDownList>
                                           </div>
                                       </div>
                                       <%--</div>--%>
                                   <%--</div>--%>
                                      </div>
                                   
                               </div>


                            <%-- TIPO DE BUSQUEDA --%>

                            <div class="row">
                                 <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:RadioButton ID="rdb_Complejo" runat="server" Text=" Por Complejo" GroupName="tipoBusqueda" value="1" OnCheckedChanged="rdb_Complejo_CheckedChanged" AutoPostBack="true" />
                                        <br />
                                        <%--<asp:HyperLink ID="link_ComplejosInfo" Text="Ver Complejos"
                                        runat="server" NavigateUrl="~/Complejos.aspx" ForeColor="Blue"></asp:HyperLink>
                                    <br />--%>


                                        <asp:Label ID="lbl_Complejo" runat="server" Text="Complejos"></asp:Label>
                                        <asp:DropDownList ID="cmb_Complejo" CssClass="form-control" runat="server" AutoPostBack="true"
                                            AppendDataBoundItems="true" OnSelectedIndexChanged="cmb_Complejo_SelectedIndexChanged">
                                            <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                        </asp:DropDownList>
                                 
                                    </div>
                                </div>
                                <div class="col-md-6">

                                    <div class="form-group">
                                        <asp:RadioButton ID="rdb_Horario" runat="server" Text=" Por Horario " GroupName="tipoBusqueda" value="0" OnCheckedChanged="rdb_Horario_CheckedChanged" AutoPostBack="true" />
                                        <br />
                                        <asp:Label ID="lbl_PorHora" runat="server" Text="Hora Inicio"></asp:Label>
                                        <asp:TextBox ID="txt_PorHora" runat="server" Columns="5" MaxLength="5" TextMode="Time"></asp:TextBox>
                                        <br />
                                        <asp:Label ID="lbl_TipoCancha" runat="server" Text="Tipo Cancha"></asp:Label>
                                        <asp:DropDownList ID="cmb_TipoCancha" CssClass="form-control" runat="server" AutoPostBack="true"
                                            AppendDataBoundItems="true" OnSelectedIndexChanged="cmb_TipoCancha_SelectedIndexChanged">
                                            <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />

                                    </div>

                                </div>

                               
                            </div>



                            <div class="form-group">
                              

                                <%--<br />--%>

                                <%--MODAL--%>


                                <%-- <asp:Button ID="btn_VerAgenda" runat="server" Text="Ver Agenda"
                                    OnClick="btn_VerAgenda_Click" data-toggle="modal" data-target="#exampleModalScrollable" />
                                --%>



                                <button type="button" id="btn_Agenda" runat="server" class="btn btn-primary"
                                    data-toggle="modal" data-target="#exampleModalScrollable"
                                    visible="false">
                                    Ver Agenda del Complejo
                                </button>



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


                  <%--
                   <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick"  Interval="1000"></asp:Timer>--%>

                                                <%-- Agenda de un Complejo --%>

                                               <asp:GridView ID="gdv_Agenda" runat="server" AutoGenerateColumns="false" CssClass="w3-table-all w3-card-4"
                                                    OnSelectedIndexChanged="gdv_Agenda_SelectedIndexChanged"
                                                    Visible="false" EmptyDataText="No hay horarios disponibles">
                                                    <Columns>
                                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~\Imagenes\flecha_png_by_saloeditions_d4t9zl2-200h.png" ShowSelectButton="true" ControlStyle-Width="60px" />

                                                        <asp:BoundField DataField="idCancha" HeaderText="Id" Visible="false" />
                                                        <asp:BoundField DataField="nombreCancha" HeaderText="Cancha" Visible="false" />
                                                        <asp:BoundField DataField="nombreTipoCancha" HeaderText="Tipo" Visible="true" />
                                                        <asp:BoundField DataField="horaInicioHorario" HeaderText="Horarios" Visible="true" />
                                                        <asp:BoundField DataField="precioCancha" HeaderText="Precio" Visible="true" />
                                                        <asp:BoundField DataField="capacidadTipoCancha" HeaderText="Capacidad" Visible="true" />

                                                    </Columns>
                                                </asp:GridView>

                                                <%--  Agenda de varios Complejos --%>

                                                 <asp:GridView ID="gdv_AgendaComplejos" runat="server" AutoGenerateColumns="false" CssClass="w3-table-all w3-card-4"
                                                     OnSelectedIndexChanged="gdv_AgendaComplejos_SelectedIndexChanged"
                                                    visible="false" EmptyDataText="No hay complejos disponibles para la hora y/o tipo de cancha seleccionados" >
                                                    <Columns>
                                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~\Imagenes\flecha_png_by_saloeditions_d4t9zl2-200h.png" ShowSelectButton="true" ControlStyle-Width="60px" />

                                                         <asp:BoundField DataField="idCancha" HeaderText="" Visible="true"
                                                          ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"/>
                                                        <asp:BoundField DataField="idComplejoDeportivo" HeaderText="" Visible="true"  
                                                         ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                                                        <asp:BoundField DataField="nombreComplejoDeportivo" HeaderText="Complejo" Visible="true" />
                                                        <asp:BoundField DataField="nombreTipoCancha" HeaderText="Tipo" Visible="true" />
                                                        <asp:BoundField DataField="precioCancha" HeaderText="Precio" Visible="true" />
                                                        <asp:BoundField DataField="capacidadTipoCancha" HeaderText="Capacidad" Visible="true" />

                                                    </Columns>
                                                </asp:GridView>

                     <%--
                              <asp:SqlDataSource ID="sqlData" runat="server"></asp:SqlDataSource>

                        </ContentTemplate>
                    </asp:UpdatePanel>--%>


                                                </center>
                                            </div>
                                            <div class="modal-footer">
                                                <%--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
                                                <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
                                            </div>
                                        </div>


                                    </div>
                                </div>



                                <%--FIN MODAL--%>




                                <%-- ***************************************************** --%>


                                <br />


                                <%--MODAL COMPLEJO--%>

                                <button type="button" id="btn_VerComplejo" runat="server" class="btn btn-primary"
                                    data-toggle="modal" data-target="#exampleModalScrollable2"
                                    visible="false">
                                    Ver Complejo
                                </button>


                                <div class="modal fade" id="exampleModalScrollable2" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle2"
                                    aria-hidden="false">
                                    <%--data-backdrop="static" data-keyboard="false">--%>
                                    <div class="modal-dialog modal-dialog-scrollable" role="document">



                                        <div class="modal-content imagen">
                                            <div class="modal-header">

                                                <button type="button" class="close colorsito" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                                <h5 class="modal-title" id="exampleModalScrollableTitle2">
                                                    <asp:Image ID="imgAvatar" ImageUrl="~/Imagenes/complejo_logo_default.png" runat="server" CssClass="img-circle" Height="100" Width="100" />
                                                    <strong>
                                                        <center>
                                                             <asp:Label ID="lbl_ComplejoTitulo" runat="server" Text="Lugar" CssClass="colorsito"></asp:Label>
                                                  </center>
                                                    </strong>
                                                    <h5></h5>
                                                    <h5></h5>
                                                    <h5></h5>
                                                </h5>
                                            </div>
                                            <div class="modal-body">


                                                <div class="form-group">
                                                    <asp:Label ID="lblValoracion" runat="server" CssClass="colorsito"></asp:Label>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="lblDeportes" runat="server" ForeColor="#FF9900" CssClass="colorsito"></asp:Label>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="lblDescripcion" runat="server" CssClass="colorsito"></asp:Label>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="lblServicios" Text="Servicios: " runat="server" CssClass="colorsito"></asp:Label>
                                                </div>
                                                <div class="form-group" id="divListServ" runat="server">
                                                    <asp:ListBox ID="listServicios" Enabled="false" runat="server"></asp:ListBox>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="lblDireccion" runat="server" CssClass="colorsito"></asp:Label>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="lblBarrio" runat="server" CssClass="colorsito"></asp:Label>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="lblZona" runat="server" CssClass="colorsito"></asp:Label>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="lblTelefono" runat="server" CssClass="colorsito"></asp:Label>
                                                </div>
                                                <div class="form-group">
                                                    <asp:Label ID="lblHorarios" runat="server" CssClass="colorsito"></asp:Label>
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
                                                                    <img id="img1" runat="server" height="500" width="700">
                                                                </div>

                                                                <div class="item">
                                                                    <img id="img2" runat="server" height="500" width="700">
                                                                </div>

                                                                <div class="item">
                                                                    <img id="img3" runat="server" height="500" width="700">
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


                                            <%-- FIN BODY --%>


                                            <div class="modal-footer">
                                                <center>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                        </center>
                                            </div>
                                        </div>


                                    </div>

                                </div>


                                <%--FIN MODAL COMPLEJO  --%>



                                <br />
                                <br />
                                <%-- ALERTA --%>
                                <div id="infoReserva" class="alert alert-info" role="alert"
                                    runat="server" visible="false">
                                    <%--<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>--%>
                                    <strong>Info!</strong>

                                    <asp:Label ID="lbl_Reserva" runat="server" Text=""></asp:Label>
                                    <br />
                                    <asp:Label ID="lbl_Capacidad" runat="server" Text=""></asp:Label>

                                </div>

                                <div class="form-group">
                                    <asp:CheckBox ID="chk_Accesibilidad" CssClass="checkbox" runat="server"
                                        Text=" Clave" OnCheckedChanged="chk_Accesibilidad_CheckedChanged" AutoPostBack="true" />
                                    <%--<asp:Label ID="lbl_Clave" runat="server" Text="Clave"></asp:Label>--%>
                                    <asp:TextBox ID="txt_Clave" CssClass="form-control" runat="server" placeHolder="Ingrese Contraseña" Text=""
                                        TextMode="Password" Columns="20" MaxLength="20"></asp:TextBox>
                                </div>

                            </div>
                        </div>



                        <%--BOTONES--%>
                    </div>


                    <%-- ALERTA --%>
                    <div class="alert alert-danger" id="alertaErrores"
                        runat="server" visible="false">
                        <%--<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>--%>
                        <strong>Error!</strong>
                        <asp:Label ID="lbl_Error" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>



                    <asp:Button ID="btn_Crear" runat="server" Text="Crear" OnClick="btn_Crear_Click" Type="button" Class="btn btn-success" />
                    <asp:Button ID="btn_Cancelar" runat="server" Text="Cancelar" OnClick="btn_Cancelar_Click" Type="button" Class="btn btn-danger" />
                    <br />

                </div>
            </div>
        </div>
        <%-- ****MAPA**** --%>

        <div class="well">
            <div class="form-group">
                <div id="myMap"></div>
            </div>

            <div class="well">
                <div id="txt_latlng" class="form-inline">
                    <div id="LatLng">
                        <label for="lbl_Latitud">Latitud</label>
                        <asp:TextBox ID="txt_Latitud" Text="" MaxLength="500" runat="server" Visible="true"></asp:TextBox>
                        <%--<input type="text" id="txt_Latitud" name="txt_Latitud" runat="server">--%>
                        <br />
                        <label for="lbl_Longitud">Longitud</label>
                        <asp:TextBox ID="txt_Longitud" Text="" MaxLength="500" runat="server" Visible="true"></asp:TextBox>
                        <%--<input type="text" id="txt_Longitud" name="txt_Longitud" runat="server">--%>
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


            // CREAR UN MARCADOR
            // let marker = L.marker([-31.416563, -64.183533]).addTo(myMap)



            // DESACTIVAR ZOOM CON DOBLE CLICK
            myMap.doubleClickZoom.disable()

            // var layerGroup = L.layerGroup().addTo(myMap)

            if (document.getElementById('<%= rdb_Publico.ClientID %>').checked) {
            // PONER UN MARCADOR CON EL EVENTO DOBLECLICK
            myMap.on('dblclick', e => {
                // ELIMINAR MARCADOR DEL COMPLEJO


                layerGroup.clearLayers();

                let latLng = myMap.mouseEventToLatLng(e.originalEvent)
                // L.marker([latLng.lat, latLng.lng]).addTo(myMap)

                myMap.closePopup();
                //var marker = L.marker([latLng.lat, latLng.lng]).addTo(layerGroup)

                marker = L.marker([latLng.lat, latLng.lng], { draggable: false }).addTo(layerGroup)
                // marker = L.marker([latLng.lat, latLng.lng]).addTo(layerGroup)

                // $('#txt_Latitud').val(myMap.getCenter().lat + ',' + myMap.getCenter().lng); //ok

                // ASP.NET
                // $('#txt_Latitud').val(marker.getLatLng().lat)
                // $('#txt_Longitud').val(marker.getLatLng().lng)

                $('#<%= txt_Latitud.ClientID %>').val(marker.getLatLng().lat);
                            $('#<%= txt_Longitud.ClientID %>').val(marker.getLatLng().lng);

                            // HTML
                            //document.getElementById("txt_Latitud").value = marker.getLatLng().lat
                            //document.getElementById("txt_Longitud").value = marker.getLatLng().lng



                            // PONER UN POPUP
                            // marker.bindPopup('CBA').openPopup(); // ok
                        })
                    }



                    var cmbCD = document.getElementById("<%= cmb_Complejo.ClientID%>");
            var indice = cmbCD.options[cmbCD.selectedIndex].value;

            if (indice > 0) {
                // MOSTRAR UN COMPLEJO
                var latitude = document.getElementById('<%= txt_Latitud.ClientID %>').value;
            var longitude = document.getElementById('<%= txt_Longitud.ClientID %>').value;

            var marker = L.marker([latitude, longitude]).addTo(layerGroup)
            if (latitude != "" && longitude != "") {
                myMap.setView([latitude, longitude], 15)
            }

        } else {
            // MOSTRAR UN COMPLEJO
            var latitude = document.getElementById('<%= txt_Latitud.ClientID %>').value;
            var longitude = document.getElementById('<%= txt_Longitud.ClientID %>').value;

            var marker = L.marker([latitude, longitude]).addTo(layerGroup)
            if (latitude != "" && longitude != "") {
                myMap.setView([latitude, longitude], 15)
            }

        }



        </script>
</asp:Content>
