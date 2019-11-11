<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdministrador.Master" AutoEventWireup="true" CodeBehind="HomeAdministrador.aspx.cs" Inherits="CapaPresentacion.HomeAdministrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container text-center">
          <br />
          <div class="w3-container">
            <h1 style="color:white">Administrador</h1>
          </div>
          <br /><br /><br /><br /><br /><br />
          
              
                  <a href="ABMComplejosAdministrador.aspx"><div class="w3-card-4" style="width:100%;">
                    <header class="w3-container w3-blue">
                        <h1>Complejos deportivos</h1>
                    </header>              
                  </div></a>
              <br />
              
                  <div class="w3-card-4" style="width:100%;">
                    <header class="w3-container w3-green">
                        <h1>Jugadores</h1>
                    </header>              
                  </div>
              <br />
              
                  <div class="w3-card-4" style="width:100%;">
                    <header class="w3-container w3-red">
                        <h1>Reportes y Estadísticas</h1>
                    </header>              
                  </div>
              
          
          <br /><br /><br /><br /><br /><br /><br />
      </div>
    </asp:Content>