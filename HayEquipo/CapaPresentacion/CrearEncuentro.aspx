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


        <div class="row">
            <br />
            <h1 style="text-align: center">
                <asp:Label ID="lbl_Titulo" runat="server" Text="Crear Encuentro"></asp:Label>
            </h1>
            <br />

        </div>

        <div class="form-group">
            <div class="row">


                <div class="col-md-6">

                    <%--DATOS--%>
                    <fieldset>
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
                        <br />
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lbl_Fecha" runat="server" Text="Fecha"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <%--NO BORRAR--%>
                                <asp:Calendar ID="cld_Fecha" runat="server"></asp:Calendar>
                                <%--<asp:TextBox ID="txt_Fecha" runat="server" TextMode="Date"></asp:TextBox>--%>
                            </div>

                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lbl_Zona" runat="server" Text="Zona"></asp:Label>
                                <%--NO BORRAR--%>
                                <%--<asp:Label ID="lbl_Barrio" runat="server" Text="Barrio"></asp:Label>--%>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="cmb_Zona" runat="server" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>
                                <%--NO BORRAR--%>
                                <%--<asp:DropDownList ID="cmb_Barrio" runat="server" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>--%>
                            </div>

                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-3">
                                <asp:CheckBox ID="chk_Accesibilidad" runat="server" Text=" Clave" />
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txt_Clave" runat="server" placeHolder="Ingrese Contraseña" TextMode="Password" Columns="10" MaxLength="10"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row">
                        </div>
                    </fieldset>
                </div>



                <div class="col-md-6">
                    <%--  LUGAR PUBLICO--%>
                    <fieldset>
                        <div class="row">
                            <asp:RadioButton ID="rdb_Publico" runat="server" Text="Lugar Público" GroupName="tipoEncuentro" value="0" />
                        </div>
                        <br />
                        <div class="row">

                            <div class="col-md-1">
                                <asp:Label ID="lbl_HoraInicio" runat="server" Text="Hora Inicio" ></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <asp:TextBox ID="txt_HoraInicio" runat="server" placeholder="HH:MM" Columns="5" MaxLength="5"></asp:TextBox>
                               
                            </div>
                        <%--</div>--%>
                        <%--<br />--%>
                            <div class="col-md-2"></div>
                        <%--<div class="row">--%>
                            <div class="col-md-1">
                                <asp:Label ID="lbl_HoraFin" runat="server" Text="Hora Fin"></asp:Label>
                            </div>
                            <div class="col-md-1">
                                <asp:TextBox ID="txt_HoraFin" runat="server" placeholder="HH:MM" Columns="5" MaxLength="5"></asp:TextBox>
                            </div>

                        </div>
                        <br />

                        <%--<div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lbl_CantidadParticipantes" runat="server" Text="Cantidad de participantes"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox ID="txt_CapacidadParticipantes" runat="server" placeHolder="Ingrese un nurmero"></asp:TextBox>
                            </div>
                        </div>--%>

                        <div class="row">
                            <asp:Label ID="lbl_NombreLugar" runat="server" Text="Lugar"></asp:Label>
                            </div>
                        <br />
                        <div class="row">
                            <asp:TextBox ID="txt_NombreLugar" runat="server" placeHolder="Lugar" Columns="50" MaxLength="40"></asp:TextBox>
                            </div>

                        <br />
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lbl_Direccion" runat="server" Text="Direccion"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                
                                <%--<asp:Label ID="lbl_NroCalle" runat="server" Text="Nro"></asp:Label>--%>
                               
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-3">
                                <asp:TextBox ID="txt_Direccion" runat="server" placeHolder="Ingrese una direccion" Columns="20" MaxLength="50"></asp:TextBox>
                                </div>
                            <div class="col-md-3">
                                 <%--<asp:TextBox ID="txt_NroCalle" runat="server" placeHolder="#####" Columns="5" MaxLength="5"></asp:TextBox>--%>

                            </div>
                            </div>
                        <br />
                         <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="lbl_Barrio" runat="server" Text="Barrio"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:DropDownList ID="cmb_Barrio" runat="server" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            
                        </div>

                        <br />
                    </fieldset>
                    <br />


                    <%-- LUGAR PRIVADO --%>
                    <fieldset>

                        <div class="row">
                            <asp:RadioButton ID="rdb_Privado" runat="server" Text="Lugar Privado" GroupName="tipoEncuentro" value="1" />
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="row">
                                    <asp:Label ID="lbl_Complejo" runat="server" Text="Complejos"></asp:Label>
                                </div>
                                <br />
                                <div class="row">
                                    <asp:DropDownList ID="cmb_Complejo" runat="server" AppendDataBoundItems>
                                        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="row">
                                    <asp:Label ID="lbl_TipoCancha" runat="server" Text="Canchas"></asp:Label>
                                </div>
                                <br />
                                <div class="row">
                                    <asp:DropDownList ID="cmb_TipoCancha" runat="server" AppendDataBoundItems>
                                        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>

                        </div>
                        <br />

                        <div class="row">
                            <asp:Button ID="btn_BuscarHorarios" runat="server" Text="Buscar Horarios" OnClick="btn_BuscarHorarios_Click" BackColor="Blue" ForeColor="White" />
                        </div>
                        <div class="row">

                            <%-- GRILLA HORARIOS DISPONIBLES --%>
                            <fieldset>
                                <legend>Horarios</legend>
                                <div class="col-md-6">

                                    <%--<div style="width: 180%; height: 400px; overflow: scroll">--%>
                                    <asp:GridView ID="gdv_Horario" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                                        <Columns>
                                            <asp:CommandField HeaderText="Seleccionar" ShowSelectButton="true" />
                                            <asp:BoundField DataField="Hora" HeaderText="Hora" Visible="true" />
                                            <asp:BoundField DataField="Disponibilidad" HeaderText="Disponibilidad" Visible="true" />
                                        </Columns>
                                    </asp:GridView>
                                </div>

                            </fieldset>



                        </div>

                    </fieldset>
                </div>
            </div>
            <br />
            <div class="row">
                <%-- BOTONES --%>
                <fieldset>

                    <div class="col-lg-10"></div>
                    <div class="col-lg-2">
                        <asp:Button ID="btn_Cancelar" runat="server" Text="Cancelar" OnClick="btn_Cancelar_Click" BackColor="Red" ForeColor="White" />
                        <asp:Button ID="btn_Crear" runat="server" Text="Crear" OnClick="btn_Crear_Click" BackColor="Green" ForeColor="White" />
                    </div>
                </fieldset>
            </div>

        </div>



    </form>
</body>
</html>
