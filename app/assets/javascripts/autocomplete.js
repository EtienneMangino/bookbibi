function initializeAutocomplete(id) {
  var element = document.getElementById(id);
  var autocomplete = new google.maps.places.Autocomplete(element, { types: ['geocode'] });
  google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
}

google.maps.event.addDomListener(window, 'load', function() {
  initializeAutocomplete('flat_address');
});

function onPlaceChanged() {
  var place = this.getPlace();
  var street_number = '';
  var route = '';

  for (var i in place.address_components) {
    var component = place.address_components[i];
    console.log(component);
    if (component.types[0] == 'locality') {
      $('#flat_city').val(component.long_name);
    } else if (component.types[0] == 'street_number') {
      street_number = component.long_name;
    } else if (component.types[0] == 'route') {
      route = component.long_name;
    }
  }

  $('#flat_address').val(street_number + ' ' + route);
}