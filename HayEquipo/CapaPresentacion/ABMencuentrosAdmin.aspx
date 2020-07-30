<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdministrador.Master" AutoEventWireup="true" CodeBehind="ABMencuentrosAdmin.aspx.cs" Inherits="CapaPresentacion.ABMencuentrosAdmin" %>
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
            <h1 style="color:white">Lista de Encuentros</h1>
          </div>
        <div class="row">
            <div class="col-sm-12 well">           
              <div class="well">
                   <div class="scroll-container">
                   <asp:GridView ID="gdv_Encuentros" runat="server" AutoGenerateColumns="false" CssClass="w3-table-all w3-card-4"
                                     onrowdeleting="gdv_Encuentros_RowDeleting"
                                    OnRowUpdating="gdv_Encuentros_RowUpdating"
                                    OnRowDataBound="gdv_Encuentros_RowDataBound">
                      <Columns>                                     
                           <asp:BoundField DataField="idEncuentroDeportivo" HeaderText="Id" Visible="true" />
                           <asp:BoundField DataField="tipoEncuentro" HeaderText="Tipo" Visible="true" />
                           <asp:BoundField DataField="nombreDeporte" HeaderText="Deporte" Visible="true" />
                           <asp:BoundField DataField="nombreComplejo" HeaderText="Complejo" Visible="true" NullDisplayText="---" />
                           <asp:BoundField DataField="nombreLP" HeaderText="LugarPublico" Visible="true" NullDisplayText="---" />
                           <asp:BoundField DataField="fechaInicioEncuentro" HeaderText="Fecha Inicio" Visible="true" DataFormatString="{0:d}"/>
                           <asp:BoundField DataField="horaInicio" HeaderText="Hora Inicio" Visible="true" DataFormatString="{0:t}"/>
                           <asp:BoundField DataField="accesibilidad" HeaderText="Accesibilidad" Visible="true" />
                           <asp:BoundField DataField="nombreEstado" HeaderText="Estado" Visible="true" />                                    
                           <asp:TemplateField ItemStyle-Width="50px">
                           <ItemTemplate>           
                                   <asp:LinkButton ID="Cancelarbtn"
                                    CommandArgument='<%# Eval("idEncuentroDeportivo") %>'                                
                                    CommandName="Update" runat="server" CssClass="btn btn-primary btn-edit" Visible="true">
                                    Cancelar Encuentro</asp:LinkButton>
                                    <asp:LinkButton ID="Habilitarbtn"
                                    CommandArgument='<%# Eval("idEncuentroDeportivo") %>'                                
                                    CommandName="Delete" runat="server" CssClass="btn btn-primary btn-edit" Enabled="false" Visible="false">
                                    Encuentro Cancelado </asp:LinkButton>
                            </ItemTemplate>                          
                          </asp:TemplateField>    
                      </Columns>
                   </asp:GridView>
                 </div>
              </div>
              <asp:Label ID="lblmsjencuentro" runat="server" Text=""></asp:Label>
            </div>          
        </div>
    </div>

</asp:Content>
