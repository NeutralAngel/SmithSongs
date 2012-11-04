jQuery(function($) {
  
  $('input.venue_submit').live("click", function() {
    history.pushState(null, "", "/venues/" + venue_id);
  });

  initialize();
});

function initialize() {

  var mapOptions = {
    zoom: 12,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  var address;
  var addressElement = document.getElementById("address");
  if (addressElement) {
    address = addressElement.innerHTML;

  //var address = document.getElementById("address").innerHTML;
  var geocoder = new google.maps.Geocoder();
  var map = new google.maps.Map(document.getElementById("map_canvas"),
    mapOptions);

  geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location
        });
      } else {
        alert("Geocode was not successful for the following reason: " + status);
      }
    });

  map = new google.maps.Map(document.getElementById("map_canvas"),
    mapOptions);

  }};


$(document).on("pjax:complete", function() {
  return initialize();
});
    
    
 

