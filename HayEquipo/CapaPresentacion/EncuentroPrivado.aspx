<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EncuentroPrivado.aspx.cs" Inherits="CapaPresentacion.EncuentroPrivado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .alinearIzquiera {
            text-align: left;
        }

        .tamanoLetra {
            font-size: 15px;
        }

        .titulo {
            text-align: center;
            color: #ffffff;
        }

        .colorLineaHorizontal {
            color: #808080;
        }

        .elPadding {
            padding: 8px;
        }

        .Estilotable {
            border-collapse: collapse;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="titulo">Encuentro</h1>
    <div class="container text-center">
        <div class="row">
            <div class="col-sm-4">
                <div class="well">
                    <legend>Datos del Encuentro</legend>
                    <div class="row">
                        <div class="col-sm-4 alinearIzquiera">
                            <span class="glyphicon glyphicon-calendar tamanoLetra"></span>
                            <strong><asp:Label ID="cld_Fecha" CssClass="tamanoLetra" runat="server" Text=""></asp:Label></strong>
                        </div>
                        <div class="col-sm-8 alinearIzquiera">
                               <strong><asp:Label ID="lbl_Deporte" CssClass="tamanoLetra" style="color:#11398a" runat="server" Text=""></asp:Label></strong><br />
                               <asp:Label ID="Label2" style="color:#808080" runat="server" Text="Privado &#183; Organizado por "></asp:Label>
                               <strong><asp:Label ID="txt_Organizador" runat="server" Text=""></asp:Label></strong>
                        </div>
                    </div>
                    <hr class="colorLineaHorizontal" />
                    <div class="alinearIzquiera elPadding">
                        <span class="glyphicon glyphicon-time"></span>
                        <asp:Label ID="Label3" style="color:black" runat="server" Text="De: "></asp:Label>
                        <asp:Label ID="txt_HoraInicio" runat="server" Text="tal hora"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text=" a "></asp:Label>
                        <asp:Label ID="txt_HoraFin" runat="server" Text="Tal hora"></asp:Label>
                    </div>
                    <div class="alinearIzquiera elPadding">
                            <span class="glyphicon glyphicon-map-marker"></span>
                            <asp:Label ID="lbl_Complejo" runat="server" Text="Lugar"></asp:Label>
                            <asp:Label ID="Label5" runat="server" Text=" &#183; "></asp:Label>
                            <asp:Label ID="txt_calle" runat="server" Text="Calle"></asp:Label>
                            <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>
                            <asp:Label ID="txt_nroCalle" runat="server" Text="Nro Calle"></asp:Label>

                    </div>
                    <div class="alinearIzquiera elPadding">
                        <span class="glyphicon glyphicon-search"></span>
                        <asp:LinkButton ID="LinkButton1" runat="server">Ver Info del Complejo</asp:LinkButton>
                        <%--Al darle click al linkbutton debería mostrar un modal con los datos del complejo: mapa, reputación, servicios, etc.--%>
                    </div>
                    <div class="alinearIzquiera elPadding">
                            <span class="glyphicon glyphicon-earphone"></span>
                            <asp:Label ID="txt_Telefono" runat="server" Text="Telefono"></asp:Label>
                    </div>

                    <asp:Button ID="btn_CancelarEncuentro" runat="server" CssClass="btn btn-danger" Text="Cancelar Encuentro" OnClick="btn_CancelarEncuentro_Click"></asp:Button>
                </div>
                <div class="well">
                    <div class="form-group">
                        <span class="glyphicon glyphicon-eye-close"></span>
                        <asp:Label ID="lbl_Clave" runat="server" Text=" Clave"></asp:Label>
                        <asp:TextBox ID="txt_Clave" runat="server" CssClass="form-control" placeHolder="Ingrese Clave" TextMode="Password"></asp:TextBox><br />
                        <asp:Button ID="btn_Ingresar" runat="server" Text="Comprobar" CssClass="btn btn-default" OnClick="btn_Ingresar_Click" />
                    </div>
                </div>
            </div>
            <div class="col-sm-4"> <%--Union a Equipos--%>
                <div class="well">
                    <legend>Lista de Participantes</legend>
                    <div class="row">
                        <div class="col-sm-6">
                                <div class="panel panel-primary">
                            <div class="panel-heading">Equipo A</div>
                                    <div class="panel-body">
                                        <%--Equipo A--%>
                                        <asp:GridView ID="gdv_Equipo_A" runat="server" AutoGenerateColumns="false" ShowHeader="false" EmptyDataText="Sin participantes aún..." BorderWidth="0" Font-Size="Large">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                            <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" />
                                        </Columns>
                                    </asp:GridView>
                                        <br />
                                        <asp:Label ID="lbl_CantidadEquipoA" runat="server" Text="Label"></asp:Label>
                                </div>
                                    </div>
                            <asp:Button ID="btn_UnirseEquipoA" runat="server" Text="Unirse" OnClick="UnirseEquipoA_Click" class="btn btn-success" />
                        </div>
                        <div class="col-sm-6">
                             <div class="panel panel-primary">
                            <div class="panel-heading">Equipo B</div>
                                    <div class="panel-body">
                                    <%--Equipo B --%>
                                    <asp:GridView ID="gdv_Equipo_B" runat="server" AutoGenerateColumns="false" ShowHeader="false" EmptyDataText="Sin participantes aún..." BorderWidth="0" Font-Size="Large">
                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                            <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" />
                                        </Columns>
                                    </asp:GridView>
                                        <br />
                                    <asp:Label ID="lbl_CantidadEquipoB" runat="server" Text="Label"></asp:Label>

                                </div>
                                 </div>

                            <asp:Button ID="btn_UnirseEquipoB" runat="server" Text="Unirse" OnClick="btn_UnirseEquipoB_Click" class="btn btn-success" />
                        </div>
                    </div>
                    <br />
                    <div class="form-group">
                    <asp:Button ID="btn_Invitar" runat="server" Text="Invitar" OnClick="btn_Invitar_Click" class="btn btn-info" />
                    <asp:Button ID="btn_Salir" runat="server" Text="Salir" OnClick="btn_Salir_Click" class="btn btn-danger"/>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="well">
                    <legend>Chat</legend>
                        <div class="w3-responsive">
                        <asp:GridView ID="gdv_Pantalla" CssClass="w3-table-all w3-card-4" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="fechaHoraMensaje" HeaderText="Fecha y Hora" Visible="true" HeaderStyle-Width="10%" />
                                <asp:BoundField DataField="nombreUsuario" HeaderText="Usuario" Visible="true" HeaderStyle-Width="20%" />
                                <asp:BoundField DataField="textoMensaje" HeaderText="Mensaje" Visible="true" HeaderStyle-Width="70%" />
                            </Columns>
                        </asp:GridView>
                            </div>
                    <br />
                    <%--BOTONES CHAT--%>
                        <div class="form-group alinearIzquiera">
                            <label for="comment">Mensaje:</label>
                             <asp:TextBox ID="txt_Mensaje" runat="server" Text="" placeholder="Escriba un mensaje" Class="form-control" ></asp:TextBox><br />
                             <asp:Button ID="btn_Enviar" runat="server" Text="Enviar" OnClick="btn_Enviar_Click" CssClass="btn btn-primary btn-block"/>
                        </div>
                </div>
            </div>
            <div class="col-me-2"></div>

        </div>

        <div id="contenedorDelMapa" runat="server" class="embed-responsive embed-responsive-16by9">
            <iframe class="embed-responsive-item" id="frm_map" runat="server" src="" allowfullscreen=""></iframe>
        </div>
    </div>
</asp:Content>




 