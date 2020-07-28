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
                                    OnSelectedIndexChanged="gdv_Usuarios_SelectedIndexChanged">
                      <Columns>                                     
                          <asp:BoundField DataField="idUsuario" HeaderText="Id" Visible="false"/>
                          <asp:BoundField DataField="nombreUsuario" HeaderText="Usuario" Visible="true"/>  
                          <asp:BoundField DataField="rol" HeaderText="Tipo Usuario" Visible="true" /> 
                          <asp:BoundField DataField="fechaAlta" HeaderText="Fecha Alta" Visible="true" DataFormatString="{0:d}" />                                                
                          <asp:CommandField showSelectButton="true"
                            SelectText='<button type="button" class="btn btn-primary btn-edit">Deshabilitar</button>' ItemStyle-Width="50px"/>
                      </Columns>
                   </asp:GridView>
                 </div>
              </div>
              <asp:Label ID="lblmsjusuario" runat="server" Text=""></asp:Label>
            </div>          
        </div>
    </div>
</asp:Content>
