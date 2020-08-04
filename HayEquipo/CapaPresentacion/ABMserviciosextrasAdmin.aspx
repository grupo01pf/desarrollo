﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdministrador.Master" AutoEventWireup="true" CodeBehind="ABMserviciosextrasAdmin.aspx.cs" Inherits="CapaPresentacion.ABMserviciosextrasAdmin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


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
     <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <div class="container  text-center">
          <div class="w3-container">
            <h1 style="color:white">Lista de Servicios Extra</h1>
          </div>
        <div class="row">
            <div class="col-sm-12 well">           
              <div class="well">
                 <div class="scroll-container">
                  <asp:GridView ID="gdv_serviciosextra" runat="server" AutoGenerateColumns="false" CssClass="w3-table-all w3-card-4"
                                    onrowdeleting="gdv_serviciosextra_RowDeleting"
                                    OnRowDataBound="gdv_serviciosextra_RowDataBound"
                                    OnRowUpdating="gdv_serviciosextra_RowUpdating">
                      <Columns>                                     
                          <asp:BoundField DataField="id" HeaderText="Id" Visible="true"/>
                          <asp:BoundField DataField="nombre" HeaderText="Nombre" Visible="true"/>                                                                           
                        <asp:TemplateField ItemStyle-Width="50px">
                           <ItemTemplate>  
                             <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>         
                                   <asp:LinkButton ID="updatebtn"
                                    CommandArgument='<%# Eval("id") %>'                                
                                    CommandName="Update" runat="server" CssClass="btn btn-primary btn-edit">
                                    Actualizar</asp:LinkButton>
                                 </ContentTemplate>
                               </asp:UpdatePanel>
                            </ItemTemplate>                          
                          </asp:TemplateField>    
                         <asp:TemplateField ItemStyle-Width="50px">
                            <ItemTemplate>         
                                   <asp:LinkButton ID="deletebtn"
                                    CommandArgument='<%# Eval("id") %>'                                
                                    CommandName="Delete" runat="server" CssClass="btn btn-primary btn-edit">
                                    Borrar</asp:LinkButton>
                            </ItemTemplate>                          
                          </asp:TemplateField>                         
                      </Columns>        
                   </asp:GridView>
                 </div>
              </div>
               <div class="col-sm-12">                  
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:LinkButton ID="btnAgragaDeporte" runat="server" OnClick="btnPopUp_Click" CssClass="btn btn-primary btn-edit">
                                     <i class='fa fa-check-square-o' aria-hidden='true'></i> Agregar Servicio Extra
                                    </asp:LinkButton>

                                </ContentTemplate>
                            </asp:UpdatePanel>
               </div>   
                 <div class="col-sm-12">          
              <asp:Label ID="lblmsjservicioextra" runat="server" Text=""></asp:Label>
                 </div>
            </div>          
        </div>
    </div>


     <asp:Button ID="btnInicial" runat="server" Text="Button" Style="display: none" />

            <asp:ModalPopupExtender ID="btnPopUp_ModalPopupExtender" runat="server"
                Enabled="True" TargetControlID="btnInicial"
                PopupControlID="PanelModal">
                <Animations>
            <OnShowing>
                <FadeIn Duration=".5" Fps="30" />
            </OnShowing>
            <OnShown>
                <FadeIn Duration=".3" Fps="30" />
            </OnShown>
            <OnHiding>
                <FadeOut Duration=".5" Fps="30" />
            </OnHiding>
            <OnHidden>
                <FadeOut Duration=".5" Fps="30" />
            </OnHidden>

                </Animations>
            </asp:ModalPopupExtender>


     <asp:Panel ID="PanelModal" runat="server" Style="display: none; background: white; height: 0%" >
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>

               <div class="ensanchar">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                <div class="modal-header">
                     <asp:Button ID="btnclose2" runat="server" Text="X" CssClass="close"
                       onclick="btnClose_Click"/>
                    <h4 class="modal-title" id="myModalLabel">Agregar Servicio Extra</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Nombre Servicio Extra</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtNombre" runat="server" Text="" placeholder="Ingrese Nombre" CssClass="form-control"></asp:TextBox>
                    </div>  
                                                                           
                     </div>

                  <div class="modal-footer">
                      <asp:Label ID="lblerror2" runat="server" CssClass="error"></asp:Label>
                      <asp:Button ID="btnClose" runat="server" Text="Cerrar" class="btn btn-danger"
                       onclick="btnClose_Click"/>

                   <asp:Button ID="btnAgregar" runat="server" Text="Agregar Servicio Extra" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btnAgregar_Click" />

                  </div>
                 </div>
                    </div>
                   </div> 
                        </div>
                    </ContentTemplate>
                    <Triggers>
                   <asp:PostBackTrigger ControlID = "btnAgregar" />
                    </Triggers>
                </asp:UpdatePanel>
            </asp:Panel>

      <asp:Button ID="btnInicial2" runat="server" Text="Button" Style="display: none" />

            <asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                Enabled="True" TargetControlID="btnInicial2"
                PopupControlID="Panel1">
                <Animations>
            <OnShowing>
                <FadeIn Duration=".5" Fps="30" />
            </OnShowing>
            <OnShown>
                <FadeIn Duration=".3" Fps="30" />
            </OnShown>
            <OnHiding>
                <FadeOut Duration=".5" Fps="30" />
            </OnHiding>
            <OnHidden>
                <FadeOut Duration=".5" Fps="30" />
            </OnHidden>

                </Animations>
            </asp:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" Style="display: none; background: white; height: 0%" >
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>

               <div class="ensanchar">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                <div class="modal-header">
                     <asp:Button ID="btnClose4" runat="server" Text="X" CssClass="close"
                       onclick="btnClose2_Click"/>
                    <h4 class="modal-title" id="myModalLabel2">Actualizar Servicio Extra</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:TextBox ID="txtId" runat="server" Text="" Visible="false"></asp:TextBox>
                    </div>  
                    <div class="form-group">
                        <label>Nombre Servicio Extra</label>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtNombre2" runat="server" Text="" placeholder="Ingrese Nombre" CssClass="form-control"></asp:TextBox>
                    </div>  
                                                                             
                     </div>

                  <div class="modal-footer">
                      <asp:Label ID="lblerror3" runat="server" CssClass="error"></asp:Label>
                      <asp:Button ID="btnClose3" runat="server" Text="Cerrar" class="btn btn-danger"
                       onclick="btnClose2_Click"/>

                   <asp:Button ID="btnActualizar" runat="server" Text="Actualizar Servicio Extra" ValidationGroup="E" CssClass="btn btn-primary btn-edit" OnClick="btnActualizar_Click" />

                  </div>
                 </div>
                    </div>
                   </div> 
                        </div>
                    </ContentTemplate>
                    <Triggers>
                   <asp:PostBackTrigger ControlID = "btnActualizar" />
                    </Triggers>
                </asp:UpdatePanel>
            </asp:Panel>
</asp:Content>