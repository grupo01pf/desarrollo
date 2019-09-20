<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEstablecimiento.Master" AutoEventWireup="true" CodeBehind="ABMComplejos.aspx.cs" Inherits="CapaPresentacion.ComplejosWF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
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
            Text="*Ingrese Nombre" ValidationGroup="A" />
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
            Text="*Ingrese Descripción" ValidationGroup="A" />
        <br />
&nbsp;
        <asp:Label ID="lblDep1" runat="server" Text="Deporte 1" ForeColor="White"></asp:Label>
&nbsp;
        <asp:DropDownList ID="ddlDep1" CssClass="form-control" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDep1_SelectedIndexChanged">
        <asp:ListItem Value="0">Seleccione..</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvDep1"
            runat="server" ControlToValidate="ddlDep1"
            ErrorMessage="Seleccione un Deporte" InitialValue="0"
            CssClass="alert-danger"
            Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
&nbsp;
            <asp:Label ID="lblDep2" runat="server" Text="Deporte 2" ForeColor="White"></asp:Label>
&nbsp;
        <asp:DropDownList ID="ddlDep2" CssClass="form-control" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDep2_SelectedIndexChanged">
        <asp:ListItem Value="0">Seleccione..</asp:ListItem>
        </asp:DropDownList>
        <br />
&nbsp;
            <asp:Label ID="lblDep3" runat="server" Text="Deporte 3" ForeColor="White"></asp:Label>
&nbsp;
        <asp:DropDownList ID="ddlDep3" CssClass="form-control" runat="server" AppendDataBoundItems="true">
        <asp:ListItem Value="0">Seleccione..</asp:ListItem>
        </asp:DropDownList>
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
            Text="*Ingrese Calle" ValidationGroup="A" />
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
            Text="*Ingrese Número" ValidationGroup="A" />
        <asp:RegularExpressionValidator ID="rvNro"
             runat="server" ErrorMessage="Ingrese un Numero válido"
             ControlToValidate="txtNro" ValidationExpression="^[0-9]*"
             CssClass="alert-danger"
             Display="Dynamic"></asp:RegularExpressionValidator>
        <br />
&nbsp;
        <asp:Label ID="lblBarrio" runat="server" Text="Barrio" ForeColor="White"></asp:Label>
&nbsp;
        <asp:DropDownList ID="ddlBarrio" CssClass="form-control" runat="server" AppendDataBoundItems="true" Height="35px" Width="1374px">
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
            Text="*Ingrese Número" ValidationGroup="A" />
         <asp:RegularExpressionValidator ID="rvTel"
             runat="server" ErrorMessage="Ingrese un Numero válido"
             ControlToValidate="txtTel" ValidationExpression="^[0-9]*"
             CssClass="alert-danger"
             Display="Dynamic"></asp:RegularExpressionValidator>
        <br />

              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
           <asp:LinkButton ID="btnUsuarioo" runat="server" onclick="btnPopUp_Click" CssClass="btn btn-primary btn-edit">
               <i class='fa fa-check-square-o' aria-hidden='true'></i> Registrarme
           </asp:LinkButton>
                   
      </ContentTemplate>
              </asp:UpdatePanel>
    
    <asp:Button ID="btnInicial" runat="server" Text="Button" style="display:none" />
      
            <ajaxToolkit:ModalPopupExtender ID="btnPopUp_ModalPopupExtender" runat="server" 
                Enabled="True" TargetControlID="btnInicial" 
               PopupControlID="PanelModal">
                <Animations>
            <OnShowing>
                <FadeIn Duration=".5" Fps="30" />
            </OnShowing>
            <OnShown>
                <FadeIn Duration=".3" Fps="30" />
            </OnShown>
            <OnHiding>
                <FadeOut Duration=".5" Fps="30" />
            </OnHiding>
            <OnHidden>
                <FadeOut Duration=".5" Fps="30" />
            </OnHidden>

            </Animations>
          
            </ajaxToolkit:ModalPopupExtender>
 
       <asp:Panel ID="PanelModal" runat="server" style="display:none; background:white; width:40%; height:auto">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
     
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

<%--                     <div class="form-group">
                        <label>Repetir Contraseña</label>
                    </div>
                    <div class="form-group">
                  <asp:TextBox ID="txtRPassword" runat="server" placeholder="" TextMode="Password" Columns="20" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                       <asp:CheckBox runat="server" ID="checkPrivacidad"/><a data-dismiss="imodal" data-toggle="modal" href="#imodal2" > Acepto Terminos y condiciones</a>
                    </div>

               <div class="form-group">
                <label>Deportista o Establecimiento ? </label>
                   <asp:RadioButtonList ID="radioLogin" runat="server" CssClass="alinearIzq centrar">
                       <asp:ListItem Text ="Deportista" Value="2" Selected="True"/>
                       <asp:ListItem Text ="Establecimiento" Value="3" />
                   </asp:RadioButtonList>
               </div>--%>
                
                  <div class="modal-footer">
                              <asp:Button ID="btnGuardarCan" runat="server" CssClass="btn btn-primary btn-edit" OnClick="btnGuardarCan_Click" Text="Guardar" ValidationGroup="A" Width="140px" />
                              <asp:Button ID="btnNuevoCan" runat="server" class="btn btn-default" OnClick="btnNuevoCan_Click" Text="Nuevo" Width="119px" />
                              <asp:Button ID="btnEliminarCan" runat="server" class="btn btn-warning" OnClick="btnEliminarCan_Click" Text="Eliminar" Width="116px" />

<%--                   <asp:Button ID="btnRegistrar" runat="server" Text="Registrarme" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btn_Registrar_Click" />--%>
                  </div>
                </div>
</ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>   

    
     <button type="button" value="btnServ" title="Administrar Servicios" class="btn btn-primary btn-edit" data-target="#smodal" data-toggle="modal" id="btnServ"><i class="fa fa-check-square-o" aria-hidden="true"></i>Servicios</button>&nbsp;
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
                        <asp:GridView ID="gvServ" runat="server" AutoGenerateColumns="True" BackColor="White" CssClass="table table-hover table-striped" ForeColor="Black" OnSelectedIndexChanged="gvServ_SelectedIndexChanged">
                        <Columns>
                        <asp:CommandField HeaderText="Seleccionar" ItemStyle-CssClass="col-lg-3 text-center" ItemStyle-ForeColor="#3366CC" ShowSelectButton="True" />
                        </Columns>
                </asp:GridView>
                    </div>
                                      <div class="modal-footer">
                              <asp:Button ID="btnGuardarS" runat="server" CssClass="btn btn-primary btn-edit" OnClick="btnGuardarS_Click" Text="Guardar" ValidationGroup="A" Width="140px" />
                              <asp:Button ID="btnNuevoS" runat="server" class="btn btn-default" OnClick="btnNuevoS_Click" Text="Nuevo" Width="119px" />
                              <asp:Button ID="btnEliminarS" runat="server" class="btn btn-warning" OnClick="btnEliminarS_Click" Text="Eliminar" Width="116px" />


<%--                   <asp:Button ID="btnRegistrar" runat="server" Text="Registrarme" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btn_Registrar_Click" />--%>
                  </div>
                </div>

            </div>
     </div>
          </div>

<%--        &nbsp;&nbsp;&nbsp;<asp:Button ID="btnCan" runat="server" CssClass="btn btn-primary" OnClick="btnCan_Click" Text="Canchas &gt; &gt;" ValidationGroup="A" Width="178px" BackColor="#339933" />--%>
<%--        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnServ" runat="server" CssClass="btn btn-primary" OnClick="btnServ_Click" Text="Servicios &gt; &gt;" ValidationGroup="A" Width="178px" BackColor="#339933" />--%>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary" OnClick="btnGuardar_Click" Text="Guardar" ValidationGroup="A" Width="140px" />
        <asp:Button ID="btnNuevo" runat="server" class="btn btn-default" OnClick="btnNuevo_Click" Text="Nuevo" Width="119px" />
        <asp:Button ID="btnEliminar" runat="server" class="btn btn-warning" OnClick="btnEliminar_Click" Text="Eliminar" Width="116px" />
        <br />
&nbsp;  <br />
<%--        <asp:Panel ID="pnlCan" runat="server" Visible="False" BorderColor="#339933">--%>
<%--                <asp:Label ID="LblDeporte" runat="server" Text="Deporte" ForeColor="White"></asp:Label>--%>
&nbsp;
<%--        <asp:DropDownList ID="ddlDep4" CssClass="form-control" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDep4_SelectedIndexChanged">
        <asp:ListItem Value="0">Seleccione..</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvDep4"
            runat="server" ControlToValidate="ddlDep4"
            ErrorMessage="Seleccione un Deporte" InitialValue="0"
            CssClass="alert-danger"
            Display="Dynamic"></asp:RequiredFieldValidator>
        <br />--%>
&nbsp;
<%--        <asp:Label ID="lblTipoCancha" runat="server" Text="Tipo" ForeColor="White"></asp:Label>
&nbsp;
        <asp:DropDownList ID="ddlTipoCancha" CssClass="form-control" runat="server" AppendDataBoundItems="true">
        <asp:ListItem Value="0">Seleccione..</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvTipoCancha"
            runat="server" ControlToValidate="ddlTipoCancha"
            ErrorMessage="Seleccione un Tipo" InitialValue="0"
            CssClass="alert-danger"
            Display="Dynamic"></asp:RequiredFieldValidator>
        <br />--%>
&nbsp;
<%--        <asp:Label ID="lblNomCan" runat="server" Text="Nombre" ForeColor="White"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtNomCan" placeholder="Ingrese nombre de la cancha" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvNomCan"
            runat="server"
            ControlToValidate="txtNomCan"
            ErrorMessage="Ingrese Nombre"
            CssClass="alert-danger" Display="Dynamic"
            Text="*Ingrese Nombre" ValidationGroup="A" />
        <br />--%>
&nbsp;
<%--        <asp:Label ID="lblDesCan" runat="server" Text="Descripcion" ForeColor="White"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtDesCan" placeholder="Ingrese una descripción" CssClass="form-control" runat="server" Height="85px" Width="618px"></asp:TextBox>--%>
        <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%--        <asp:Button ID="btnGuardarCan" runat="server" CssClass="btn btn-primary" OnClick="btnGuardarCan_Click" Text="Guardar" ValidationGroup="A" Width="140px" />
        <asp:Button ID="btnNuevoCan" runat="server" class="btn btn-default" OnClick="btnNuevoCan_Click" Text="Nuevo" Width="119px" />
        <asp:Button ID="btnEliminarCan" runat="server" class="btn btn-warning" OnClick="btnEliminarCan_Click" Text="Eliminar" Width="116px" />--%>
        <br />
        <br />
<%--                <asp:GridView ID="gvCanchas" runat="server" AutoGenerateColumns="True" BackColor="White" CssClass="table table-hover table-striped" ForeColor="Black" OnSelectedIndexChanged="gvCanchas_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField HeaderText="Seleccionar" ItemStyle-CssClass="col-lg-3 text-center" ItemStyle-ForeColor="#3366CC" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>--%>
<%--    </asp:Panel>--%>
    <br />
        <asp:GridView ID="gvComplejos" runat="server"     CssClass="table table-hover table-striped" AutoGenerateColumns="False" OnSelectedIndexChanged="gvComplejos_SelectedIndexChanged" ForeColor="Black" BackColor="White">
            <Columns>
                <asp:CommandField HeaderText="Seleccionar" ItemStyle-CssClass="col-lg-3 text-center" ShowSelectButton="True" ItemStyle-ForeColor="#3366CC" >
<ItemStyle CssClass="col-lg-3 text-center" ForeColor="#3366CC"></ItemStyle>
                </asp:CommandField>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Deportes" HeaderText="Deportes" />
                <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                <asp:BoundField DataField="Responsable" HeaderText="Responsable" />
            </Columns>
        </asp:GridView>
        <br />
        <br />

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<</asp:Content>