var styles = [
  {
    stylers: [
      { "hue": "#00aaff" },
      { "lightness": -36 },
      { "saturation": -67 }
    ]
  }
];
var mapOptions = {
  zoom: 8,
  minZoom: 1,
  panControl: false,
  zoomControl: false,
  mapTypeControl: false,
  scaleControl: true,
  streetViewControl: false,
  overviewMapControl: false,
  center: new google.maps.LatLng(41.843606, -87.610474),
  mapTypeId: google.maps.MapTypeId.ROADMAP,
  styles: styles
};


function initialize() {

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  var home = new google.maps.Marker({
    position: map.getCenter(),
    map: map,
    title: 'Home'
  });

  google.maps.event.addListener(map, 'center_changed', function() {
    // 3 seconds after the center of the map has changed, pan back to the
    // marker.
    //window.setTimeout(function() {
    //  map.panTo(home.getPosition());
    //}, 3000);
  });

  google.maps.event.addListener(map, 'click', function(event) {
    alert("Yes");
  });

  google.maps.event.addListener(home, 'click', function() {
    alert("This is your home");
  });



}

google.maps.event.addDomListener(window, 'load', initialize);
