<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="Complejos.aspx.cs" Inherits="CapaPresentacion.Complejos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
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
            <asp:ListItem>Más cercano</asp:ListItem>
            <asp:ListItem Value="3">Alfabéticamente</asp:ListItem>
            <asp:ListItem Value="2">Más nuevo</asp:ListItem>
        </asp:DropDownList>
<%--        <asp:RequiredFieldValidator ID="rfvBarrio"
            runat="server" ControlToValidate="ddlBarrio"
            ErrorMessage="Seleccione un Barrio" InitialValue="0"
            CssClass="alert-danger"
            Display="Dynamic"></asp:RequiredFieldValidator>--%>
        <br />
&nbsp;  
    <asp:LinkButton ID="lbFutbol" runat="server" OnClick="lbFutbol_Click">Fútbol</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbBasket" runat="server" OnClick="lbBasket_Click">Basket</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbPaddle" runat="server">Paddle</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbTenis" runat="server">Tenis</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbRunning" runat="server">Running</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbCiclismo" runat="server">Ciclismo</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbCaminata" runat="server">Caminata</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbVolley" runat="server">Volley</asp:LinkButton>
&nbsp;<br />
    <br />
&nbsp;
    <asp:Button ID="btnD1" runat="server" CssClass="btn-warning" Text="Button" Visible="False" />
&nbsp;
    <asp:Button ID="btnD2" runat="server" CssClass="btn-warning" Text="Button" Visible="False" />
&nbsp;
    <asp:Button ID="btnD3" runat="server" CssClass="btn-warning" Text="Button" Visible="False" />
    <br />
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
     <%--    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
           <asp:LinkButton ID="btnServicios" runat="server" onclick="btnPopUp2_Click" Enabled="false" CssClass="btn btn-primary btn-edit">
               <i class='fa fa-check-square-o' aria-hidden='true'></i> Servicios
           </asp:LinkButton>
                   
      </ContentTemplate>
              </asp:UpdatePanel>--%>
    
    <asp:Button ID="btnInicial2" runat="server" Text="Button" style="display:none" />
      
            <ajaxToolkit:ModalPopupExtender ID="btnPopUp_ModalPopupExtender2" runat="server" 
                Enabled="True" TargetControlID="btnInicial2" 
               PopupControlID="PanelModal2">
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
 
       <asp:Panel ID="PanelModal2" runat="server" style="display:none; width:40%; height:auto" BackColor="White">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
    
                <div class="modal-header">
                     <asp:Button ID="btnClose2" runat="server" Text="X" CssClass="close"   
                       onclick="btnClose2_Click"/>
                    <h4 class="modal-title" id="myModalLabel2" runat="server"></h4>
                    <asp:Image ID="imgAvatar" runat="server" />
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:Label ID="lblValoracion" runat="server"></asp:Label>
                    </div>
                     <div class="form-group">
                        <asp:Label ID="lblDeportes" runat="server"></asp:Label>
                    </div>  
                    <div class="form-group">
                        <asp:Label ID="lblDescripcion" runat="server"></asp:Label>
                    </div>
                   <%-- <div class="form-group">
                        <asp:Label ID="lblServicios" text="Servicios: " runat="server"></asp:Label>
                        <asp:ListBox ID="listServicios" Enabled="false" runat="server"></asp:ListBox>
                    </div>--%>
                    
                    <div class="form-group">
                        <asp:Label ID="lblDireccion" runat="server"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblBarrio" runat="server"></asp:Label>
                    </div>    
                     <div class="form-group">
                        <asp:Label ID="lblZona" runat="server"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblTelefono" runat="server"></asp:Label>
                    </div>  
                    <div class="form-group">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img id="img1"  width="1000" height="1500" runat="server">
      </div>

      <div class="item">
        <img id="img2" width="1000" height="1500" runat="server">
      </div>
    
      <div class="item">
        <img id="img3" width="1000" height="1500" runat="server">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

                  <div class="modal-footer">
                              
                  </div>
                </div>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel> 
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</asp:Content>



