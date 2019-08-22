<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EncuentroPublico.aspx.cs" Inherits="CapaPresentacion.EncuentroPublico" %>

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
            <h1 style="text-align: center">Encuentro Público</h1>
        </div>
        <div class="row" id="datos">
        </div>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-7">
<<<<<<< HEAD
                <%--DATOS--%>
                <fieldset>
                    <div class="row">
                        <%--<div class="col-md-1"></div>--%>
                        <%--<div class="col-md-2">--%>
                            <asp:CheckBox ID="chk_Accesibilidad" runat="server" Text=" Clave" />
                        <%--</div>--%>
                        <%--<div class="col-md-3">--%>
                            <asp:TextBox ID="txt_Clave" runat="server" placeHolder="Ingrese Contraseña" TextMode="Password" Columns="20" MaxLength="20"></asp:TextBox>


                            <asp:Button ID="btn_Ingresar" runat="server" Text="Ingresar" OnClick="btn_Ingresar_Click" />
                        <%--</div>--%>
                        <%--<div class="col-md-1"></div>--%>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-4">
                            <asp:Label ID="lbl_Fecha" runat="server" Text="Fecha"></asp:Label>
                        </div>
                        <div class="col-md-4">

                            <asp:Label ID="lbl_Deporte" runat="server" Text="Deporte"></asp:Label>
                        </div>




                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <asp:Calendar ID="cld_Fecha" runat="server"></asp:Calendar>
                            <%--<asp:TextBox ID="txt_Fecha" runat="server" TextMode="Date"></asp:TextBox>--%>
                        </div>
                        <div class="col-md-4">
                            <%--NO BORRAR--%>

                            <asp:DropDownList ID="cmb_Deporte" runat="server" AppendDataBoundItems>
                                <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <br />
                    <div class="row">
                        <div class="col-md-4">
                            <%--<asp:Label ID="lbl_Zona" runat="server" Text="Zona"></asp:Label>--%>
                            <%--NO BORRAR--%>
                            <%--<asp:Label ID="lbl_Barrio" runat="server" Text="Barrio"></asp:Label>--%>
                        </div>
                        <div class="col-md-4">
                            <%-- <asp:DropDownList ID="cmb_Zona" runat="server" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>--%>
                            <%--NO BORRAR--%>
                            <%--<asp:DropDownList ID="cmb_Barrio" runat="server" AppendDataBoundItems>
=======
                  <%--DATOS--%>
                    <fieldset>
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label ID="lbl_Deporte" runat="server" Text="Deporte"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbl_Fecha" runat="server" Text="Fecha"></asp:Label>
                                </div>
                            
                               
                            
                            
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                             <asp:DropDownList ID="cmb_Deporte" runat="server" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4">
                                <%--NO BORRAR--%>
                                <asp:Calendar ID="cld_Fecha" runat="server"></asp:Calendar>
                                <%--<asp:TextBox ID="txt_Fecha" runat="server" TextMode="Date"></asp:TextBox>--%>
                            </div>
                        </div>
                        
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label ID="lbl_Zona" runat="server" Text="Zona"></asp:Label>
                                <%--NO BORRAR--%>
                                <%--<asp:Label ID="lbl_Barrio" runat="server" Text="Barrio"></asp:Label>--%>
                            </div>
                            <div class="col-md-4">
                                <asp:DropDownList ID="cmb_Zona" runat="server" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>
                                <%--NO BORRAR--%>
                                <%--<asp:DropDownList ID="cmb_Barrio" runat="server" AppendDataBoundItems>
>>>>>>> parent of fe3928b... frontedn publico privado
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>--%>
                        </div>

                    </div>

                    <div class="row">
                    </div>
                </fieldset>

                <div class="col-md-6">
                    <%--  LUGAR PUBLICO--%>
                    <fieldset>
<<<<<<< HEAD

                        <%--<div class="row">
                            <asp:RadioButton ID="rdb_Publico" runat="server" Text="Lugar Público" GroupName="tipoEncuentro" value="0" OnCheckedChanged="rdb_Publico_CheckedChanged" AutoPostBack="true"/>
                        </div>
                        <br />--%>
=======
                        
>>>>>>> parent of fe3928b... frontedn publico privado
                        <div class="row">

                            <div class="col-md-1">
                                <asp:Label ID="lbl_HoraInicio" runat="server" Text="Hora Inicio"></asp:Label>
                            </div>
                            <div class="col-md-1">
<<<<<<< HEAD
                                <asp:TextBox ID="txt_HoraInicio" runat="server" placeholder="00:00" Columns="5" MaxLength="5"></asp:TextBox>

=======
                                <asp:TextBox ID="txt_HoraInicio" runat="server" placeholder="HH:MM" Columns="5" MaxLength="5"></asp:TextBox>
                               
>>>>>>> parent of fe3928b... frontedn publico privado
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

                        <div class="row">
                            <asp:TextBox ID="txt_NombreLugar" runat="server" placeHolder="Lugar" Columns="50" MaxLength="40"></asp:TextBox>
                        </div>

                        <br />
                        <div class="row">
<<<<<<< HEAD
                            <asp:Label ID="lbl_Direccion" runat="server" Text="Direccion"></asp:Label>
=======
                            <div class="col-md-4">
                                <asp:Label ID="lbl_Calle" runat="server" Text="Calle"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                
                                <asp:Label ID="lbl_NroCalle" runat="server" Text="Nro"></asp:Label>
                               
                            </div>
>>>>>>> parent of fe3928b... frontedn publico privado
                        </div>

                        <div class="row">
<<<<<<< HEAD
                            <asp:TextBox ID="txt_Direccion" runat="server" placeHolder="Ingrese una direccion" Columns="50" MaxLength="40"></asp:TextBox>
                        </div>
                        <br />
                        <%--<div class="row">
=======
                            <div class="col-md-4">
                                <asp:TextBox ID="txt_Calle" runat="server" placeHolder="Ingrese una direccion" Columns="20" MaxLength="50"></asp:TextBox>
                                </div>
                            <div class="col-md-4">
                                 <asp:TextBox ID="txt_NroCalle" runat="server" placeHolder="#####" Columns="5" MaxLength="5"></asp:TextBox>

                            </div>
                            </div>
                        <br />
                         <div class="row">
>>>>>>> parent of fe3928b... frontedn publico privado
                            <div class="col-md-4">
                                <asp:Label ID="lbl_Barrio" runat="server" Text="Barrio"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:DropDownList ID="cmb_Barrio" runat="server" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            
                        </div>

                        <br />
                    </fieldset>
                </div>




<<<<<<< HEAD
                <br />
=======
            </div>
            <div class="col-md-4"></div>
                    <div class="row" id="contenido">
            <div class="col-8">
                 <div style="width: 180%; height: 400px; overflow: scroll">
                 <asp:GridView ID="gdv_UsuariosUnidos" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                                <Columns>
                                   <asp:CommandField HeaderText="Unirse" ShowSelectButton="true" />                                    
                                    <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                    <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" /> 
                                    
                                </Columns>
                            </asp:GridView>
                <%--<asp:DataList ID="dtl_UsuariosUnidos" runat="server" ></asp:DataList>--%>
>>>>>>> parent of fe3928b... frontedn publico privado

            </div>
            <div class="col-md-4">
            <div class="row">
                <%--<div class="col-8">--%>
                    <legend>Lista</legend>
                    <div style="width: 80%; height: 400px; overflow: scroll">
                        <asp:GridView ID="gdv_UsuariosUnidos" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                            <Columns>
                                <asp:CommandField HeaderText="Unirse" ShowSelectButton="true" />
                                <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" />

                            </Columns>
                        </asp:GridView>
                        <%--<asp:DataList ID="dtl_UsuariosUnidos" runat="server" ></asp:DataList>--%>
                    </div>
                    <br />

                    
                    <%--<div class="col-md-4"></div>--%>
                </div>
            <div class="row">
                        <%-- <div class="col-md-4"></div>
                            <div class="col-md-4">--%>
                        <asp:Button ID="btn_Salir" runat="server" Text="Salir" OnClick="btn_Salir_Click" BackColor="Red" ForeColor="White" />
                        <asp:Button ID="btn_Unirse" runat="server" Text="Unirse" OnClick="btn_Unirse_Click" BackColor="Green" ForeColor="White" />
                    </div>



                <%--</div>--%>
                <%--<div class="col-4">
                <asp:Table ID="tbl_Chat" runat="server" ></asp:Table>
            </div>--%>
            </div>
    </form>
</body>
</html>
