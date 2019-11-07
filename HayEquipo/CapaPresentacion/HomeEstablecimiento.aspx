<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEstablecimiento.Master" AutoEventWireup="true" CodeBehind="HomeEstablecimiento.aspx.cs" Inherits="CapaPresentacion.HomeEstablecimiento" %>


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

       <div class="container text-center">
 
      <div class="col-sm-10">
             <div class="well">
            
              <div class="w3-panel w3-black">
                    <h1 class="w3-opacity">
                     <b>Próximos Encuentros</b></h1>
                    </div>

  <div class="scroll-container">
     <asp:Repeater ID="encuentrosRepeater" runat="server">
           <ItemTemplate>
               <div class="w3-container alinearIzquiera">
  <div class="w3-card-4">
      <header class="w3-container w3-green">
          <img class="w3-left w3-circle w3-margin-right" style="width:55px" src="Imagenes/nene.png"" alt="Avatar" />
     <h1><asp:Label runat="server" text='<%#Eval("nombreDeporte") %>'></asp:Label></h1>
    </header>
      <div class="w3-container">
      <p class="tamanoLetra">
          <br />
          <div class="row">
              <div class="col-sm-3">
                  <span class="glyphicon glyphicon-calendar"></span>               
                  <asp:Label runat="server" text='<%#Eval("fechaInicioEncuentro") %>'></asp:Label>
                  <asp:Label runat="server" text='<%#Eval("horaInicio") %>'></asp:Label>
                  <br />
              </div>
              <div class="col-sm-3">
                  <span class="glyphicon glyphicon-map-marker"></span>
                  <asp:Label runat="server" text='<%#Eval("nombreComplejo") %>'></asp:Label> <asp:Label ID="Label1" runat="server" Text=" &#183 "></asp:Label>
                  <asp:Label runat="server" text='<%#Eval("calleComplejo") %> '></asp:Label> <asp:Label runat="server" text=' <%#Eval("numeroCalleComplejo") %>'></asp:Label>         
                  <br />               
              </div>
              <div class="col-sm-3">
                  <span class="glyphicon glyphicon-eye-open"></span>
                  <asp:Label runat="server" text='<%#Eval("accesibilidad") %>'></asp:Label>
                  <br />
              </div>
              <div class="col-sm-3">
                  <i class="fa fa-male"></i>
                  <i class="fa fa-male"></i>
                  <i class="fa fa-male"></i>
                  <asp:Label runat="server" text="Acá se dice se tiene cupo o no"></asp:Label>
              </div>
          </div>         
      </p>
      <br />  
    </div>   
      <asp:LinkButton runat="server" CommandName="btnUnirseEncuentro" CommandArgument='<%#Eval("idEncuentroDeportivo") %>' text="Ver encuentro" Class="w3-button w3-block w3-black" ></asp:LinkButton>
      </div>   
           </div><br />
            </ItemTemplate>
     </asp:Repeater>    

 </div>
    </div>  
                         </div>

           <div class="col-sm-10">
                    <div class="well">

                        <div class="w3-panel w3-black">
                    <h1 class="w3-opacity">
                     <b>Agenda</b></h1>
                    </div>
                        <div class="form-group">
                            <asp:ListBox ID="lstComp" CssClass="form-control" runat="server"  AppendDataBoundItems="true" OnSelectedIndexChanged="lstComp_SelectedIndexChanged" ></asp:ListBox>
                       <%--  <asp:DropDownList ID="ddlComp" CssClass="form-control" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlComp_SelectedIndexChanged">
                                <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                            </asp:DropDownList>--%>
                            </div>

                         <div class="form-group">
                            <asp:Label ID="lbl_Fecha" runat="server" Text="Fecha"></asp:Label>
                            <asp:Calendar ID="cld_Fecha" runat="server" Width="270px" ></asp:Calendar>
                         </div>

                        <div class="form-group">
                             <asp:DropDownList ID="ddlHora" CssClass="form-control" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlHora_SelectedIndexChanged">
                              <%--  <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                                <asp:ListItem Value="1">00hs</asp:ListItem>--%>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group">
                             <asp:GridView ID="gvCanchas" runat="server" AutoGenerateColumns="false" BackColor="White" CssClass="table table-hover table-striped" ForeColor="Black" OnSelectedIndexChanged="gvCanchas_SelectedIndexChanged">
                                <Columns>
                                <asp:CommandField HeaderText="Reservar" ItemStyle-CssClass="col-lg-3 text-center" ItemStyle-ForeColor="#3366CC" ShowSelectButton="True" SelectText="Reservar" />
                                </Columns>
                             </asp:GridView>
                            
                        </div>
                        </div>
                    </div>
               </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           </div>
</asp:Content>