(function () {
  BUS2.LocationHandler = {
    init: function () {
      this.isAvailable = 'geolocation' in navigator;

      if (this.isAvailable) {
        console.log('geolocation is available')
      }

      if (!this.isAvailable) {
        console.log('geolocation is not available');
      }
    },

    getCurrentPosition: function (success) {
      navigator.geolocation.getCurrentPosition(function(position) {
        // plotPosition(position.coords.latitude, position.coords.longitude);
        success(position.coords.latitude, position.coords.longitude);
      });
    }
  };
})();
