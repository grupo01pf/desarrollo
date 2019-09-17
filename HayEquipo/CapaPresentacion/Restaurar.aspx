<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Restaurar.aspx.cs" Inherits="CapaPresentacion.Restaurar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <script src="scripts/jquery-1.9.1.min.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.10/js/all.js" integrity="sha384-slN8GvtUJGnv6ca26v8EzVaR9DC58QEwsIk9q1QXdCU8Yu8ck/tL/5szYlBbqmS+" crossorigin="anonymous"></script>
    <link href="fontawesome/css/fontawesome.css" rel="stylesheet" />
    <link href="css/Style.css" rel="stylesheet" type="text/css" />


    <style>
       .alinearIzq { text-align: left; }
       .fondoDeImagen {background-image: url("Imagenes/sports.jpg");}
       .centrar{margin-left:180px; }
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
       .error{
          color:red;
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
           <div class="container">
                <div class="row">
                    
              <div class="col-sm-12">
               <div class="well">
               <div class="container">
         <h2>Restaurar Contraseña</h2>

    <div class="form-group">
      <label>Confirmar Email</label>
        <asp:TextBox ID="txt_ConfirmarEmail" runat="server" class="form-control" placeholder="Confirmar Email"></asp:TextBox>

    </div>
   
    <div class="form-group">
      <label>Nueva Contraseña</label>
        <asp:TextBox ID="txt_NuevaPassword" runat="server" class="form-control" placeholder="Ingrese Nueva Contraseña" TextMode="Password"></asp:TextBox>
     
    </div>
     <div class="form-group">
      <label>Repetir Nueva Contraseña</label>
        <asp:TextBox ID="txt_RNuevaPassword" runat="server" class="form-control" placeholder="Repetir Nueva Contraseña" TextMode="Password"></asp:TextBox>

    </div>
    <asp:Label ID="lblerror" runat="server" CssClass="error"></asp:Label>
                   <br /> 
    <asp:Button ID="btn_Restaurar" runat="server" class="btn btn-default" Text="Restaurar Contraseña" ValidationGroup="E" OnClick="btn_Restaurar_Click"></asp:Button>
      <br />
     
    </div>


          </div>
                </div>

            </div>

    
        </div>
        </div>
        </form>
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

    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>



</body>
</html>
