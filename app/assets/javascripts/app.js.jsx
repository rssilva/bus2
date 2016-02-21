
(function () {

  ReactDOM.render(<BUS2.Header />, $('.bus2-header')[0]);

  ReactDOM.render(<BUS2.ContributeArea />, $('.contribute-area-container')[0]);
  ReactDOM.render(<BUS2.ContributeButton />, $('.contribute-button-container')[0]);
  // ReactDOM.render(<BUS2.ContributeStartForm />, $('.contribute-start-form-container')[0]);

  ReactDOM.render(<BUS2.ContributeArea />, $('.contribute-area-container')[0]);

  BUS2.LocationHandler.init();

  BUS2.MapComponent.init($('.map-canvas')[0], -30.0346, -51.217, 14);

  BUS2.LocationHandler.getCurrentPosition(function (lat, lng) {
    BUS2.MapComponent.setCenter({lat: lat, lng: lng});
    BUS2.MapComponent.setUserMarker(lat, lng);
  });

  BUS2.Eventer.on('loginSuccessful', function (ev, data) {
    console.log(data)
  });

  var interval;

  function sendColaborateData () {
    interval = setInterval(function () {
      
    }, 10000);
  }

})();
