<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CapaPresentacion.Login" %>
<%--le agregue la propiedad EnableEventValidation="false" porque me tiraba un bronca con el postback. Soy Nacho--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
   <%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>--%>
    <script src="scripts/jquery-1.9.1.min.js"></script>
    <%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>--%>
    <script src="scripts/bootstrap.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.10/js/all.js" integrity="sha384-slN8GvtUJGnv6ca26v8EzVaR9DC58QEwsIk9q1QXdCU8Yu8ck/tL/5szYlBbqmS+" crossorigin="anonymous"></script>
    
    <%--<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet" />--%>
    <link href="fontawesome/css/fontawesome.css" rel="stylesheet" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />


    <style>
       .alinearIzq { text-align: left; }
       .fondoDeImagen {background-image: url("Imagenes/sports.jpg");}
      h1 {
  text-shadow: 2px 2px 5px green;
}
      .loader {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    z-index: 9999;
    background: url('Imagenes/loadingGif1.gif') 50% 50% no-repeat rgb(249,249,249);
    opacity: .8;
}
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script type="text/javascript">
$(window).load(function() {
    $(".loader").fadeOut(1000);
});
</script>
    <title></title>
</head>
<body>
    <div class="loader"></div>
    <form id="form1" runat="server">
        <div>

            <nav class="navbar navbar-inverse">


                <div class="container-fluid">
                    <div class="navbar-header">
                        <%--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>--%>
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
<!-- Footer -->
<footer class="page-footer font-small special-color-dark pt-4">

  <!-- Footer Elements -->
  <div class="container">

    <!-- Social buttons -->
    <ul class="list-unstyled list-inline text-center">
      <li class="list-inline-item">
        <a class="btn-floating btn-fb mx-1">
          <i class="fab fa-facebook-f"> </i>
        </a>
      </li>
      <li class="list-inline-item">
        <a class="btn-floating btn-tw mx-1">
          <i class="fab fa-twitter"> </i>
        </a>
      </li>
      <li class="list-inline-item">
        <a class="btn-floating btn-gplus mx-1">
          <i class="fab fa-google-plus-g"> </i>
        </a>
      </li>
      <li class="list-inline-item">
        <a class="btn-floating btn-li mx-1">
          <i class="fab fa-linkedin-in"> </i>
        </a>
      </li>
      <li class="list-inline-item">
        <a class="btn-floating btn-dribbble mx-1">
          <i class="fab fa-dribbble"> </i>
        </a>
      </li>
    </ul>
    <!-- Social buttons -->

  </div>
  <!-- Footer Elements -->

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2019 Copyright:
    <a href="#"> HayEquipo.com.ar</a>
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->
    </form>
</body>
</html>
