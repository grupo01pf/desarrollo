<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CrearEncuentro.aspx.cs" Inherits="CapaPresentacion.CrearEncuentro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Crear Encuentro</title>


  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="row">
            </div>

            <div class="row">
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6">

                        <%--<asp:Label ID="lbl_EncuentroPublico" runat="server" Text="Enecuntro en Espacio Público"></asp:Label>--%>

                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lbl_Deporte" runat="server" Text="Deporte"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="cmb_Deporte" runat="server" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lbl_Fecha" runat="server" Text="Fecha"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:Calendar ID="asp_Calendario" runat="server"></asp:Calendar>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lbl_Hora" runat="server" Text="Hora"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txt_Hora" runat="server" TextMode="Time"></asp:TextBox>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lbl_Zona" runat="server" Text="Zona"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="cmb_Zona" runat="server" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                        </div>
                        <div class="row">
                            

                        </div>
                    </div>



                </div>
            </div>
        <div class="form-grooup" >
            <div class="col-md-6">

               <%-- <asp:Label ID="lbl_EncuentroPrivado" runat="server" Text="Enecuntro en Espacio Privado"></asp:Label>--%>

                 <div class="form-group">
                    <div class="col-md-6">
                         <div class="row">
                             <asp:RadioButton ID="rdb_Publico" runat="server" Text="Público" GroupName="tipoEncuentro" value="0" />
                             <asp:Label ID="lbl_Direccion" runat="server" Text="Dirección"></asp:Label>
                             <asp:TextBox ID="txt_Direccion" runat="server" placeHolder="Ingrese una direccion"></asp:TextBox>
                         </div>
                        <div class="row">
                            <asp:RadioButton ID="rdb_Privado" runat="server" Text="Privado" GroupName="tipoEncuentro" value="1" />
                             <asp:DropDownList ID="cmb_Complejo" runat="server" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>

                            <asp:GridView ID="gdv_Horario" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered" OnSelectedIndexChanged="">
                              <Columns>
                                  <asp:CommandField HeaderText="Seleccionar" ShowSelectButton="true" />
                                  <asp:BoundField DataField="" HeaderText="Hora" Visible="false" />
                              </Columns>
                            </asp:GridView>
                        </div>
                </div>


            </div>
        </div>

               
           



        </div>


    </form>
</body>
</html>
