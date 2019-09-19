<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="Complejos.aspx.cs" Inherits="CapaPresentacion.Complejos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblCD" runat="server" Text="Explorá nuestros Complejos Deportivos asociados" ForeColor="White" Font-Size="Large"></asp:Label>
        <br />
        <br />
&nbsp;
        <asp:TextBox ID="txtBuscar" placeholder="Buscar Complejo" CssClass="form-control" runat="server" Width="1406px"></asp:TextBox>
      <%--  <asp:RequiredFieldValidator ID="rvfBuscar"
            runat="server"
            ControlToValidate="txtBuscar"
            ErrorMessage="Ingrese Nombre"
            CssClass="alert-danger" Display="Dynamic"
            Text="*Ingrese Nombre" ValidationGroup="A" />--%>
        <br />       
        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" OnClick="btnBuscar_Click" Text="Buscar" Width="140px" />
&nbsp;<br />
    <br />
&nbsp;<asp:Label ID="lblOrdenar" runat="server" Text="Ordenar por:" ForeColor="White"></asp:Label>
&nbsp;
        <asp:DropDownList ID="ddlOrdenar" CssClass="form-control" runat="server" AppendDataBoundItems="true" Height="35px" Width="1374px" OnSelectedIndexChanged="ddlOrdenar_SelectedIndexChanged">
        <asp:ListItem Value="0" Selected="True">Seleccione..</asp:ListItem>
            <asp:ListItem Value="1">Mejor puntuado</asp:ListItem>
            <asp:ListItem Value="2">Más nuevo</asp:ListItem>
            <asp:ListItem Value="3">Alfabéticamente</asp:ListItem>
        </asp:DropDownList>
<%--        <asp:RequiredFieldValidator ID="rfvBarrio"
            runat="server" ControlToValidate="ddlBarrio"
            ErrorMessage="Seleccione un Barrio" InitialValue="0"
            CssClass="alert-danger"
            Display="Dynamic"></asp:RequiredFieldValidator>--%>
        <br />
&nbsp;  <br />
        <br />
        <asp:GridView ID="gvComplejos" runat="server"     CssClass="table table-hover table-striped" OnSelectedIndexChanged="gvComplejos_SelectedIndexChanged" ForeColor="Black" BackColor="White" AutoGenerateColumns="False">
            <Columns>
                <asp:CommandField HeaderText="Seleccionar" ItemStyle-CssClass="col-lg-3 text-center" ShowSelectButton="True" ItemStyle-ForeColor="#3366CC" >
<ItemStyle CssClass="col-lg-3 text-center" ForeColor="#3366CC"></ItemStyle>
                </asp:CommandField>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                <asp:BoundField DataField="Deportes" HeaderText="Deportes" />
                <asp:BoundField DataField="Valoracion" HeaderText="Valoración" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <div class="modal fade" id="smodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabelS">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabelS">Mis Servicios</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Servicio</label>
                    </div>
                    <div class="form-group">
                            <asp:DropDownList ID="ddlServ" CssClass="form-control" runat="server" AppendDataBoundItems="true">
                            <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvServ"
                            runat="server" ControlToValidate="ddlServ"
                            ErrorMessage="Seleccione un Servicio" InitialValue="0"
                            CssClass="alert-danger"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
<%--                        <asp:GridView ID="gvServ" runat="server" AutoGenerateColumns="True" BackColor="White" CssClass="table table-hover table-striped" ForeColor="Black" OnSelectedIndexChanged="gvServ_SelectedIndexChanged">
                        <Columns>
                        <asp:CommandField HeaderText="Seleccionar" ItemStyle-CssClass="col-lg-3 text-center" ItemStyle-ForeColor="#3366CC" ShowSelectButton="True" />
                        </Columns>
                </asp:GridView>--%>
                    </div>
                                      <div class="modal-footer">
<%--                              <asp:Button ID="btnGuardarS" runat="server" CssClass="btn btn-primary btn-edit" OnClick="btnGuardarS_Click" Text="Guardar" ValidationGroup="A" Width="140px" />
                              <asp:Button ID="btnNuevoS" runat="server" class="btn btn-default" OnClick="btnNuevoS_Click" Text="Nuevo" Width="119px" />
                              <asp:Button ID="btnEliminarS" runat="server" class="btn btn-warning" OnClick="btnEliminarS_Click" Text="Eliminar" Width="116px" />--%>


<%--                   <asp:Button ID="btnRegistrar" runat="server" Text="Registrarme" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btn_Registrar_Click" />--%>
                  </div>
                </div>

            </div>
     </div>
          </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<</asp:Content>



