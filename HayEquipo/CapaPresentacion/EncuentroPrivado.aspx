<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EncuentroPrivado.aspx.cs" Inherits="CapaPresentacion.EncuentroPrivado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">

            <div class="row">
                <h1 style="text-align: center">Encuentro Privado</h1>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-1"></div>
            <%--<div class="col-md-2">--%>
            <%--<asp:CheckBox ID="chk_Accesibilidad" runat="server" Text=" Clave" />--%>
            <%--</div>--%>
            <%--<div class="col-md-3">--%>
            <%--   <asp:Label ID="lbl_Clave" runat="server" Text="Clave"></asp:Label>
                           <asp:TextBox ID="txt_Clave" runat="server" placeHolder="Ingrese Contraseña" TextMode="Password" Columns="20" MaxLength="20"></asp:TextBox>

                            <asp:Button ID="btn_Ingresar" runat="server" Text="Ingresar" OnClick="btn_Ingresar_Click" />--%>
            <%--</div>--%>
            <%--<div class="col-md-1"></div>--%>
        </div>
        <br />


        <div class="row">


            <div class="col-md-6">
                <div class="col-md-1"></div>
                <%--<div class="col-md-2">--%>
                <div class="col-md-4">
                    <div class="row">
                        <asp:Label ID="lbl_Fecha" runat="server" Text="Fecha"></asp:Label>
                        <%--<asp:Calendar ID="cld_Fecha" runat="server"></asp:Calendar>--%>
                        <asp:TextBox ID="cld_Fecha" runat="server" Text=""></asp:TextBox>
                    </div>
                    <%--<div class="row">

                </div>--%>
                    <br />
                    <div class="row">
                        <asp:Label ID="lbl_Complejo" runat="server" Text="Complejos"></asp:Label>
                        <asp:DropDownList ID="cmb_Complejo" runat="server" AppendDataBoundItems>
                            <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <%-- <div class="row">

                 </div>--%>
                    <div class="row"></div>
                </div>



                <div class="row">
                    <asp:Label ID="lbl_Deporte" runat="server" Text="Deporte"></asp:Label>
                    <asp:DropDownList ID="cmb_Deporte" runat="server" AppendDataBoundItems>
                        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="lbl_Calle" runat="server" Text="Calle"></asp:Label>
                    <asp:TextBox ID="txt_calle" runat="server" Text=""></asp:TextBox>
                    <br />
                    <asp:Label ID="lbl_nroCalle" runat="server" Text="Nro Calle"></asp:Label>
                    <asp:TextBox ID="txt_nroCalle" runat="server" Text=""></asp:TextBox>
                    <br />
                    <asp:Label ID="lbl_Telefono" runat="server" Text="Telefono"></asp:Label>
                    <asp:TextBox ID="txt_Telefono" runat="server" Text=""></asp:TextBox>
                    <br />
                    <asp:Label ID="lbl_Organizador" runat="server" Text="Organizador"></asp:Label>
                    <asp:TextBox ID="txt_Organizador" runat="server" placeHolder="Organizador" Columns="50" MaxLength="40"></asp:TextBox>
                    <br />
                    <asp:Button ID="btn_CancelarEncuentro" runat="server" Text="Cancelar Encuentro" OnClick="btn_CancelarEncuentro_Click" BackColor="Gray" ForeColor="Black"></asp:Button>
                    <br />
                    <asp:Label ID="lbl_CapacidadMaxima" runat="server" Text="Cantidad de Participantes"></asp:Label>
                    <strong>
                        <asp:Label ID="lbl_Cantidad" runat="server" Text=""></asp:Label></strong>
                    <div class="row">
                    </div>
                    <br />
                </div>
                <br />
                <div class="row"></div>
                <div class="row"></div>
                <div class="row"></div>
                <div class="row"></div>



                <br />
            </div>
            <div class="col-md-1"></div>

            <%--***************************************--%>

            <%--<div class="row">--%>

            <div class="col-md-6">
                <div class="col-md-1"></div>
                <div class="col-md-2">
                    <div class="row">
                        <fieldset>
                            <legend>Equipo A</legend>
                            <strong>
                                <asp:Label ID="lbl_CantidadEquipoA" runat="server" Text=""></asp:Label></strong>
                            <div class="row" id="contenido">
                                <%--<div class="col-8">--%>
                                <div style="width: 100%; height: 300px; overflow: scroll">
                                    <asp:GridView ID="gdv_Equipo_A" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                                        <Columns>
                                            <%--<asp:CommandField HeaderText="Unirse" ShowSelectButton="true" />--%>
                                            <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                            <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" />

                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <%--<asp:DataList ID="dtl_UsuariosUnidos" runat="server" ></asp:DataList>--%>
                            </div>
                            <div class="row">
                                <%-- <div class="col-md-4"></div>
                            <div class="col-md-4">--%>
                                <%--<asp:Button ID="btn_Salir" runat="server" Text="Salir" OnClick="btn_Salir_Click" BackColor="Red" ForeColor="White" />--%>
                                <asp:Button ID="btn_UnirseEquipoA" runat="server" Text="Unirse" OnClick="UnirseEquipoA_Click" BackColor="Green" ForeColor="White" />
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="row">
                        <fieldset>
                            <legend>Equipo B</legend>
                            <strong>
                                <asp:Label ID="lbl_CantidadEquipoB" runat="server" Text=""></asp:Label></strong>
                            <div class="row" id="contenido">
                                <%--<div class="col-8">--%>
                                <div style="width: 100%; height: 300px; overflow: scroll">
                                    <asp:GridView ID="gdv_Equipo_B" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                                        <Columns>
                                            <%--<asp:CommandField HeaderText="Unirse" ShowSelectButton="true" />--%>
                                            <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                            <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" />

                                        </Columns>
                                    </asp:GridView>
                                    <%--<asp:DataList ID="dtl_UsuariosUnidos" runat="server" ></asp:DataList>--%>
                                </div>
                            </div>
                            <div class="row">
                                <%-- <div class="col-md-4"></div>
                            <div class="col-md-4">--%>
                                <%--<asp:Button ID="btn_Salir" runat="server" Text="Salir" OnClick="btn_Salir_Click" BackColor="Red" ForeColor="White" />--%>
                                <asp:Button ID="btn_UnirseEquipoB" runat="server" Text="Unirse" OnClick="btn_UnirseEquipoB_Click" BackColor="Green" ForeColor="White" />
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>

        <br />
        <div class="row">
            <div class="col-md-6"></div>
            <div class="col-md-6">
                <asp:Button ID="btn_Invitar" runat="server" Text="Invitar" OnClick="btn_Invitar_Click" BackColor="White" ForeColor="Black" Width="100" />
            </div>
        </div>

        <br />
        <div class="row">
            <div class="col-md-6"></div>
            <div class="col-md-6">
                <asp:Button ID="btn_Salir" runat="server" Text="Salir" OnClick="btn_Salir_Click" BackColor="Red" ForeColor="White" Width="100" />
            </div>
        </div>



        <div class="row">
            <div class="col-me-2"></div>
            <div class="col-me-8">
                <div class="row">

                    <%--<asp:TextBox ID="txt_Pantalla" runat="server" Text="" TextMode="MultiLine" Width="200px" Height="400px"></asp:TextBox>--%>
                    <div style="width: 100%; height: 300px; overflow: scroll">
                        <asp:GridView ID="gdv_Pantalla" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                            <Columns>
                                <%--<asp:CommandField HeaderText="Unirse" ShowSelectButton="true" />--%>
                                <asp:BoundField DataField="fechaHoraMensaje" HeaderText="Fecha y Hora" Visible="true" HeaderStyle-Width="10%" />
                                <asp:BoundField DataField="nombreUsuario" HeaderText="Usuario" Visible="true" HeaderStyle-Width="20%" />
                                <asp:BoundField DataField="textoMensaje" HeaderText="Mensaje" Visible="true" HeaderStyle-Width="70%" />

                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="form-group alinearIzquiera">
                        <label for="comment">Mensaje:</label>
                        <asp:Panel ID="pnl_PanelChat" runat="server" DefaultButton="btn_Enviar">
                            <asp:TextBox ID="txt_Mensaje" runat="server" Text="" placeholder="Escriba un mensaje" Class="form-control" MaxLength="50"></asp:TextBox><br />
                            <asp:Button ID="btn_Enviar" runat="server" Text="Enviar" OnClick="btn_Enviar_Click" CssClass="btn btn-primary btn-block" />

                        </asp:Panel>
                    </div>

                </div>
            </div>
            <div class="col-me-2"></div>

        </div>

        <div id="contenedorDelMapa" runat="server" class="embed-responsive embed-responsive-16by9">
            <iframe class="embed-responsive-item" id="frm_map" runat="server" src="" allowfullscreen=""></iframe>
        </div>




    </form>
</body>
</html>
