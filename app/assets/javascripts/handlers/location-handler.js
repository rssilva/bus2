(function () {
  BUS2.LocationHandler = {
    init: function () {
      this.isAvailable = 'geolocation' in navigator;

      if (this.isAvailable) {
        
      }

      if (!this.isAvailable) {
        
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
