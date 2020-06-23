<%@ Page Title="" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.Master" CodeBehind="Complejos.aspx.cs" Inherits="CapaPresentacion.Complejos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .colorLetra
        {
            color:#1e74cb;
            font-size: 50px;
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
            /*height: 600px;*/
            overflow-y: auto;
        }

         .alinearIzquiera {
            text-align: left;
        }

            .alinearDerecha {
            text-align: right;
        }

           .alinearAlCentro {
            text-align: center;
        }

     .tamanoLetra {
            font-size: 20px;
        }
  
         .ModalPopupBG
            {
                background-color: #000000;
                filter: alpha(opacity=50);
                opacity: 0.4;
            }

  </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

       <div class="container text-center"">
        <%--<div class="row alinearAlCentro">--%>
            <div class="col-sm-12">  
                  <h1>
                        <asp:Label ID="lblTitulo" runat="server" Text="Explorá nuestros Complejos Deportivos asociados" ForeColor="White"></asp:Label>
                  </h1>             
                <br />
                <br />
            </div>

            <asp:Panel ID="pnl_PanelBuscar" runat="server" DefaultButton="btnBuscar">
            <div class="col-sm-4">
        <asp:TextBox ID="txtBuscar" placeholder="Buscar Complejo" CssClass="form-control" runat="server" ></asp:TextBox>
      <%--  <asp:RequiredFieldValidator ID="rvfBuscar"
            runat="server"
            ControlToValidate="txtBuscar"
            ErrorMessage="Ingrese Nombre"
            CssClass="alert-danger" Display="Dynamic"
            Text="*Ingrese Nombre" ValidationGroup="A" />--%>
            </div>

            <div class="alinearIzquiera">
            <div class="col-sm-2">
        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" OnClick="btnBuscar_Click" Text="Buscar" Width="140px" />
            </div>
            </div>
            </asp:Panel>

            <div class="alinearDerecha">
            <div class="col-sm-2">
        <asp:Label ID="lblOrdenar" runat="server" Text="Ordenar por:" ForeColor="White"></asp:Label>
            </div>
            </div>

        <div class="col-sm-4">
        <asp:DropDownList ID="ddlOrdenar" CssClass="form-control" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlOrdenar_SelectedIndexChanged">
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
                </div>

            <div class="col-sm-2">
                <div class="well">
  
    <asp:LinkButton ID="lbFutbol" runat="server" OnClick="lbFutbol_Click" ForeColor="#0099CC" >Fútbol</asp:LinkButton>
                    <br />

    <asp:LinkButton ID="lbBasket" runat="server" OnClick="lbBasket_Click" ForeColor="#0099CC" >Basket</asp:LinkButton>
                    <br />

    <asp:LinkButton ID="lbPaddle" runat="server" OnClick="lbPaddle_Click" ForeColor="#0099CC" >Paddle</asp:LinkButton>
                    <br />

    <asp:LinkButton ID="lbTenis" runat="server" OnClick="lbTenis_Click" ForeColor="#0099CC" >Tenis</asp:LinkButton>
                    <br />

    <asp:LinkButton ID="lbRunning" runat="server" OnClick="lbRunning_Click" ForeColor="#0099CC" >Running</asp:LinkButton>
                    <br />

    <asp:LinkButton ID="lbCiclismo" runat="server" OnClick="lbCiclismo_Click" ForeColor="#0099CC" >Ciclismo</asp:LinkButton>
                    <br />

    <asp:LinkButton ID="lbGolf" runat="server" OnClick="lbGolf_Click" ForeColor="#0099CC" >Golf</asp:LinkButton>
                    <br />

    <asp:LinkButton ID="lbVolley" runat="server" OnClick="lbVolley_Click" ForeColor="#0099CC" >Volley</asp:LinkButton>
                    <br />

    <asp:LinkButton ID="lbPingPong" runat="server" OnClick="lbPingPong_Click" ForeColor="#0099CC" >Ping Pong</asp:LinkButton>
                    <br />

    <asp:LinkButton ID="lbBoxeo" runat="server" OnClick="lbBoxeo_Click" ForeColor="#0099CC" >Boxeo</asp:LinkButton>
                    <br />

    <asp:LinkButton ID="lbKarate" runat="server" OnClick="lbKarate_Click" ForeColor="#0099CC" >Karate</asp:LinkButton>
                    <br />
                    <br />

    <asp:Button ID="btnD1" runat="server" CssClass="btn-warning" Visible="False" OnClick="btnD1_Click"/>
                    <br />
                    <br />

    <asp:Button ID="btnD2" runat="server" CssClass="btn-warning" Visible="False" OnClick="btnD2_Click"/>
                    <br />
                    <br />

    <asp:Button ID="btnD3" runat="server" CssClass="btn-warning" Visible="False" OnClick="btnD3_Click"/>
                    <br />
                    <br />

    <asp:Button ID="btnD4" runat="server" CssClass="btn-warning" Visible="False" OnClick="btnD4_Click"/>
                    <br />
                    <br />
    <asp:LinkButton ID="lbQuitarFiltros" runat="server" Visible="False" OnClick="lbQuitarFiltros_Click" ForeColor="Silver">Quitar filtros</asp:LinkButton>
  

<br />

</div>
                </div>
 
      <div class="col-sm-10">
             <div class="well">
            
              <div class="w3-panel w3-black">
                    <h1 class="w3-opacity">
                     <b>Complejos Deportivos</b></h1>
                    </div>

  <div class="scroll-container">
     <asp:Repeater ID="encuentrosRepeater" runat="server" onitemdatabound="encuentrosRepeater_ItemDataBound" >
           <ItemTemplate>
               <div class="w3-container alinearIzquiera">
  <div class="w3-card-4">
      <header class="w3-container w3-indigo">
          <img class="w3-left w3-circle w3-margin-right" style="width:55px" src="data:image/jpg;base64, <%# Convert.ToBase64String((byte[])DataBinder.Eval(Container.DataItem, "Avatar")) %>" />
      <h1><asp:Label runat="server" text='<%#Eval("Nombre") %>'></asp:Label></h1>
    </header>
      <div class="w3-container">
      <p class="tamanoLetra">
          <br />
          <div class="row">
              <div class="alinearAlCentro">
              <div class="col-sm-4">
                  <span class="glyphicon glyphicon-map-marker"></span>               
                  <asp:Label runat="server" text='<%#Eval("Calle") %>'></asp:Label>
                  <asp:Label runat="server" text='<%#Eval("NroCalle") %>'></asp:Label>
                  <br />
              </div>
              </div>
              <div class="alinearAlCentro">
              <div class="col-sm-4">
                  <i class="fas fa-volleyball-ball"></i>
                  <asp:Label runat="server" text='<%#Eval("Deportes") %>'></asp:Label>          
                  <br />               
              </div>
              </div>
              <div class="alinearAlCentro">
              <div class="col-sm-4">
                  <span class="glyphicon glyphicon-thumbs-up"></span>
                  <asp:Label runat="server" text='<%#Eval("Valoracion") %>'></asp:Label> 
                  <br />
              </div>
              </div>
      <%--        <div class="col-sm-3">
                  <i class="fa fa-male"></i>
                  <i class="fa fa-male"></i>
                  <i class="fa fa-male"></i>
                  <asp:Label runat="server" text="Acá se dice se tiene cupo o no"></asp:Label>
              </div>--%>
          </div>         
      </p>
      <br />  
    </div>   
      <asp:LinkButton runat="server" CommandName="btnUnirseEncuentro" CommandArgument='<%#Eval("ID") %>' text="Explorar Complejo" Class="w3-button w3-block w3-black" ></asp:LinkButton>
      </div>   
           </div><br />
            </ItemTemplate>

            <FooterTemplate>
            <tr>
            <td>
            <asp:Label ID="lblEmptyData"
            Text="No Se Encontraron Complejos" runat="server" Visible="false" Font-Size="Large">
            </asp:Label>
            </td>
            </tr>
            </table>           
            </FooterTemplate>

     </asp:Repeater>    

 </div>
    </div>
         <%-- <div class="w3-panel w3-black">
                    <asp:Label ID="lblCompDefault" runat="server" Text="No se encontraron complejos" ForeColor="White" Visible="false"></asp:Label>
                    </div>--%>
                         </div>
            <%--</div>--%>
        </div>
        <br />
        <br />
    
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



