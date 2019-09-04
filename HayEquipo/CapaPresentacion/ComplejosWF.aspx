<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEstablecimiento.Master" AutoEventWireup="true" CodeBehind="ComplejosWF.aspx.cs" Inherits="CapaPresentacion.ComplejosWF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblCD" runat="server" Text="Complejos Deportivos" ForeColor="White" Font-Size="Large"></asp:Label>
        <br />
        <br />
&nbsp;
        <asp:Label ID="lblNombre" runat="server" Text="Nombre" ForeColor="White"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtNomb" placeholder="Ingrese nombre del complejo" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rvfNomb"
            runat="server"
            ControlToValidate="txtNomb"
            ErrorMessage="Ingrese Nombre"
            CssClass="alert-danger" Display="Dynamic"
            Text="*" ValidationGroup="A" />
        <asp:RegularExpressionValidator ID="rvNomb"
             runat="server" ErrorMessage="Ingrese un Nombre válido"
             ControlToValidate="txtNomb" ValidationExpression="^[a-zA-Z ]*$"
             CssClass="alert-danger"
             Display="Dynamic"></asp:RegularExpressionValidator>
        <br />
&nbsp;
        <asp:Label ID="lblDesc" runat="server" Text="Descripcion" ForeColor="White"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtDesc" placeholder="Ingrese una descripción" CssClass="form-control" runat="server" Height="85px" Width="618px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rvfDesc"
            runat="server"
            ControlToValidate="txtDesc"
            ErrorMessage="Ingrese Descripción"
            CssClass="alert-danger" Display="Dynamic"
            Text="*" ValidationGroup="A" />
        <asp:RegularExpressionValidator ID="rvDesc"
             runat="server" ErrorMessage="Ingrese una Descripción válida"
             ControlToValidate="txtDesc" ValidationExpression="^[a-zA-Z ]*$"
             CssClass="alert-danger"
             Display="Dynamic"></asp:RegularExpressionValidator>
        <br />
&nbsp;
        <asp:Label ID="lblTipo" runat="server" Text="Tipo" ForeColor="White"></asp:Label>
&nbsp;
        <asp:DropDownList ID="ddlTipo" CssClass="form-control" runat="server" AppendDataBoundItems="true">
        <asp:ListItem Value="0">Seleccione..</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvTipo"
            runat="server" ControlToValidate="ddlTipo"
            ErrorMessage="Seleccione un Tipo" InitialValue="0"
            CssClass="alert-danger"
            Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
&nbsp;
        <asp:Label ID="lblCalle" runat="server" Text="Calle" ForeColor="White"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtCalle" placeholder="Ingrese una calle" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvCalle"
            runat="server"
            ControlToValidate="txtCalle"
            ErrorMessage="Ingrese Calle"
            CssClass="alert-danger" Display="Dynamic"
            Text="*" ValidationGroup="A" />
        <asp:RegularExpressionValidator ID="rvCalle"
             runat="server" ErrorMessage="Ingrese una Calle válida"
             ControlToValidate="txtNomb" ValidationExpression="^[a-zA-Z ]*$"
             CssClass="alert-danger"
             Display="Dynamic"></asp:RegularExpressionValidator>
        <br />
&nbsp;
        <asp:Label ID="lblNum" runat="server" Text="Número" ForeColor="White"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtNro" placeholder="Ingrese un número" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNro"
            runat="server"
            ControlToValidate="txtNro"
            ErrorMessage="Ingrese Número"
            CssClass="alert-danger" Display="Dynamic"
            Text="*" ValidationGroup="A" />
        <asp:RegularExpressionValidator ID="rvNro"
             runat="server" ErrorMessage="Ingrese un Número válido"
             ControlToValidate="txtNomb" ValidationExpression="^[a-zA-Z ]*$"
             CssClass="alert-danger"
             Display="Dynamic"></asp:RegularExpressionValidator>
        <br />
&nbsp;
        <asp:Label ID="lblBarrio" runat="server" Text="Barrio" ForeColor="White"></asp:Label>
&nbsp;
        <asp:DropDownList ID="ddlBarrio" CssClass="form-control" runat="server" AppendDataBoundItems="true">
        <asp:ListItem Value="0">Seleccione..</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvBarrio"
            runat="server" ControlToValidate="ddlBarrio"
            ErrorMessage="Seleccione un Barrio" InitialValue="0"
            CssClass="alert-danger"
            Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
&nbsp;
        <asp:Label ID="lblTel" runat="server" Text="Teléfono" ForeColor="White"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtTel" placeholder="Ingrese un número" CssClass="form-control" runat="server" Width="227px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvTel"
            runat="server"
            ControlToValidate="txtTel"
            ErrorMessage="Ingrese Número"
            CssClass="alert-danger" Display="Dynamic"
            Text="*" ValidationGroup="A" />
        <asp:RegularExpressionValidator ID="rvTel"
             runat="server" ErrorMessage="Ingrese un Número válido"
             ControlToValidate="txtNomb" ValidationExpression="^[a-zA-Z ]*$"
             CssClass="alert-danger"
             Display="Dynamic"></asp:RegularExpressionValidator>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary" OnClick="btnGuardar_Click" Text="Guardar" ValidationGroup="A" Width="140px" />
        <asp:Button ID="btnNuevo" runat="server" class="btn btn-default" OnClick="btnNuevo_Click" Text="Nuevo" Width="119px" />
        <asp:Button ID="btnEliminar" runat="server" class="btn btn-warning" OnClick="btnEliminar_Click" Text="Eliminar" Width="116px" />
        <br />
&nbsp;<br />
        <asp:GridView ID="gvComplejos" runat="server"     CssClass="table table-hover table-striped" AutoGenerateColumns="True" OnSelectedIndexChanged="gvComplejos_SelectedIndexChanged" ForeColor="Black" BackColor="White">
            <Columns>
            <%--    <asp:BoundField DataField="nombre" ItemStyle-CssClass="col-lg-3 text-center" HeaderText="Nombre" />
                <asp:BoundField DataField="descripcion" ItemStyle-CssClass="col-lg-3 text-center" HeaderText="Descripción" />
                <asp:BoundField DataField="calle" ItemStyle-CssClass="col-lg-3 text-center" HeaderText="Calle" />
                <asp:BoundField DataField="nroCalle" ItemStyle-CssClass="col-lg-3 text-center" HeaderText="Nº" />
                <asp:BoundField DataField="nroTelefono" ItemStyle-CssClass="col-lg-3 text-center" HeaderText="Télefono" />--%>
                <asp:CommandField HeaderText="Seleccionar" ItemStyle-CssClass="col-lg-3 text-center" ShowSelectButton="True" />
            </Columns>
        </asp:GridView>
        <br />
        <br />

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<</asp:Content>