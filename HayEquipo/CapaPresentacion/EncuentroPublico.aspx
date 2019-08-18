<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EncuentroPublico.aspx.cs" Inherits="CapaPresentacion.EncuentroPublico" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="row">
            <h1 style="text-align:center">Encuentro Público</h1>
        </div>
        <div class="row" id="datos">

        </div>
        <div class="row" id="contenido">
            <div class="col-8">
                 <%--<div style="width: 180%; height: 400px; overflow: scroll">--%>
                 <asp:GridView ID="gdv_UsuariosUnidos" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
                                <Columns>
                                   <asp:CommandField HeaderText="Unirse" ShowSelectButton="true" />                                    
                                    <asp:BoundField DataField="id" HeaderText="Id" Visible="false" />
                                    <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true" /> 
                                    
                                </Columns>
                            </asp:GridView>
                <%--<asp:DataList ID="dtl_UsuariosUnidos" runat="server" ></asp:DataList>--%>

            </div>
            <div class="col-4">
                <asp:Table ID="tbl_Chat" runat="server" ></asp:Table>
            </div>

        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <asp:Button ID="btn_Salir" runat="server" Text="Salir" OnClick="btn_Salir_Click" BackColor="Red" ForeColor="White"/>
                <asp:Button ID="btn_Unirsr" runat="server" Text="Unirse" OnClick="btn_Unirsr_Click" BackColor="Green" ForeColor="White" />
            </div>
            <div class="col-md-4"></div>
        </div>

    
    </div>
    </form>
</body>
</html>
