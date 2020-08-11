<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEstablecimiento.Master" AutoEventWireup="true" CodeBehind="EstadisticaComplejo.aspx.cs" Inherits="CapaPresentacion.EstadisticaComplejo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">   
        <div class="well">
            <asp:Button ID="btnMostrarEstadistica" type="button" class="btn btn-primary btn-block" runat="server" Text="Mostrar/Refrescar Reporte y Estadística" OnClick="btnMostrarEstadistica_Click" />
            <div id="elDivDelDashboard" visible="false" runat="server">
                <iframe width="1024" height="612" src="https://app.powerbi.com/view?r=eyJrIjoiNjFlYWQ1MTctNGIyOC00MWYzLWI4ODItZjFmOTAxODRhMjQxIiwidCI6ImVkZDNjZTA0LWY0MjgtNGJmNC1iY2E2LTY5MGIyNmI1ODBmZSJ9&pageName=ReportSection" frameborder="0" allowFullScreen="true"></iframe>
            </div>
        </div>      
    </div>
    
</asp:Content>
