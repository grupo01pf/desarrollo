<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdministrador.Master" AutoEventWireup="true" CodeBehind="ABMdeportesAdmin.aspx.cs" Inherits="CapaPresentacion.ABMdeportesAdmin"%>
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
            <h1 style="color:white">Lista de Deportes</h1>
          </div>
        <div class="row">
            <div class="col-sm-12 well">           
              <div class="well">
                 <div class="scroll-container">
                  <asp:GridView ID="gdv_deportes" runat="server" AutoGenerateColumns="false" CssClass="w3-table-all w3-card-4"
                                    OnSelectedIndexChanged="gdv_deportes_SelectedIndexChanged"
                                    onrowdeleting="gdv_deportes_RowDeleting" >
                      <Columns>                                     
                          <asp:BoundField DataField="idDeporte" HeaderText="Id" Visible="true"/>
                          <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true"/>                                                                          
                          <asp:CommandField showSelectButton="true"
                            SelectText='<button type="button" class="btn btn-primary btn-edit">Actualizar</button>' ItemStyle-Width="50px"/>
                          <asp:CommandField showDeleteButton="true"
                            DeleteText='<button type="button" class="btn btn-primary btn-edit">Borrar</button>' ItemStyle-Width="50px"/>                      
                          <asp:TemplateField ItemStyle-Width="50px" Visible="false">
                            <ItemTemplate>
                                  <asp:Button ID="deletebtn" runat="server" OnClick="deletebtn_Click" CssClass="btn btn-primary btn-edit" 
                                   Text="Borrar" OnClientClick="return confirm('Seguro que desea borrar este deporte?');"/>
                            </ItemTemplate>
                          </asp:TemplateField>                            
                      </Columns>        
                   </asp:GridView>
                 </div>
              </div>
               <div class="col-sm-12">
             <asp:Button ID="btn_AgregarDeporte" runat="server" class="btn btn-primary btn-edit" Text="Agregar Deporte" ValidationGroup="E" OnClick="btn_AgregarDeporte_Click"></asp:Button>            
               </div>   
                 <div class="col-sm-12">          
              <asp:Label ID="lblmsjdeporte" runat="server" Text=""></asp:Label>
                 </div>
            </div>          
        </div>
    </div>

</asp:Content>
