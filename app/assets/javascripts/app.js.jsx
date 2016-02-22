
(function () {

  ReactDOM.render(<BUS2.Header />, $('.bus2-header')[0]);

  ReactDOM.render(<BUS2.ContributeArea />, $('.contribute-area-container')[0]);
  ReactDOM.render(<BUS2.ContributeButton />, $('.contribute-button-container')[0]);
  ReactDOM.render(<BUS2.SearchView />, $('.bus2-search-container')[0]);
  // ReactDOM.render(<BUS2.ContributeStartForm />, $('.contribute-start-form-container')[0]);

  ReactDOM.render(<BUS2.ContributeArea />, $('.contribute-area-container')[0]);

  BUS2.LocationHandler.init();

  BUS2.MapComponent.init($('.map-canvas')[0], -30.0346, -51.217, 14);

  BUS2.LocationHandler.getCurrentPosition(function (lat, lng) {
    BUS2.MapComponent.setCenter({lat: lat, lng: lng});
    BUS2.MapComponent.setUserMarker(lat, lng);
  });

  var busLine;
  var interval;
  var linesData;
  var country;
  var state;
  var city;
  var markersInterval;
  
  BUS2.Eventer.on('loginSuccessful', function (ev, data) {
    BUS2.TOKEN = data.jwt;
    sendColaborateData();
    startColaborateData();
  });

  BUS2.Eventer.on('alreadyLogged', function (ev, data) {
    sendColaborateData();
    startColaborateData();
  });

  BUS2.Eventer.on('contributeStartClick', function (ev, data) {
    busLine = data.busLine;
  });

  BUS2.Eventer.on('onLinesData', function (ev, data) {
    linesData = data.linesData;
  });

  BUS2.Eventer.on('lineResultClick', function(event, data){
    country = data.country;
    state = data.state;
    city = data.city;

    BUS2.MapComponent.plotMarkers(linesData);
    getLinesData();
  });

  function getLinesData () {
    clearInterval(markersInterval);

    markersInterval = setInterval(function () {
      $.ajax({
        url: '/api/v1/line_search/search/' + country + '/' + state + '/' + city
      }).done(function (linesData) {
        console.log('PLIM')
        BUS2.MapComponent.plotMarkers(linesData);
      })
    }, 10000);
  }

  function startColaborateData () {
    interval = setInterval(function () {
      sendColaborateData();
    }, 10000);
  }

  function sendColaborateData () {
    BUS2.LocationHandler.getCurrentPosition(function (lat, lng) {
      execRequest(lat, lng)
    });
  }

  function execRequest (lat, lng) {
    $.ajax({
      type: 'POST',
      url: '/api/v1/user/location/push/sensor',
      beforeSend: function (request) {
        request.setRequestHeader('Authorization', BUS2.TOKEN);
      },
      data: {
        line_name: busLine,
        lat: lat,
        lon: lng
      }
    }).done(function (data) {
      console.log(data)
    })
  }

})();
