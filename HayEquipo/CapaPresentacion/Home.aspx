<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CapaPresentacion.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .mydatagrid {
            width: 80%;
            border: solid 4px black;
            border-radius: 12px;
            min-width: 80%;
        }

        .enlace {
           color: #09426d;
           text-align:center;
        }
        .divimagen
        {
            margin: 0 auto;
            text-align: center;
            width:auto;
            height:130px;
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

        .botonunirse {
            margin-bottom: 5px;
            margin-top: 5px;
        }

        .alinearIzquiera {
            text-align: left;
        }

        .tamanoLetra {
            font-size: 20px;
        }


        .scroll-container {
            display: block;
            height: 500px;
            overflow-y: scroll;
        }

        .scroll-container2 {
            display: block;
            height: 946px;
        }


        .notification {
            background-color: #555;
            color: white;
            text-decoration: none;
            padding: 15px 26px;
            position: relative;
            display: inline-block;
            border-radius: 2px;
        }

            .notification:hover {
                background: green;
            }

            .notification            
            .badge {
                position: absolute;
                top: -10px;
                right: -10px;
                padding: 5px 10px;
                border-radius: 50%;
                background: red;
                color: white;
            }

        .linkButton:hover{
            color:white;
        }


    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



<div class="container text-center">

  <div class="row">
    <div class="col-sm-2 well" <%--style="background-color:#d7dbd3;"--%>>
     <div class="scroll-container2">
      <div class="well">
        <%--<p><a href="#">Ignacio Monetto</a></p>--%>
         <p> <asp:LinkButton ID="link_nombreUsuario"  runat="server" Text="" OnClick="link_nombreUsuario_Click" ></asp:LinkButton></p>
        <asp:Image ID="Image1" ImageUrl="Imagenes/nene.png" runat="server" CssClass="img-circle" height="100" width="100" />
      </div>


        <%-- INVITACIONES --%>

         <%--<a href="#" class="notification">--%>
        <div class="well notification">
            
            <asp:LinkButton ID="btn_Notificacion" runat="server" Text="Notificaciones" OnClick="btn_Notificacion_Click" 
            CssClass="linkButton" ToolTip="Notificaciones" >
                <span class="glyphicon glyphicon-bell"></span>
            </asp:LinkButton>
            <span class="badge"><asp:Label ID="lbl_Notificacion" runat="server" Text="0"></asp:Label></span>
      <%--  </a> --%>
         </div>
         <div class="well notification">            
            <asp:LinkButton ID="btn_Solicitudes" runat="server" Text="Solicitudes" OnClick="btn_Notificacion_Click" 
            CssClass="linkButton" ToolTip="Solicitudes" >
               <i class="fa fa-users" aria-hidden="true"></i>
               <%--<span class="glyphicon glyphicon-user"></span>
               <span class="glyphicon glyphicon-user"></span>--%>
               <%--<span class="glyphicon glyphicon-user"></span>--%>
            </asp:LinkButton>
            <span class="badge"><asp:Label ID="lbl_Solicitudes" runat="server" Text="0"></asp:Label></span>
             
         </div>

      <div class="well">
        <p><a href="#">Algunos links que te pueden interesar...</a></p>
        <p>
          <a href="https://www.ole.com.ar" class="w3-button w3-small w3-white w3-border w3-border-light-green w3-round-large"" role="button" style="margin-bottom:10%">Olé</a>
          <a href="https://mundod.lavoz.com.ar" class="w3-button w3-small w3-white w3-border w3-border-green w3-round-large"" role="button" style="margin-bottom:10%">Mundo D</a>
          <a href="https://www.cba.gov.ar/reparticion/agencia-cordoba-deportes/" class="w3-button w3-small w3-white w3-border w3-border-blue w3-round-large"" role="button"style="margin-bottom:10%">Agencia<br /> Córdoba<br /> Deportes</a>
          <a href="https://www.espn.com.ar" class="w3-button w3-small w3-white w3-border w3-border-red w3-round-large"" role="button"style="margin-bottom:10%">ESPN</a>
        </p>
      </div>
      <%-- <div class="well">
           <h3>Deportistas</h3>
           <asp:Repeater ID="DeportistasRepeater" runat="server">
           <ItemTemplate>--%>
              <%--  <img class="w3-left w3-circle w3-margin-right" style="width:55px" src="data:image/png;base64,<%#Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"avatar"))%>" alt="Avatar"/>
               --%>  <%-- <asp:Label runat="server" text='<%#Eval("nombres") %>'></asp:Label> <asp:Label runat="server" text='<%#Eval("apellido") %>'> </asp:Label>
               <asp:LinkButton runat="server" CommandName="btnVerPerfil" CommandArgument='<%#Eval("idDeportista") %>' text="Ver Perfil" Class="w3-button w3-block w3-black" ></asp:LinkButton>
               </ItemTemplate>
               </asp:Repeater>

       </div>--%>

        <%-- FIN INVITACIONES --%>
  </div>
    </div>


    <div class="col-sm-8" <%--style="background-color:#d7dbd3;"--%>>

      <div class="row">

        <div class="col-sm-12">
          <div class="panel panel-default text-left">
            <div class="panel-body">

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
          <a href="https://www.heineken.com">
        <img src="Imagenes/cerveza.jpg" width="1000" height="1500"></a>
      </div>

      <div class="item">
          <a href="https://www.adidas.com.ar">
        <img src="Imagenes/adidas.jpg" width="1000" height="1500"></a>
      </div>

      <div class="item">
          <a href="https://www.nike.com">
        <img src="Imagenes/nike.jpg" width="1000" height="1500"></a>
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
              <%--<p contenteditable="true">ADS</p>
              <button type="button" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-thumbs-up"></span> Like
              </button>  --%>
            </div>
          </div>
        </div>
      </div>
        <div><button type="button" class="btn btn-primary btn-block" >Filtrar encuentros</button>

        </div>
          <%--<input type="text" class="form-control" id="myInput" placeholder="Buscar encuentros..."/>--%>
       <%--   <span class="input-group-btn">
            <button class="btn btn-default" type="button">
              <span class="glyphicon glyphicon-search"></span>
            </button>
          </span>--%>
            <asp:Label ID="lblDeportes" runat="server" Text="Por Deporte:" ForeColor="White"></asp:Label>
            <asp:DropDownList ID="ddlDeportes" CssClass="form-control" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDeportes_SelectedIndexChanged">
            <asp:ListItem Value="0" Selected="True">Todos..</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblZonas" runat="server" Text="Por Zona:" ForeColor="White"></asp:Label>
            <asp:DropDownList ID="ddlZonas" CssClass="form-control" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlZonas_SelectedIndexChanged">
            <asp:ListItem Value="0" Selected="True">Todas..</asp:ListItem>
            </asp:DropDownList>
            <br />

          <div class="well">

              <div class="w3-panel w3-black">
                    <h1 class="w3-opacity">
                     <b>Encuentros Vigentes</b></h1>
                    </div>
           <%--<h3 class="round3">Encuentros Vigentes</h3>--%>
          <%-- <img src="Imagenes/futbol.jpg" class="img-circle" height="55" width="55" alt="Avatar">--%>

              <%-- GRILLA LUGARES PUBLICOS --%>

                  <%-- <div id="myDIV">
                    <div class="table-responsive">
                  <asp:GridView ID="gdv_EncuentrosDisponibles" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                                 HeaderStyle-CssClass="header" RowStyle-CssClass="rows"
                                OnSelectedIndexChanged="gdv_EncuentrosDisponibles_SelectedIndexChanged">
                                <Columns>
                                    <asp:CommandField buttontype="Image" selectimageurl="~\Imagenes\boton-ir.png" ShowSelectButton="true" ControlStyle-Width="25px"/>
                                    <asp:BoundField DataField="idEncuentroDeportivo" HeaderText="Id" Visible="false" />
                                    <asp:BoundField DataField="tipoEncuentro" HeaderText="Tipo" Visible="true" />
                                    <asp:BoundField DataField="nombreDeporte" HeaderText="Deporte" Visible="true" />
                                    <asp:BoundField DataField="nombreComplejo" HeaderText="Complejo" Visible="true" NullDisplayText="---" />
                                    <asp:BoundField DataField="nombreLP" HeaderText="LugarPublico" Visible="true" NullDisplayText="---" />
                                    <asp:BoundField DataField="fechaInicioEncuentro" HeaderText="Fecha Inicio" Visible="true" DataFormatString="{0:d}"/>
                                    <asp:BoundField DataField="horaInicio" HeaderText="Hora Inicio" Visible="true" DataFormatString="{0:t}"/>
                                    <asp:BoundField DataField="accesibilidad" HeaderText="Accesibilidad" Visible="true" />
                                    <asp:BoundField DataField="nombreEstado" HeaderText="Estado" Visible="false" />

                                </Columns>
                            </asp:GridView>

              </div>
              </div>--%>
  <div class="scroll-container">

     <asp:Repeater ID="encuentrosRepeater" runat="server">
           <ItemTemplate>
               <div class="w3-container alinearIzquiera">
  <div class="w3-card-4">
    <%--<h2>Encuentro <asp:Label ID="tipoencuentro" runat="server" text='<%#Eval("tipoEncuentro") %>'></asp:Label></h2>--%>
      <header class="w3-container w3-green">
       <img class="w3-left w3-circle w3-margin-right" style="width:55px" src="data:image/png;base64,<%#Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem,"avatar"))%>" alt="Avatar"/>

         <h1><asp:Label runat="server" text='<%#Eval("nombreDeporte") %>'></asp:Label></h1>
    </header>
      <div class="w3-container">
      <p class="tamanoLetra">
          <br />
          <div class="row">
              <div class="col-sm-3">
                  <span class="glyphicon glyphicon-calendar tamanoLetra"></span>
                  <asp:Label runat="server" text='<%#Eval("fechaInicioEncuentro", "{0:dd/MM/yyyy}") %>'></asp:Label>
                  <asp:Label runat="server" text='<%#Eval("horaInicio", "{0:HH:mm}") %>'></asp:Label>
                  <asp:Label runat="server" text="Hs"></asp:Label>
                  <br />
                  <br />
              </div>
              <div class="col-sm-3">
                  <span class="glyphicon glyphicon-map-marker"></span>
                  <asp:Label runat="server" text='<%#Eval("nombreComplejo") %>'></asp:Label><asp:Label runat="server" text='<%#Eval("nombreLP") %>'> </asp:Label><asp:Label ID="Label1" runat="server" Text=" &#183 "></asp:Label>
                  <asp:Label runat="server" text='<%#Eval("direccion") %>'></asp:Label><asp:Label runat="server" text='<%#Eval("calleComplejo") %> '></asp:Label> <asp:Label runat="server" text=' <%#Eval("numeroCalleComplejo") %>'></asp:Label>
                  <br />
                  <br />
              </div>
              <div class="col-sm-3">
                  <span class="glyphicon glyphicon-eye-open"></span>
                  <asp:Label runat="server" text='<%#Eval("accesibilidad") %>'></asp:Label>
                  <br />
                  <br />
              </div>
              <div class="col-sm-3">
                  <i class="fa fa-male"></i>
                  <i class="fa fa-male"></i>
                  <i class="fa fa-male"></i>
                  <asp:Label runat="server" text='<%#Eval("nombreEstado") %>'></asp:Label>
              </div>
          </div>

      <%--</p>--%>
          <%--<hr />--%>

        <%--<p>--%>

          <%--<asp:Label runat="server" text='<%#Eval("fechaInicioEncuentro") %>'></asp:Label><br />--%>

      </p>
      <br />
    </div>


      <%--<asp:LinkButton runat="server" CommandName="evaluartipo" CommandArgument='<%#Eval("tipoEncuentro") %>' Visible="false"></asp:LinkButton>--%>
      <asp:LinkButton runat="server" CommandName="btnUnirseEncuentro" CommandArgument='<%#Eval("idEncuentroDeportivo") %>' text="Unirse al encuentro" Class="w3-button w3-block w3-black" ></asp:LinkButton>
      </div>
           </div><br />
            </ItemTemplate>
     </asp:Repeater>

 </div>
    </div>
  </div>
    <div class="col-sm-2 well" <%--style="background-color:#d7dbd3;"--%>>
        <div class="scroll-container2">
      <div class="thumbnail">
        <p>Próximo encuentro</p>
        <img src="Imagenes/futbol.jpg" alt="Paris" width="400" height="300">
        <p><strong>Fútbol 7 en Don Balón</strong></p>
        <p>Viernes 30 de Agosto a las 20 hs. </p>
        <button class="btn btn-primary">Info</button>
      </div>
        <a href="https://www.latam.com/es_ar/">
      <div class="well">
        <div><span style="text-align:center; color:#808080; font-size:10px">PUBLICIDAD</span></div>
          <img src="Imagenes/publicidadLatam.png" class="img-responsive" width="460" height="460">
          <hr />
        <p style="font-size:12px;">
            <strong>¡40% extra en acumulación de millas!</strong>
            <%--<br />
            <br />
            ¿Estás listo para tus próximas vacaciones? Con Rentalcars y LATAM Pass, acumulá 7 millas por dólar gastado. Enterate cómo. Hasta el 21 de Octubre.--%>
        </p>
        <div class="enlace" style="font-size:12px;">
            ABRIR ENLACE >
        </div>
      </div></a>
        <a href="https://www.newbalance.com.ar">
      <div class="well">
        <div><span style="text-align:center; color:#808080; font-size:10px">PUBLICIDAD</span></div>
          <img src="Imagenes/publicidadNewBalance.jpg" class="img-responsive" width="460" height="345">
          <hr />
        <p style="font-size:12px;">
            <strong>Descuento del 40% ingresando a través de este enlace</strong>
            <%--<br />
            <br />
            ¿Estás listo para tus próximas vacaciones? Con Rentalcars y LATAM Pass, acumulá 7 millas por dólar gastado. Enterate cómo. Hasta el 21 de Octubre.--%>
        </p>
        <div class="enlace" style="font-size:12px;">
            ABRIR ENLACE >
        </div>
      </div></a>
      </div>  
    </div>
   </div>
   

 <%--   <script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myDIV ID").filter(function () {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>--%>
</asp:Content>
