<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EncuentroPrivado.aspx.cs" Inherits="CapaPresentacion.EncuentroPrivado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
            <h1 style="text-align:center">Encuentro Privado</h1>
        </div>
        </div>
        <br />

       <div class="row">
                        <div class="col-md-1"></div>
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
            <div class="col-md-1"></div>
<<<<<<< HEAD
            <div class="col-md-2">
                <div class="row">
                    <asp:Label ID="lbl_Fecha" runat="server" Text="Fecha"></asp:Label>
                </div>
                <div class="row">
                    <asp:Calendar ID="cld_Fecha" runat="server"></asp:Calendar>
                </div>
                <br />
                <div class="row">
                    <asp:Label ID="lbl_Complejo" runat="server" Text="Complejos"></asp:Label>
                </div>
                 <div class="row">
                     <asp:DropDownList ID="cmb_Complejo" runat="server" AppendDataBoundItems>
                                        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                    </asp:DropDownList>
                 </div>
                 <div class="row"></div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <div class="row">
                    <asp:Label ID="lbl_Deporte" runat="server" Text="Deporte"></asp:Label>
                </div>
                <div class="row">
                    <asp:DropDownList ID="cmb_Deporte" runat="server" AppendDataBoundItems>
                                <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                            </asp:DropDownList>
                </div>
                <div class="row"></div>
                 <div class="row"></div>
                 <div class="row"></div>
                 <div class="row"></div>
            </div>
                </div>
            

            <div class="col-md-6">
            <div class="col-md-1"></div>
            <div class="col-md-2">
                <div class="row">
                    <fieldset>
                         <legend>Equipo A</legend>
                        <div class="row" id="contenido">
                            <%--<div class="col-8">--%>
                            <div style="width: 80%; height: 400px; overflow: scroll">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                                <Columns>
                                   <asp:CommandField HeaderText="Unirse" ShowSelectButton="true" />                                    
                                    <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                    <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" /> 
                                    
                                </Columns>
                            </asp:GridView>
                            <%--<asp:DataList ID="dtl_UsuariosUnidos" runat="server" ></asp:DataList>--%>
                        </div>
                        <div class="row">
                        <%-- <div class="col-md-4"></div>
                            <div class="col-md-4">--%>
                        <%--<asp:Button ID="btn_Salir" runat="server" Text="Salir" OnClick="btn_Salir_Click" BackColor="Red" ForeColor="White" />--%>
                        <asp:Button ID="UnirseEquipoA" runat="server" Text="Unirse" OnClick="UnirseEquipoA_Click" BackColor="Green" ForeColor="White" />
                    </div>
                    </fieldset>
                </div>
            </div>
            <div class="col-md-2">
                <div class="row">
                    <fieldset>
                         <legend>Equipo B</legend>
                        <div class="row" id="contenido">
                            <%--<div class="col-8">--%>
                            <div style="width: 80%; height: 400px; overflow: scroll">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                                <Columns>
                                    <asp:CommandField HeaderText="Unirse" ShowSelectButton="true" />
                                    <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                    <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" />

                                </Columns>
                            </asp:GridView>
                            <%--<asp:DataList ID="dtl_UsuariosUnidos" runat="server" ></asp:DataList>--%>
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



=======
>>>>>>> parent of fe3928b... frontedn publico privado
            <div class="col-md-8">
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
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>--%>
                            </div>

                        </div>
                    <div class="row">
                            <div class="col-md-4">
                                <asp:Label ID="lbl_Barrio" runat="server" Text="Barrio"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:DropDownList ID="cmb_Barrio" runat="server" AppendDataBoundItems>
                                    <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                       
                        <div class="row">
                        </div>
                    </fieldset>


            </div>
           
            <div class="col-md-4">
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
                            <%--<asp:Button ID="btn_BuscarHorarios" runat="server" Text="Buscar Horarios" OnClick="btn_BuscarHorarios_Click" BackColor="Blue" ForeColor="White" />--%>
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

<<<<<<< HEAD
                        </div>
                    </fieldset>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-4">
                        
                    </div>                    
                        </div>
                    <div class="col-md-4">
                    </div>
                    <div class="col-md-1"></div>
                    

                </div>
=======
            </div>
                      </fieldset>
        </div>
        <br />
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-4">
                                    <div class="row" id="contenido">
            <%--<div class="col-8">--%>
                 <%--<div style="width: 180%; height: 400px; overflow: scroll">--%>
                 <asp:GridView ID="gdv_EquipoA" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                                <Columns>
                                   <asp:CommandField HeaderText="Unirse" ShowSelectButton="true" />                                    
                                    <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                    <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" /> 
                                    
                                </Columns>
                            </asp:GridView>
                <%--<asp:DataList ID="dtl_UsuariosUnidos" runat="server" ></asp:DataList>--%>

           

        </div>
            </div>
            <div class="col-md-4">
                                    <div class="row" id="contenido">
            <%--<div class="col-8">--%>
                 <%--<div style="width: 180%; height: 400px; overflow: scroll">--%>
                 <asp:GridView ID="gdv_EquipoB" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                                <Columns>
                                   <asp:CommandField HeaderText="Unirse" ShowSelectButton="true" />                                    
                                    <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                    <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" /> 
                                    
                                </Columns>
                            </asp:GridView>
                <%--<asp:DataList ID="dtl_UsuariosUnidos" runat="server" ></asp:DataList>--%>

           

        </div>
            </div>
            <div class="col-md-4"></div>
        </div>
    
 
>>>>>>> parent of fe3928b... frontedn publico privado
    </form>
</body>
</html>
