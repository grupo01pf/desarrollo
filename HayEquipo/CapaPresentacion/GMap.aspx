<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GMap.aspx.cs" Inherits="CapaPresentacion.GMap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    

     <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
   integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
   crossorigin=""/>

    <style>
        #myMap { height: 400px; width:700px; }
    </style>

</head>

<body>
    <form id="form1" runat="server">
        <div id="myMap" > 

        </div>

        <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
   integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
   crossorigin=""></script> 
        <script src="scripts/map.js"></script>
    </form>
</body>
</html>
