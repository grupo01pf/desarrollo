<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PerfilDeportistas.aspx.cs" Inherits="CapaPresentacion.PerfilDeportistas" %>

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
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container">
    <div class="row">

      <div class="col-sm-4 well text-center">
   
       <p> <asp:LinkButton ID="link_nombreUsuario2" runat="server" Text=""></asp:LinkButton></p>
       
          <asp:Image ID="Image1" ImageUrl="Imagenes/nene.png" runat="server" CssClass="img-circle" height="100" width="100" />
          <br />
          <br />
          <div class="form-group">
          <asp:FileUpload ID="FileUploadAvatar" CssClass="btn btn-primary" runat="server" /> 
              </div>
          
           <div class="form-group">
             <asp:Button ID="btn_guardarImagen" runat="server" Text="Guardar Imagen" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btnGuardarImagen_Click"/>
            </div>
             <asp:Label ID="lblestado" runat="server"></asp:Label>
         </div>
        <div class="col-sm-8 well">
         <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">Mis Datos</a></li>
    <li><a data-toggle="tab" href="#menu1">Mis Encuentros</a></li>
    <li><a data-toggle="tab" href="#menu2">Mis Calificaciones</a></li>
    <li><a data-toggle="tab" href="#menu3">Estadisticas</a></li>
  </ul>

        <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
       
         <div class="form-group">
          <label>Nombres</label>
        <asp:TextBox ID="txt_Nombres" class="form-control" runat="server" placeholder="Ingrese Nombres"></asp:TextBox>

    </div>
       <div class="form-group">
      <label>Apellido</label>
        <asp:TextBox ID="txt_Apellidos" runat="server" class="form-control" placeholder="Ingrese Apellido"></asp:TextBox>
        </div>
    <div class="form-group">
      <label>Tipo Documento</label>
        <asp:DropDownList ID="ddl_TipoDocumento" runat="server"></asp:DropDownList>
      </div>
          
           <div class="form-group">
      <label>Numero de Documento</label>
        <asp:TextBox ID="txt_NumeroDocumento" runat="server" class="form-control" placeholder="Ingrese Nro Documento"></asp:TextBox>
        </div>
           <div class="form-group">
      <label>Sexo</label>
        <asp:TextBox ID="txt_Sexo" runat="server" class="form-control" placeholder="Ingrese Sexo"></asp:TextBox>
        
           </div>
           <div class="form-group">
      <label>Fecha de Nacimiento</label>
        <asp:TextBox ID="txt_FechaNacimiento" runat="server" class="form-control" placeholder="Ingrese Fecha Nacimiento"></asp:TextBox>
        </div>
             <div class="form-group">
      <label>Telefono</label>
        <asp:TextBox ID="txt_Telefono" runat="server" class="form-control" placeholder="Ingrese Telefono"></asp:TextBox>
        </div>
           <div class="form-group">
             <asp:Button ID="btnGuardar" runat="server" Text="Registrar Datos Deportista" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btnGuardar_Click" />
 </div>
       </div> 
   

           
    <div id="menu1" class="tab-pane fade">
          <div class="table-responsive">
                  <asp:GridView ID="gdv_EncuentrosDeportista" runat="server" AutoGenerateColumns="false" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                                 HeaderStyle-CssClass="header" RowStyle-CssClass="rows"  >
                             
                                <Columns>
                                    <asp:CommandField buttontype="Image" selectimageurl="~\Imagenes\boton-ir.png" ShowSelectButton="true" ControlStyle-Width="25px"/>                          
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
</asp:Content>