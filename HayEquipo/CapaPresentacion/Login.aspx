<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CapaPresentacion.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
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
    .jumbotron {
    background-color: white;
    color: #000000;
    padding: 100px 25px;
    font-family: Montserrat, sans-serif;
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
      <%--<ul class="nav navbar-nav">
        <li class="active"><a href="#">Principal</a></li>
        <li><a href="#">Crear Encuentro</a></li>
      </ul>--%>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-circle-arrow-up"></span> Registrarse</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Iniciar Sesión</a></li>
      </ul>
    </div>
  </div>
</nav>
        <div class="jumbotron text-center">
  <h1>HAY EQUIPO !</h1> 
  <p>Unidos por el deporte</p> 
  
</div>



    </div>
    </form>
</body>
</html>
