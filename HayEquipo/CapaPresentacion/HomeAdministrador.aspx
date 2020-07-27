<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdministrador.Master" AutoEventWireup="true" CodeBehind="HomeAdministrador.aspx.cs" Inherits="CapaPresentacion.HomeAdministrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container text-center">

        <div class="well">
            <asp:Button ID="btnMostrarEstadistica" type="button" class="btn btn-primary btn-block" runat="server" Text="Mostrar reporte" OnClick="btnMostrarEstadistica_Click" />
            <div id="elDivDelDashboard" visible="false" runat="server">
                <iframe width="933" height="700" src="https://app.powerbi.com/view?r=eyJrIjoiYTBmNzM5NGMtMjVlMy00NDJjLWEwZDEtMTY4ODQwN2NlN2UwIiwidCI6ImVkZDNjZTA0LWY0MjgtNGJmNC1iY2E2LTY5MGIyNmI1ODBmZSJ9" frameborder="0" allowFullScreen="true"></iframe>
            </div>
        </div>
    </div>

          <br />
          <div class="w3-container">
            <h1 style="color:white">Administrador</h1>
          </div>
          <br/>
                <div class="col-sm-1">
             <asp:Button ID="btn_Usuarios" runat="server" CssClass="btn btn-primary btn-edit" Text="Usuarios" ValidationGroup="E" OnClick="btn_Usuarios_Click"></asp:Button>
                 </div>
               <div class="col-sm-1">
             <asp:Button ID="btn_deportes" runat="server" CssClass="btn btn-primary btn-edit" Text="ABM Deportes" ValidationGroup="E" OnClick="btn_deportes_Click"></asp:Button>
                 </div>

    
              <br /><br /><br /><br /><br />
                     
                  <a href="ABMComplejosAdministrador.aspx"><div class="w3-card-4" style="width:100%;">
                    <header class="w3-container w3-black">
                        <h1>Complejos deportivos</h1>
                    </header>
                  </div></a>
              <br />

                  <div class="w3-card-4" style="width:100%;">
                    <header class="w3-container w3-black">
                        <h1>Jugadores</h1>
                    </header>
                  </div>
              <br />

                  <a href="ReportesEstadisticasAdmin.aspx"><div class="w3-card-4" style="width:100%;">
                    <header class="w3-container w3-black">
                        <h1>Reportes y Estadísticas</h1>
                    </header>
                  </div></a>


          <br /><br /><br /><br /><br /><br /><br />
      

    </asp:Content>
