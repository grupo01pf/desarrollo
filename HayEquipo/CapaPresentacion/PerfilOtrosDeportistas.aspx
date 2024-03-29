﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PerfilOtrosDeportistas.aspx.cs" Inherits="CapaPresentacion.PerfilOtrosDeportistas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
            .mydatagrid
{
	width: 80%;
	border: solid 4px black;
    border-radius: 12px;
	min-width: 80%;
}
.header
{
	background-color: #0b3107;
	font-family: Arial;
	color: White;
	height: 25px;
	text-align: center;
	font-size: 16px;
}

.rows
{
	background-color: #fff;
	font-family: Arial;
	font-size: 14px;
	color: #000;
	min-height: 25px;
	text-align: left;
}
.rows:hover
{
	background-color: #000;
    color:White;
}

.mydatagrid a /** FOR THE PAGING ICONS  **/
{
	background-color: Transparent;
	padding: 5px 5px 5px 5px;
	color: #000;
	text-decoration: none;
	font-weight: bold;
}

.mydatagrid a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/
{
	background-color: #0026ff;
	color: #fff;
}
.mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/
{
	
	padding: 5px 5px 5px 5px;
	background-color: #000;
	color: #fff;
}
.pager
{
	background-color: #22c81a;
	font-family: Arial;
	color: White;
	height: 30px;
	text-align: left;
}

.mydatagrid td
{
	padding: 5px;
}
.mydatagrid th
{
	padding: 5px;
}
.round3 {
  border: 2px solid #0b3107;
  border-radius: 12px;
}


input[type="radio"] {
  display: none;
}


.clasificacion {
  direction: rtl;
  unicode-bidi: bidi-override;
  margin-right:70%;
}

label:hover,
label:hover ~ label {
  color: orange;
}


input[type="radio"]:checked ~ label {
  color: orange;
}
.estrellalabel{
    font-size:20px;
}
.estrella{
    transform: scale(2.0);
     margin-left:20%;
}



    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container">
    <div class="row">

      <div class="col-sm-4 well text-center">
   
       <p> <asp:LinkButton ID="link_nombreUsuario2" runat="server" Text=""></asp:LinkButton></p>
       
          <asp:Image ID="Image1" ImageUrl="Imagenes/nene.png" runat="server" CssClass="img-circle" height="100" width="100" />
           <asp:Label ID="msjimagennNula" runat="server" Text=""></asp:Label>
          <br />
          <br />
         
         </div>
        <div class="col-sm-8 well">
         <ul class="nav nav-tabs">
    <li id="datos" runat="server" class="active"><a data-toggle="tab" href="#home">Datos</a></li>
    <li><a data-toggle="tab" href="#menu1">Encuentros</a></li>
    <li id="calif" class="" runat="server"><a data-toggle="tab" href="#menu2">Calificaciones</a></li>
    
  </ul>
        <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
        <br />
         <div class="form-group">
           <asp:Label ID="lbl_Nombres" runat="server" Text="Nombres:"></asp:Label>
           <asp:Label ID="Nombres" runat="server"></asp:Label>
    </div>
       <div class="form-group">
       <asp:Label ID="lbl_Apellidos" runat="server" Text="Apellido:"></asp:Label>
        <asp:Label ID="Apellidos" runat="server"></asp:Label>
       </div> 
          
           <div class="form-group">
       <asp:Label ID="lbl_NumeroDocumento" runat="server" Text="Numero de Documento:"></asp:Label>
       <asp:Label ID="Nrodoc" runat="server"></asp:Label>
          </div>
           <div class="form-group">
       <asp:Label ID="lbl_Sexo" runat="server" Text="Sexo:"></asp:Label>
        <asp:Label ID="sexo" runat="server"></asp:Label>
           </div>
           <div class="form-group">
       <asp:Label ID="lbl_FechaNacimiento" runat="server" Text="Fecha de nacimiento:"></asp:Label>
       <asp:Label ID="Fechanac" runat="server"></asp:Label>

           </div>
             <div class="form-group">
         <asp:Label ID="lbl_Telefono" runat="server" Text="Telefono:"></asp:Label>
        <asp:Label ID="Tel" runat="server"></asp:Label>
             </div>
        <div class="form-group">
       <asp:Label ID="lbl_DeportePreferido" runat="server" Text="Deporte Preferido:"></asp:Label>
        <asp:Label ID="DeportePreferido" runat="server"></asp:Label>
           </div>
        <div class="form-group">
       <asp:Label ID="lbl_BarrioDeportista" runat="server" Text="Barrio:"></asp:Label>
        <asp:Label ID="BarrioDeportista" runat="server"></asp:Label>
           </div>
           <asp:Label ID="msjdepcompletar" runat="server" Text=""></asp:Label>
       </div> 
   

           
    <div id="menu1" class="tab-pane fade">
          <div class="table-responsive">
               <br />
                  <asp:GridView ID="gdv_EncuentrosDeportista" runat="server" AutoGenerateColumns="false" CssClass="w3-table-all w3-card-4"
                       OnSelectedIndexChanged="gdv_EncuentrosDisponibles_SelectedIndexChanged" >
                             
                                <Columns>
                                    <asp:CommandField buttontype="Image" SelectImageUrl="~\Imagenes\flecha_png_by_saloeditions_d4t9zl2-200h.png" ShowSelectButton="true" ControlStyle-Width="60px"/>                          
                                    <asp:BoundField DataField="idEncuentroDeportivo" HeaderText="Id" Visible="false" />
                                    <asp:BoundField DataField="tipoEncuentro" HeaderText="Tipo" Visible="true" />
                                    <asp:BoundField DataField="nombreDeporte" HeaderText="Deporte" Visible="true" />                                      
                                    <asp:BoundField DataField="nombreComplejo" HeaderText="Lugar/Complejo" Visible="true" />
                                    <asp:BoundField DataField="calleComplejo" HeaderText="Direccion" Visible="false" />
                                    <asp:BoundField DataField="fechaInicioEncuentro" HeaderText="Fecha Inicio" Visible="true" DataFormatString="{0:d}"/>  
                                    <asp:BoundField DataField="horaInicio" HeaderText="Hora Inicio" Visible="true" DataFormatString="{0:t}"/>
                                    <asp:BoundField DataField="accesibilidad" HeaderText="Accesibilidad" Visible="true" />  
                                    <asp:BoundField DataField="nombreEstado" HeaderText="Estado" Visible="true" />

                                </Columns>
                            </asp:GridView>
                    
              </div>

          </div> 
<div id="menu2" class="tab-pane fade">
          <div class="table-responsive">
               <br />
   <asp:Label CssClass="estrellalabel" runat="server" Text="Comportamiento"></asp:Label>
  <p class="clasificacion">
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" CssClass="estrella" AutoPostBack="true">
    <asp:ListItem Text="★" Value="1"></asp:ListItem>
    <asp:ListItem Text="★" Value="2"></asp:ListItem>
    <asp:ListItem Text="★" Value="3"></asp:ListItem>
    <asp:ListItem Text="★" Value="4"></asp:ListItem>
    <asp:ListItem Text="★" Value="5"></asp:ListItem>  
    </asp:RadioButtonList> 
       <asp:Label ID="lblmsjrb1" runat="server" Text=""></asp:Label>
  
      
  </p>
      <asp:Label CssClass="estrellalabel" runat="server" Text="Puntualidad"></asp:Label>   
  <p class="clasificacion">
     <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatDirection="Horizontal" CssClass="estrella" AutoPostBack="true" ClientIDMode="Predictable">
    <asp:ListItem Text="★" Value="1"></asp:ListItem>
    <asp:ListItem Text="★" Value="2"></asp:ListItem>
    <asp:ListItem Text="★" Value="3"></asp:ListItem>
    <asp:ListItem Text="★" Value="4"></asp:ListItem>
    <asp:ListItem Text="★" Value="5"></asp:ListItem>
    </asp:RadioButtonList> 
     <asp:Label ID="lblmsjrb2" runat="server" Text=""></asp:Label>
  </p>
        <asp:Label CssClass="estrellalabel" runat="server" Text="Habilidad Deportiva"></asp:Label>
  <p class="clasificacion">
     <asp:RadioButtonList ID="RadioButtonList3" runat="server" RepeatDirection="Horizontal" CssClass="estrella" AutoPostBack="true">
    <asp:ListItem Text="★" Value="1" ></asp:ListItem>
    <asp:ListItem Text="★" Value="2"></asp:ListItem>
    <asp:ListItem Text="★" Value="3"></asp:ListItem>
    <asp:ListItem Text="★" Value="4"></asp:ListItem>
    <asp:ListItem Text="★" Value="5"></asp:ListItem>
    </asp:RadioButtonList> 
      <asp:Label ID="lblmsjrb3" runat="server" Text=""></asp:Label>
  </p>

                <asp:Label CssClass="estrellalabel" runat="server" Text="Promedio General"></asp:Label>   
  <p class="clasificacion">
     <asp:RadioButtonList ID="RadioButtonList4" runat="server" RepeatDirection="Horizontal" CssClass="estrella" AutoPostBack="true"  >
    <asp:ListItem Text="★" Value="1"></asp:ListItem>
    <asp:ListItem Text="★" Value="2"></asp:ListItem>
    <asp:ListItem Text="★" Value="3"></asp:ListItem>
    <asp:ListItem Text="★" Value="4"></asp:ListItem>
    <asp:ListItem Text="★" Value="5"></asp:ListItem>
    </asp:RadioButtonList> 
     <asp:Label ID="lblmsjrb4" runat="server" Text=""></asp:Label>
  </p>
             
            </div>
   </div>
            </div>
   </div>
        
    </div>

    </div>

   
</asp:Content>