<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEstablecimiento.Master" AutoEventWireup="true" CodeBehind="ABMComplejosEstablecimiento.aspx.cs" Inherits="CapaPresentacion.ABMComplejosEstablecimiento" %>

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

         .ModalPopupBG
            {
                background-color: #000000;
                filter: alpha(opacity=50);
                opacity: 0.4;
            }

         .ModalTamaño
            {
                min-width: 200px;
                min-height: 150px;
                background: white;
                box-shadow: 0px 0px 10px #2b2b2b;
            }

                 .titulo2 {
            text-align: center;
            color: #ffffff;
            font-size:xxx-large;
        }

    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <%--<h1 class="titulo">Complejo Deportivo</h1>--%>

            <asp:Panel ID="Panel1"  runat="server" Visible="False">
                <div class="container text-center">
                    <div class="row alinearAlCentro">
                        <h1 class="titulo2">Todavía no registraste tu complejo</h1>
                        <br />
                        <asp:Button ID="btnRegComplejo" runat="server" Text="Registralo ahora!" BackColor="Black" BorderColor="Black" ForeColor="White" CssClass="w3-xxlarge" OnClick="btnRegComplejo_Click"/>            
                        <br />
                        <h1 class="titulo2"></h1>
                        <br />
                        <h1 class="titulo2"></h1>
                    </div>
                </div>
            </asp:Panel>
    <asp:Panel ID="Panel2"  runat="server" Visible="True">
        <h1 class="titulo">Complejo Deportivo</h1>
        <br />
    <%--<div class="jumbotron text-center" style="background-color: black">--%>
    <div class="container text-center">
        <div class="row alinearAlCentro">
            <div class="col-sm-6">
                <div class="well">
                    <legend>Registro de Complejo</legend>
                     <%--Aquí inicia el Formulario de Registro de Complejos--%>
                    <div class="form-group">
                        <asp:Label ID="lblNomRes" CssClass="alinearIzquiera" runat="server" Text="Nombre del Responsable" ForeColor="black"></asp:Label>
                        <asp:TextBox ID="txtNomRes" placeholder="Ingrese nombre del responsable" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfNomRes"
                            runat="server"
                            ControlToValidate="txtNomRes"
                            ErrorMessage="Ingrese Nombre del responsable"
                            CssClass="alert-danger" Display="Dynamic"
                            Text="*Ingrese nombre del responsable" ValidationGroup="A" />

                        <asp:Label ID="lblApeRes" CssClass="alinearIzquiera" runat="server" Text="Apellido del Responsable" ForeColor="black"></asp:Label>
                        <asp:TextBox ID="txtApeRes" placeholder="Ingrese apellido del responsable" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfAperes"
                            runat="server"
                            ControlToValidate="txtApeRes"
                            ErrorMessage="Ingrese apellido del responsable"
                            CssClass="alert-danger" Display="Dynamic"
                            Text="*Ingrese apellido del responsable" ValidationGroup="A" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblNombre" CssClass="alinearIzquiera" runat="server" Text="Nombre del Complejo" ForeColor="black"></asp:Label>
                        <asp:TextBox ID="txtNomb" placeholder="Ingrese nombre del complejo" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rvfNomb"
                            runat="server"
                            ControlToValidate="txtNomb"
                            ErrorMessage="Ingrese nombre del complejo"
                            CssClass="alert-danger" Display="Dynamic"
                            Text="*Ingrese nombre del complejo" ValidationGroup="A" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDesc" CssClass="alinearIzquiera" runat="server" Text="Descripcion" ForeColor="black"></asp:Label>
                        <asp:TextBox ID="txtDesc" placeholder="Ingrese una descripción" CssClass="form-control" runat="server" height="100px" Wrap="true" TextMode="MultiLine"></asp:TextBox>     
                        <asp:RequiredFieldValidator ID="rvfDesc"
                            runat="server"
                            ControlToValidate="txtDesc"
                            ErrorMessage="Ingrese Descripción"
                            CssClass="alert-danger" Display="Dynamic"
                            Text="*Ingrese Descripción" ValidationGroup="A" />
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
                        <%--<asp:RequiredFieldValidator ID="rfvBarrio"
                            runat="server" ControlToValidate="ddlBarrio"
                            ErrorMessage="Seleccione un Barrio" InitialValue="0"
                            CssClass="alert-danger"
                            Display="Dynamic"></asp:RequiredFieldValidator>--%>
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
                    <div class="form-group"> 
                            <asp:Label ID="lblHorarios" CssClass="alinearIzquiera" runat="server" Text="Horarios" ForeColor="black"></asp:Label>       
                    </div>
                    <div class="form-group"> 
                            <asp:Label ID="lblHoraApe" runat="server" Text="Apertura "></asp:Label>
                            <asp:TextBox ID="txtHoraApe" runat="server" Columns="5" MaxLength="5" TextMode="Time"></asp:TextBox>
                     
                            <asp:Label ID="lblHoraCie" runat="server" Text="Cierre "></asp:Label>
                            <asp:TextBox ID="txtHoraCie" runat="server" Columns="5" MaxLength="5" TextMode="Time"></asp:TextBox>              
                    </div>
                    <div class="form-group">
                                 <asp:Image ID="imgAvatar" ImageUrl="~/Imagenes/complejo_logo_default.png" runat="server" CssClass="img-circle" height="100" width="100" />
                                 <br />
                                 <br />
                                 <div class="form-group">
                                 <asp:FileUpload ID="FileUploadAvatar" CssClass="form-control" runat="server" /> 
                                 </div>
                                 <asp:Label ID="lblestado" runat="server"></asp:Label> 
                    </div>          
           <div class="form-group">
             <asp:Button ID="btn_guardarImagen" runat="server" Text="Guardar avatar" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btnGuardarImagen_Click" Visible="False"/>
              <asp:Button ID="btn_CambiarImagen" runat="server" Text="Cambiar avatar" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btnCambiarImagen_Click" Visible="false"/>            
                </div>
                    <div class="form-group">
                        <asp:Label ID="lblFecha" CssClass="alinearIzquiera" runat="server" ForeColor="black" Visible="False" Text="Fecha de registro:  "></asp:Label>
                        <asp:Label ID="lblFecResultado" CssClass="alinearIzquiera" runat="server" ForeColor="#FF9900" Visible="False"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblDeportes" CssClass="alinearIzquiera" runat="server" Text="Deportes:  " ForeColor="black" Visible="False"></asp:Label>
                        <asp:Label ID="lblDepResultado" CssClass="alinearIzquiera" runat="server" ForeColor="#FF9900" Visible="False"></asp:Label>         
                    </div>
                        <div class="alinearAlCentro modal-footer">
                        <%--Botones para ABM complejo--%>
                        <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-primary" OnClick="btnGuardar_Click" Text="Guardar" ValidationGroup="A" />
                        <asp:Button ID="btnNuevo" runat="server" class="btn btn-default" OnClick="btnNuevo_Click" Text="Nuevo" />
                        <asp:Button ID="btnEliminar" runat="server" class="btn btn-warning" OnClick="btnEliminar_Click" Text="Eliminar" />
                    </div>
                </div>
        
            </div>
            <%--ACA--%>
            <div class="col-sm-6">
                            <div class="well">
                    <legend>Imágenes del Complejo</legend>
                    <div class="form-group">                         
                                    <div class="form-group">
                                    <asp:FileUpload ID="fUploadImagen" runat="server" CssClass="form-control" />
                                    </div>
                                    <asp:Label ID="lblEstadoImg" runat="server"></asp:Label> 
                                    <br />
                                    <br />
                                    <asp:Button ID="btnSubir" runat="server" Text="Agregar imágen" CssClass="btn btn-primary btn-edit" OnClick="btnSubir_Click" />                                 
                            <div class="row">
                                 <br />
                                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand1">
                                    <ItemTemplate>
                                        <div class="col-md-4">
                                            <img class="img-responsive" src="data:image/jpg;base64, <%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem, "imagen")) %>" />
                                            <br />
                                            <asp:LinkButton runat="server" CommandName="btnEliminarImagen" CommandArgument='<%#Eval("id") %>' text="Eliminar imágen" Class="w3-button w3-block w3-black" ></asp:LinkButton>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                   </div>
                </div>
                <div class="well">
                    <%--Botones--%>
                    <div class="alinearAlCentro">                       
                        <asp:LinkButton ID="btnCanchas" runat="server" onclick="btnPopUp_Click" Enabled="false" CssClass="btn btn-primary btn-edit">
                        <i class='fa fa-check-square-o' aria-hidden='true'></i> Canchas
                        </asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="btnServicios" runat="server" onclick="btnPopUp2_Click" Enabled="false" CssClass="btn btn-primary btn-edit">
                        <i class='fa fa-check-square-o' aria-hidden='true'></i> Servicios
                        </asp:LinkButton>            
                        &nbsp;&nbsp;&nbsp;&nbsp;                                                
                    </div>
                </div>
            </div>
        </div>

    
    <asp:Button ID="btnInicial" runat="server" Text="Button" style="display:none" />
      
            <ajaxToolkit:ModalPopupExtender ID="btnPopUp_ModalPopupExtender" runat="server" 
                Enabled="True" TargetControlID="btnInicial" 
               PopupControlID="PanelModal" BackgroundCssClass="ModalPopupBG">
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

               <asp:Panel ID="PanelModal" runat="server" style="display:none">
                   <div class="ModalTamaño">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

     
    
                <div class="modal-header">
                     <asp:Button ID="btnClose" runat="server" Text="X" CssClass="close"   
                       onclick="btnClose_Click"/>
                    <h4 class="modal-title" id="myModalLabel">Canchas</h4>
                </div>
      <div class="modal-body">
                        <div class="form-group">
                            <label>Deporte</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlDep4" CssClass="form-control" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDep4_SelectedIndexChanged">
                                <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                            </asp:DropDownList>
                           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                                runat="server" ControlToValidate="ddlDep4"
                                ErrorMessage="Seleccione un Deporte" InitialValue="0"
                                CssClass="alert-danger"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        </div>
                        <div class="form-group">
                            <label>Tipo de Cancha</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlTipoCancha" CssClass="form-control" runat="server" AppendDataBoundItems="true">
                                <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                                runat="server" ControlToValidate="ddlTipoCancha"
                                ErrorMessage="Seleccione un Tipo" InitialValue="0"
                                CssClass="alert-danger"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        </div>
                        <div class="form-group">
                            <label>Nombre</label>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtNomCan" placeholder="Ingrese nombre de la cancha" CssClass="form-control" runat="server"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                                runat="server"
                                ControlToValidate="txtNomCan"
                                ErrorMessage="Ingrese Nombre"
                                CssClass="alert-danger" Display="Dynamic"
                                Text="*Ingrese Nombre" ValidationGroup="A" />--%>
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
                            <div class="alinearAlCentro">  
                                <asp:Button ID="btnGuardarCan" runat="server" CssClass="btn btn-primary btn-edit" OnClick="btnGuardarCan_Click" Text="Guardar" ValidationGroup="A" Width="140px" />
                                <asp:Button ID="btnNuevoCan" runat="server" class="btn btn-default" OnClick="btnNuevoCan_Click" Text="Nuevo" Width="119px" />
                                <asp:Button ID="btnEliminarCan" runat="server" class="btn btn-warning" OnClick="btnEliminarCan_Click" Text="Eliminar" Width="116px" />
                            </div>
                        </div>
                    </div>
   </ContentTemplate>
                    </asp:UpdatePanel>
                       </div>
                </asp:Panel>
  
    <asp:Button ID="btnInicial2" runat="server" Text="Button" style="display:none" />
      
            <ajaxToolkit:ModalPopupExtender ID="btnPopUp_ModalPopupExtender2" runat="server" 
                Enabled="True" TargetControlID="btnInicial2" 
               PopupControlID="PanelModal2" BackgroundCssClass="ModalPopupBG">
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
 
       <asp:Panel ID="PanelModal2" runat="server" style="display:none">
           <div class="ModalTamaño">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
    
                <div class="modal-header">
                     <asp:Button ID="btnClose2" runat="server" Text="X" CssClass="close"   
                       onclick="btnClose2_Click"/>
                    <h4 class="modal-title" id="myModalLabel2">Servicios</h4>
                </div>
                     <div class="modal-body">
                        <div class="form-group">
                            <label>Servicios</label>
                        </div>
                        <div class="form-group">
                            <asp:DropDownList ID="ddlServ" CssClass="form-control" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlServ_SelectedIndexChanged">
                                <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                            </asp:DropDownList>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                                runat="server" ControlToValidate="ddlServ"
                                ErrorMessage="Seleccione un Servicio" InitialValue="0"
                                CssClass="alert-danger"
                                Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        </div>
                        <div class="form-group">
                            <%--Botones para los Servicios--%>
                            <asp:Button ID="btnGuardarS" runat="server" CssClass="btn btn-primary btn-edit" OnClick="btnGuardarS_Click" Text="Agregar >>" ValidationGroup="A" Width="140px" />
                        </div>
                        <div class="form-group">
                             <asp:GridView ID="gvServ" runat="server" AutoGenerateColumns="false" BackColor="White" CssClass="table table-hover table-striped" ForeColor="Black" OnSelectedIndexChanged="gvServ_SelectedIndexChanged">
                                <Columns>
                                <asp:CommandField HeaderText="Eliminar" ItemStyle-CssClass="col-lg-3 text-center" ItemStyle-ForeColor="#3366CC" ShowSelectButton="True" SelectText="Eliminar" />
                                <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                                </Columns>
                             </asp:GridView>
                        </div>
                    </div>
                    </ContentTemplate>
                    </asp:UpdatePanel>
               </div>
                </asp:Panel> 

            <asp:Button ID="btnInicial3" runat="server" Text="Button" style="display:none" />
      
            <ajaxToolkit:ModalPopupExtender ID="btnPopUp_ModalPopupExtender3" runat="server" 
                Enabled="True" TargetControlID="btnInicial3" 
               PopupControlID="PanelModal3" BackgroundCssClass="ModalPopupBG">
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
 
       <asp:Panel ID="PanelModal3" runat="server" style="display:none">
           <div class="ModalTamaño">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
    
                <div class="modal-header">
                     <asp:Button ID="btnClose3" runat="server" Text="X" CssClass="close"   
                       onclick="btnClose3_Click"/>
                    <h4 class="modal-title" id="myModalLabel3">Imágenes</h4>
                </div>
                     <div class="modal-body">
 
                    </div>
                    </ContentTemplate>
                    </asp:UpdatePanel>
               </div>
                </asp:Panel> 


        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    </div>
</asp:Panel>
</asp:Content>
