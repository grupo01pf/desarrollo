

const tilesProvider = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png '


// centrar la vista del mapa
let myMap = L.map('myMap').setView([-31.416563, -64.183533], 12)


L.tileLayer(tilesProvider, {
    maxzoom: 18,
}).addTo(myMap)

// crear un marcador
// let marker = L.marker([-31.416563, -64.183533]).addTo(myMap)


myMap.doubleClickZoom.disable()

var layerGroup = L.layerGroup().addTo(myMap)
// poner un marcador al hacer dobleclick
myMap.on('dblclick', e => {

    layerGroup.clearLayers();

    let latLng = myMap.mouseEventToLatLng(e.originalEvent)
   // L.marker([latLng.lat, latLng.lng]).addTo(myMap)

    myMap.closePopup();
    var marker = L.marker([latLng.lat, latLng.lng]).addTo(layerGroup)

   // $('#txt_Latitud').val(myMap.getCenter().lat + ',' + myMap.getCenter().lng); //ok

   $('#txt_Latitud').val(marker.getLatLng().lat)
   $('#txt_Longitud').val(marker.getLatLng().lng)

    // marker.bindPopup('CBA').openPopup(); // ok
    
})



// var latitude = document.getElementById('<%= txt_Latitud.ClientID %>').value
// var longitude = document.getElementById('<%= txt_Longitud.ClientID %>').value




// var complejoDeportivo = L.marker([latitude, longitude]).addTo(myMap)
// var complejoDeportivo = L.marker([latitude, longitude]).addTo(layerGroup)

// myMap = L.map('myMap').setView([latitude, longitude], 10)

















