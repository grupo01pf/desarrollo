<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEstablecimiento.Master" AutoEventWireup="true" CodeBehind="ABMComplejos.aspx.cs" Inherits="CapaPresentacion.ComplejosWF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .alinearIzquiera {
            text-align: left;
        }

        .alinearAlCentro {
            text-align: center;
        }

        .LetraNegra {
            color: black;
        }

        .titulo {
            text-align: center;
            color: #ffffff;
        }

    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="titulo">Complejos</h1>
    <%--<div class="jumbotron text-center" style="background-color: black">--%>
    <div class="container text-center"">
        <div class="row alinearAlCentro">
            <div class="col-sm-6">
                <div class="well">
                    <legend>Registro de Complejo</legend>
                    <div class="form-group">
                        <%--Aquí inicia el Formulario de Registro de Complejos--%>
                        <asp:Label ID="lblNombre" CssClass="alinearIzquiera" runat="server" Text="Nombre" ForeColor="black"></asp:Label>
                        <asp:TextBox ID="txtNomb" placeholder="Ingrese nombre del complejo" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfNomb"
                            runat="server"
                            ControlToValidate="txtNomb"
                            ErrorMessage="Ingrese Nombre"
                            CssClass="alert-danger" Display="Dynamic"
                            Text="*Ingrese Nombre" ValidationGroup="A" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDesc" CssClass="alinearIzquiera" runat="server" Text="Descripcion" ForeColor="black"></asp:Label>
                        <asp:TextBox ID="txtDesc" placeholder="Ingrese una descripción" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfDesc"
                            runat="server"
                            ControlToValidate="txtDesc"
                            ErrorMessage="Ingrese Descripción"
                            CssClass="alert-danger" Display="Dynamic"
                            Text="*Ingrese Descripción" ValidationGroup="A" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDep1" CssClass="alinearIzquiera" runat="server" Text="Deporte 1" ForeColor="black"></asp:Label>
                        <asp:DropDownList ID="ddlDep1" CssClass="form-control" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDep1_SelectedIndexChanged">
                            <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDep1"
                            runat="server" ControlToValidate="ddlDep1"
                            ErrorMessage="Seleccione un Deporte" InitialValue="0"
                            CssClass="alert-danger"
                            Display="Dynamic"></asp:RequiredFieldValidator>--%>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDep2" CssClass="alinearIzquiera" runat="server" Text="Deporte 2" ForeColor="black"></asp:Label>
                        <asp:DropDownList ID="ddlDep2" CssClass="form-control" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDep2_SelectedIndexChanged">
                            <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDep3" CssClass="alinearIzquiera" runat="server" Text="Deporte 3" ForeColor="black"></asp:Label>
                        <asp:DropDownList ID="ddlDep3" CssClass="form-control" runat="server" AppendDataBoundItems="true">
                            <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblCalle" CssClass="alinearIzquiera" runat="server" Text="Calle" ForeColor="black"></asp:Label>
                        <asp:TextBox ID="txtCalle" placeholder="Ingrese una calle" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCalle"
                            runat="server"
                            ControlToValidate="txtCalle"
                            ErrorMessage="Ingrese Calle"
                            CssClass="alert-danger" Display="Dynamic"
                            Text="*Ingrese Calle" ValidationGroup="A" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblNum" CssClass="alinearIzquiera" runat="server" Text="Número" ForeColor="black"></asp:Label>
                        <asp:TextBox ID="txtNro" placeholder="Ingrese un número" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNro"
                            runat="server"
                            ControlToValidate="txtNro"
                            ErrorMessage="Ingrese Número"
                            CssClass="alert-danger" Display="Dynamic"
                            Text="*Ingrese Número" ValidationGroup="A" />
                        <asp:RegularExpressionValidator ID="rvNro"
                            runat="server" ErrorMessage="Ingrese un Numero válido"
                            ControlToValidate="txtNro" ValidationExpression="^[0-9]*"
                            CssClass="alert-danger"
                            Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblBarrio" CssClass="alinearIzquiera" runat="server" Text="Barrio" ForeColor="black"></asp:Label>
                        <asp:DropDownList ID="ddlBarrio" CssClass="form-control" runat="server" AppendDataBoundItems="true">
                            <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvBarrio"
                            runat="server" ControlToValidate="ddlBarrio"
                            ErrorMessage="Seleccione un Barrio" InitialValue="0"
                            CssClass="alert-danger"
                            Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblTel" CssClass="alinearIzquiera" runat="server" Text="Teléfono" ForeColor="black"></asp:Label>
                        <asp:TextBox ID="txtTel" placeholder="Ingrese un número" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTel"
                            runat="server"
                            ControlToValidate="txtTel"
                            ErrorMessage="Ingrese Número"
                            CssClass="alert-danger" Display="Dynamic"
                            Text="*Ingrese Número" ValidationGroup="A" />
                        <asp:RegularExpressionValidator ID="rvTel"
                            runat="server" ErrorMessage="Ingrese un Numero válido"
                            ControlToValidate="txtTel" ValidationExpression="^[0-9]*"
                            CssClass="alert-danger"
                            Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="well">
                    <%--Botones--%>
                    <div class="modal-footer alinearIzquiera">
                        <%--Botones para ABM complejo--%>
                        <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary" OnClick="btnGuardar_Click" Text="Guardar" ValidationGroup="A" />
                        <asp:Button ID="btnNuevo" runat="server" class="btn btn-default" OnClick="btnNuevo_Click" Text="Nuevo" />
                        <asp:Button ID="btnEliminar" runat="server" class="btn btn-warning" OnClick="btnEliminar_Click" Text="Eliminar" />
                    </div>
                    <div class="alinearIzquiera modal-footer">
                        <button type="button" value="btnCan" title="Administrar Canchas" class="btn btn-primary btn-edit" data-target="#imodal" data-toggle="modal" id="btnCan"><i class="fa fa-check-square-o" aria-hidden="true"></i>Canchas</button>&nbsp;
                        <button type="button" value="btnServ" title="Administrar Servicios" class="btn btn-primary btn-edit" data-target="#smodal" data-toggle="modal" id="btnServ"><i class="fa fa-check-square-o" aria-hidden="true"></i>Servicios</button>&nbsp;
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="well">
                    <%--Grilla de Complejos--%>
                    <legend>Complejos cargados</legend>
                    <div class="table-responsive">
                        <asp:GridView ID="gvComplejos" runat="server" CssClass="table table-hover table-striped" AutoGenerateColumns="True" OnSelectedIndexChanged="gvComplejos_SelectedIndexChanged" ForeColor="Black" BackColor="White">
                            <Columns>
                                <asp:CommandField HeaderText="Seleccionar" ItemStyle-CssClass="col-lg-3 text-center" ShowSelectButton="True" ItemStyle-ForeColor="#3366CC" />
                                <asp:BoundField DataField="idComplejoDeportivo" HeaderText="ID" Visible="false" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="imodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Mis Canchas</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Deporte</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlDep4" CssClass="form-control" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDep4_SelectedIndexChanged">
                                <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvDep4"
                                runat="server" ControlToValidate="ddlDep4"
                                ErrorMessage="Seleccione un Deporte" InitialValue="0"
                                CssClass="alert-danger"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Tipo de Cancha</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlTipoCancha" CssClass="form-control" runat="server" AppendDataBoundItems="true">
                                <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvTipoCancha"
                                runat="server" ControlToValidate="ddlTipoCancha"
                                ErrorMessage="Seleccione un Tipo" InitialValue="0"
                                CssClass="alert-danger"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Nombre</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNomCan" placeholder="Ingrese nombre de la cancha" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNomCan"
                                runat="server"
                                ControlToValidate="txtNomCan"
                                ErrorMessage="Ingrese Nombre"
                                CssClass="alert-danger" Display="Dynamic"
                                Text="*Ingrese Nombre" ValidationGroup="A" />
                        </div>
                        <div class="form-group">
                            <label>Descripción</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtDesCan" placeholder="Ingrese una descripción" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:GridView ID="gvCanchas" runat="server" AutoGenerateColumns="True" BackColor="White" CssClass="table table-hover table-striped" ForeColor="Black" OnSelectedIndexChanged="gvCanchas_SelectedIndexChanged">
                                <Columns>
                                    <asp:CommandField HeaderText="Seleccionar" ItemStyle-CssClass="col-lg-3 text-center" ItemStyle-ForeColor="#3366CC" ShowSelectButton="True" />
                                </Columns>
                            </asp:GridView>
                        </div>

                        <div class="modal-footer">
                            <asp:Button ID="btnGuardarCan" runat="server" CssClass="btn btn-primary btn-edit" OnClick="btnGuardarCan_Click" Text="Guardar" ValidationGroup="A" Width="140px" />
                            <asp:Button ID="btnNuevoCan" runat="server" class="btn btn-default" OnClick="btnNuevoCan_Click" Text="Nuevo" Width="119px" />
                            <asp:Button ID="btnEliminarCan" runat="server" class="btn btn-warning" OnClick="btnEliminarCan_Click" Text="Eliminar" Width="116px" />
                        </div>
                    </div>

                </div>
            </div>
        </div>



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
                            <%--Botones para los Servicios--%>
                            <asp:Button ID="btnGuardarS" runat="server" CssClass="btn btn-primary btn-edit" OnClick="btnGuardarS_Click" Text="Guardar" ValidationGroup="A" Width="140px" />
                            <asp:Button ID="btnNuevoS" runat="server" class="btn btn-default" OnClick="btnNuevoS_Click" Text="Nuevo" Width="119px" />
                            <asp:Button ID="btnEliminarS" runat="server" class="btn btn-warning" OnClick="btnEliminarS_Click" Text="Eliminar" Width="116px" />
                        </div>
                        <div class="form-group">
                            <asp:GridView ID="gvServ" runat="server" AutoGenerateColumns="True" BackColor="White" CssClass="table table-hover table-striped" ForeColor="Black" OnSelectedIndexChanged="gvServ_SelectedIndexChanged">
                                <Columns>
                                    <asp:CommandField HeaderText="Seleccionar" ItemStyle-CssClass="col-lg-3 text-center" ItemStyle-ForeColor="#3366CC" ShowSelectButton="True" />
                                </Columns>
                            </asp:GridView>
                        </div>

                    </div>

                </div>
            </div>
        </div>


        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    </div>

</asp:Content>
