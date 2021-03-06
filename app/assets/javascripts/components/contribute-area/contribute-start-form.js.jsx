(function () {
  var Eventer = BUS2.Eventer;

  BUS2.ContributeStartForm = React.createClass({
    getInitialState: function () {
      this.setEvents();

      return {
        className: 'contribute-start-form',
        parent: $('.contribute-start-form-container'),
        busLine: ''
      }
    },

    setEvents: function () {
      var that = this;

      Eventer.on('contributeClick', function () {
        // that.toggleVisibility();
      });
    },

    // onStartClick: function () {
    //   Eventer.trigger('contributeStartClick', {busLine: this.state.busLine});
    // },

    onSubmitForm: function (ev) {
      Eventer.trigger('contributeStartClick', {busLine: this.state.busLine});

      ev.preventDefault();
    },

    onBusLineChange: function (ev) {
      this.setState({busLine: ev.target.value})
    },

    componentDidMount: function () {
      this.state.parent.removeClass('hidden');
    },

    componentWillUnmount: function () {
      this.state.parent.addClass('hidden');
    },

    render: function () {
      return (
        <div>
          <form className={this.state.className} onSubmit={this.onSubmitForm}>
            <div>
              <span className="main-label">Share your position and help other users</span>
              <span className="location"></span>
            </div>
            <div>
              <input className="busline" placeholder="Select a bus line" onChange={this.onBusLineChange}></input>
            </div>
            <input className="start-contribute-button" type="submit" value="start"></input>
          </form>
        </div>
      )
    }
  });
})();
