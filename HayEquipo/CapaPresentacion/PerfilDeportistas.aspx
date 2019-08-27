<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PerfilDeportistas.aspx.cs" Inherits="CapaPresentacion.PerfilDeportistas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <div class="row">
       <div class="col-sm-10 well">
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
   </div>


</asp:Content>