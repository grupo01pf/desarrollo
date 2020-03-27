

const tilesProvider = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png '

let myMap = L.map('myMap').setView([-31.416563, -64.183533], 12)

L.tileLayer(tilesProvider, {
    maxzoom: 18,
}).addTo(myMap)


let marker = L.marker([-31.416563, -64.183533]).addTo(myMap)

myMap.doubleClickZoom.disable()
myMap.on('dblclick', e => {
    let latLng = myMap.mouseEventToLatLng(e.originalEvent)
    L.marker([latLng.lat, latLng.lng]).addTo(myMap)
})


