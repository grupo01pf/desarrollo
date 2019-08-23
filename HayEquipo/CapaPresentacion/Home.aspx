<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CapaPresentacion.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       

  
<div class="container text-center">    

  <div class="row">
    <div class="col-sm-3 well" <%--style="background-color:#d7dbd3;"--%>>
      <div class="well">
        <%--<p><a href="#">Ignacio Monetto</a></p>--%>
         <p> <asp:LinkButton ID="link_nombreUsuario" runat="server" Text="" OnClick="link_nombreUsuario_Click"></asp:LinkButton></p>
        <img src="Imagenes/nene.png" class="img-circle" height="65" width="65" alt="Avatar">
      </div>
      
      <div class="alert alert-success fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
        <p><strong>Ey!</strong></p>
        Tienes una invitación de Juan Perez. <p><strong>Ver Invitación</strong></p>
      </div>
         <div class="alert alert-success fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
        <p><strong>Ey!</strong></p>
        Tienes una invitación de Pedro García. <p><strong>Ver Invitación</strong></p>
      </div>
    </div>
    <div class="col-sm-7" <%--style="background-color:#d7dbd3;"--%>>
    
      <div class="row">
          
        <div class="col-sm-12">
          <div class="panel panel-default text-left">
            <div class="panel-body">

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
        <img src="Imagenes/cerveza.jpg" width="1000" height="1500">
      </div>

      <div class="item">
        <img src="Imagenes/adidas.jpg" width="1000" height="1500">
      </div>
    
      <div class="item">
        <img src="Imagenes/nike.jpg" width="1000" height="1500">
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
              <%--<p contenteditable="true">ADS</p>
              <button type="button" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-thumbs-up"></span> Like
              </button>  --%>   
            </div>
          </div>
        </div>
      </div>
        <div><button type="button" class="btn btn-primary btn-block">Filtrar encuentros</button>

        </div>
      <div class="form-group input-group">
          <input type="text" class="form-control" placeholder="Buscar encuentros...">
          <span class="input-group-btn">
            <button class="btn btn-default" type="button">
              <span class="glyphicon glyphicon-search"></span>
            </button>
          </span>        
        </div>
      <div class="row">
        <div class="col-sm-12">
          <div class="well">
           <p>Encuentros Vigentes</p>
          <%-- <img src="Imagenes/futbol.jpg" class="img-circle" height="55" width="55" alt="Avatar">--%>
             
              <%-- GRILLA LUGARES PUBLICOS --%>
               <div class="row">
                   <asp:Label ID="lbl_Prueba" runat="server" ></asp:Label>
                    <div style="width: 30; height: 400px; overflow: scroll">
                  <asp:GridView ID="gdv_EncuentrosDisponibles" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered"
                      OnSelectedIndexChanged="gdv_LugaresPublicos_SelectedIndexChanged">
                                <Columns>
                                    <asp:CommandField HeaderText="Seleccionar" ShowSelectButton="true" />                                    
                                    <asp:BoundField DataField="idEncuentroDeportivo" HeaderText="Id" Visible="false" />
                                    <asp:BoundField DataField="tipoEncuentro" HeaderText="Tipo" Visible="true" />
                                    <asp:BoundField DataField="nombreDeporte" HeaderText="Deporte" Visible="true" />                                      
                                    <asp:BoundField DataField="nombreComplejo" HeaderText="Complejo" Visible="true" />
                                    <asp:BoundField DataField="nombreLP" HeaderText="LugarPublico" Visible="true" />
                                    <asp:BoundField DataField="fechaInicioEncuentro" HeaderText="Fecha Inicio" Visible="true" DataFormatString="{0:d}"/>  
                                    <asp:BoundField DataField="horaInicio" HeaderText="Hora Inicio" Visible="true" DataFormatString="{0:t}"/>
                                    <asp:BoundField DataField="accesibilidad" HeaderText="Accesibilidad" Visible="true" />  
                                    <asp:BoundField DataField="nombreEstado" HeaderText="Estado" Visible="true" />

                                </Columns>
                            </asp:GridView>
                    
              </div>
                   </div>


          </div>
        </div>
      </div>
      
    </div>
    <div class="col-sm-2 well" <%--style="background-color:#d7dbd3;"--%>>
      <div class="thumbnail">
        <p>Próximo encuentro</p>
        <img src="Imagenes/futbol.jpg" alt="Paris" width="400" height="300">
        <p><strong>Fútbol 7 en Don Balón</strong></p>
        <p>Viernes 30 de Agosto a las 20 hs. </p>
        <button class="btn btn-primary">Info</button>
      </div>      
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
        <div class="well">
        <p><a href="#">Algunos links que te pueden interesar...</a></p>
        <p>
          <span class="label label-default">Link1</span>
          <span class="label label-primary">Link2</span>
          <span class="label label-success">Link3</span>
          <span class="label label-info">Link4</span>
          <span class="label label-warning">Link5</span>
          <span class="label label-danger">Link6</span>
        </p>
      </div>
    </div>
  </div>
</div>
</asp:Content>



