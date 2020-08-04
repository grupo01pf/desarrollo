<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdministrador.Master" AutoEventWireup="true" CodeBehind="HomeAdministrador.aspx.cs" Inherits="CapaPresentacion.HomeAdministrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container text-center">

         
          <div class="w3-container">
            <h1 style="color:white">Administrador</h1>
          </div>
          <br/>
            
             
                

           <div class="col-sm-6 w3-padding" >
                  <a href="ABMusuariosAdmin.aspx"><div class="w3-card-4" style="width:100%;">
                    <header class="w3-container w3-black">
                        <h1>Usuarios</h1>
                    </header>
                  </div></a>
              <br />

           <a href="ABMencuentrosAdmin.aspx"><div class="w3-card-4" style="width:100%;">
                    <header class="w3-container w3-black">
                        <h1>Encuentros Deportivos</h1>
                    </header>
                  </div></a>
              <br />
                     
              <a href="ABMComplejosAdministrador.aspx"><div class="w3-card-4" style="width:100%;">
                    <header class="w3-container w3-black">
                        <h1>Complejos deportivos</h1>
                    </header>
                  </div></a>
              <br />
                </div>
            
           <div class="col-sm-6">
               <a href="ABMdeportesAdmin.aspx"><div class="w3-card-4" style="width:100%;">
                    <header class="w3-container w3-black">
                        <h1>ABM Deportes</h1>
                    </header>
                  </div></a>
              <br />
                  
           <a href="ABMserviciosextrasAdmin.aspx"><div class="w3-card-4" style="width:100%;">
                    <header class="w3-container w3-black">
                        <h1>ABM Servicios Extras</h1>
                    </header>
                  </div></a>
              <br />

           <a href="ABMtipocanchaAdmin.aspx"><div class="w3-card-4" style="width:100%;">
                    <header class="w3-container w3-black">
                        <h1>ABM Tipo de Cancha</h1>
                    </header>
                  </div></a>
                <br />
               </div>
             <div class="col-sm-12" >
                  <a href="ReportesEstadisticasAdmin.aspx"><div class="w3-card-4" style="width:100%;">
                    <header class="w3-container w3-black">
                        <h1>Reportes y Estadísticas</h1>
                    </header>
                  </div></a>

             </div>

         
       </div>
          <br />  <br /> <br /> <br /> <br />
    </asp:Content>
