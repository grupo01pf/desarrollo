<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CapaPresentacion.Login" %>

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
       
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <%--<div class="row">
                <div class="col-md-2">

                </div>
                <div class="col-md-5">

                </div>
                <div class="col-md-2">

                </div>
                <div class="col-md-2">

                </div>
                <div class="col-md-1">

                </div>

            </div>--%>

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
                        <%--<ul class="nav navbar-nav">
        <li class="active"><a href="#">Principal</a></li>
        <li><a href="#">Crear Encuentro</a></li>
      </ul>--%>
                        <%--<ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-circle-arrow-up"></span> Registrarse</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Iniciar Sesión</a></li>
      </ul>--%>
                         <fieldset id="LoginBox">
                            <%--<legend>Login</legend>--%>
                            <div class="form-group">
                                <table>
                                    <tr>
                                        <th>
                                            <asp:TextBox ID="txt_NombreUsuario" runat="server" placeholder="Nombre de Usuario" Columns="20"></asp:TextBox>
                                        </th>
                                        <th>
                                            <asp:TextBox ID="txt_Password" runat="server" placeholder="Password" TextMode="Password" Columns="20"></asp:TextBox>
                                        </th>
                                        <th>
                                            <asp:Button ID="btn_Login" runat="server" Text="Iniciar Sesión" ValidationGroup="E" OnClick="btn_Login_Click" />
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <%--<asp:RequiredFieldValidator ID="rfv_NombreUsuario" runat="server"
                                                ControlToValidate="txt_NombreUsuario" Text="Falta el nombre de usuario" ErrorMessage="Falta el nombre de usuario"
                                                ValidationGroup="E" ForeColor="Red" Columns="20"></asp:RequiredFieldValidator>--%>

                                        </td>
                                        <td>
                                            <%--<asp:RequiredFieldValidator ID="rfv_Password" runat="server"
                                            ControlValidate="txt_Password" Text="Falta el password" ErrorMessage="Falta el password"
                                            ValidatioGroup="E" ForeColor="Red" Columns="20"></asp:RequiredFieldValidator>--%>
                                        </td>
                                        <td>
                                            <%--<asp:ValidationSummary ID="vsSummary" runat="server" ShowMessageBox="false" ValidationGroup="E" ForeColor="Red" />--%>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </fieldset>
 


                    </div>
                </div>
            </nav>
            <div class="jumbotron text-center">
                <h1>HAY EQUIPO !</h1>
                <p>Unidos por el deporte</p>
          <button type="button" value="btnUsuario" title="Registrar Jugador" class="btn btn-primary btn-edit" data-target="#imodal" data-toggle="modal"><i class="fa fa-check-square-o" aria-hidden="true"></i>Registrarme como Usuario</button>&nbsp;
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

    </form>


</body>
</html>
