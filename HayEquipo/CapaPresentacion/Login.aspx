<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CapaPresentacion.Login" %>
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

    <link href="css/Style.css" rel="stylesheet" type="text/css" />

    <style>
       .alinearIzq { text-align: left; }
       .fondoDeImagen {background-image: url("Imagenes/sports.jpg");}
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       

            <nav class="navbar navbar-inverse">


                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <img class="img-responsive" src="Imagenes/logoconnombre2.png" width="135" height="100"/>
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
   <button type="button" value="btnUsuario" title="Registrar Jugador" class="btn btn-primary btn-edit" data-target="#imodal" data-toggle="modal"><i class="fa fa-check-square-o" aria-hidden="true"></i>Registrarme</button>&nbsp;
             
  
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
                
             <!--   <div class="form-group">
                        <label>Jugador o Establecimiento</label>
                 </div>
                  <div class="form-group">
                <asp:RadioButton ID="radioJugador" Text="Jugador" runat="server" />
                <asp:RadioButton ID="radioEstablecimiento" Text="Establecimiento" runat="server" />
                 </div>
                    </div> -->
                  <div class="modal-footer">
                   <asp:Button ID="btnRegistrar" runat="server" Text="Registrarme" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btn_Registrar_Click" />        

                  </div>
        </div>
    </div>
   </div>
        </div>
      </div>
      

    </form>


</body>
</html>
