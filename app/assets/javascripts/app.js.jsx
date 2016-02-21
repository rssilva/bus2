
(function () {

  ReactDOM.render(<BUS2.Header />, $('.bus2-header')[0]);

  ReactDOM.render(<BUS2.ContributeArea />, $('.contribute-area-container')[0]);
  ReactDOM.render(<BUS2.ContributeButton />, $('.contribute-button-container')[0]);
  // ReactDOM.render(<BUS2.ContributeStartForm />, $('.contribute-start-form-container')[0]);

  ReactDOM.render(<BUS2.SearchView />, $('.bus2-search-container')[0]);
  ReactDOM.render(<BUS2.ContributeArea />, $('.contribute-area-container')[0]);

  var showAuthorInfo = function () {
    console.log("showAuthorInfo");
  };

  var listBooks = function () {
    console.log("listBooks");
  };

  var routes = {
    '/contribute': function () {

    },
    '/contribute/set': function () {
      BUS2.Eventer.trigger('setContribution', {isOpen: true});
    }
  };

  BUS2.router = Router(routes).configure({
    // html5history: true
  });

  BUS2.router.init();

})();
