<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EstadisticaJugador.aspx.cs" Inherits="CapaPresentacion.EstadisticaJugador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <style>
        .tamanioframe{
            width:1024px;
            height:612px;
        }
        @media screen and (max-width: 800px) {
         .tamanioframe{
            width:100%;
           
           
        }
        
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container text-center">   
        <div class="well">
            <asp:Button ID="btnMostrarEstadistica" type="button" class="btn btn-primary btn-block" runat="server" Text="Mostrar/Refrescar Reporte y Estadística" OnClick="btnMostrarEstadistica_Click" />
            <div id="elDivDelDashboard" visible="false" runat="server">
            <iframe class="tamanioframe" src="https://app.powerbi.com/view?r=eyJrIjoiYjRhZWI4NjYtNzIxYS00YTRhLThlZTEtNmVlMTg0YTMyMmZlIiwidCI6ImVkZDNjZTA0LWY0MjgtNGJmNC1iY2E2LTY5MGIyNmI1ODBmZSJ9" frameborder="0" allowFullScreen="true"></iframe>
            </div>
        </div>      
</div>
</asp:Content>
