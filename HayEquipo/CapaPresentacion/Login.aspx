﻿<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CapaPresentacion.Login" %>
<%--le agregue la propiedad EnableEventValidation="false" porque me tiraba un bronca con el postback. Soy Nacho--%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.10/js/all.js" integrity="sha384-slN8GvtUJGnv6ca26v8EzVaR9DC58QEwsIk9q1QXdCU8Yu8ck/tL/5szYlBbqmS+" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet" />
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
   <button type="button" value="btnUsuario" title="Registrar Jugador" class="btn btn-primary btn-edit" data-target="#imodal" data-toggle="modal"><i class="fa fa-check-square-o" aria-hidden="true"></i> Registrarme</button>&nbsp;


      </div>
    </div>


          </div>
                </div>

            </div>









    <div class="modal fade" id="imodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Registrarme</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Nombre de usuario</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtNombre" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtEmail" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Contraseña</label>
                    </div>
                    <div class="form-group">
                  <asp:TextBox ID="txtPassword" runat="server" placeholder="" TextMode="Password" Columns="20" CssClass="form-control"></asp:TextBox>
                    </div>
                     <div class="form-group">
                        <label>Repetir Contraseña</label>
                    </div>
                    <div class="form-group">
                  <asp:TextBox ID="txtRPassword" runat="server" placeholder="" TextMode="Password" Columns="20" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                       <asp:CheckBox runat="server" ID="checkPrivacidad"/><a data-dismiss="imodal" data-toggle="modal" href="#imodal2" > Acepto Terminos y condiciones</a>

                 </div>

               <div class="form-group">
                <label>Deportista o Establecimiento ? </label>
                   <asp:RadioButtonList ID="radioLogin" runat="server" CssClass="alinearIzq centrar">
                       <asp:ListItem Text ="Deportista" Value="2" Selected="True"/>
                       <asp:ListItem Text ="Establecimiento" Value="3" />
                   </asp:RadioButtonList>
                
                    </div>
                
                  <div class="modal-footer">
                   <asp:Button ID="btnRegistrar" runat="server" Text="Registrarme" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btn_Registrar_Click" />

                  </div>
        </div>

      </div>
     </div>
          </div>

      <div class="modal fade" id="imodal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel2">Terminos y Condiciones de uso de HayEquipo</h4>
                </div>
                  <div class="modal-body">
                 <div class="form-group">
    
1. Tienes que tener 13 o más años. <br />
2. No publiques nada que muestre violencia, que pueda asustar a otras personas o que contenga 
imágenes con desnudos.  <br />
3. No uses la cuenta de nadie sin permiso, ni intentes descubrir sus datos de login.  <br />
4. No permitas que nadie use tu cuenta.  <br />
5. Mantén tu contraseña en secreto.  <br />
6. No acoses a nadie ni publiques nada feo sobre ninguna persona.  <br />
7. No publiques información privada de otra persona.  <br />
8. No uses HayEquipo para hacer nada ilegal ni nada que nosotros hayamos prohibido.  <br />
9. Si quieres añadir un sitio web a tu nombre de usuario, asegúrate primero de que tienes permiso de 
HayEquipo.  <br /> 
10. No cambies nada de nuestro sitio web o de nuestras aplicaciones, ni subas ningún tipo de virus, ni 
hagas nada que pueda interferir con la forma en que HayEquipo funciona.  <br />
11. No utilices ningún tipo de software o robot para crear cuentas de acceso a HayEquipo, ni envíes 
spam o emails no deseados.  <br />
12. Lee nuestras normas de uso y obedécelas cuando uses HayEquipo.  <br />
13. No hagas nada que pueda afectar al modo en que otras personas usan y disfrutan de HayEquipo.  <br />
14. No incites a nadie a saltarse estas reglas.  <br />

<h4>Tus derechos y nuestros derechos: </h4>
1. Tienes derecho a sentirte seguro usando Instagram. <br />
2. Oficialmente eres el dueño de cualquier imagen o vídeo original que publiques, pero nosotros tenemos permiso para usarlos,
así como para permitir que otros los usen en cualquier parte del mundo. 
Aunque otros nos paguen por ese uso nosotros no tenemos que pagarte a tí por eso.  <br />
3. Tú eres el responsable de todo lo que hagas en HayEquipo y de todo lo que publiques, incluyendo 
cosas inesperadas como nombres de usuario, datos y música de otra gente.  <br />
4. Se asumirá que eres el propietario de lo que publicas, y que lo que publicas no incumple la ley. Si 
incumples la ley y te multan, tendrás que pagar la multa.  <br />
5. Aunque eres el responsable de la información que pones en HayEquipo, 
nosotros podemos almacenar, usar y compartir tu información personal con compañías conectadas a HayEquipo.
Esta información incluye tu nombre, tu email,dónde vives, tus imágenes, tu número de teléfono,
los sitios que visitas y cualquier otra información personal que encontremos, como tu fecha cumpleaños o con quien chateas en los foros 
No somos responsables de lo que otras empresas hagan con esta información. 
No venderemos o alquilaremos tu información a nadie más sin tu permiso. 
Cuando borres tu cuenta mantendremos esta información personal sobre tí, 
así como tus fotos tanto tiempo como sea necesario para nuestros intereses.  <br />
6. HayEquipo tampoco es responsable de:  <br />
a. Los links que aparezcan en Instagram de otras compañías o personas que no controlamos, 
incluso si esos links te los hemos enviado nosotros mismos.  <br />
b. Lo que ocurra si te conectas a tu cuenta de Instagram desde otra aplicación o sitio Web, 
por ejemplo para compartir una imagen, y la otra app hace algo con ella o se queda con tus datos personales. <br />
7. Aunque HayEquipo no es responsable de lo que ocurra contigo o con tus datos mientras los usas, 
tenemos muchos poderes:  <br />
a. Podemos enviarte publicidad que coincida con tus intereses (que previamente habremos investigado). 
No puedes evitar que hagamos esto y no siempre será obvio que lo que te mostremos sea publicidad.  <br />
b. Podemos cambiar o cerrar HayEquipo, o cerrar tu acceso al mismo en cualquier momento, 
por cualquier razón y sin previo aviso. También podemos borrar posts y comentarios de forma aleatoria,
por cualquier razón y sin decírtelo. Si lo hacemos no seremos responsables de pagar nada
y tú no tendrás derecho a quejarte.  <br />
c. Podemos obligarte a cambiar de nombre de usuario por cualquier razón.  <br />
d. Podemos, pero no tenemos que, eliminar, editar, bloquear y / o supervisar cualquier cosa publicada
o cualquier cuenta que creamos que incumple cualquiera de estas reglas. 
No somos responsables si alguien infringe la ley o estas reglas, pero tú sí serás responsable si lo haces. 
Debes utilizar el sentido común y tu mejor juicio cuando utilizas HayEquipo.  <br />
8. Aunque tú no seas propietario de tus datos, nosotros sí lo somos de los nuestros.
No puedes copiar y pegar los logos de HayEquipo o cualquier otra cosa que hayamos creado,
ni eliminarlos ni intentar cambiarlos.  <br />
9. En caso de realizar deportes extremos y se realizen encuentros a travez de la platarforma, HayEquipo no se
se hacer responsable por posibles daños ni traumas psicologicos. <br />

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
