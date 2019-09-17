<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CapaPresentacion.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
     .mydatagrid
{
	width: 80%;
	border: solid 4px black;
    border-radius: 12px;
	min-width: 80%;
}
.header
{
	background-color: #0b3107;
	font-family: Arial;
	color: White;
	height: 25px;
	text-align: center;
	font-size: 16px;
}

.rows
{
	background-color: #fff;
	font-family: Arial;
	font-size: 14px;
	color: #000;
	min-height: 25px;
	text-align: left;
}
.rows:hover
{
	background-color: #000;
    color:White;
}

.mydatagrid a /** FOR THE PAGING ICONS  **/
{
	background-color: Transparent;
	padding: 5px 5px 5px 5px;
	color: #000;
	text-decoration: none;
	font-weight: bold;
}

.mydatagrid a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/
{
	background-color: #0026ff;
	color: #fff;
}
.mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/
{
	
	padding: 5px 5px 5px 5px;
	background-color: #000;
	color: #fff;
}
.pager
{
	background-color: #22c81a;
	font-family: Arial;
	color: White;
	height: 30px;
	text-align: left;
}

.mydatagrid td
{
	padding: 5px;
}
.mydatagrid th
{
	padding: 5px;
}
.round3 {
  border: 2px solid #0b3107;
  border-radius: 12px;
}

    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       

  
<div class="container text-center">    

  <div class="row">
    <div class="col-sm-2 well" <%--style="background-color:#d7dbd3;"--%>>
      <div class="well">
        <%--<p><a href="#">Ignacio Monetto</a></p>--%>
         <p> <asp:LinkButton ID="link_nombreUsuario" runat="server" Text="" OnClick="link_nombreUsuario_Click"></asp:LinkButton></p>
        <asp:Image ID="Image1" ImageUrl="Imagenes/nene.png" runat="server" CssClass="img-circle" height="100" width="100" />
      </div>
      
      <div class="alert alert-success fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
        <p><strong>Ey!</strong></p>
        Tienes una invitación de Juan Perez. <p><strong>Ver Invitación</strong></p>
      </div>
         <div class="alert alert-success fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
        <p><strong>Ey!</strong></p>
        Tienes una invitación de Pedro García. <p><strong>Ver Invitación</strong></p>
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
        <img src="Imagenes/cerveza.jpg" width="1000" height="1500">
      </div>

      <div class="item">
        <img src="Imagenes/adidas.jpg" width="1000" height="1500">
      </div>
    
      <div class="item">
        <img src="Imagenes/nike.jpg" width="1000" height="1500">
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
        <div><button type="button" class="btn btn-primary btn-block">Filtrar encuentros</button>

        </div>
      <div class="form-group input-group">
          <input type="text" class="form-control" id="myInput" placeholder="Buscar encuentros..."/>
          <span class="input-group-btn">
            <button class="btn btn-default" type="button">
              <span class="glyphicon glyphicon-search"></span>
            </button>
          </span>        
        </div>
      
        
          <div class="well">
            
           <h3 class="round3">Encuentros Vigentes</h3>
          <%-- <img src="Imagenes/futbol.jpg" class="img-circle" height="55" width="55" alt="Avatar">--%>
             
              <%-- GRILLA LUGARES PUBLICOS --%>
               
                   <div id="myDIV">
                    <div class="table-responsive">
                  <asp:GridView ID="gdv_EncuentrosDisponibles" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                                 HeaderStyle-CssClass="header" RowStyle-CssClass="rows"
                                OnSelectedIndexChanged="gdv_LugaresPublicos_SelectedIndexChanged">
                                <Columns>
                                    <asp:CommandField buttontype="Image" selectimageurl="~\Imagenes\boton-ir.png" ShowSelectButton="true" ControlStyle-Width="25px"/>                          
                                    <asp:BoundField DataField="idEncuentroDeportivo" HeaderText="Id" Visible="false" />
                                    <asp:BoundField DataField="tipoEncuentro" HeaderText="Tipo" Visible="true" />
                                    <asp:BoundField DataField="nombreDeporte" HeaderText="Deporte" Visible="true" />                                      
                                    <asp:BoundField DataField="nombreComplejo" HeaderText="Complejo" Visible="true" />
                                    <asp:BoundField DataField="nombreLP" HeaderText="LugarPublico" Visible="true" />
                                    <asp:BoundField DataField="fechaInicioEncuentro" HeaderText="Fecha Inicio" Visible="true" DataFormatString="{0:d}"/>  
                                    <asp:BoundField DataField="horaInicio" HeaderText="Hora Inicio" Visible="true" DataFormatString="{0:t}"/>
                                    <asp:BoundField DataField="accesibilidad" HeaderText="Accesibilidad" Visible="true" />  
                                    <asp:BoundField DataField="nombreEstado" HeaderText="Estado" Visible="true" />

                                </Columns>
                            </asp:GridView>
                    
              </div>
              </div>
          <%--    <div class="container">
 
  <div class="card img-fluid" style="width:50%;border:black">
    <h2>Encuentro publico</h2>
   <img class="card-img-top" src="Imagenes/nene.png"" alt="Card image" style="width:100px;"/>
    <div class="card-img-overlay">
      <div class="col-md-6">
      <h4 class="card-title">Complejo: Don Balon</h4>
      <h4 class="card-title">Deporte: Futbol</h4>
           <h4 class="card-title">Direccion: Dorrego 123</h4>
      </div>
        </div>
       <div class="col-md-6">
      <h4 class="card-title">Fecha Encuentro: 21/10/2019</h4>
           <h4 class="card-title">Hora Inicio: 15:00</h4>
            <h4 class="card-title">Accesibilidad: Abierto</h4>
       </div>
       <a href="#" class="btn btn-primary">Unirse al Encuentro</a>
       </div>
     
           </div>
    --%>
    </div>
  </div>

                   


         
        
      
      
    
    <div class="col-sm-2 well" <%--style="background-color:#d7dbd3;"--%>>
      <div class="thumbnail">
        <p>Próximo encuentro</p>
        <img src="Imagenes/futbol.jpg" alt="Paris" width="400" height="300">
        <p><strong>Fútbol 7 en Don Balón</strong></p>
        <p>Viernes 30 de Agosto a las 20 hs. </p>
        <button class="btn btn-primary">Info</button>
      </div>      
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
        <div class="well">
        <p><a href="#">Algunos links que te pueden interesar...</a></p>
        <p>
          <span class="label label-default">Link1</span>
          <span class="label label-primary">Link2</span>
          <span class="label label-success">Link3</span>
          <span class="label label-info">Link4</span>
          <span class="label label-warning">Link5</span>
          <span class="label label-danger">Link6</span>
        </p>
      </div>
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



