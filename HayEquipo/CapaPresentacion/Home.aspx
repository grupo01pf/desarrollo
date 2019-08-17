<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CapaPresentacion.Home" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <style>    
    /* Set black background color, white text and some padding */
    footer {
      background-color: #000000;
      color: white;
      padding: 15px;
    }
    /* segundo commit  */
    body {
        background-color: #0b3107;
    }
    .fondo {
  overflow: hidden;
  background-color: #525252;
}
  </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
       <img class="img-responsive" src="Imagenes/logoconnombre2.png"  width="135" height="100">
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Principal</a></li>
        <%--<li><a href="#">Crear Encuentro</a></li>--%>
        <li> <asp:LinkButton ID="btn_CrearEncuentro" runat="server"    Text="Crear Encuentro" OnClick="btn_CrearEncuentro_Click" ></asp:LinkButton></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Mi Cuenta</a></li>
        <%--<li><a href="Login.aspx"><span class="glyphicon glyphicon-off" ></span> Cerrar Sesión</a></li>--%>
           <%--<asp:Button ID="btn_Login" runat="server" Text="Cerrar Sesión" ValidationGroup="E" OnClick="btn_Login_Click" BackColor="Transparent" ForeColor="White" />--%>
          <asp:LinkButton ID="btn_Logout" runat="server"    Text="Cerrar Sesión" OnClick="btn_Logout_Click" ></asp:LinkButton>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container text-center">    
  <div class="row">
    <div class="col-sm-3 well" <%--style="background-color:#d7dbd3;"--%>>
      <div class="well">
        <%--<p><a href="#">Ignacio Monetto</a></p>--%>
         <p> <asp:LinkButton ID="link_nombreUsuario" runat="server" Text="" OnClick="link_nombreUsuario_Click"></asp:LinkButton></p>
        <img src="Imagenes/nene.png" class="img-circle" height="65" width="65" alt="Avatar">
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
    <div class="col-sm-7" <%--style="background-color:#d7dbd3;"--%>>
    
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
          <input type="text" class="form-control" placeholder="Buscar encuentros...">
          <span class="input-group-btn">
            <button class="btn btn-default" type="button">
              <span class="glyphicon glyphicon-search"></span>
            </button>
          </span>        
        </div>
      <div class="row">
        <div class="col-sm-12">
          <div class="well">
           <p>Aquí los datos del encuentro</p>
          <%-- <img src="Imagenes/futbol.jpg" class="img-circle" height="55" width="55" alt="Avatar">--%>
          </div>
        </div>
      </div>
      <%--<div class="row">
        <div class="col-sm-3">
          <div class="well">
           <p>Tenis Dobles</p>
           <img src="Imagenes/tenisdobles.jpg" class="img-circle" height="55" width="55" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p>Datos del encuentro</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <div class="well">
           <p>Running</p>
           <img src="Imagenes/running.jpg" class="img-circle" height="55" width="55" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p>Datos del encuentro</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <div class="well">
           <p>Basket</p>
           <img src="Imagenes/basket.jpg" class="img-circle" height="55" width="55" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p>Datos del encuentro.</p>
          </div>
        </div>
      </div>     --%>
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

<footer class="container-fluid text-center">
  <p>Pie de Página</p>
</footer>

    </div>
    </form>
</body>
</html>
