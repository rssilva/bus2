
(function () {

  ReactDOM.render(<BUS2.ContributeArea />, $('.contribute-area-container')[0]);
  ReactDOM.render(<BUS2.Header />, $('.bus2-header')[0]);
  ReactDOM.render(<BUS2.ContributeStartForm />, $('.contribute-start-form-container')[0]);

  var routes = {
    '/contribute': function () {

    },
    '/contribute/set': function () {
      BUS2.Eventer.trigger('setContribution');
    }
  };

  BUS2.router = Router(routes).configure({
    // html5history: true
  });

  BUS2.router.init();

})();
