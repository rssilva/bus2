(function () {
  BUS2.MapComponent = {
    init: function (el, lat, lng, zoom) {
      this.markers = [];

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
        icon: BUS2.assets.PERSON_MARKER
      });
    },

    cleanMarkers: function () {
      this.markers.forEach(function (marker) {
        marker.setMap(null);
      });

      this.markers = [];
    },

    plotMarkers: function (data) {
      var that = this;
      var marker;

      this.cleanMarkers();

      if (data && data.hits && data.hits.hits) {
        data.hits.hits.forEach(function (line) {

          if (line && line._source) {
            line._source.users_reporting.forEach(function (user) {

              marker = new google.maps.Marker({
                position: {lat: user.location[0], lng: user.location[1]},
                map: that.map,
                icon: BUS2.assets.BUS_MARKER_BLUE
              });

              that.markers.push(marker);
            });
          }
        });
      }
    },

    render: function () {

    }
  }
})();
