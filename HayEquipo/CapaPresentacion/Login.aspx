<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CapaPresentacion.Login" %>
<%--le agregue la propiedad EnableEventValidation="false" porque me tiraba un bronca con el postback. Soy Nacho--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <link href="css/Style.css" rel="stylesheet" type="text/css" />

    <style>
       .alinearIzq { text-align: left; }
       .fondoDeImagen {background-image: url("Imagenes/sports.jpg");}
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
                        <img class="img-responsive" src="Imagenes/logoconnombre2.png" width="135" height="100">
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
               
                    </div>
                </div>
            </nav>
  <div class="jumbotron text-center" style="background-color:black">
                <div class="row">
                    <div class="col-sm-6 well">
                        <br />
                        <br />
                        <br />
                        <br />
                        <h1>HAY EQUIPO !</h1>
                <p>Unidos por el deporte</p>
                        <br />
                        <br />
                        <br />
                        <br />
                    </div>
                    <div class="col-sm-6">
                         <div class="well">
                        <div class="container">
  <h2>Iniciar Sesión</h2>
  
  <form>
    <div class="form-group">
      <label>Usuario</label>
        <asp:TextBox ID="txt_NombreUsuario" class="form-control" runat="server" placeholder="Ingrese Usuario"></asp:TextBox>
      
    </div>
    <div class="form-group">
      <label>Contraseña</label>
        <asp:TextBox ID="txt_Password" runat="server" class="form-control" placeholder="Ingrese Contraseña" TextMode="Password"></asp:TextBox>
        
    </div>
    <asp:Button ID="btn_Login" runat="server" class="btn btn-default" Text="Iniciar Sesión" ValidationGroup="E" OnClick="btn_Login_Click"></asp:Button>
      <br />
      <div class="alinearIzq">
    <label>¿No tenés una cuenta?</label> <br />
    <button type="button" class="btn btn-primary">Registrarme</button></div>
  </form>
      </div>
</div>
                       
                        
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
