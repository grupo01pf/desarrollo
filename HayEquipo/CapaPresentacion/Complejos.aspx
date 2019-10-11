<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="Complejos.aspx.cs" Inherits="CapaPresentacion.Complejos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .colorLetra
        {
            color:#1e74cb
        }

  /* Make the image fully responsive */
  .carousel-inner img {
      width: 100%;
      height: 100%;
  }

  /* Make the image fully responsive */
  .tamañoCarousel {
      width: 1000px;
      height: 800px;
  }

      .scroll-container {
            display: block;
            height: 340px;
            overflow-y: scroll;
        }

         .alinearIzquiera {
            text-align: left;
        }

     .tamanoLetra {
            font-size: 20px;
        }


  </style>

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
    <asp:LinkButton ID="lbFutbol" runat="server" OnClick="lbFutbol_Click" ForeColor="#0099CC">Fútbol</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbBasket" runat="server" OnClick="lbBasket_Click" ForeColor="#0099CC">Basket</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbPaddle" runat="server" OnClick="lbPaddle_Click" ForeColor="#0099CC">Paddle</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbTenis" runat="server" ForeColor="#0099CC" OnClick="lbTenis_Click">Tenis</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbRunning" runat="server" ForeColor="#0099CC">Running</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbCiclismo" runat="server" ForeColor="#0099CC">Ciclismo</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbCaminata" runat="server" ForeColor="#0099CC">Caminata</asp:LinkButton>
&nbsp;
    <asp:LinkButton ID="lbVolley" runat="server" ForeColor="#0099CC">Volley</asp:LinkButton>
&nbsp;<br />
    <br />
&nbsp;
    <asp:Button ID="btnD1" runat="server" CssClass="btn-warning" Visible="False" OnClick="btnD1_Click"/>
&nbsp;
    <asp:Button ID="btnD2" runat="server" CssClass="btn-warning" Visible="False" OnClick="btnD2_Click"/>
&nbsp;
    <asp:Button ID="btnD3" runat="server" CssClass="btn-warning" Visible="False" OnClick="btnD3_Click"/>
    <br />
        <br />
<%--        <asp:GridView ID="gvComplejos" runat="server"     CssClass="table table-hover table-striped" OnSelectedIndexChanged="gvComplejos_SelectedIndexChanged" ForeColor="Black" BackColor="White" AutoGenerateColumns="False">
            <Columns>
                <asp:CommandField HeaderText="Seleccionar" ItemStyle-CssClass="col-lg-3 text-center" ShowSelectButton="True" ItemStyle-ForeColor="#3366CC" >
<ItemStyle CssClass="col-lg-3 text-center" ForeColor="#3366CC"></ItemStyle>
                </asp:CommandField>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                <asp:BoundField DataField="Deportes" HeaderText="Deportes" />
                <asp:BoundField DataField="Valoracion" HeaderText="Valoración" />
            </Columns>
        </asp:GridView>--%>
             <div class="well">
            
              <div class="w3-panel w3-black">
                    <h1 class="w3-opacity">
                     <b>Encuentros Vigentes</b></h1>
                    </div>

  <div class="scroll-container">
     <asp:Repeater ID="encuentrosRepeater" runat="server">
           <ItemTemplate>
               <div class="w3-container alinearIzquiera">
  <div class="w3-card-4">
    <%--<h2>Encuentro <asp:Label ID="tipoencuentro" runat="server" text='<%#Eval("tipoEncuentro") %>'></asp:Label></h2>--%>
      <header class="w3-container w3-green">
          <img class="w3-left w3-circle w3-margin-right" style="width:55px" src="Imagenes/nene.png"" alt="Avatar"/>
      <h1><asp:Label runat="server" text='<%#Eval("Nombre") %>'></asp:Label></h1>
    </header>
      <div class="w3-container">
      <p class="tamanoLetra">
          <br />
          <div class="row">
              <div class="col-sm-3">
                  <span class="glyphicon glyphicon-calendar tamanoLetra"></span>
                  <asp:Label runat="server" text='<%#Eval("Direccion") %>'></asp:Label>
                  <br />
              </div>
              <div class="col-sm-3">
                  <span class="glyphicon glyphicon-map-marker"></span>
                  <asp:Label runat="server" text='<%#Eval("Deportes") %>'></asp:Label><asp:Label runat="server" text='<%#Eval("Valoracion") %>'> </asp:Label><asp:Label ID="Label1" runat="server" Text=" &#183 "></asp:Label>           
                  <%--<asp:Label runat="server" text='<%#Eval("direccion") %>'></asp:Label><asp:Label runat="server" text='<%#Eval("calleComplejo") %> '></asp:Label> <asp:Label runat="server" text=' <%#Eval("numeroCalleComplejo") %>'></asp:Label> --%> 
                  <br />               
              </div>
              <div class="col-sm-3">
                  <span class="glyphicon glyphicon-eye-open"></span>
                  <%--<asp:Label runat="server" text='<%#Eval("accesibilidad") %>'></asp:Label>--%>
                  <br />
              </div>
              <div class="col-sm-3">
                  <i class="fa fa-male"></i>
                  <i class="fa fa-male"></i>
                  <i class="fa fa-male"></i>
                  <asp:Label runat="server" text="Acá se dice se tiene cupo o no"></asp:Label>
              </div>
          </div>
                 
      <%--</p>--%>
          <%--<hr />--%>
      
        <%--<p>--%>
          
          <%--<asp:Label runat="server" text='<%#Eval("fechaInicioEncuentro") %>'></asp:Label><br />--%>
          
      </p>
      <br />  
    </div>
   
         
      <%--<asp:LinkButton runat="server" CommandName="evaluartipo" CommandArgument='<%#Eval("tipoEncuentro") %>' Visible="false"></asp:LinkButton>--%>
      <asp:LinkButton runat="server" CommandName="btnUnirseEncuentro" CommandArgument='<%#Eval("ID") %>' text="Explorar Complejo" Class="w3-button w3-block w3-black" ></asp:LinkButton>
      </div>   
           </div><br />
            </ItemTemplate>
     </asp:Repeater>    

 </div>
    </div>
        <br />
        <br />
    
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
 
       <asp:Panel ID="PanelModal2" runat="server" style="display:none; width:80%; height:80%" BackColor="White" ScrollBars="Vertical">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
    
                <div class="modal-header">
                     <asp:Button ID="btnClose2" runat="server" Text="X" CssClass="close"   
                       onclick="btnClose2_Click"/>
                    <h4 class="modal-title colorLetra" id="myModalLabel2" runat="server"></h4>
                    <asp:Image ID="imgAvatar" ImageUrl="~/Imagenes/complejo_logo_default.png" runat="server" CssClass="img-circle" height="100" width="100" />
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:Label ID="lblValoracion" runat="server"></asp:Label>
                    </div>
                     <div class="form-group">
                        <asp:Label ID="lblDeportes" runat="server" ForeColor="#FF9900"></asp:Label>
                    </div>  
                    <div class="form-group">
                        <asp:Label ID="lblDescripcion" runat="server"></asp:Label>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblServicios" text="Servicios: " runat="server"></asp:Label>
                    </div> 
                    <div class="form-group" id="divListServ" runat="server">
                        <asp:ListBox ID="listServicios" Enabled="false" runat="server"></asp:ListBox>
                    </div>                 
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
                        <asp:Label ID="lblHorarios" runat="server"></asp:Label>
                    </div>
                    <div class="form-group">

<div class="tamañoCarousel">  
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
        <img id="img1"  runat="server" height="50" width="50">
      </div>

      <div class="item">
        <img id="img2" runat="server" height="50" width="50">
      </div>
    
      <div class="item">
        <img id="img3"  runat="server" height="50" width="50">
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
</div>

                  <div class="modal-footer">
                              
                  </div>
                </div>
                    </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel> 

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</asp:Content>



