<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEstablecimiento.Master" AutoEventWireup="true" CodeBehind="HomeEstablecimiento.aspx.cs" Inherits="CapaPresentacion.HomeEstablecimiento" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
      <h1><asp:Label runat="server" text='<%#Eval("nombreDeporte") %>'></asp:Label></h1>
    </header>
      <div class="w3-container">
      <p class="tamanoLetra">
          <br />
          <div class="row">
              <div class="col-sm-3">
                  <span class="glyphicon glyphicon-calendar tamanoLetra"></span>
                  <asp:Label runat="server" text='<%#Eval("horaInicio") %>'></asp:Label>
                  <br />
              </div>
              <div class="col-sm-3">
                  <span class="glyphicon glyphicon-map-marker"></span>
                  <asp:Label runat="server" text='<%#Eval("nombreComplejo") %>'></asp:Label><asp:Label runat="server" text='<%#Eval("nombreLP") %>'> </asp:Label><asp:Label ID="Label1" runat="server" Text=" &#183 "></asp:Label>           
                  <asp:Label runat="server" text='<%#Eval("direccion") %>'></asp:Label><asp:Label runat="server" text='<%#Eval("calleComplejo") %> '></asp:Label> <asp:Label runat="server" text=' <%#Eval("numeroCalleComplejo") %>'></asp:Label>  
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
                 
      <%--</p>--%>
          <%--<hr />--%>
      
        <%--<p>--%>
          
          <%--<asp:Label runat="server" text='<%#Eval("fechaInicioEncuentro") %>'></asp:Label><br />--%>
          
      </p>
      <br />  
    </div>
   
         
      <%--<asp:LinkButton runat="server" CommandName="evaluartipo" CommandArgument='<%#Eval("tipoEncuentro") %>' Visible="false"></asp:LinkButton>--%>
      <asp:LinkButton runat="server" CommandName="btnUnirseEncuentro" CommandArgument='<%#Eval("idEncuentroDeportivo") %>' text="Unirse al encuentro" Class="w3-button w3-block w3-black" ></asp:LinkButton>
      </div>   
           </div><br />
            </ItemTemplate>
     </asp:Repeater>    

 </div>
    </div>
    </asp:Content>