(function () {
  var Eventer = BUS2.Eventer;

  BUS2.ContributeButton = React.createClass({
    getInitialState: function () {
      this.setEvents();

      return {
        isOpen: false
      }
    },

    onClick: function (ev) {
      Eventer.trigger('contributeClick');

      ev.stopPropagation();
    },

    setEvents: function () {
      var that = this;

    },

    render: function () {
      return (
        <div className="contribute-area">
          <div className="contribute-button" onClick={this.onClick} >
            <button className="contribute-button" onClick={this.onClick} >
              <svg className="contribute-bus">
                <use xlinkHref="#contribute-bus"></use>
              </svg>
              <span className="label">Colaborate</span>
            </button>
          </div>
        </div>
      )
    }
  });
})();
