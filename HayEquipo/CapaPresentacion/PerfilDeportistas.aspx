<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PerfilDeportistas.aspx.cs" Inherits="CapaPresentacion.PerfilDeportistas" %>


<%--<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>--%>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">



    <style>
        .mydatagrid {
            width: 80%;
            border: solid 4px black;
            border-radius: 12px;
            min-width: 80%;
        }

        .header {
            background-color: #0b3107;
            font-family: Arial;
            color: White;
            height: 25px;
            text-align: center;
            font-size: 16px;
        }

        .rows {
            background-color: #fff;
            font-family: Arial;
            font-size: 14px;
            color: #000;
            min-height: 25px;
            text-align: left;
        }

            .rows:hover {
                background-color: #000;
                color: White;
            }

        .mydatagrid a /** FOR THE PAGING ICONS  **/ {
            background-color: Transparent;
            padding: 5px 5px 5px 5px;
            color: #000;
            text-decoration: none;
            font-weight: bold;
        }

            .mydatagrid a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/ {
                background-color: #0026ff;
                color: #fff;
            }

        .mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/ {
            padding: 5px 5px 5px 5px;
            background-color: #000;
            color: #fff;
        }

        .pager {
            background-color: #22c81a;
            font-family: Arial;
            color: White;
            height: 30px;
            text-align: left;
        }

        .mydatagrid td {
            padding: 5px;
        }

        .mydatagrid th {
            padding: 5px;
        }

        .round3 {
            border: 2px solid #0b3107;
            border-radius: 12px;
        }


        input[type="radio"] {
            display: none;
        }


        .clasificacion {
            direction: rtl;
            unicode-bidi: bidi-override;
            margin-right: 70%;
        }

        label:hover,
        label:hover ~ label {
            color: orange;
        }


        input[type="radio"]:checked ~ label {
            color: orange;
        }

        .estrellalabel {
            font-size: 20px;
        }

        .estrella {
            transform: scale(2.0);
            margin-left: 20%;
        }


        .badge {
            position: absolute;
            top: -10px;
            right: -10px;
            padding: 5px 10px;
            border-radius: 50%;
            background: red;
            color: white;
        }

        .hiddencol {
            display: none;
        }

        .scroll-container {
            display: block;
            height: 390px;
            overflow-y: auto;
        }

    </style>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { 'packages': ['bar'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Mes');
            data.addColumn('number', 'Jugados');
            data.addColumn('number', 'Organizados');
            data.addRows(<%=this.obtenerDatosBar()%>);

            var options = {
                chart: {
                    title: 'Partidos Jugados y Organizados',

                },

                hAxis: {
                    title: "Fecha",
                    format: 'M/d/yy',
                },
                vAxis: {
                    title: "Partidos",
                    minValue: 0,
                    maxValue: 100,


                }
            };

            var chart = new google.charts.Bar(document.getElementById('barchart_material'));

            chart.draw(data, google.charts.Bar.convertOptions(options));
        }



    </script>
<script src="scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
<script src="scripts/calendar-en.min.js" type="text/javascript"></script>
<link href="css/calendar-blue.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
    $(document).ready(function () {
        $("#<%=txt_FechaNacimiento.ClientID %>").dynDateTime({
            showsTime: true,
            ifFormat: "%d/%m/%Y",
            daFormat: "%l;%M %p, %e %m,  %Y",
            align: "BR",
            electric: false,
            singleClick: false,
            displayArea: ".siblings('.dtcDisplayArea')",
            button: ".next()"
        });
    });
</script>


</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">

            <div class="col-sm-5 text-center">
                <div class="well">
                    <p>
                        <asp:LinkButton ID="link_nombreUsuario2" runat="server" Text=""></asp:LinkButton>
                    </p>

                    <asp:Image ID="Image1" ImageUrl="Imagenes/nene.png" runat="server" CssClass="img-circle" Height="100" Width="100" />
                    <br />
                    <br />
                    <div class="form-group">
                        <asp:FileUpload ID="FileUploadAvatar" CssClass="btn btn-primary" runat="server" />
                    </div>

                    <div class="form-group">
                        <asp:Button ID="btn_guardarImagen" runat="server" Text="Guardar Imagen" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btnGuardarImagen_Click" />
                        <asp:Button ID="btn_CambiarImagen" runat="server" Text="Cambiar Imagen" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btnCambiarImagen_Click" Visible="false" />
                    </div>
                    <asp:Label ID="lblestado" runat="server"></asp:Label>


                    <br />

                    <%-- BUSCAR JUADORES --%>





                    <asp:Panel ID="pnl_Busqueda" runat="server" Visible="true">


                        <div class="well">
                            <div class="form-group">
                                <asp:Label ID="lbl_BuscarJugadores" Text="Buscar Jugadores" runat="server"></asp:Label>
                            </div>

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
                                        <%--<asp:Button ID="btn_InvitarJugador" Text="Invitar" runat="server" OnClick="btn_InvitarJugador_Click" />--%>
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
                                                    <asp:DropDownList ID="cmb_BuscarBarrio" runat="server" CssClass="form-control" AppendDataBoundItems
                                                        OnSelectedIndexChanged="cmb_BuscarBarrio_SelectedIndexChanged" AutoPostBack="true">
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

                                            <%--<asp:Button ID="btn_EnviarInvitacion" runat="server" Text="Invitación" OnClick="btn_EnviarInvitacion_Click" />--%>
                                            <asp:Button ID="btn_Solicitud" runat="server" Text="Solicitud" OnClick="btn_Solicitud_Click" Visible="false" />
                                        </center>
                                </div>
                            </div>


                        </div>
                    </div>

                    <%--FIN MODAL--%>

                    <%-- FIN BUSCAR JUGADORES --%>
                </div>







            </div>
            <div class="col-sm-7 well">

                <div class="well">
                    <ul class="nav nav-tabs">
                        <li id="datos" runat="server" class="active"><a data-toggle="tab" href="#home">Mis Datos</a></li>
                        <li><a data-toggle="tab" href="#menu1">Mis Encuentros</a></li>
                        <li id="calif" class="" runat="server"><a data-toggle="tab" href="#menu2">Mis Calificaciones</a></li>
                        <li><a data-toggle="tab" href="#menu3">Estadisticas</a></li>
                        <%-- <li><a data-toggle="tab" href="#menu5">Reporte Establecimiento</a></li>--%>
                        <li><a data-toggle="tab" href="#menu6"><span class="glyphicon glyphicon-bell"></span>Notificaciones<span class="badge">
                            <asp:Label ID="lbl_Notificacion" runat="server" Text="0"></asp:Label></span></a></li>

                        <li><a data-toggle="tab" href="#menu7"><span class="glyphicon glyphicon-user"></span>Solicitudes<span class="badge">
                            <asp:Label ID="lbl_Solicitudes" runat="server" Text="0"></asp:Label></span></a></li>

                        <li><a data-toggle="tab" href="#menu8"><i class="fa fa-users" aria-hidden="true"></i>Contactos<span class="badge">
                            <asp:Label ID="lbl_Contactos" runat="server" Text="0"></asp:Label></span></a></li>

                    </ul>
                  <div class="scroll-container">
                    <div class="tab-content">
                        <div id="home" class="tab-pane fade in active">
                            <br />
                            <div class="form-group">
                                <asp:Label ID="lbl_Nombres" runat="server" Text="Nombres"></asp:Label>
                                <asp:TextBox ID="txt_Nombres" class="form-control" runat="server" placeholder="Ingrese Nombres"></asp:TextBox>

                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbl_Apellidos" runat="server" Text="Apellido"></asp:Label>
                                <asp:TextBox ID="txt_Apellidos" runat="server" class="form-control" placeholder="Ingrese Apellido"></asp:TextBox>

                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbl_TipoDocumento" runat="server" Text="Tipo Documento"></asp:Label>
                                <asp:DropDownList ID="ddl_TipoDocumento" runat="server"></asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="lbl_NumeroDocumento" runat="server" Text="N°Documento"></asp:Label>
                                <asp:TextBox ID="txt_NumeroDocumento" runat="server" class="form-control" placeholder="Ingrese Nro Documento"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbl_Sexo" runat="server" Text="Sexo"></asp:Label>
                                <asp:DropDownList ID="cmb_sexo" runat="server" CssClass="form-control" AppendDataBoundItems >
                                        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                    </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbl_FechaNacimiento" runat="server" Text="Fecha de nacimiento"></asp:Label>

                                <asp:TextBox ID="txt_FechaNacimiento" runat="server" placeholder="Ingrese Fecha Nacimiento"></asp:TextBox>
                                <asp:Image id="calendario" runat="server" ImageUrl="imagenes/calender.png"  />

                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbl_Telefono" runat="server" Text="Telefono"></asp:Label>
                                <asp:TextBox ID="txt_Telefono" runat="server" class="form-control" placeholder="Ingrese Telefono"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbl_DeportePreferido" runat="server" Text="Deporte Preferido"></asp:Label>
                                 <asp:DropDownList ID="cmb_DeportePrederido" runat="server" CssClass="form-control" AppendDataBoundItems >
                                        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                    </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbl_Barrio" runat="server" Text="Barrio"></asp:Label>
                                <asp:DropDownList ID="cmb_Barrio" runat="server" CssClass="form-control" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="btnGuardar" runat="server" Text="Registrar Datos Deportista" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btnGuardar_Click" Visible="true" />
                                <asp:Button ID="btnCambiar" runat="server" Text="Cambiar Datos Deportista" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btnCambiar_Click" Visible="false" />
                                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Datos Deportista" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btnActualizar_Click" Visible="false" />
                                <asp:Label ID="lblmsj" runat="server"></asp:Label>
                            </div>
                        </div>



                        <div id="menu1" class="tab-pane fade">
                            <div class="table-responsive">
                                <br />
                                <asp:GridView ID="gdv_EncuentrosDeportista" runat="server" AutoGenerateColumns="false" CssClass="w3-table-all w3-card-4"
                                    OnSelectedIndexChanged="gdv_EncuentrosDisponibles_SelectedIndexChanged">

                                    <Columns>
                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~\Imagenes\flecha_png_by_saloeditions_d4t9zl2-200h.png" ShowSelectButton="true" ControlStyle-Width="60px" />
                                        <asp:BoundField DataField="idEncuentroDeportivo" HeaderText="Id" Visible="false" />
                                        <asp:BoundField DataField="tipoEncuentro" HeaderText="Tipo" Visible="true" />
                                        <asp:BoundField DataField="nombreDeporte" HeaderText="Deporte" Visible="true" />
                                        <asp:BoundField DataField="nombreComplejo" HeaderText="Complejo" Visible="true" />
                                        <asp:BoundField DataField="nombreLP" HeaderText="LugarPublico" Visible="true" />
                                        <asp:BoundField DataField="fechaInicioEncuentro" HeaderText="Fecha Inicio" Visible="true" DataFormatString="{0:d}" />
                                        <asp:BoundField DataField="horaInicio" HeaderText="Hora Inicio" Visible="true" DataFormatString="{0:t}" />
                                        <asp:BoundField DataField="accesibilidad" HeaderText="Accesibilidad" Visible="true" />
                                        <asp:BoundField DataField="nombreEstado" HeaderText="Estado" Visible="true" />

                                    </Columns>
                                </asp:GridView>

                            </div>

                        </div>
                        <%-- NOTIFICACIONES --%>



                        <div id="menu6" class="tab-pane fade">
                            <div class="table-responsive">



                                <center>
                                <asp:GridView ID="gdv_Notificaciones" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                                      HeaderStyle-CssClass="header" RowStyle-CssClass="rows" visible ="true" EmptyDataText="Sin Notificaciones"
                                   OnSelectedIndexChanged="gdv_Notificaciones_SelectedIndexChanged" OnRowDeleting="gdv_Notificaciones_RowDeleting">

                                      <Columns>

                                           <asp:CommandField showDeleteButton="true" HeaderText="" ShowHeader="True"
                                               DeleteText='<i class="glyphicon glyphicon-trash"></i>' />

                                           <asp:CommandField ButtonType="Image" SelectImageUrl="~\Imagenes\boton-ir.png"
                                                ShowSelectButton="true" ControlStyle-Width="25px" HeaderText="Ir"
                                              />

                                            <asp:BoundField DataField="idNotificacion" HeaderText="IdNotif" Visible="false" />
                                            <asp:BoundField DataField="nombreEmisor" HeaderText="Emisor" Visible="true" />
                                            <asp:BoundField DataField="texto" HeaderText="Notificacion" Visible="true" />
                                            <asp:BoundField DataField="idEncuentro" HeaderText="IdEncuentro" Visible="false" />
                                           <%-- <asp:BoundField DataField="fecha" HeaderText="Fecha" Visible="true" DataFormatString="{0:d}"/>
                                            <asp:BoundField DataField="horainicio" HeaderText="Hora Inicio" Visible="true" DataFormatString="{0:t}" />--%>
                                            <asp:BoundField DataField="nombreEstado" HeaderText="Estado" Visible="true" />

                                     </Columns>
                               </asp:GridView>


                              </center>




                            </div>
                        </div>
                        <%-- FIN NOTIFICACIONES --%>




                        <div id="menu7" class="tab-pane fade">
                            <div class="table-responsive">

                                <center>
                                <asp:GridView ID="gdv_Solicitudes" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                                      HeaderStyle-CssClass="header" RowStyle-CssClass="rows" visible ="true" EmptyDataText="Sin Solicitudes"
                                      OnSelectedIndexChanged="gdv_Solicitudes_SelectedIndexChanged"
                                      OnRowDeleting="gdv_Solicitudes_RowDeleting"
                                      OnRowCommand="gdv_Solicitudes_RowCommand"
                                      >

                                      <Columns>
                                           <asp:CommandField showDeleteButton="true" HeaderText="Eliminar" ShowHeader="True"
                                               DeleteText='<i class="glyphicon glyphicon-trash"></i>' />
                                           <asp:CommandField ButtonType="Image" SelectImageUrl="~\Imagenes\boton-ir.png"
                                                ShowSelectButton="true" ControlStyle-Width="25px" HeaderText="Ir" />
                                          <asp:ButtonField buttontype="link" Text="<i class='fa fa-check'></i>"
                                             HeaderText="Aceptar" ShowHeader="True" CommandName="Aceptar" />
                                              <%--  <asp:ButtonField buttontype="link" Text="<i class='fa fa-remove'></i>"
                                              HeaderText="Cancelar" ShowHeader="True" CommandName="Cancelar" />
                                                 --%>

                                            <asp:BoundField DataField="idNotificacion" HeaderText="IdNotif" Visible="false" />
                                            <asp:BoundField DataField="nombreEmisor" HeaderText="Emisor" Visible="true" />
                                            <asp:BoundField DataField="texto" HeaderText="Notificacion" Visible="true" />
                                            <asp:BoundField DataField="idEncuentro" HeaderText="IdEncuentro" Visible="false" />
                                            <asp:BoundField DataField="nombreEstado" HeaderText="Estado" Visible="true" />
                                            <asp:BoundField DataField="idReceptor" HeaderText="IdReceptor" visible="true"
                                                ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                                            <asp:BoundField DataField="idEmisor" HeaderText="IdEmisor" visible="true"
                                                ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"  />
                                          <asp:BoundField DataField="nombreReceptor" HeaderText="Receptor" Visible="true"
                                              ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol"  />
                                     </Columns>
                               </asp:GridView>

                                  <%--  <asp:Label ID="lbl_Prueba" runat="server" Text="Sin resultados"></asp:Label>--%>

                              </center>


                            </div>
                        </div>


                        <div id="menu8" class="tab-pane fade">
                            <div class="table-responsive">
                                <br />


                                <center>
                                <asp:GridView ID="gdv_Contactos" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                                    HeaderStyle-CssClass="header" RowStyle-CssClass="rows"
                                    OnSelectedIndexChanged="gdv_Contactos_SelectedIndexChanged"
                                    OnRowDeleting="gdv_Contactos_RowDeleting">

                                    <Columns>
                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~\Imagenes\boton-ir.png"
                                                ShowSelectButton="true" ControlStyle-Width="25px" HeaderText="Ir" />
                                        <asp:BoundField DataField="id" HeaderText="" Visible="false" />
                                        <asp:BoundField DataField="nombre" HeaderText="Usuario" Visible="true" />
                                        <asp:CommandField showDeleteButton="true" HeaderText="Eliminar" ShowHeader="True"
                                               DeleteText='<i class="glyphicon glyphicon-trash"></i>' />
                                    </Columns>
                                </asp:GridView>
                                </center>
                            </div>
                        </div>



                        <div id="menu2" class="tab-pane fade">
                            <div class="table-responsive">
                                <br />
                                <asp:Label CssClass="estrellalabel" runat="server" Text="Comportamiento"></asp:Label>
                                <p class="clasificacion">
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" CssClass="estrella" AutoPostBack="true">
                                        <asp:ListItem Text="★" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="5"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:Label ID="lblmsjrb1" runat="server" Text=""></asp:Label>
                                    <%-- <input id="radio1" runat="server" type="radio" name="estrellas" value="5" />
    <label for="radio1" class="estrella" runat="server" onclick="marcarradio1">★</label>
    <input id="radio2"  runat="server" type="radio" name="estrellas" value="4"/>
    <label for="radio2" class="estrella">★</label>
    <input id="radio3" runat="server" type="radio" name="estrellas" value="3"/>
    <label for="radio3" class="estrella">★</label>
    <input id="radio4" runat="server" type="radio" name="estrellas" value="2"/>
    <label for="radio4" class="estrella">★</label>
    <input id="radio5" runat="server" type="radio" name="estrellas" value="1"/>
    <label for="radio5" class="estrella">★</label>--%>
                                </p>
                                <asp:Label CssClass="estrellalabel" runat="server" Text="Puntualidad"></asp:Label>
                                <p class="clasificacion">
                                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" CssClass="estrella" AutoPostBack="true" ClientIDMode="Predictable">
                                        <asp:ListItem Text="★" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="5"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:Label ID="lblmsjrb2" runat="server" Text=""></asp:Label>
                                </p>
                                <asp:Label CssClass="estrellalabel" runat="server" Text="Habilidad Deportiva"></asp:Label>
                                <p class="clasificacion">
                                    <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal" CssClass="estrella" AutoPostBack="true">
                                        <asp:ListItem Text="★" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="5"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:Label ID="lblmsjrb3" runat="server" Text=""></asp:Label>
                                </p>

                                <asp:Label CssClass="estrellalabel" runat="server" Text="Promedio General"></asp:Label>
                                <p class="clasificacion">
                                    <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal" CssClass="estrella" AutoPostBack="true">
                                        <asp:ListItem Text="★" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="★" Value="5"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:Label ID="lblmsjrb4" runat="server" Text=""></asp:Label>
                                </p>

                            </div>
                        </div>
                        <div id="menu3" class="fade">
                            <div class="table-responsive">
                                <asp:DropDownList ID="ddl_anios" runat="server" Width="150px" AutoPostBack="true">
                                    <asp:ListItem Text="2020" Value="2020" />
                                    <asp:ListItem Text="2019" Value="2019" />
                                    <asp:ListItem Text="2018" Value="2018" />


                                </asp:DropDownList>
                                <div id="barchart_material" style="width: 100%; height: 500px;"></div>


                            </div>

                           </div>
                          </div>
                       </div>

              </div>
            </div>

        </div>



    </div>


</asp:Content>
