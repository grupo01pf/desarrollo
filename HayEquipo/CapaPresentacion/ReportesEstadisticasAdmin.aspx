<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdministrador.Master" AutoEventWireup="true" CodeBehind="ReportesEstadisticasAdmin.aspx.cs" Inherits="CapaPresentacion.ReportesEstadisticasAdmin" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
     <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Mes');
          data.addColumn('number', 'Usuarios');
          data.addRows(<%=this.obtenerDatosBarUsuariosRegistrados()%>);

        var options = {
          chart: {
            title: 'Usuarios Registrados',
            bars: 'horizontal'
          },

            hAxis:{
                title: "Fecha",
                format: 'M/d/yy',
            },
            vAxis: {
                title: "Cantidad de Usuarios Registrados",
                minValue: 0,
                maxValue: 100,


        }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <div class="container text-center">
          <br />
          <div class="w3-container">
            <h1 style="color:white">Reportes y Estadisticas</h1>
          </div>
              <br /><br />
          <div class="well">
            <asp:Button ID="btnMostrarEstadistica" type="button" class="btn btn-primary btn-block" runat="server" Text="Mostrar reporte" OnClick="btnMostrarEstadistica_Click" />
            <div id="elDivDelDashboard" visible="false" runat="server">
                <iframe width="933" height="700" src="https://app.powerbi.com/view?r=eyJrIjoiYTBmNzM5NGMtMjVlMy00NDJjLWEwZDEtMTY4ODQwN2NlN2UwIiwidCI6ImVkZDNjZTA0LWY0MjgtNGJmNC1iY2E2LTY5MGIyNmI1ODBmZSJ9" frameborder="0" allowFullScreen="true"></iframe>
            </div>
        </div>
   
          <br /><br /><br />
           <%--  
              <asp:DropDownList ID="ddl_aniosregistros" runat="server" Width="150px" AutoPostBack="true"   >
                                    <asp:ListItem Text="2020" Value="2020" /> 
                                    <asp:ListItem Text="2019" Value="2019" />
                                    <asp:ListItem Text="2018" Value="2018" />


                                </asp:DropDownList>
                 <div id="columnchart_material" style="width:100%; height: 500px;"></div> 
          --%>
               
              
          
          <br /><br /><br /><br /><br /><br /><br />
      </div>
</asp:Content>
