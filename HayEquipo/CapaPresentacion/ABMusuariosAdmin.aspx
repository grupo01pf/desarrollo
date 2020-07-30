<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdministrador.Master" AutoEventWireup="true" CodeBehind="ABMusuariosAdmin.aspx.cs" Inherits="CapaPresentacion.ABMusuariosAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

         .scroll-container {
            display: block;
            height: 400px;
            overflow-y: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container  text-center">
          <div class="w3-container">
            <h1 style="color:white">Lista de Usuarios</h1>
          </div>
        <div class="row">
            <div class="col-sm-12 well">           
              <div class="well">
                   <div class="scroll-container">
                   <asp:GridView ID="gdv_Usuarios" runat="server" AutoGenerateColumns="false" CssClass="w3-table-all w3-card-4"
                                     onrowdeleting="gdv_Usuarios_RowDeleting"
                                    OnRowUpdating="gdv_Usuarios_RowUpdating"
                                    OnRowDataBound="gdv_Usuarios_RowDataBound">
                      <Columns>                                     
                          <asp:BoundField DataField="idUsuario" HeaderText="Id" Visible="true"/>
                          <asp:BoundField DataField="nombreUsuario" HeaderText="Usuario" Visible="true"/>  
                          <asp:BoundField DataField="rol" HeaderText="Tipo Usuario" Visible="true" /> 
                          <asp:BoundField DataField="fechaAlta" HeaderText="Fecha Alta" Visible="true" DataFormatString="{0:d}" />
                          <asp:BoundField DataField="bloqueado" HeaderText="Habilitado/Deshabilitado" Visible="false" />                                                
                           <asp:TemplateField ItemStyle-Width="50px">
                           <ItemTemplate>           
                                   <asp:LinkButton ID="Deshabilitarbtn"
                                    CommandArgument='<%# Eval("idUsuario") %>'                                
                                    CommandName="Update" runat="server" CssClass="btn btn-primary btn-edit" Visible="true">
                                    Deshabilitar</asp:LinkButton>
                                    <asp:LinkButton ID="Habilitarbtn"
                                    CommandArgument='<%# Eval("idUsuario") %>'                                
                                    CommandName="Delete" runat="server" CssClass="btn btn-primary btn-edit" Visible="false">
                                    Habilitar</asp:LinkButton>
                            </ItemTemplate>                          
                          </asp:TemplateField>    
                      </Columns>
                   </asp:GridView>
                 </div>
              </div>
              <asp:Label ID="lblmsjusuario" runat="server" Text=""></asp:Label>
            </div>          
        </div>
    </div>
</asp:Content>
