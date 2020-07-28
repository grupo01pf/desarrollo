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
                                    onrowdeleting="gdv_deportes_RowDeleting"
                                    OnRowDataBound="gdv_deportes_RowDataBound">
                      <Columns>                                     
                          <asp:BoundField DataField="idDeporte" HeaderText="Id" Visible="true"/>
                          <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true"/>   
                          <asp:TemplateField HeaderText="Avatar">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" 
                                    ImageUrl='<%# Eval("idDeporte", "ImagenDeporteAdmin.aspx?id={0}") %>' CssClass="img-circle"  Width="50px" Height="50px" />
                            </ItemTemplate>
                        </asp:TemplateField>                                                                          
                          <asp:CommandField showSelectButton="true"
                            SelectText='<button type="button" class="btn btn-primary btn-edit">Actualizar</button>' ItemStyle-Width="50px"/>
                         <asp:TemplateField ItemStyle-Width="50px">
                            <ItemTemplate>         
                                   <asp:LinkButton ID="deletebtn"
                                    CommandArgument='<%# Eval("idDeporte") %>'                                
                                    CommandName="Delete" runat="server" CssClass="btn btn-primary btn-edit">
                                    Borrar</asp:LinkButton>
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
