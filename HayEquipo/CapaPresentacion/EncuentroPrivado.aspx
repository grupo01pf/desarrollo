<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EncuentroPrivado.aspx.cs" Inherits="CapaPresentacion.EncuentroPrivado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .alinearIzquiera {
            text-align: left;
        }

        .tamanoLetra {
            font-size: 20px;
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
    </div>
    <asp:Label ID="lbl_Clave" runat="server" Text="Clave"></asp:Label>
    <asp:TextBox ID="txt_Clave" runat="server" placeHolder="Ingrese Contraseña" TextMode="Password" Columns="20" MaxLength="20"></asp:TextBox>
    <asp:Button ID="btn_Ingresar" runat="server" Text="Ingresar" OnClick="btn_Ingresar_Click" />
    <asp:Label ID="lbl_Fecha" runat="server" Text="Fecha"></asp:Label>
    <asp:TextBox ID="cld_Fecha" runat="server" Text=""></asp:TextBox>
    <asp:Label ID="lbl_Complejo" runat="server" Text="Complejos"></asp:Label>
    <asp:DropDownList ID="cmb_Complejo" runat="server" AppendDataBoundItems>
        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
    </asp:DropDownList>
    <asp:Label ID="lbl_Deporte" runat="server" Text="Deporte"></asp:Label>
    <asp:DropDownList ID="cmb_Deporte" runat="server" AppendDataBoundItems>
        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
    </asp:DropDownList>
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
    <div class="col-md-2">
        <div class="row">
            <fieldset>
                <legend>Equipo A</legend>
                <div class="row" id="contenido">
                    <div style="width: 100%; height: 300px; overflow: scroll">
                        <asp:GridView ID="gdv_Equipo_A" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <asp:Button ID="btn_UnirseEquipoA" runat="server" Text="Unirse" OnClick="UnirseEquipoA_Click" BackColor="Green" ForeColor="White" />
            </fieldset>
        </div>
    </div>
    <fieldset>
        <legend>Equipo B</legend>
        <div class="row" id="contenido">
            <div style="width: 100%; height: 300px; overflow: scroll">
                <asp:GridView ID="gdv_Equipo_B" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <asp:Button ID="btn_UnirseEquipoB" runat="server" Text="Unirse" OnClick="btn_UnirseEquipoB_Click" BackColor="Green" ForeColor="White" />
    </fieldset>
    <asp:Button ID="btn_Invitar" runat="server" Text="Invitar" OnClick="btn_Invitar_Click" BackColor="White" ForeColor="Black" Width="100" />
    <asp:Button ID="btn_Salir" runat="server" Text="Salir" OnClick="btn_Salir_Click" BackColor="Red" ForeColor="White" Width="100" />
    <div style="width: 100%; height: 300px; overflow: scroll">
        <asp:GridView ID="gdv_Pantalla" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
            <Columns>
                <asp:BoundField DataField="fechaHoraMensaje" HeaderText="Fecha y Hora" Visible="true" HeaderStyle-Width="10%" />
                <asp:BoundField DataField="nombreUsuario" HeaderText="Usuario" Visible="true" HeaderStyle-Width="20%" />
                <asp:BoundField DataField="textoMensaje" HeaderText="Mensaje" Visible="true" HeaderStyle-Width="70%" />
            </Columns>
        </asp:GridView>
    </div>
    <asp:TextBox ID="txt_Mensaje" runat="server" Text="" placeholder="Escriba un mensaje" MaxLength="50"></asp:TextBox>
    <asp:Button ID="btn_Enviar" runat="server" Text="Enviar" OnClick="btn_Enviar_Click" CssClass="bg-info" />
</asp:Content>

