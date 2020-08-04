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
         .losmargenes{
             margin-left:30px;
             margin-right:30px
         }

         .titulo2 {
            text-align: center;
            color: #ffffff;
            font-size:xxx-large;
        }
         .w3-green{
             background-color:#174f18!important;
         }

  </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <asp:Panel ID="Panel1"  runat="server" Visible="False">
                <div class="container text-center">
                    <div class="row alinearAlCentro">
                        <h1 class="titulo2">Todavía no registraste tu complejo</h1>
                        <br />
                        <asp:Button ID="btnRegComplejo" runat="server" Text="Registralo ahora!" BackColor="Black" BorderColor="Black" ForeColor="White" CssClass="w3-xxlarge" OnClick="btnRegComplejo_Click" />            
                        <br />
                        <h1 class="titulo2"></h1>
                        <br />
                        <h1 class="titulo2"></h1>
                    </div>
                </div>
            </asp:Panel>
    <asp:Panel ID="Panel2"  runat="server" Visible="True">
    <div class="losmargenes">
 <div class="row">
     <div class="col-sm-6">
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
                  <asp:Label runat="server" text='<%#Eval("nombreEstado") %>'></asp:Label>
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
     <div class="col-sm-6">
          <div class="well">

                        <div class="w3-panel w3-black">
                    <h1 class="w3-opacity">
                     <b>Agenda</b></h1>
                    </div>
                  <%--      <div class="form-group">
                             <asp:Label ID="lbl_Comp" runat="server" Text="Complejo"></asp:Label>
                             <asp:DropDownList ID="ddlComp" CssClass="form-control" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlComp_SelectedIndexChanged" >
                             <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                             </asp:DropDownList>
                        </div>--%>

              <div class="row alinearAlCentro">
                        <%--<div class="form-group">--%>
                             <asp:Label ID="lblDep" runat="server" Text="Deporte"></asp:Label>
              </div>
              <div class="row alinearAlCentro">
                  <div class="col-sm-3">
                             </div>
                  <div class="col-sm-6">                            
                             <asp:DropDownList ID="ddlDeportes" CssClass="form-control" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDeportes_SelectedIndexChanged" >
                             <asp:ListItem Value="0">Seleccione..</asp:ListItem>
                             </asp:DropDownList>
                      </div>
                  <div class="col-sm-3">
                             </div>
                        <%--</div>--%>
              </div>
              <div class="row alinearAlCentro">
                        <%--<div class="form-group">--%>
                             <asp:Label ID="lbl_Fecha" runat="server" Text="Fecha"></asp:Label>
               </div>
               <div class="row alinearAlCentro">
                             <div class="col-sm-4">
                             </div>
                             <div class="col-sm-4" style="padding-left: 0px;">
                             <asp:Calendar ID="cld_Fecha" runat="server" Width="270px" OnSelectionChanged="cld_Fecha_SelectionChanged" ></asp:Calendar>
                             </div>
                             <div class="col-sm-4">
                             </div>
                   <br />
                   </div>
                        <%--</div>--%>

              <div class="row alinearAlCentro">
                        <strong><asp:Label ID="lbl_agendaFecha" runat="server"></asp:Label></strong>
                                                         <br />
                  </div>
                      <%--  <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick" Interval="1000"></asp:Timer>       
                                                         <br />--%>
                                         
                                               <asp:GridView ID="gdv_Agenda" runat="server" AutoGenerateColumns="false" CssClass="w3-table-all w3-card-4" PagerStyle-CssClass="pager"
                                                    HeaderStyle-CssClass="header" RowStyle-CssClass="rows"
                                                    OnSelectedIndexChanged="gdv_Agenda_SelectedIndexChanged">
                                                    <Columns>
                                                        <asp:CommandField ButtonType="Image" SelectImageUrl="~\Imagenes\flecha_png_by_saloeditions_d4t9zl2-200h.png" ShowSelectButton="true" ControlStyle-Width="60px" />
                                                        <asp:BoundField DataField="idCancha" HeaderText="Id" Visible="false" />
                                                        <asp:BoundField DataField="nombreCancha" HeaderText="Cancha" Visible="true" />
                                                        <asp:BoundField DataField="nombreTipoCancha" HeaderText="Tipo" Visible="true" />
                                                        <asp:BoundField DataField="horaInicioHorario" HeaderText="Horarios" Visible="true" />
                                                        <asp:BoundField DataField="precioCancha" HeaderText="Precio" Visible="true" />
                                                        <asp:BoundField DataField="capacidadTipoCancha" HeaderText="Capacidad" Visible="true" />
                                                        <asp:BoundField DataField="idEstadoHorario" HeaderText="Estado" Visible="true"/>
                                                    </Columns>
                                                </asp:GridView>
                                           
                                 <br />
                                <asp:Label ID="lbl_Reserva" runat="server" Text="" ForeColor="#FF9900"></asp:Label>
                                <br />
                                <%--<asp:Label ID="lbl_Capacidad" runat="server" Text=""></asp:Label>--%>
                        </div>
                    
     </div>
 </div>
      
            
                         
        </div>
           
                   
      
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 </asp:Panel>
</asp:Content>