(function () {
  BUS2.MapComponent = {
    init: function (el, lat, lng, zoom) {
      this.map = new google.maps.Map(el, {
        center: {lat: lat, lng: lng},
        zoom: zoom
      });
    },

    setCenter: function (lat, lng) {
      this.map.setCenter(lat, lng);
    },

    setUserMarker: function (lat, lng) {
      var position = {lat: lat, lng: lng};

      this.userMarker = new google.maps.Marker({
        position: position,
        map: this.map,
        icon: "/assets/person-marker.png"
      });
    },

    render: function () {

    }
  }
})();
