
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GMap.aspx.cs" Inherits="CapaPresentacion.GMap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css"
        integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ=="
        crossorigin="" />

    <style>
        #myMap {
            height: 450px;
            width: 550px;
        }

        #form1 {
            background-color:black;
            color:white;
        }
    </style>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>
    <form id="form1" runat="server">

        <div class="container">

            <div class="row">

                <%--FORMULARIO--%>
                <div class="col-md-6">
                    <br />
                   <%-- <label for="lbl_Ubicacion">Ubicacion</label>
                    <asp:HiddenField ID="txt_ID" runat="server" />
                    <asp:TextBox ID="txt_Ubicacion" CssClass="form-control" runat="server"></asp:TextBox>--%>


                    <asp:Label ID="lbl_Complejo" runat="server" Text="Complejos"></asp:Label>
                    <asp:DropDownList ID="cmb_Complejo" CssClass="form-control" runat="server" AutoPostBack="true"
                        AppendDataBoundItems="true" >
                        <asp:ListItem Value="0">&lt;Sin Seleccionar&gt;</asp:ListItem>
                    </asp:DropDownList>





                    <br />

                    <%--**** MAPA ****--%>

                <div class="form-group">
                    <div id="myMap"></div>
                </div>
                
                    <%--**** FIN MAPA ****--%>

                <div class="form-inline">
                

                    <label for="lbl_Latitud">Latitud</label>
                    <%--<asp:TextBox ID="txt_Latitud" Text="" MaxLength="500"  runat="server"></asp:TextBox>--%>
                    <input type="text" id="txt_Latitud" name="txt_Latitud" runat="server">
                    
                    <label for="lbl_Longitud">Longitud</label>
                    <%--<asp:TextBox ID="txt_Longitud" Text="" MaxLength="500"  runat="server"></asp:TextBox>--%>
                    <input type="text" id="txt_Longitud" name="txt_Longitud" runat="server">
                    <br />

                 

                </div>
                <br />
                <div class="form-inline">
                    <asp:Button ID="btn_Agregar" CssClass="btn btn-success" runat="server" Text="Agregar" UseSubmitBehavior="false"  OnClick="btn_Agregar_Click"/>
                    <asp:Button ID="btn_Modificar" CssClass="btn btn-warning" runat="server" Text="Modificar" UseSubmitBehavior="false" OnClick="btn_Modificar_Click" />
                    <asp:Button ID="btn_Eliminar" CssClass="btn btn-danger" runat="server" Text="Eliminar" UseSubmitBehavior="false"  OnClick="btn_Eliminar_Click"/>
                    <asp:Button ID="btn_Limpiar" CssClass="btn btn-default" runat="server" Text="Limpiar" UseSubmitBehavior="false" OnClick="btn_Limpiar_Click"/>
                </div>

                </div>
               

                <%--GRILLA--%>
                <div class="col-md-6">
                    <br />
                    <h1>Ubicaciones</h1>

                    <br />
                    <div class="form-group">
                        <asp:TextBox ID="txt_Todos" Text="" runat="server" Visible="true"></asp:TextBox>     
                        <asp:Button ID="btn_Todos" Text="Mostrar Todos" runat="server" 
                            CssClass="btn btn-info" OnClientClick="getCoords();"/>                                           

                    </div>
                    <br />

                    <div class="form-group">
                        <asp:GridView ID="gdv_Ubicaciones" runat="server" AutoGenerateColumns="False" CssClass="mydatagrid" PagerStyle-CssClass="pager"
                            HeaderStyle-CssClass="header" RowStyle-CssClass="rows" OnSelectedIndexChanged="gdv_Ubicaciones_SelectedIndexChanged">
                            <Columns>

                                <asp:CommandField ShowSelectButton="true" />

                                <asp:BoundField DataField="id" HeaderText="Id" Visible="true" />
                                <asp:BoundField DataField="idMapa" HeaderText="IdMapa" Visible="true" />
                                <asp:BoundField DataField="nombre" HeaderText="Commplejo Deportivo" Visible="true" />
                                <asp:BoundField DataField="calle" HeaderText="Calle" Visible="true" />
                                <asp:BoundField DataField="nroCalle" HeaderText="Nro" Visible="true" />
                                <asp:BoundField DataField="latitud" HeaderText="Latitud" Visible="true" />
                                <asp:BoundField DataField="longitud" HeaderText="Longitud" Visible="true" />


                            </Columns>

                        </asp:GridView>
                    </div>

                </div>
            </div>
        </div>


        <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js"
            integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew=="
            crossorigin="">

        </script>

         <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


        <%--**** CONTROL DEL MAPA ****--%>
        <%--<script src="scripts/map.js" ></script>--%>


       <script type="text/javascript">

           let firstTime = true

           const tilesProvider = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png '


           // CENTRAR LA VISTA DEL MAPA
           //let myMap = L.map('myMap').setView([-31.416563, -64.183533], 12)
           var myMap = L.map('myMap').setView([-31.416563, -64.183533], 12)

           L.tileLayer(tilesProvider, {
               maxzoom: 18,
           }).addTo(myMap)

           var layerGroup = L.layerGroup().addTo(myMap)



           if (firstTime) {
               getCoords()
               firstTime = false
           } else {
               layerGroup.clearLayers();
           }

           // MOSTRAR UN COMPLEJO
           var latitude = document.getElementById('<%= txt_Latitud.ClientID %>').value;
           var longitude = document.getElementById('<%= txt_Longitud.ClientID %>').value;
           var marker = L.marker([latitude, longitude]).addTo(layerGroup)
           if (latitude != "" && longitude != "") {
               myMap.setView([latitude, longitude], 15)
           } 
          

           // CREAR UN MARCADOR
           // let marker = L.marker([-31.416563, -64.183533]).addTo(myMap)

           // DESACTIVAR ZOOM CON DOBLE CLICK
           myMap.doubleClickZoom.disable()
           
           // var layerGroup = L.layerGroup().addTo(myMap)

           // PONER UN MARCADOR CON EL EVENTO DOBLECLICK
           myMap.on('dblclick', e => {
               // ELIMINAR MARCADOR DEL COMPLEJO     
               layerGroup.clearLayers();

               let latLng = myMap.mouseEventToLatLng(e.originalEvent)
               // L.marker([latLng.lat, latLng.lng]).addTo(myMap)

               myMap.closePopup();
               //var marker = L.marker([latLng.lat, latLng.lng]).addTo(layerGroup)

                marker = L.marker([latLng.lat, latLng.lng], { draggable: false }).addTo(layerGroup)
               // marker = L.marker([latLng.lat, latLng.lng]).addTo(layerGroup)

               // $('#txt_Latitud').val(myMap.getCenter().lat + ',' + myMap.getCenter().lng); //ok

               // ASP.NET
               //$('#txt_Latitud').val(marker.getLatLng().lat) // ok
               //$('#txt_Longitud').val(marker.getLatLng().lng) // ok

                <%--$('#<%= txt_Latitud.ClientID %>').val(marker.getLatLng().lat); // ok
                $('#<%= txt_Longitud.ClientID %>').val(marker.getLatLng().lng); // ok--%>

               // HTML
                document.getElementById("txt_Latitud").value = marker.getLatLng().lat
                document.getElementById("txt_Longitud").value = marker.getLatLng().lng

               // PONER UN POPUP
               // marker.bindPopup('CBA').openPopup(); // ok

             
           })
           
           // ARRAY LOCATIONS
           // CREAR UN MARCADOR           

           function getCoords() {

               layerGroup.clearLayers();
               var coords = $("#txt_Todos").val();
               console.log(coords)
               var v = coords.split(',');
             
               var j = 1
               var k = 2
               for (var i = 0; i < v.length - 1; i=i+3) {

                   L.marker([v[i], v[j]]).bindPopup(v[k]).openPopup().addTo(layerGroup);
               
                   j = j + 3
                   k = k +3
               }
           }

        

           

       </script>


        

    </form>
</body>
</html>