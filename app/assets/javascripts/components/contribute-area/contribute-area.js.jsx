(function () {
  var Eventer = BUS2.Eventer;

  BUS2.ContributeArea = React.createClass({
    getInitialState: function () {
      this.setEvents();

      return {
        isOpen: false
      }
    },

    onClick: function (ev) {
      var isOpen = this.state.isOpen;

      if (isOpen) {
        this.setState({isOpen: false})
        window.location.hash = '#/';
        Eventer.trigger('contributeClick');
      }

      if (!isOpen) {
        this.setState({isOpen: true})
        window.location.hash = '#/contribute/set';
        Eventer.trigger('contributeClick');
      }

      ev.stopPropagation();
    },

    setEvents: function () {
      var that = this;

      Eventer.on('setContribution', function () {
        that.setState({isOpen: true});
      });
    },

    render: function () {
      return (
        <div className="contribute-area">
          <div className="contribute-button" onClick={this.onClick} >
            <button className="contribute-button" onClick={this.onClick} >
              <svg className="contribute-bus">
                <use xlinkHref="#contribute-bus"></use>
              </svg>
              <span className="label">Contribute</span>
            </button>
          </div>
        </div>
      )
    }
  });
})();
