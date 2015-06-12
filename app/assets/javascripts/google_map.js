function initialize() {
  var element = document.getElementById('map-canvas');
  var latitude = Number(element.getAttribute('data-latitude'));
  var longitude = Number(element.getAttribute('data-longitude'));
  var coordinates = new google.maps.LatLng(latitude, longitude);

  var mapOptions = {
    center: coordinates,
    zoom: 15
  };
  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  var marker = new google.maps.Marker({
      position: coordinates,
      map: map,
      title: 'Here I am !'
  });

}
google.maps.event.addDomListener(window, 'load', initialize);
